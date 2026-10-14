#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern const char *usage_trace_table[];
extern const uint32_t usage_trace_size;

static FILE *Bin;
static uint32_t FlushId = UINT32_MAX;
static long Frames;

static FILE *openOut(const char *ext) {
  const char *prefix = getenv("TRACE_OUT");
  char path[4096];
  snprintf(path, sizeof(path), "%s%s", prefix ? prefix : "trace", ext);
  FILE *f = fopen(path, "w");
  if (!f) {
    perror(path);
    exit(1);
  }
  return f;
}

static void init(void) {
  FILE *map = openOut(".map");
  for (uint32_t id = 0; id < usage_trace_size; ++id) {
    fprintf(map, "%u\t%s\n", id, usage_trace_table[id]);
    if (strncmp(usage_trace_table[id], "call(simFlush) ", 15) == 0)
      FlushId = id;
  }
  fclose(map);

  const char *frames = getenv("TRACE_FRAMES");
  Frames = frames ? atol(frames) : 1; // How much frames are we tracing?
  Bin = openOut(".bin");
}

void usage_trace_log(uint32_t id) {
  if (!Bin)
    init();
  uint16_t v = id;
  fwrite(&v, sizeof(v), 1, Bin);

  if (id == FlushId && --Frames == 0)
    exit(0);
}
