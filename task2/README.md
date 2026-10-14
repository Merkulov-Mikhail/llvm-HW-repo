# Running
```bash
make        # -O2: pass -> instrumented app -> trace of 1 frame -> stats/O2
make OPT=Os # the same for -Os
make ir     # instrumented IR: build/raytracing.O2.ll
SDL_VIDEODRIVER=dummy make    # without a window
```

# Layout

| Path                      | Contents                                                                     |
| ------------------------- | ---------------------------------------------------------------------------- |
| `pass/UsageTracePass.cpp` | the pass: a call `usage_trace_log(id)` before every non-phi instruction      |
| `runtime/trace_rt.c`      | the logger: writes `trace.map` (id -> record) and `trace.bin` (executed ids) |
| `analysis/ngrams.py`      | counts windows of 1-5 instructions in the trace                              |
| `stats/O2`, `stats/Os`    | results                                                                      |

# Results

In `stats/<OPT>/`:

- `ngrams.md` — windows of opcodes, a table per window length, e.g. `load load fsub`;
- `ngrams_full.md` — the same with full records, e.g. `load <- global ; fsub <- load load`;
- `user_operand.md` — User <- Operand pairs, e.g. `fsub <- load`.
