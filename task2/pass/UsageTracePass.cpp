#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

using namespace llvm;

static std::string record(Instruction &I) {
  std::string R = I.getOpcodeName();
  auto *Call = dyn_cast<CallInst>(&I);
  if (Call && Call->getCalledFunction())
    R += "(" + Call->getCalledFunction()->getName().str() + ")";
  R += " <-";

  for (Use &U : I.operands()) {
    Value *Op = U.get();
    if (isa<BasicBlock>(Op) || (Call && Call->isCallee(&U)))
      continue; // branch targets and the callee are not data
    if (auto *OpI = dyn_cast<Instruction>(Op))
      R += std::string(" ") + OpI->getOpcodeName();
    else if (isa<Argument>(Op))
      R += " arg";
    else if (isa<GlobalValue>(Op)) // a GlobalValue is also a Constant
      R += " global";
    else
      R += " const";
  }
  return R;
}

struct UsageTracePass : PassInfoMixin<UsageTracePass> {
  PreservedAnalyses run(Module &M, ModuleAnalysisManager &) {
    LLVMContext &Ctx = M.getContext();
    FunctionCallee Log = M.getOrInsertFunction(
        "usage_trace_log", Type::getVoidTy(Ctx), Type::getInt32Ty(Ctx));

    IRBuilder<> Builder(Ctx);
    std::vector<Constant *> Table;
    for (Function &F : M) {
      if (F.isDeclaration())
        continue;

      std::vector<Instruction *> Targets;
      for (BasicBlock &BB : F)
        for (Instruction &I : BB)
          if (!isa<PHINode>(I)) // phi == skip
            Targets.push_back(&I);

      for (Instruction *I : Targets) {
        Builder.SetInsertPoint(I); // new instructions go right before I
        Table.push_back(Builder.CreateGlobalStringPtr(record(*I)));
        Builder.CreateCall(Log, {Builder.getInt32(Table.size() - 1)});
      }

      // LLM told this is interesting to point out

      // -O2 has inferred e.g. memory(none) for norm_factor. The logger
      // writes memory and may call exit(), so such attributes are now false.
      F.removeFnAttr(Attribute::Memory);
      F.removeFnAttr(Attribute::WillReturn);
      F.removeFnAttr(Attribute::NoSync);
      F.removeFnAttr(Attribute::NoFree);

      // END_LLM

      if (verifyFunction(F, &errs()))
        report_fatal_error("UsageTracePass broke " + F.getName());
    }

    // const char *usage_trace_table[N]; const uint32_t usage_trace_size;
    auto *TableTy = ArrayType::get(PointerType::getUnqual(Ctx), Table.size());
    new GlobalVariable(M, TableTy, /*isConstant=*/true,
                       GlobalValue::ExternalLinkage,
                       ConstantArray::get(TableTy, Table), "usage_trace_table");
    new GlobalVariable(M, Builder.getInt32Ty(), /*isConstant=*/true,
                       GlobalValue::ExternalLinkage,
                       Builder.getInt32(Table.size()), "usage_trace_size");

    errs() << "[usage-trace] " << M.getName() << ": " << Table.size()
           << " instructions instrumented\n";
    return PreservedAnalyses::none();
  }

  static bool isRequired() { return true; }
};

extern "C" PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "UsageTrace", "1.0", [](PassBuilder &PB) {
            PB.registerOptimizerLastEPCallback(
                [](ModulePassManager &MPM, OptimizationLevel) {
                  MPM.addPass(UsageTracePass());
                });
          }};
}
