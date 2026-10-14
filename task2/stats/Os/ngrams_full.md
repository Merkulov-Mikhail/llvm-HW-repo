# Windows of full records (User <- Operands)

Trace `out/Os/trace.bin`: 76,622,940 events, 247 of 306 instrumented instructions executed.

## Window 1

76,622,940 windows, 122 distinct.

| # | Count | Share | Pattern |
|--:|--:|--:|---|
| 1 | 9,122,238 | 11.91 % | `load <- global` |
| 2 | 3,538,944 | 4.62 % | `fsub <- load load` |
| 3 | 2,729,880 | 3.56 % | `fmul <- call const` |
| 4 | 2,606,352 | 3.40 % | `fmul <- fmul call` |
| 5 | 2,359,296 | 3.08 % | `call(llvm.fmuladd.f32) <- fmul fmul fmul` |
| 6 | 2,359,296 | 3.08 % | `fmul <- fadd const` |
| 7 | 1,426,706 | 1.86 % | `br <- fcmp` |
| 8 | 1,426,704 | 1.86 % | `ashr <- bitcast const` |
| 9 | 1,426,704 | 1.86 % | `bitcast <- sub` |
| 10 | 1,426,704 | 1.86 % | `fdiv <- fsub fmul` |
| 11 | 1,426,704 | 1.86 % | `fmul <- call bitcast` |
| 12 | 1,426,704 | 1.86 % | `fmul <- fmul bitcast` |
| 13 | 1,426,704 | 1.86 % | `fmul <- fmul fmul` |
| 14 | 1,426,704 | 1.86 % | `sub <- const ashr` |
| 15 | 1,303,944 | 1.70 % | `fmul <- fsub fsub` |
| 16 | 1,303,180 | 1.70 % | `fcmp <- call const` |
| 17 | 1,303,176 | 1.70 % | `call(llvm.fmuladd.f32) <- fmul bitcast const` |
| 18 | 1,303,176 | 1.70 % | `call(llvm.fmuladd.f32) <- fmul fmul const` |
| 19 | 1,180,429 | 1.54 % | `br <- icmp` |
| 20 | 1,180,426 | 1.54 % | `add <- phi const` |
| 21 | 1,180,426 | 1.54 % | `icmp <- add const` |
| 22 | 1,180,419 | 1.54 % | `sitofp <- phi` |
| 23 | 1,180,416 | 1.54 % | `fadd <- sitofp const` |
| 24 | 1,180,416 | 1.54 % | `fdiv <- fadd const` |
| 25 | 1,179,650 | 1.54 % | `bitcast <- fadd` |
| 26 | 1,179,650 | 1.54 % | `fadd <- call const` |
| 27 | 1,179,649 | 1.54 % | `fadd <- fdiv const` |
| 28 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- arg arg call` |
| 29 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- arg arg fmul` |
| 30 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fneg load call` |

## Window 2

76,622,939 windows, 189 distinct.

| # | Count | Share | Pattern |
|--:|--:|--:|---|
| 1 | 3,786,001 | 4.94 % | `load <- global ; load <- global` |
| 2 | 3,538,944 | 4.62 % | `load <- global ; fsub <- load load` |
| 3 | 2,359,296 | 3.08 % | `fsub <- load load ; load <- global` |
| 4 | 1,426,704 | 1.86 % | `ashr <- bitcast const ; sub <- const ashr` |
| 5 | 1,426,704 | 1.86 % | `fmul <- call bitcast ; fmul <- fmul fmul` |
| 6 | 1,426,704 | 1.86 % | `sub <- const ashr ; bitcast <- sub` |
| 7 | 1,303,176 | 1.70 % | `call(llvm.fmuladd.f32) <- fmul bitcast const ; fmul <- call bitcast` |
| 8 | 1,303,176 | 1.70 % | `call(llvm.fmuladd.f32) <- fmul fmul const ; fmul <- fmul call` |
| 9 | 1,303,176 | 1.70 % | `fmul <- fmul bitcast ; call(llvm.fmuladd.f32) <- fmul bitcast const` |
| 10 | 1,303,176 | 1.70 % | `fmul <- fmul fmul ; call(llvm.fmuladd.f32) <- fmul fmul const` |
| 11 | 1,180,426 | 1.54 % | `add <- phi const ; icmp <- add const` |
| 12 | 1,180,426 | 1.54 % | `icmp <- add const ; br <- icmp` |
| 13 | 1,180,416 | 1.54 % | `fadd <- sitofp const ; fdiv <- fadd const` |
| 14 | 1,180,416 | 1.54 % | `sitofp <- phi ; fadd <- sitofp const` |
| 15 | 1,179,648 | 1.54 % | `bitcast <- fadd ; ashr <- bitcast const` |
| 16 | 1,179,648 | 1.54 % | `bitcast <- sub ; fmul <- fadd const` |
| 17 | 1,179,648 | 1.54 % | `br <- icmp ; sitofp <- phi` |
| 18 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- arg arg call ; fmul <- fsub arg` |
| 19 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- arg arg fmul ; call(llvm.fmuladd.f32) <- arg arg call` |
| 20 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fmul fmul fmul ; fadd <- call const` |
| 21 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fmul fmul fmul ; fcmp <- call const` |
| 22 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fneg load call ; fmul <- call const` |
| 23 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub arg call ; fmul <- call const` |
| 24 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub arg fmul ; call(llvm.fmuladd.f32) <- fsub arg call` |
| 25 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub fsub call ; load <- global` |
| 26 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub fsub fmul ; call(llvm.fmuladd.f32) <- fsub fsub call` |
| 27 | 1,179,648 | 1.54 % | `call(simPutPixel) <- phi phi call ; add <- phi const` |
| 28 | 1,179,648 | 1.54 % | `call(trace) <- fdiv fdiv fdiv ; load <- global` |
| 29 | 1,179,648 | 1.54 % | `fadd <- call const ; bitcast <- fadd` |
| 30 | 1,179,648 | 1.54 % | `fadd <- fdiv const ; fmul <- fadd const` |

