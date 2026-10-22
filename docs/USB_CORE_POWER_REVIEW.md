# USB-only 功能需求与当前工程审查

日期：2026-10-22。**需求已确认；架构、器件与制造均未批准。** 本文不构成采购、布线前置条件通过或制造放行。

## 用户确认的功能范围

无 VBAT，仅电脑 USB 必须支持 STM32H743 启动、USB 枚举、固件刷写、地面站连接和参数配置；尽可能支持 BMI088、SPL06-001 桌面检测与校准。microSD 不作为强制负载，也不得妨碍 MCU 启动、USB 与基本配置。优先电流预算、反向阻断、双电源切换与大功率外设隔离；禁止 USB VBUS 硬并 5V_MAIN。具体电源架构或器件仍须另行批准。

## ArduPilot 对 microSD 的实际依赖

只读审查本地 `third_party/ardupilot` 提交 `9165d22419406556fc9815d9f4e3e299e13713a8`：

| 证据 | 结论与边界 |
| --- | --- |
| `libraries/AP_HAL_ChibiOS/hwdef/MatekH743/hwdef.dat:176-180` | 配置 32768 字节参数存储，`STORAGE_FLASH_PAGE 14`，使用最后两页内部 Flash；这只是已有 H743 配置的证据，不能复制它的引脚分配。 |
| `libraries/AP_HAL_ChibiOS/Storage.cpp:78-105,330-343` | 配置 Flash 时先走 `_flash_load()`；只有相应文件系统分支使用 microSD 参数文件。Flash 初始化自身失败仍可 panic。 |
| `libraries/AP_HAL_ChibiOS/sdcard.cpp:164-188`；`Scheduler.cpp:580-589` | 挂载失败返回 false；未解锁时在后台 IO 线程每 3 秒重试，不是该路径直接强制停止整个系统。 |
| `HAL_ChibiOS_Class.cpp:377-392` | USB 初始化进入主循环的路径没有 SD 挂载成功前置检查。 |
| `libraries/AP_Logger/AP_Logger.cpp:1575-1586` | 存在 USB 下抑制常规 disarmed logging 的模式，但 forced/persistent logging 还有其它分支，不能凭参数名保证绝不访问 SD。 |

因此，没有源码依据把 microSD 提升为 USB-only 启动/参数配置的必需品。X100 自己的 hwdef、bootloader、参数 Flash 分区、无卡冷启动与刷写仍未完成。最终要验证应用和 bootloader 两条路径，不能将通用 H743 支持当作本板测试结果。无卡导致的日志/解锁告警也不同于启动、USB 或参数配置失败。

## 电源候选及拒绝放行的原因

隔离研究候选：现有 VBAT Buck 的 5V_MAIN 接 TPS2116DRLR VIN1，USB_VBUS_RAW 经第二颗 TPS2553DBVR 限流后接 VIN2；mux 输出新 5V_CORE，再供现有 U102 MCU Buck 与 R108/U103 传感器支路。U104/EXT_5V 保留电池供电。只改 C111.1、U102.2、U102.3、R108.1 四个既有引脚的电源网，不变 MCU GPIO。此拓扑**没有进入正式源**。

