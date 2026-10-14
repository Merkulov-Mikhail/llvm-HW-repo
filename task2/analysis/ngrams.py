#!/usr/bin/env python3
"""Sliding-window analysis of a usage trace (see runtime/trace_rt.c).

usage: ngrams.py <trace.map> <trace.bin> <out-dir> [top]

Counts windows of 1..5 consecutive executed instructions and writes
  <out-dir>/ngrams.md        windows of User opcodes  ("fmul fadd")
  <out-dir>/ngrams_full.md   windows of full records  ("fmul <- arg arg ; ...")
  <out-dir>/user_operand.md  dynamic counts of User <- Operand pairs
"""

import os
import sys
from array import array
from collections import Counter

MAX_N = 5
CHUNK = 1 << 22  # ids read from the trace at once


class Record:
    def __init__(self, line):
        self.full = line.split('\t', 1)[1]              # "fdiv <- fmul call"
        self.user, _, ops = self.full.partition(' <-')  # "fdiv"
        self.operands = ops.split()                     # ["fmul", "call"]


def die(msg):
    sys.exit(f'ngrams.py: {msg}')


def read_map(path):
    with open(path) as f:
        return [Record(line.rstrip('\n')) for line in f]


def read_ids(path):
    """Yields the trace (uint16 little-endian ids) chunk by chunk."""
    with open(path, 'rb') as f:
        while True:
            ids = array('H')
            try:
                ids.fromfile(f, CHUNK)
            except EOFError:  # the last, shorter chunk is still read
                pass
            if not ids:
                return
            if sys.byteorder != 'little':
                ids.byteswap()
            yield ids


def count_windows(path):
    """Returns ({n: Counter(window of ids -> count)}, number of events).

    Every window ending at event i >= MAX_N-1 is a suffix of the full window
    ending there: only full windows are counted over the whole trace, the
    shorter ones are derived from them afterwards. Windows ending inside the
    first MAX_N-1 events are counted directly.
    """
    full = Counter()
    start = []         # first MAX_N-1 events
    prev = array('H')  # last MAX_N-1 events of the previous chunk
    events = 0
    for ids in read_ids(path):
        if len(start) < MAX_N - 1:
            start.extend(ids[:MAX_N - 1 - len(start)])
        seq = prev + ids
        full.update(zip(*(seq[k:] for k in range(MAX_N))))
        prev = seq[-(MAX_N - 1):]
        events += len(ids)

    by_len = {n: Counter() for n in range(1, MAX_N + 1)}
    for window, count in full.items():
        for n in by_len:
            by_len[n][window[MAX_N - n:]] += count
    for end in range(len(start)):
        for n in range(1, end + 2):
            by_len[n][tuple(start[end - n + 1:end + 1])] += 1
    return by_len, events


def rank(counter):
    return sorted(counter.items(), key=lambda kv: (-kv[1], kv[0]))


def percent(part, total):
    return f'{100.0 * part / total if total else 0.0:.2f} %'


def write_table(f, header, ranking, total, top=None):
    f.write(f'| # | Count | Share | {header} |\n|--:|--:|--:|---|\n')
    for i, (text, count) in enumerate(ranking[:top], 1):
        f.write(f'| {i} | {count:,} | {percent(count, total)} | `{text}` |\n')


def write_header(f, title, trace_path, events, executed, num_ids):
    f.write(f'# {title}\n\n')
    f.write(f'Trace `{trace_path}`: {events:,} events, {executed} of '
            f'{num_ids} instrumented instructions executed.\n')


def write_windows(f, records, by_len, events, top, full_records):
    """Ranks windows of every length by a text built from their records."""
    sep = ' ; ' if full_records else ' '
    for n, windows in by_len.items():
        by_text = Counter()
        for window, count in windows.items():
            by_text[sep.join(records[i].full if full_records else records[i].user
                             for i in window)] += count
        ranking = rank(by_text)
        total = events - n + 1 if events >= n else 0

        f.write(f'\n## Window {n}\n\n')
        f.write(f'{total:,} windows, {len(ranking)} distinct.\n\n')
        write_table(f, 'Pattern', ranking, total, top)


def write_user_operand(f, records, singles):
    pairs, kinds = Counter(), Counter()
    for (i,), count in singles.items():
        for op in records[i].operands:
            pairs[f'{records[i].user} <- {op}'] += count
            kinds[op] += count
    uses = sum(kinds.values())

    f.write(f'{uses:,} dynamic operand uses (branch targets and callees are '
            'not operands here).\n')
    f.write('\n## User <- Operand pairs\n\n')
    write_table(f, 'Pair', rank(pairs), uses)
    f.write('\n## Operand kinds\n\n')
    write_table(f, 'Operand', rank(kinds), uses)


def main(argv):
    if len(argv) not in (4, 5):
        sys.exit(f'usage: {argv[0]} <trace.map> <trace.bin> <out-dir> [top]')
    map_path, trace_path, out_dir = argv[1:4]
    top = int(argv[4]) if len(argv) == 5 else 30

    records = read_map(map_path)
    by_len, events = count_windows(trace_path)
    executed = len(by_len[1])
    if by_len[1] and max(by_len[1])[0] >= len(records):
        die(f'id {max(by_len[1])[0]} is not in the map')

    def out(name, title):
        f = open(os.path.join(out_dir, name), 'w')
        write_header(f, title, trace_path, events, executed, len(records))
        return f

    with out('ngrams.md', 'Windows of User opcodes') as f:
        write_windows(f, records, by_len, events, top, full_records=False)
    with out('ngrams_full.md', 'Windows of full records (User <- Operands)') as f:
        write_windows(f, records, by_len, events, top, full_records=True)
    with out('user_operand.md', 'User <- Operand usage') as f:
        write_user_operand(f, records, by_len[1])

    print(f'{events:,} events -> {out_dir}/{{ngrams,ngrams_full,user_operand}}.md')


if __name__ == '__main__':
    main(sys.argv)