## Window 3

76,622,938 windows, 215 distinct.

| # | Count | Share | Pattern |
|--:|--:|--:|---|
| 1 | 3,538,944 | 4.62 % | `load <- global ; load <- global ; fsub <- load load` |
| 2 | 2,359,296 | 3.08 % | `fsub <- load load ; load <- global ; load <- global` |
| 3 | 2,359,296 | 3.08 % | `load <- global ; fsub <- load load ; load <- global` |
| 4 | 1,426,704 | 1.86 % | `ashr <- bitcast const ; sub <- const ashr ; bitcast <- sub` |
| 5 | 1,303,176 | 1.70 % | `call(llvm.fmuladd.f32) <- fmul bitcast const ; fmul <- call bitcast ; fmul <- fmul fmul` |
| 6 | 1,303,176 | 1.70 % | `fmul <- call bitcast ; fmul <- fmul fmul ; call(llvm.fmuladd.f32) <- fmul fmul const` |
| 7 | 1,303,176 | 1.70 % | `fmul <- fmul bitcast ; call(llvm.fmuladd.f32) <- fmul bitcast const ; fmul <- call bitcast` |
| 8 | 1,303,176 | 1.70 % | `fmul <- fmul fmul ; call(llvm.fmuladd.f32) <- fmul fmul const ; fmul <- fmul call` |
| 9 | 1,180,426 | 1.54 % | `add <- phi const ; icmp <- add const ; br <- icmp` |
| 10 | 1,180,416 | 1.54 % | `sitofp <- phi ; fadd <- sitofp const ; fdiv <- fadd const` |
| 11 | 1,179,648 | 1.54 % | `bitcast <- fadd ; ashr <- bitcast const ; sub <- const ashr` |
| 12 | 1,179,648 | 1.54 % | `bitcast <- sub ; fmul <- fadd const ; fmul <- fmul bitcast` |
| 13 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- arg arg call ; fmul <- fsub arg ; call(llvm.fmuladd.f32) <- fsub arg fmul` |
| 14 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- arg arg fmul ; call(llvm.fmuladd.f32) <- arg arg call ; fmul <- fsub arg` |
| 15 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fmul fmul const ; fmul <- fmul call ; fmul <- fadd fmul` |
| 16 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fmul fmul fmul ; fadd <- call const ; bitcast <- fadd` |
| 17 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fmul fmul fmul ; fcmp <- call const ; br <- fcmp` |
| 18 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fneg load call ; fmul <- call const ; fmul <- fmul call` |
| 19 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub arg call ; fmul <- call const ; fmul <- fsub fsub` |
| 20 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub arg fmul ; call(llvm.fmuladd.f32) <- fsub arg call ; fmul <- call const` |
| 21 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub fsub call ; load <- global ; fneg <- load` |
| 22 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub fsub fmul ; call(llvm.fmuladd.f32) <- fsub fsub call ; load <- global` |
| 23 | 1,179,648 | 1.54 % | `call(simPutPixel) <- phi phi call ; add <- phi const ; icmp <- add const` |
| 24 | 1,179,648 | 1.54 % | `call(trace) <- fdiv fdiv fdiv ; load <- global ; load <- global` |
| 25 | 1,179,648 | 1.54 % | `fadd <- call const ; bitcast <- fadd ; ashr <- bitcast const` |
| 26 | 1,179,648 | 1.54 % | `fadd <- fdiv const ; fmul <- fadd const ; call(llvm.fmuladd.f32) <- fmul fmul fmul` |
| 27 | 1,179,648 | 1.54 % | `fadd <- sitofp const ; fdiv <- fadd const ; fadd <- fdiv const` |
| 28 | 1,179,648 | 1.54 % | `fdiv <- const fmul ; call(trace) <- fdiv fdiv fdiv ; load <- global` |
| 29 | 1,179,648 | 1.54 % | `fdiv <- fadd const ; fadd <- fdiv const ; fmul <- fadd const` |
| 30 | 1,179,648 | 1.54 % | `fdiv <- fmul fmul ; fdiv <- fsub fmul ; fdiv <- const fmul` |

