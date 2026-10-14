APP_DIR ?= ../task1
OPT     ?= O2
FRAMES  ?= 1
TOP     ?= 30

BUILD_DIR = build
OUT_DIR   = out/$(OPT)
STATS_DIR = stats/$(OPT)

PLUGIN   = $(BUILD_DIR)/libUsageTrace.so
APP_OBJ  = $(BUILD_DIR)/raytracing.$(OPT).o
APP_IR   = $(BUILD_DIR)/raytracing.$(OPT).ll
APP_BIN  = $(BUILD_DIR)/raytracing.$(OPT)
TRACE    = $(OUT_DIR)/trace.bin
STATS    = $(STATS_DIR)/ngrams.md

APP_HEADERS = $(APP_DIR)/sim.h $(APP_DIR)/mymath.h
LLVM_CXXFLAGS = $(shell llvm-config --cxxflags)

all: stats

pass: $(PLUGIN)
app: $(APP_BIN)
ir: $(APP_IR)
trace: $(TRACE)
stats: $(STATS)

$(BUILD_DIR) $(OUT_DIR) $(STATS_DIR):
	mkdir -p $@

$(PLUGIN): pass/UsageTracePass.cpp | $(BUILD_DIR)
	clang++ $(LLVM_CXXFLAGS) -O2 -fPIC -shared $< -o $@

# Only the logical module goes through the plugin.
$(APP_OBJ): $(APP_DIR)/raytracing.c $(APP_HEADERS) $(PLUGIN) | $(BUILD_DIR)
	clang -$(OPT) -c $< -fpass-plugin=$(PLUGIN) -o $@

# Instrumented IR, for reading.
$(APP_IR): $(APP_DIR)/raytracing.c $(APP_HEADERS) $(PLUGIN) | $(BUILD_DIR)
	clang -$(OPT) -S -emit-llvm $< -fpass-plugin=$(PLUGIN) -o $@

$(APP_BIN): $(APP_OBJ) $(APP_DIR)/sim.c $(APP_DIR)/start.c runtime/trace_rt.c $(APP_HEADERS)
	clang -O2 $(filter-out %.h,$^) -lSDL2 -o $@

$(TRACE): $(APP_BIN) | $(OUT_DIR)
	TRACE_OUT=$(OUT_DIR)/trace TRACE_FRAMES=$(FRAMES) ./$<

$(STATS): $(TRACE) analysis/ngrams.py | $(STATS_DIR)
	python3 analysis/ngrams.py $(OUT_DIR)/trace.map $(TRACE) $(STATS_DIR) $(TOP)

stats-all:
	$(MAKE) OPT=O2 stats
	$(MAKE) OPT=Os stats

# Keeps stats/: they are the result of the task.
clean:
	rm -rf $(BUILD_DIR) out

.PHONY: all pass app ir trace stats stats-all clean
