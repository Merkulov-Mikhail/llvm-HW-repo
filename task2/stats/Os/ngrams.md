# Windows of User opcodes

Trace `out/Os/trace.bin`: 76,622,940 events, 247 of 306 instrumented instructions executed.

## Window 1

76,622,940 windows, 33 distinct.

| # | Count | Share | Pattern |
|--:|--:|--:|---|
| 1 | 17,559,709 | 22.92 % | `fmul` |
| 2 | 13,964,356 | 18.22 % | `call(llvm.fmuladd.f32)` |
| 3 | 9,122,238 | 11.91 % | `load` |
| 4 | 5,460,541 | 7.13 % | `fdiv` |
| 5 | 4,033,826 | 5.26 % | `fsub` |
| 6 | 3,539,732 | 4.62 % | `fadd` |
| 7 | 2,853,414 | 3.72 % | `bitcast` |
| 8 | 2,731,444 | 3.56 % | `br` |
| 9 | 1,551,013 | 2.02 % | `sitofp` |
| 10 | 1,550,242 | 2.02 % | `fcmp` |
| 11 | 1,482,336 | 1.93 % | `insertelement` |
| 12 | 1,426,704 | 1.86 % | `ashr` |
| 13 | 1,426,704 | 1.86 % | `sub` |
| 14 | 1,303,184 | 1.70 % | `fneg` |
| 15 | 1,180,441 | 1.54 % | `icmp` |
| 16 | 1,180,436 | 1.54 % | `add` |
| 17 | 1,179,651 | 1.54 % | `ret` |
| 18 | 1,179,648 | 1.54 % | `call(simPutPixel)` |
| 19 | 1,179,648 | 1.54 % | `call(trace)` |
| 20 | 864,696 | 1.13 % | `extractelement` |
| 21 | 494,112 | 0.64 % | `call(llvm.fmuladd.v2f32)` |
| 22 | 370,594 | 0.48 % | `shl` |
| 23 | 370,588 | 0.48 % | `or` |
| 24 | 370,584 | 0.48 % | `fptoui` |
| 25 | 123,540 | 0.16 % | `select` |
| 26 | 123,528 | 0.16 % | `shufflevector` |
| 27 | 10 | 0.00 % | `and` |
| 28 | 10 | 0.00 % | `mul` |
| 29 | 4 | 0.00 % | `call(llvm.fabs.f32)` |
| 30 | 3 | 0.00 % | `store` |

## Window 2

76,622,939 windows, 121 distinct.