原厂来源：[TPS2116](https://www.ti.com/lit/ds/symlink/tps2116.pdf)、[TPS2553](https://www.ti.com/lit/ds/symlink/tps2553.pdf)、[STM32H743 DS12110 Rev11](https://www.st.com/resource/en/datasheet/stm32h743bi.pdf)、[BMI088](https://www.bosch-sensortec.com/en/products/motion-sensors/imus/bmi088)。

- 60.4k / 0.1% 的 TPS2553 限流初算约 390–488mA（电阻温漂仍须按最终温区重算）。这是限流阈值范围，不是可分配负载或实测电流。
- TPS2116 具有受阈值、响应时间及漏电规格限制的反向阻断，不能写成任何故障下都绝对零反向电流。两级串联、源优先阈值、host-off、拔掉任一电源、短路和切换波形仍需验证。
- 现有研究稿的 82u CORE 电容加既有 10u 输入电容，按手册典型 5V/1.7ms 软启动估算，仅充电就约 271mA，尚未加负载。因此它**不能作为枚举前 <100mA 已满足的证据**；电容量/软启动/启动次序需要重做，不能直接推广这份 ERC=0 的研究稿。
- 本地 `hwdef/common/usbcfg.c:84-89` 和 `usbcfg_dualcdc.c:194-201` 均为 self-powered、`bMaxPower=50`（100mA）。未经固件描述符与枚举前后负载策略适配，不能默认已取得 500mA 配置电流。只提高描述符也不能解决枚举前电流与浪涌。
- 必须逐阶段计算 startup / boot / idle / flashing / configuration，使用实际 MCU revision、频率、温区、外设与 Flash 编程电流；Buck 效率采用有依据的下界并计入传感器 LDO、CAN/逻辑、LED、USB 与电容充电。禁止把旧 0.889A 整板预算或手册典型值当 USB 实际消耗。
- 研究稿的 3V3_SD 仍经 R501=0R 接 3V3_MCU。即使 SD 不强制，它仍会对已插卡供电，**不能据此声称 SD 已隔离或不会拖垮核心**。需要进一步明确 USB-only 下 SD 支路的隔离/限流与 IO 防寄生供电，以及固件无卡处理；不得悄悄将 SD 纳入已接受负载。

隔离电源研究稿 ERC=0/0，201→211 个电气器件，精确改网仅四个引脚；这只是结构验证，功能审查仍不通过。它未推广、未进入正式 BOM、未同步为正式 PCB，未用于自动布线。MCP 测试同步还遇到 Windows GBK/UTF-8 解析问题，不能宣称 native F8 绑定已完成。

## 推进顺序

先闭合电流、浪涌、SD 支路和故障路径，再提交具体架构与可采购 exact MPN 供用户审定；批准后最小正式 ECO、native netlist/PCB 同步与逐脚核查、局部放置，满足前置条件后执行已授权布线。完整 DRC、Gerber 回读、BOM/CPL、钢网和板厂 DFM 均通过后才可判断是否可下单。实际付款下单不在本次授权内。


## 2026-10-22 J401正式接受后的电源推进核查

J401已正式应用；下列工作不再等待J401同型号批准。旧`ECO_STAGED`电源研究稿仍不能直接推广，后续必须从`POST_J401_FORMAL_BASELINE`克隆，防止旧生成脚本回滚正式连接器姿态/规则。

1. TPS2553的电阻公式只在15–232kΩ有效。不能外推330kΩ等数值来声称得到可靠的枚举前100mA限流。原厂ILIM直接接IN模式给出50/75/100mA的min/typ/max；最小可用电流与上游检测/静态电流都要计入。来源：[TPS2553 RevF p.16、20](https://www.ti.com/lit/ds/symlink/tps2553.pdf)。
2. 按60.4k、0.1%、25ppm/°C及相对25°C最大100°C温差重新计算，原候选限流约389.8–488.2mA；不是500mA可用负载。每级30%容量余量按`capacity >= 1.30*load`检查，不能用IC绝对额定值替代限流后可保证的供电能力。
3. 原候选mux直连电容至少92.1uF（C11110u+C12182u+C122100n），5V/1.7ms典型启动已对应约271mA充电；R108后还有22uF及传感器输出电容。U102自身4ms软启动只是典型值，不能据此保证全系统最坏浪涌。来源：[AP63203原厂资料](https://www.diodes.com/datasheet/download/AP63200-AP63201-AP63203-AP63205.pdf)。
4. 以未冻结的保守示例VCORE>=4.2V、Buck效率>=80%、3V3<=3.33V、传感器/控制各25/5mA代入限流与30%余量，3V3负载可分配上界约272mA。ST RevV 400MHz、Flash cache ON、全外设使能、Tj85°C的MCU上界本身336mA；因此不能沿用旧整板0.829A预算或以轻载typical宣称覆盖所有工况。该示例用于否定旧候选，不能作为已完成的USB预算。计算见`USB_POWER_BUDGET_REJECTION.json`。
5. 当前ArduPilot H7时钟头文件对8MHz HSE分支只显式支持默认时钟与自定义480MHz；直接写`HAL_CUSTOM_MCU_CLOCKRATE=200000000`会进入#error，不能声称只改hwdef一个值即可完成USB低功耗启动。需要可实施的boot/application枚举前后时钟/负载策略，与合法描述符、硬件限流选择一起设计；没有改当前固件仓库。

后续具体设计方向：区分枚举前与配置后的USB供电状态，软启动与可保证低电流启动联动；SD支路及SDIO避免USB-only寄生供电；VBAT/USB切换保持双向反灌分析。只在真实预算和故障路径闭合后写入正式电源ECO，不复制旧不合格研究稿。
