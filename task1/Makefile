BUILD_DIR = build
IR_DIR = IR

LLVM_FLAGS = $(shell llvm-config --cppflags --ldflags --libs)

all: raytracing

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(IR_DIR):
	mkdir -p $(IR_DIR)

$(IR_DIR)/start.ll: start.c | $(IR_DIR)
	clang -emit-llvm -S $^ -o $@
$(IR_DIR)/sim.ll: sim.c | $(IR_DIR)
	clang -emit-llvm -S $^ -o $@
$(IR_DIR)/raytracing.ll: raytracing.c | $(IR_DIR)
	clang -emit-llvm -S $^ -o $@

full.bc: $(IR_DIR)/start.ll $(IR_DIR)/sim.ll $(IR_DIR)/raytracing.ll
	llvm-link $^ -o full.bc

$(IR_DIR)/raytracing-opt.ll: raytracing.c | $(IR_DIR)
	clang -emit-llvm -S $^ -o $@ -O2

raytracing: $(BUILD_DIR)/raytracing
raytracing-opt: $(BUILD_DIR)/raytracing-opt

$(BUILD_DIR)/raytracing: $(IR_DIR)/raytracing.ll start.c sim.c | $(BUILD_DIR)
	clang $^ -lSDL2 -o $@
$(BUILD_DIR)/raytracing-opt: $(IR_DIR)/raytracing-opt.ll start.c sim.c | $(BUILD_DIR)
	clang $^ -lSDL2 -o $@ -O2

clean:
	rm -rf $(BUILD_DIR) $(IR_DIR) full.bc

.PHONY: all clean raytracing raytracing-opt