#define TRUE 1
#define FALSE 0
#define STM32H743xx
#define STM32_HSECLK 8000000U
#define STM32_LSECLK 32768U
#define STM32_VDD 330U
#include "stm32h743xx.h"
#include PROFILE_HEADER
#include "hal_lld_type1.h"
_Static_assert(STM32_CORE_CK == EXPECTED_CPU, "CPU");
_Static_assert(STM32_HCLK == EXPECTED_HCLK, "AHB");
_Static_assert(STM32_USBCLK == 48000000U, "USB 48MHz");
_Static_assert(STM32_PLL1_Q_CK == 80000000U, "SPI/SDMMC/CAN 80MHz");
_Static_assert(STM32_I2C1CLK == 32000000U, "I2C kernel remains PLL3-R 32MHz");
_Static_assert(STM32_USART1CLK == 100000000U, "UART kernel remains PLL2-Q 100MHz");
_Static_assert(STM32_UART4CLK == 100000000U, "UART4 kernel remains PLL2-Q 100MHz");
_Static_assert(STM32_SPI4CLK == 100000000U, "SPI4 remains PLL2-Q 100MHz");
_Static_assert(STM32_SPI5CLK == 100000000U, "SPI5 remains PLL2-Q 100MHz");
_Static_assert(STM32_FLASHBITS == 2U, "same native legacy-compatible latency field in both VOS profiles");
_Static_assert(STM32_TIMCLK1 / 1000000U - 1U == EXPECTED_TIMER_PSC, "TIM5 1MHz prescaler before RTOS init");
const unsigned clocks[]={STM32_CORE_CK,STM32_HCLK,STM32_TIMCLK1,STM32_USART1CLK,STM32_I2C1CLK,STM32_USBCLK};
