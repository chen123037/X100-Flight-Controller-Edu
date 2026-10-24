#define TRUE 1
#define FALSE 0
#define STM32H743xx
#define STM32_HSECLK 8000000U
#define STM32_LSECLK 32768U
#define STM32_VDD 330U
#include "stm32h743xx.h"
#ifdef ORIGINAL_PROBE
#include "original_mcuconf.h"
#else
#include "candidate_mcuconf.h"
#endif
#include "hal_lld_type1.h"
_Static_assert(STM32_CORE_CK == EXPECTED_CPU, "CPU frequency");
_Static_assert(STM32_USBCLK == 48000000U, "USB must remain 48 MHz");
_Static_assert(STM32_PLL1_Q_CK == 80000000U, "SPI/SDMMC/CAN kernel source");
_Static_assert(STM32_HCLK == EXPECTED_HCLK, "AHB frequency");
_Static_assert(STM32_PCLK1 == EXPECTED_HCLK/2, "APB1 frequency");
_Static_assert(STM32_VOS == EXPECTED_VOS, "VOS must match current-budget table");
const unsigned x100_probe_clocks[] = {STM32_CORE_CK, STM32_HCLK, STM32_PCLK1, STM32_USBCLK, STM32_PLL1_Q_CK, STM32_VOS};
