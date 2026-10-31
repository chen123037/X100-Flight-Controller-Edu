# 200MHz静态时钟可行性编译探针

AI-assisted，2026-10-22。只读使用本地ArduPilot/ChibiOS源，在隔离目录复制公共头文件并对候选副本应用[7行条件配置](candidate.patch)。**没有修改ArduPilot或ChibiOS生产源，没有生成或刷写整板固件。**

- ArduPilot根提交：`9165d22419406556fc9815d9f4e3e299e13713a8`。
- 该提交记录的ChibiOS gitlink：`9aebaf4a40442277d01bd9dd38c13713fc45ef41`；实际参与的头文件哈希见[SOURCES.json](SOURCES.json)。
- 编译器：本机WSL `/opt/gcc-arm-none-eabi-10-2020-q4-major/bin/arm-none-eabi-gcc`；`-std=c11 -mcpu=cortex-m7 -mthumb -ffreestanding -Wall -Werror`。
- [clock_probe.c](clock_probe.c) 包含真实CMSIS/ChibiOS头文件，通过静态断言检查CPU、AHB/APB、USB48MHz、PLL1-Q80MHz与VOS。
- [result.txt](result.txt)：原始400=0、原始200=1（预期不支持）、候选200=0、候选400=0。0为编译退出码，不是硬件PASS。

可用[run_probe.sh](run_probe.sh)复现：传入对应ArduPilot源目录及独立输出目录两个绝对路径；它只复制头文件到输出目录并应用候选patch、编译探针，不改ArduPilot源。需要ARM GCC、GNU patch和bash；可用`ARM_GCC`指定编译器路径。

这些探针只证明静态时钟表达式及头文件限制可接受。没有验证PLL实际锁定、供电/温区、实时计时、USB枚举、刷写、动态切换、调度或完整ArduPilot功能。枚举前100mA与配置后电流、硬件浪涌及分阶段启动仍未关闭。
