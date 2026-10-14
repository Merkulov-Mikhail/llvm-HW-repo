# User <- Operand usage

Trace `out/Os/trace.bin`: 76,622,940 events, 247 of 306 instrumented instructions executed.
152,433,676 dynamic operand uses (branch targets and callees are not operands here).

## User <- Operand pairs

| # | Count | Share | Pair |
|--:|--:|--:|---|
| 1 | 14,526,360 | 9.53 % | `call(llvm.fmuladd.f32) <- fmul` |
| 2 | 9,122,238 | 5.98 % | `load <- global` |
| 3 | 8,313,168 | 5.45 % | `fmul <- fmul` |
| 4 | 7,448,472 | 4.89 % | `call(llvm.fmuladd.f32) <- arg` |
| 5 | 7,380,576 | 4.84 % | `fmul <- call` |
| 6 | 7,077,888 | 4.64 % | `call(llvm.fmuladd.f32) <- fsub` |
| 7 | 7,077,888 | 4.64 % | `fsub <- load` |
| 8 | 5,089,177 | 3.34 % | `fmul <- const` |
| 9 | 4,965,659 | 3.26 % | `fdiv <- fmul` |
| 10 | 4,842,124 | 3.18 % | `call(llvm.fmuladd.f32) <- call` |
| 11 | 3,787,536 | 2.48 % | `fmul <- fsub` |
| 12 | 3,539,721 | 2.32 % | `fadd <- const` |
| 13 | 3,538,944 | 2.32 % | `call(trace) <- fdiv` |
| 14 | 3,538,944 | 2.32 % | `fmul <- arg` |
| 15 | 3,538,944 | 2.32 % | `fmul <- fadd` |
| 16 | 2,853,410 | 1.87 % | `call(llvm.fmuladd.f32) <- const` |
| 17 | 2,853,408 | 1.87 % | `fmul <- bitcast` |
| 18 | 2,360,066 | 1.55 % | `fdiv <- const` |
| 19 | 2,359,296 | 1.55 % | `call(simPutPixel) <- phi` |
| 20 | 2,223,504 | 1.46 % | `insertelement <- const` |
| 21 | 1,550,242 | 1.02 % | `fcmp <- const` |
| 22 | 1,550,234 | 1.02 % | `call(llvm.fmuladd.f32) <- load` |
| 23 | 1,426,706 | 0.94 % | `br <- fcmp` |
| 24 | 1,426,704 | 0.94 % | `ashr <- bitcast` |
| 25 | 1,426,704 | 0.94 % | `ashr <- const` |
| 26 | 1,426,704 | 0.94 % | `bitcast <- sub` |
| 27 | 1,426,704 | 0.94 % | `fdiv <- fsub` |
| 28 | 1,426,704 | 0.94 % | `sub <- ashr` |
| 29 | 1,426,704 | 0.94 % | `sub <- const` |
| 30 | 1,303,180 | 0.85 % | `fcmp <- call` |
| 31 | 1,303,176 | 0.85 % | `call(llvm.fmuladd.f32) <- bitcast` |
| 32 | 1,180,441 | 0.77 % | `icmp <- const` |
| 33 | 1,180,436 | 0.77 % | `add <- const` |
| 34 | 1,180,429 | 0.77 % | `br <- icmp` |
| 35 | 1,180,426 | 0.77 % | `add <- phi` |
| 36 | 1,180,426 | 0.77 % | `icmp <- add` |
| 37 | 1,180,419 | 0.77 % | `sitofp <- phi` |
| 38 | 1,180,416 | 0.77 % | `fadd <- sitofp` |
| 39 | 1,180,416 | 0.77 % | `fdiv <- fadd` |
| 40 | 1,179,650 | 0.77 % | `bitcast <- fadd` |
| 41 | 1,179,650 | 0.77 % | `call(llvm.fmuladd.f32) <- fneg` |
| 42 | 1,179,650 | 0.77 % | `fadd <- call` |
| 43 | 1,179,649 | 0.77 % | `fadd <- fdiv` |
| 44 | 1,179,648 | 0.77 % | `call(simPutPixel) <- call` |
| 45 | 1,179,648 | 0.77 % | `fneg <- load` |
| 46 | 1,179,648 | 0.77 % | `ret <- phi` |
| 47 | 988,224 | 0.65 % | `fdiv <- extractelement` |
| 48 | 864,696 | 0.57 % | `extractelement <- const` |
| 49 | 741,168 | 0.49 % | `fsub <- insertelement` |
| 50 | 741,168 | 0.49 % | `insertelement <- call` |
| 51 | 741,168 | 0.49 % | `insertelement <- insertelement` |
| 52 | 741,168 | 0.49 % | `insertelement <- load` |
| 53 | 494,112 | 0.32 % | `call(llvm.fmuladd.f32) <- fdiv` |
| 54 | 494,112 | 0.32 % | `call(llvm.fmuladd.v2f32) <- fmul` |
| 55 | 494,112 | 0.32 % | `call(llvm.fmuladd.v2f32) <- fsub` |
| 56 | 494,112 | 0.32 % | `extractelement <- fsub` |
| 57 | 370,594 | 0.24 % | `shl <- const` |
| 58 | 370,586 | 0.24 % | `call(llvm.fmuladd.f32) <- phi` |
| 59 | 370,585 | 0.24 % | `fmul <- sitofp` |
| 60 | 370,584 | 0.24 % | `extractelement <- fmul` |
| 61 | 370,584 | 0.24 % | `fptoui <- fmul` |
| 62 | 370,584 | 0.24 % | `or <- shl` |
| 63 | 370,584 | 0.24 % | `sitofp <- load` |
| 64 | 247,058 | 0.16 % | `bitcast <- call` |
| 65 | 247,056 | 0.16 % | `call(llvm.fmuladd.v2f32) <- const` |
| 66 | 247,056 | 0.16 % | `or <- or` |
| 67 | 247,056 | 0.16 % | `shl <- fptoui` |
| 68 | 123,538 | 0.08 % | `fmul <- fdiv` |
| 69 | 123,536 | 0.08 % | `select <- fcmp` |
| 70 | 123,532 | 0.08 % | `fcmp <- fdiv` |
| 71 | 123,532 | 0.08 % | `select <- call` |
| 72 | 123,532 | 0.08 % | `select <- const` |
| 73 | 123,528 | 0.08 % | `call(llvm.fmuladd.f32) <- extractelement` |
| 74 | 123,528 | 0.08 % | `call(llvm.fmuladd.f32) <- select` |
| 75 | 123,528 | 0.08 % | `call(llvm.fmuladd.v2f32) <- bitcast` |
| 76 | 123,528 | 0.08 % | `call(llvm.fmuladd.v2f32) <- call` |
| 77 | 123,528 | 0.08 % | `fcmp <- phi` |
| 78 | 123,528 | 0.08 % | `fmul <- shufflevector` |
| 79 | 123,528 | 0.08 % | `fneg <- fmul` |
| 80 | 123,528 | 0.08 % | `fsub <- fmul` |
| 81 | 123,528 | 0.08 % | `fsub <- fneg` |
| 82 | 123,528 | 0.08 % | `or <- fptoui` |
| 83 | 123,528 | 0.08 % | `shl <- load` |
| 84 | 123,528 | 0.08 % | `shufflevector <- const` |
| 85 | 123,528 | 0.08 % | `shufflevector <- fdiv` |
| 86 | 770 | 0.00 % | `fsub <- const` |
| 87 | 768 | 0.00 % | `fsub <- fdiv` |
| 88 | 11 | 0.00 % | `fdiv <- sitofp` |
| 89 | 10 | 0.00 % | `add <- shl` |
| 90 | 10 | 0.00 % | `fadd <- fmul` |
| 91 | 10 | 0.00 % | `fadd <- phi` |
| 92 | 10 | 0.00 % | `fmul <- phi` |
| 93 | 10 | 0.00 % | `mul <- add` |
| 94 | 10 | 0.00 % | `mul <- shl` |
| 95 | 10 | 0.00 % | `shl <- phi` |
| 96 | 10 | 0.00 % | `sitofp <- mul` |
| 97 | 8 | 0.00 % | `and <- bitcast` |
| 98 | 8 | 0.00 % | `and <- const` |
| 99 | 8 | 0.00 % | `icmp <- and` |
| 100 | 8 | 0.00 % | `or <- icmp` |
| 101 | 6 | 0.00 % | `icmp <- bitcast` |
| 102 | 6 | 0.00 % | `select <- fadd` |
| 103 | 4 | 0.00 % | `fadd <- select` |
| 104 | 4 | 0.00 % | `fneg <- select` |
| 105 | 4 | 0.00 % | `select <- fneg` |
| 106 | 4 | 0.00 % | `select <- icmp` |
| 107 | 4 | 0.00 % | `select <- select` |
| 108 | 3 | 0.00 % | `store <- global` |
| 109 | 2 | 0.00 % | `and <- fcmp` |
| 110 | 2 | 0.00 % | `and <- or` |
| 111 | 2 | 0.00 % | `bitcast <- fdiv` |
| 112 | 2 | 0.00 % | `br <- and` |
| 113 | 2 | 0.00 % | `br <- or` |
| 114 | 2 | 0.00 % | `call(llvm.fabs.f32) <- fadd` |
| 115 | 2 | 0.00 % | `call(llvm.fabs.f32) <- phi` |
| 116 | 2 | 0.00 % | `fadd <- arg` |
| 117 | 2 | 0.00 % | `fadd <- load` |
| 118 | 2 | 0.00 % | `fcmp <- select` |
| 119 | 2 | 0.00 % | `fdiv <- call` |
| 120 | 2 | 0.00 % | `fmul <- fneg` |
| 121 | 2 | 0.00 % | `fmul <- select` |
| 122 | 2 | 0.00 % | `fneg <- fadd` |
| 123 | 2 | 0.00 % | `fneg <- phi` |
| 124 | 2 | 0.00 % | `fsub <- call` |
| 125 | 2 | 0.00 % | `ret <- select` |
| 126 | 2 | 0.00 % | `select <- fsub` |
| 127 | 2 | 0.00 % | `store <- call` |
| 128 | 1 | 0.00 % | `call(cos_taylor) <- fadd` |
| 129 | 1 | 0.00 % | `call(cos_taylor) <- fdiv` |
| 130 | 1 | 0.00 % | `icmp <- phi` |
| 131 | 1 | 0.00 % | `store <- fadd` |

