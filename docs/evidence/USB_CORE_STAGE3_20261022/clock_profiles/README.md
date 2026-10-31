# Static clock configuration evidence only

The isolated native CMSIS/ChibiOS macro probes compiled for USB before configuration (CPU/AHB 100/100MHz), USB configured (200/100MHz), and battery (400/200MHz). UART PLL2Q, I2C PLL3R, USB PLL3Q and PLL1Q peripheral sources remain unchanged. TIM5 1MHz PSC=99 for USB and199 for battery. RESULTS.json records the fresh compiler exit codes and isolated header/object hashes; all three are zero. This is not runtime evidence.

Local preparation: prepare_preserved_vbat_clock_probe.py; GCC arm-none-eabi10-2020-q4-major; ArduPilot9165d22419406556fc9815d9f4e3e299e13713a8 and ChibiOS9aebaf4a40442277d01bd9dd38c13713fc45ef41. Header copies were isolated outside third_party. Actual early clock selection, USB state hooks, descriptors, suspend/wake and full firmware remain unimplemented/unqualified. This directory is evidence, not a portable standalone firmware build.