| # | Count | Share | Pattern |
|--:|--:|--:|---|
| 1 | 8,504,592 | 11.10 % | `fmul call(llvm.fmuladd.f32)` |
| 2 | 6,639,408 | 8.67 % | `fmul fmul` |
| 3 | 6,145,296 | 8.02 % | `call(llvm.fmuladd.f32) fmul` |
| 4 | 3,909,528 | 5.10 % | `call(llvm.fmuladd.f32) call(llvm.fmuladd.f32)` |
| 5 | 3,786,001 | 4.94 % | `load load` |
| 6 | 3,538,944 | 4.62 % | `load fsub` |
| 7 | 2,482,824 | 3.24 % | `fdiv fdiv` |
| 8 | 2,359,296 | 3.08 % | `fsub load` |
| 9 | 1,427,472 | 1.86 % | `fsub fmul` |
| 10 | 1,426,706 | 1.86 % | `fcmp br` |
| 11 | 1,426,704 | 1.86 % | `ashr sub` |
| 12 | 1,426,704 | 1.86 % | `bitcast ashr` |
| 13 | 1,426,704 | 1.86 % | `bitcast fmul` |
| 14 | 1,426,704 | 1.86 % | `call(llvm.fmuladd.f32) load` |
| 15 | 1,426,704 | 1.86 % | `sub bitcast` |
| 16 | 1,303,178 | 1.70 % | `call(llvm.fmuladd.f32) fcmp` |
| 17 | 1,303,176 | 1.70 % | `fmul fdiv` |
| 18 | 1,180,429 | 1.54 % | `icmp br` |
| 19 | 1,180,426 | 1.54 % | `add icmp` |
| 20 | 1,180,418 | 1.54 % | `br sitofp` |
| 21 | 1,180,416 | 1.54 % | `fadd fdiv` |
| 22 | 1,180,416 | 1.54 % | `sitofp fadd` |
| 23 | 1,179,650 | 1.54 % | `fadd bitcast` |
| 24 | 1,179,650 | 1.54 % | `fneg call(llvm.fmuladd.f32)` |
| 25 | 1,179,649 | 1.54 % | `br ret` |
| 26 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fadd` |
| 27 | 1,179,648 | 1.54 % | `call(simPutPixel) add` |
| 28 | 1,179,648 | 1.54 % | `call(trace) load` |
| 29 | 1,179,648 | 1.54 % | `fadd fmul` |
| 30 | 1,179,648 | 1.54 % | `fdiv call(trace)` |

## Window 3

76,622,938 windows, 184 distinct.

| # | Count | Share | Pattern |
|--:|--:|--:|---|
| 1 | 4,965,648 | 6.48 % | `call(llvm.fmuladd.f32) fmul fmul` |
| 2 | 4,965,648 | 6.48 % | `fmul fmul call(llvm.fmuladd.f32)` |
| 3 | 3,538,944 | 4.62 % | `fmul call(llvm.fmuladd.f32) call(llvm.fmuladd.f32)` |
| 4 | 3,538,944 | 4.62 % | `load load fsub` |
| 5 | 2,606,352 | 3.40 % | `fmul call(llvm.fmuladd.f32) fmul` |
| 6 | 2,359,296 | 3.08 % | `call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) fmul` |
| 7 | 2,359,296 | 3.08 % | `fsub load load` |
| 8 | 2,359,296 | 3.08 % | `load fsub load` |
| 9 | 1,426,704 | 1.86 % | `ashr sub bitcast` |
| 10 | 1,426,704 | 1.86 % | `bitcast ashr sub` |
| 11 | 1,426,704 | 1.86 % | `bitcast fmul fmul` |
| 12 | 1,426,704 | 1.86 % | `sub bitcast fmul` |
| 13 | 1,303,176 | 1.70 % | `call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) load` |
| 14 | 1,180,426 | 1.54 % | `add icmp br` |
| 15 | 1,180,416 | 1.54 % | `br sitofp fadd` |
| 16 | 1,180,416 | 1.54 % | `sitofp fadd fdiv` |
| 17 | 1,179,648 | 1.54 % | `br ret call(simPutPixel)` |
| 18 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fadd bitcast` |
| 19 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fcmp br` |
| 20 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fmul call(llvm.fmuladd.f32)` |
| 21 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) load fneg` |
| 22 | 1,179,648 | 1.54 % | `call(simPutPixel) add icmp` |
| 23 | 1,179,648 | 1.54 % | `call(trace) load load` |
| 24 | 1,179,648 | 1.54 % | `fadd bitcast ashr` |
| 25 | 1,179,648 | 1.54 % | `fadd fdiv fadd` |
| 26 | 1,179,648 | 1.54 % | `fadd fmul call(llvm.fmuladd.f32)` |
| 27 | 1,179,648 | 1.54 % | `fdiv call(trace) load` |
| 28 | 1,179,648 | 1.54 % | `fdiv fadd fmul` |
| 29 | 1,179,648 | 1.54 % | `fdiv fdiv call(trace)` |
| 30 | 1,179,648 | 1.54 % | `fdiv fdiv fdiv` |

## Window 4

76,622,937 windows, 210 distinct.

| # | Count | Share | Pattern |
|--:|--:|--:|---|
| 1 | 3,662,472 | 4.78 % | `call(llvm.fmuladd.f32) fmul fmul call(llvm.fmuladd.f32)` |
| 2 | 2,606,352 | 3.40 % | `fmul call(llvm.fmuladd.f32) fmul fmul` |
| 3 | 2,606,352 | 3.40 % | `fmul fmul call(llvm.fmuladd.f32) fmul` |
| 4 | 2,359,296 | 3.08 % | `fmul call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) fmul` |
| 5 | 2,359,296 | 3.08 % | `fsub load load fsub` |
| 6 | 2,359,296 | 3.08 % | `load fsub load load` |
| 7 | 2,359,296 | 3.08 % | `load load fsub load` |
| 8 | 1,426,704 | 1.86 % | `ashr sub bitcast fmul` |
| 9 | 1,426,704 | 1.86 % | `bitcast ashr sub bitcast` |
| 10 | 1,426,704 | 1.86 % | `sub bitcast fmul fmul` |
| 11 | 1,303,176 | 1.70 % | `bitcast fmul fmul call(llvm.fmuladd.f32)` |
| 12 | 1,180,416 | 1.54 % | `br sitofp fadd fdiv` |
| 13 | 1,179,648 | 1.54 % | `br ret call(simPutPixel) add` |
| 14 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) fmul call(llvm.fmuladd.f32)` |
| 15 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) fmul fmul` |
| 16 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) load fneg` |
| 17 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fadd bitcast ashr` |
| 18 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fmul call(llvm.fmuladd.f32) call(llvm.fmuladd.f32)` |
| 19 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fmul fmul fdiv` |
| 20 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) load fneg call(llvm.fmuladd.f32)` |
| 21 | 1,179,648 | 1.54 % | `call(simPutPixel) add icmp br` |
| 22 | 1,179,648 | 1.54 % | `call(trace) load load fsub` |
| 23 | 1,179,648 | 1.54 % | `fadd bitcast ashr sub` |
| 24 | 1,179,648 | 1.54 % | `fadd fdiv fadd fmul` |
| 25 | 1,179,648 | 1.54 % | `fadd fmul call(llvm.fmuladd.f32) fadd` |
| 26 | 1,179,648 | 1.54 % | `fdiv call(trace) load load` |
| 27 | 1,179,648 | 1.54 % | `fdiv fadd fmul call(llvm.fmuladd.f32)` |
| 28 | 1,179,648 | 1.54 % | `fdiv fdiv call(trace) load` |
| 29 | 1,179,648 | 1.54 % | `fdiv fdiv fdiv call(trace)` |
| 30 | 1,179,648 | 1.54 % | `fmul call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) load` |