## Operand kinds

| # | Count | Share | Operand |
|--:|--:|--:|---|
| 1 | 29,287,533 | 19.21 % | `fmul` |
| 2 | 24,560,589 | 16.11 % | `const` |
| 3 | 17,120,470 | 11.23 % | `call` |
| 4 | 13,280,354 | 8.71 % | `fsub` |
| 5 | 11,043,052 | 7.24 % | `load` |
| 6 | 10,987,418 | 7.21 % | `arg` |
| 7 | 9,122,241 | 5.98 % | `global` |
| 8 | 6,393,938 | 4.19 % | `phi` |
| 9 | 5,899,022 | 3.87 % | `fadd` |
| 10 | 5,706,830 | 3.74 % | `bitcast` |
| 11 | 5,584,074 | 3.66 % | `fdiv` |
| 12 | 1,551,012 | 1.02 % | `sitofp` |
| 13 | 1,550,244 | 1.02 % | `fcmp` |
| 14 | 1,482,336 | 0.97 % | `insertelement` |
| 15 | 1,426,704 | 0.94 % | `ashr` |
| 16 | 1,426,704 | 0.94 % | `sub` |
| 17 | 1,303,184 | 0.85 % | `fneg` |
| 18 | 1,180,441 | 0.77 % | `icmp` |
| 19 | 1,180,436 | 0.77 % | `add` |
| 20 | 1,111,752 | 0.73 % | `extractelement` |
| 21 | 370,604 | 0.24 % | `shl` |
| 22 | 370,584 | 0.24 % | `fptoui` |
| 23 | 247,060 | 0.16 % | `or` |
| 24 | 123,546 | 0.08 % | `select` |
| 25 | 123,528 | 0.08 % | `shufflevector` |
| 26 | 10 | 0.00 % | `and` |
| 27 | 10 | 0.00 % | `mul` |
