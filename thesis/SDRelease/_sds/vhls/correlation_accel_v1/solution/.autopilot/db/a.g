#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/trungnguyen/SDSoC/thesis/SDRelease/_sds/vhls/correlation_accel_v1/solution/.autopilot/db/a.g.bc ${1+"$@"}
