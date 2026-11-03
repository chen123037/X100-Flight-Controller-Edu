#!/bin/bash
# Isolated compile probes only. Never writes to the ArduPilot checkout.
set -uo pipefail
if [ "$#" != 2 ]; then
  echo "Usage: run_probe.sh /absolute/ardupilot/source /absolute/probe-output"
  exit 2
fi
ap=$(realpath "$1")
mkdir -p "$2"
out=$(realpath "$2")
here=$(cd "$(dirname "$0")" && pwd)
gcc=${ARM_GCC:-arm-none-eabi-gcc}
command -v "$gcc" >/dev/null || { echo "ARM compiler not found; set ARM_GCC"; exit 2; }
sed 's/\r$//' "$ap/libraries/AP_HAL_ChibiOS/hwdef/common/stm32h7_mcuconf.h" > "$out/original_mcuconf.h"
patch --silent --output="$out/candidate_mcuconf.h" "$out/original_mcuconf.h" "$here/candidate.patch" || exit 1
flags=(-std=c11 -mcpu=cortex-m7 -mthumb -ffreestanding -Wall -Werror -I"$out"
  -I"$ap/modules/ChibiOS/os/common/ext/ST/STM32H7xx"
  -I"$ap/modules/ChibiOS/os/common/ext/ARM/CMSIS/Core/Include"
  -I"$ap/modules/ChibiOS/os/hal/ports/STM32/STM32H7xx")
"$gcc" "${flags[@]}" -DORIGINAL_PROBE -DEXPECTED_CPU=400000000U -DEXPECTED_HCLK=200000000U -DEXPECTED_VOS=STM32_VOS_SCALE1 -c "$here/clock_probe.c" -o "$out/original_400.o" >"$out/original_400.log" 2>&1
a=$?
"$gcc" "${flags[@]}" -DORIGINAL_PROBE -DHAL_CUSTOM_MCU_CLOCKRATE=200000000 -DEXPECTED_CPU=200000000U -DEXPECTED_HCLK=100000000U -DEXPECTED_VOS=STM32_VOS_SCALE3 -c "$here/clock_probe.c" -o "$out/original_200.o" >"$out/original_200.log" 2>&1
b=$?
"$gcc" "${flags[@]}" -DHAL_CUSTOM_MCU_CLOCKRATE=200000000 -DEXPECTED_CPU=200000000U -DEXPECTED_HCLK=100000000U -DEXPECTED_VOS=STM32_VOS_SCALE3 -c "$here/clock_probe.c" -o "$out/candidate_200.o" >"$out/candidate_200.log" 2>&1
c=$?
"$gcc" "${flags[@]}" -DEXPECTED_CPU=400000000U -DEXPECTED_HCLK=200000000U -DEXPECTED_VOS=STM32_VOS_SCALE1 -c "$here/clock_probe.c" -o "$out/candidate_400.o" >"$out/candidate_400.log" 2>&1
d=$?
printf 'original_400=%s original_200=%s candidate_200=%s candidate_400=%s\n' "$a" "$b" "$c" "$d" | tee "$out/result.txt"
test "$a,$b,$c,$d" = '0,1,0,0' || exit 1
grep -q 'Unable to configure custom clockrate' "$out/original_200.log"