## Window 5

76,622,936 windows, 226 distinct.

| # | Count | Share | Pattern |
|--:|--:|--:|---|
| 1 | 2,606,352 | 3.40 % | `fmul fmul call(llvm.fmuladd.f32) fmul fmul` |
| 2 | 2,359,296 | 3.08 % | `load fsub load load fsub` |
| 3 | 2,359,296 | 3.08 % | `load load fsub load load` |
| 4 | 1,426,704 | 1.86 % | `ashr sub bitcast fmul fmul` |
| 5 | 1,426,704 | 1.86 % | `bitcast ashr sub bitcast fmul` |
| 6 | 1,303,176 | 1.70 % | `bitcast fmul fmul call(llvm.fmuladd.f32) fmul` |
| 7 | 1,303,176 | 1.70 % | `call(llvm.fmuladd.f32) fmul fmul call(llvm.fmuladd.f32) fmul` |
| 8 | 1,303,176 | 1.70 % | `fmul call(llvm.fmuladd.f32) fmul fmul call(llvm.fmuladd.f32)` |
| 9 | 1,303,176 | 1.70 % | `sub bitcast fmul fmul call(llvm.fmuladd.f32)` |
| 10 | 1,179,648 | 1.54 % | `br ret call(simPutPixel) add icmp` |
| 11 | 1,179,648 | 1.54 % | `br sitofp fadd fdiv fadd` |
| 12 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) fmul call(llvm.fmuladd.f32) call(llvm.fmuladd.f32)` |
| 13 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) fmul fmul call(llvm.fmuladd.f32)` |
| 14 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) load fneg call(llvm.fmuladd.f32)` |
| 15 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fadd bitcast ashr sub` |
| 16 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fmul call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) fmul` |
| 17 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fmul fmul call(llvm.fmuladd.f32) call(llvm.fmuladd.f32)` |
| 18 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fmul fmul call(llvm.fmuladd.f32) fcmp` |
| 19 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) fmul fmul fdiv fdiv` |
| 20 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) load fneg call(llvm.fmuladd.f32) fmul` |
| 21 | 1,179,648 | 1.54 % | `call(trace) load load fsub load` |
| 22 | 1,179,648 | 1.54 % | `fadd bitcast ashr sub bitcast` |
| 23 | 1,179,648 | 1.54 % | `fadd fdiv fadd fmul call(llvm.fmuladd.f32)` |
| 24 | 1,179,648 | 1.54 % | `fadd fmul call(llvm.fmuladd.f32) fadd bitcast` |
| 25 | 1,179,648 | 1.54 % | `fdiv call(trace) load load fsub` |
| 26 | 1,179,648 | 1.54 % | `fdiv fadd fmul call(llvm.fmuladd.f32) fadd` |
| 27 | 1,179,648 | 1.54 % | `fdiv fdiv call(trace) load load` |
| 28 | 1,179,648 | 1.54 % | `fdiv fdiv fdiv call(trace) load` |
| 29 | 1,179,648 | 1.54 % | `fmul call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) fmul call(llvm.fmuladd.f32)` |
| 30 | 1,179,648 | 1.54 % | `fmul call(llvm.fmuladd.f32) call(llvm.fmuladd.f32) fmul fmul` |
