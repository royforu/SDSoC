#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/trungnguyen/SDSoC/samples/mmult_optimized/_sds/vhls/mmult_accel/solution/.autopilot/db/a.g.bc ${1+"$@"}