## Window 4

76,622,937 windows, 229 distinct.

| # | Count | Share | Pattern |
|--:|--:|--:|---|
| 1 | 2,359,296 | 3.08 % | `fsub <- load load ; load <- global ; load <- global ; fsub <- load load` |
| 2 | 2,359,296 | 3.08 % | `load <- global ; fsub <- load load ; load <- global ; load <- global` |
| 3 | 2,359,296 | 3.08 % | `load <- global ; load <- global ; fsub <- load load ; load <- global` |
| 4 | 1,303,176 | 1.70 % | `call(llvm.fmuladd.f32) <- fmul bitcast const ; fmul <- call bitcast ; fmul <- fmul fmul ; call(llvm.fmuladd.f32) <- fmul fmul const` |
| 5 | 1,303,176 | 1.70 % | `fmul <- call bitcast ; fmul <- fmul fmul ; call(llvm.fmuladd.f32) <- fmul fmul const ; fmul <- fmul call` |
| 6 | 1,303,176 | 1.70 % | `fmul <- fmul bitcast ; call(llvm.fmuladd.f32) <- fmul bitcast const ; fmul <- call bitcast ; fmul <- fmul fmul` |
| 7 | 1,179,648 | 1.54 % | `ashr <- bitcast const ; sub <- const ashr ; bitcast <- sub ; fmul <- fadd const` |
| 8 | 1,179,648 | 1.54 % | `bitcast <- fadd ; ashr <- bitcast const ; sub <- const ashr ; bitcast <- sub` |
| 9 | 1,179,648 | 1.54 % | `bitcast <- sub ; fmul <- fadd const ; fmul <- fmul bitcast ; call(llvm.fmuladd.f32) <- fmul bitcast const` |
| 10 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- arg arg call ; fmul <- fsub arg ; call(llvm.fmuladd.f32) <- fsub arg fmul ; call(llvm.fmuladd.f32) <- fsub arg call` |
| 11 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- arg arg fmul ; call(llvm.fmuladd.f32) <- arg arg call ; fmul <- fsub arg ; call(llvm.fmuladd.f32) <- fsub arg fmul` |
| 12 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fmul fmul const ; fmul <- fmul call ; fmul <- fadd fmul ; fdiv <- fmul fmul` |
| 13 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fmul fmul fmul ; fadd <- call const ; bitcast <- fadd ; ashr <- bitcast const` |
| 14 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fneg load call ; fmul <- call const ; fmul <- fmul call ; call(llvm.fmuladd.f32) <- fmul fmul fmul` |
| 15 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub arg call ; fmul <- call const ; fmul <- fsub fsub ; call(llvm.fmuladd.f32) <- fsub fsub fmul` |
| 16 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub arg fmul ; call(llvm.fmuladd.f32) <- fsub arg call ; fmul <- call const ; fmul <- fsub fsub` |
| 17 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub fsub call ; load <- global ; fneg <- load ; call(llvm.fmuladd.f32) <- fneg load call` |
| 18 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub fsub fmul ; call(llvm.fmuladd.f32) <- fsub fsub call ; load <- global ; fneg <- load` |
| 19 | 1,179,648 | 1.54 % | `call(simPutPixel) <- phi phi call ; add <- phi const ; icmp <- add const ; br <- icmp` |
| 20 | 1,179,648 | 1.54 % | `call(trace) <- fdiv fdiv fdiv ; load <- global ; load <- global ; fsub <- load load` |
| 21 | 1,179,648 | 1.54 % | `fadd <- call const ; bitcast <- fadd ; ashr <- bitcast const ; sub <- const ashr` |
| 22 | 1,179,648 | 1.54 % | `fadd <- fdiv const ; fmul <- fadd const ; call(llvm.fmuladd.f32) <- fmul fmul fmul ; fadd <- call const` |
| 23 | 1,179,648 | 1.54 % | `fadd <- sitofp const ; fdiv <- fadd const ; fadd <- fdiv const ; fmul <- fadd const` |
| 24 | 1,179,648 | 1.54 % | `fdiv <- const fmul ; call(trace) <- fdiv fdiv fdiv ; load <- global ; load <- global` |
| 25 | 1,179,648 | 1.54 % | `fdiv <- fadd const ; fadd <- fdiv const ; fmul <- fadd const ; call(llvm.fmuladd.f32) <- fmul fmul fmul` |
| 26 | 1,179,648 | 1.54 % | `fdiv <- fmul fmul ; fdiv <- fsub fmul ; fdiv <- const fmul ; call(trace) <- fdiv fdiv fdiv` |
| 27 | 1,179,648 | 1.54 % | `fdiv <- fsub fmul ; fdiv <- const fmul ; call(trace) <- fdiv fdiv fdiv ; load <- global` |
| 28 | 1,179,648 | 1.54 % | `fmul <- arg arg ; call(llvm.fmuladd.f32) <- arg arg fmul ; call(llvm.fmuladd.f32) <- arg arg call ; fmul <- fsub arg` |
| 29 | 1,179,648 | 1.54 % | `fmul <- call const ; fmul <- fmul call ; call(llvm.fmuladd.f32) <- fmul fmul fmul ; fcmp <- call const` |
| 30 | 1,179,648 | 1.54 % | `fmul <- call const ; fmul <- fsub fsub ; call(llvm.fmuladd.f32) <- fsub fsub fmul ; call(llvm.fmuladd.f32) <- fsub fsub call` |

## Window 5

76,622,936 windows, 241 distinct.

| # | Count | Share | Pattern |
|--:|--:|--:|---|
| 1 | 2,359,296 | 3.08 % | `load <- global ; fsub <- load load ; load <- global ; load <- global ; fsub <- load load` |
| 2 | 2,359,296 | 3.08 % | `load <- global ; load <- global ; fsub <- load load ; load <- global ; load <- global` |
| 3 | 1,303,176 | 1.70 % | `call(llvm.fmuladd.f32) <- fmul bitcast const ; fmul <- call bitcast ; fmul <- fmul fmul ; call(llvm.fmuladd.f32) <- fmul fmul const ; fmul <- fmul call` |
| 4 | 1,303,176 | 1.70 % | `fmul <- fmul bitcast ; call(llvm.fmuladd.f32) <- fmul bitcast const ; fmul <- call bitcast ; fmul <- fmul fmul ; call(llvm.fmuladd.f32) <- fmul fmul const` |
| 5 | 1,179,648 | 1.54 % | `ashr <- bitcast const ; sub <- const ashr ; bitcast <- sub ; fmul <- fadd const ; fmul <- fmul bitcast` |
| 6 | 1,179,648 | 1.54 % | `bitcast <- fadd ; ashr <- bitcast const ; sub <- const ashr ; bitcast <- sub ; fmul <- fadd const` |
| 7 | 1,179,648 | 1.54 % | `bitcast <- sub ; fmul <- fadd const ; fmul <- fmul bitcast ; call(llvm.fmuladd.f32) <- fmul bitcast const ; fmul <- call bitcast` |
| 8 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- arg arg call ; fmul <- fsub arg ; call(llvm.fmuladd.f32) <- fsub arg fmul ; call(llvm.fmuladd.f32) <- fsub arg call ; fmul <- call const` |
| 9 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- arg arg fmul ; call(llvm.fmuladd.f32) <- arg arg call ; fmul <- fsub arg ; call(llvm.fmuladd.f32) <- fsub arg fmul ; call(llvm.fmuladd.f32) <- fsub arg call` |
| 10 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fmul fmul const ; fmul <- fmul call ; fmul <- fadd fmul ; fdiv <- fmul fmul ; fdiv <- fsub fmul` |
| 11 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fmul fmul fmul ; fadd <- call const ; bitcast <- fadd ; ashr <- bitcast const ; sub <- const ashr` |
| 12 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fneg load call ; fmul <- call const ; fmul <- fmul call ; call(llvm.fmuladd.f32) <- fmul fmul fmul ; fcmp <- call const` |
| 13 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub arg call ; fmul <- call const ; fmul <- fsub fsub ; call(llvm.fmuladd.f32) <- fsub fsub fmul ; call(llvm.fmuladd.f32) <- fsub fsub call` |
| 14 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub arg fmul ; call(llvm.fmuladd.f32) <- fsub arg call ; fmul <- call const ; fmul <- fsub fsub ; call(llvm.fmuladd.f32) <- fsub fsub fmul` |
| 15 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub fsub call ; load <- global ; fneg <- load ; call(llvm.fmuladd.f32) <- fneg load call ; fmul <- call const` |
| 16 | 1,179,648 | 1.54 % | `call(llvm.fmuladd.f32) <- fsub fsub fmul ; call(llvm.fmuladd.f32) <- fsub fsub call ; load <- global ; fneg <- load ; call(llvm.fmuladd.f32) <- fneg load call` |
| 17 | 1,179,648 | 1.54 % | `call(trace) <- fdiv fdiv fdiv ; load <- global ; load <- global ; fsub <- load load ; load <- global` |
| 18 | 1,179,648 | 1.54 % | `fadd <- call const ; bitcast <- fadd ; ashr <- bitcast const ; sub <- const ashr ; bitcast <- sub` |
| 19 | 1,179,648 | 1.54 % | `fadd <- fdiv const ; fmul <- fadd const ; call(llvm.fmuladd.f32) <- fmul fmul fmul ; fadd <- call const ; bitcast <- fadd` |
| 20 | 1,179,648 | 1.54 % | `fadd <- sitofp const ; fdiv <- fadd const ; fadd <- fdiv const ; fmul <- fadd const ; call(llvm.fmuladd.f32) <- fmul fmul fmul` |
| 21 | 1,179,648 | 1.54 % | `fdiv <- const fmul ; call(trace) <- fdiv fdiv fdiv ; load <- global ; load <- global ; fsub <- load load` |
| 22 | 1,179,648 | 1.54 % | `fdiv <- fadd const ; fadd <- fdiv const ; fmul <- fadd const ; call(llvm.fmuladd.f32) <- fmul fmul fmul ; fadd <- call const` |
| 23 | 1,179,648 | 1.54 % | `fdiv <- fmul fmul ; fdiv <- fsub fmul ; fdiv <- const fmul ; call(trace) <- fdiv fdiv fdiv ; load <- global` |
| 24 | 1,179,648 | 1.54 % | `fdiv <- fsub fmul ; fdiv <- const fmul ; call(trace) <- fdiv fdiv fdiv ; load <- global ; load <- global` |
| 25 | 1,179,648 | 1.54 % | `fmul <- arg arg ; call(llvm.fmuladd.f32) <- arg arg fmul ; call(llvm.fmuladd.f32) <- arg arg call ; fmul <- fsub arg ; call(llvm.fmuladd.f32) <- fsub arg fmul` |
| 26 | 1,179,648 | 1.54 % | `fmul <- call bitcast ; fmul <- fmul fmul ; call(llvm.fmuladd.f32) <- fmul fmul const ; fmul <- fmul call ; fmul <- fadd fmul` |
| 27 | 1,179,648 | 1.54 % | `fmul <- call const ; fmul <- fmul call ; call(llvm.fmuladd.f32) <- fmul fmul fmul ; fcmp <- call const ; br <- fcmp` |
| 28 | 1,179,648 | 1.54 % | `fmul <- call const ; fmul <- fsub fsub ; call(llvm.fmuladd.f32) <- fsub fsub fmul ; call(llvm.fmuladd.f32) <- fsub fsub call ; load <- global` |
| 29 | 1,179,648 | 1.54 % | `fmul <- fadd const ; call(llvm.fmuladd.f32) <- fmul fmul fmul ; fadd <- call const ; bitcast <- fadd ; ashr <- bitcast const` |
| 30 | 1,179,648 | 1.54 % | `fmul <- fadd const ; fmul <- fmul bitcast ; call(llvm.fmuladd.f32) <- fmul bitcast const ; fmul <- call bitcast ; fmul <- fmul fmul` |
