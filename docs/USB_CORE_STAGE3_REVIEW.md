# USB-only Stage 3：设计估算与可审查候选

本页保留Stage3历史证据；后续设计以[Stage5候选](../hardware/proposals/USB_CORE_STAGE5_NOT_APPROVED/README.md)为供电评估起点，其中外I2C上拉门控、独立PWR灯恢复与当前205个既有位置均已处理。Stage5同样未批准、未完成放置/布线，不能整项目覆盖正式源。

2026-10-22；**候选未正式采用，不能下单。** 正式源仍为 `hardware/X100_V1`，201 个电气器件；本页候选为 240 个电气器件。所有 CAD 修改通过唯一指定的 `plant_kicad_v1` 执行。

用户已明确：当前没有 H743 开发板或实物测试条件，不额外购买开发板；继续资料计算和 PCB 设计，首次启动、电流、枚举与切换波形放到首板 Bring-up。此要求取代“先拿实测再继续设计”的暂停方式，但不把估算变为实测或制造 PASS。J401 同型号批准无需重复。

## 本轮实际完成的检查

- 原生 KiCad 10.0.6 ERC：0 错误、0 警告。
- 201→240 个电气器件；PCB 244 个封装（含四孔）。既有引脚改网恰好 27 处，原符号 UUID 保持。MCU 新用 PE2/PE3，其余已分配引脚保持。
- 候选已同步 PCB：逐焊盘网络、封装分配、符号路径、器件 Value 核对无差异；原生 schematic parity=0。源字段及新增封装的层级 UUID 路径已同步。
- 对正式源 55 项 CAD SHA256 比较无变化；候选没有覆盖正式 PCB，也没有进入正式 BOM。
- 修正执行接口的 T 接点误删问题后，从检查点恢复三页并重新执行 MCP 修改，再完成上述检查；没有靠忽略 ERC 消除问题。

证据：[结构审查](evidence/USB_CORE_STAGE3_20261022/POWER_STAGE3_STRUCTURAL_REVIEW.json)、[ERC](evidence/USB_CORE_STAGE3_20261022/POWER_STAGE3_FINAL_ERC.json)、[原生 DRC](evidence/USB_CORE_STAGE3_20261022/POWER_STAGE3_FINAL_DRC.json)、[候选网表](evidence/USB_CORE_STAGE3_20261022/POWER_STAGE3_FINAL.net.xml)。

## 当前具体候选

USB→TPS2553 限流→TPS2116 VIN2；原 5V_MAIN→VIN1。TPS2116 优先电池，输出独立 `5V_CORE_MUX`，禁止两源硬并。两颗既有型号 82µF 并联直接放在 mux 输出；TPS22918 受控充电后形成 `5V_CORE`，供原 MCU Buck 与传感器支路。大功率 EXT_5V 保持电池供电。

TMUX1219 根据 PE3 `USB_CFG_ACTIVE` 选择 TPS2553 的两种 ILIM 状态：复位默认 LOW，把 ILIM 接 IN；主机配置完成且描述符申请 500mA 后，才切到 60.4kΩ。LOW 态输出限流的 min/typ/max 为 50/75/100mA；这不是上游总输入电流必定≤100mA的保证，静态电流、漏电及瞬态都另计。HIGH 态含既定电阻容差和温漂假设约 389.8–488.2mA，不把 500mA 全额分配给负载。来源：[TPS2553](https://www.ti.com/lit/ds/symlink/tps2553.pdf)、[TMUX1219](https://www.ti.com/lit/ds/symlink/tmux1219.pdf)。

TPS22918 CT 改为 10nF，使用手册公式估计 5V 的 10–90% 上升时间约 27.65ms。该公式是近似/典型关系，没有系统最坏启动电流保证；需验证 Buck 启动及复位时序。2×82µF 在 mux 输出，U107 直接输出侧主要为原 C111=10µF，避免把超过 200µF 的电容直接接入其 QOD 放电负载。来源：[TPS22918](https://www.ti.com/lit/ds/symlink/tps22918.pdf)、[TPS2116](https://www.ti.com/lit/ds/symlink/tps2116.pdf)。

TLV803EA29DBZR 为 2.93V、200ms、开漏复位候选。它不保证所有阶段 USB 3.0V 电气规范已经满足。传感器 LDO 由 BAT_SELECTED 或 USB_CFG_ACTIVE 使能；未供电时 MCU 的 SPI/I2C IO 必须保持安全状态。CAN 使用 BSS138 驱动 TCAN3414 **pin5 SHDN**（pin8 STB 保持原功能），USB-only 下关闭收发器。SD 通过负载开关与具有 Ioff 的总线开关隔离；BAT_SELECTED 与 SD_PG 同时成立才开放 SD 总线。以上时序均有首板测试项。

新增 IC 候选：TPS2116DRLR、TPS2553DBVR、TPS22918DBVR×2、SN74CB3Q3245PWR、TLV6700DDCR、SN74LVC1G00DBVR、TMUX1219DBVR、TLV803EA29DBZR、SN74LVC1G32DBVR、BSS138LT1G。完整参考型号见[候选 BOM](evidence/USB_CORE_STAGE3_20261022/POWER_STAGE3_CANDIDATE_BOM.json)。**这些新增 exact MPN 尚未获得正式采用授权；普通 R/C 的首选 MPN、库存和全部器件机械焊盘复核尚未完成，不能采购。**

原 ADC 支路 R811=1kΩ 本身消耗 3.3mA，不应漏记在挂起预算中。候选保留泄放路径，改为 10kΩ：正常消耗约 0.33mA；沿用原局部 U801 8µA 反向漏电假设及 2% 电阻角落，局部抬升估算 81.6mV。这个数字仅限定该漏电贡献，不是整板关电实测值或全来源漏电保证。原 ADC 输入分压、串联限流、隔离开关与输入泄放保持。

## 电流预算的证据层级

可重算文件：[计算脚本](evidence/USB_CORE_STAGE3_20261022/calculate_stage3_current_budget.py)、[输入和结果](evidence/USB_CORE_STAGE3_20261022/USB_STAGE3_CURRENT_BUDGET.json)。

1. **数据手册规格/测试案例**：限流阈值范围；ST 指定 revision、VOS、时钟、外设和结温下的电流 min/typ/max。表中最大值只适用于该手册条件，不等于实际 X100 整机电流。
2. **典型值**：开关转换时间、效率曲线、低功耗典型电流；不能当作保证下界/上界。
3. **工程假设**：核心输入≥4.2V、3V3≤3.33V、Buck 效率按 80% 筛查，USB PHY 另留 25mA、传感器留 25mA、逻辑、泄放及偏置留 3.5mA（含原 R701/R702 外部 I2C 上拉同时被拉低、ST/PG/复位上拉和逻辑预留），上游另留 0.5mA；其他外部输出在 USB-only 启动期间保持 analog/no-pull；80%不是原厂保证的系统最小效率，25mA不是 ST 保证的 PHY 最大值。最终按器件及实际驱动进一步收紧。
4. **待实测**：整机冷启动、枚举前波形、Flash 写入电流、掉电反灌、源切换和挂起/恢复。

下表是以上假设下的灵敏度筛查，不标记整机电流 PASS。结温 Tj 不能替换为环境温度。

| 场景 | 估算 USB 输入 | 加 30% 容量余量 | 与限流最小供给比较 |
| --- | ---: | ---: | --- |
| 配置后 200MHz，ST 全外设测试案例，Tj85°C | 225.0mA | 292.5mA | 小于 389.8mA |
| 同上 Tj105°C | 283.5mA | 368.5mA | 小于 389.8mA |
| 安静 bootloader 刷写，采用 200MHz 外设关闭上界，Tj105°C，另留 20mA Flash | 234.9mA | 305.4mA | 小于 389.8mA；20mA 为假设 |
| 枚举前，100MHz Sleep 电流按 200MHz 典型值减半估算 | 36.9mA | 48.0mA | 小于 50mA；线性缩放没有规格保证 |
| 枚举前，改用 ST 200MHz Sleep 的 25°C 最大案例 | 62.0mA | 80.7mA | 超过最小 50mA，不能保证启动 |

ST 数据源：[DS12110 Rev11，Tables119–122](https://www.st.com/resource/en/datasheet/stm32h743bi.pdf)。Buck 的效率曲线与 4ms 软启动是典型条件，不能升级为保证值：[AP63203](https://www.diodes.com/datasheet/download/AP63200-AP63201-AP63203-AP63205.pdf)。

**真实剩余问题**：预配置低电流启动尚没有纯资料的整机保证；热态更不能靠降频线性缩放证明。挂起要求原始 USB 输入≤2.5mA，MCU Stop 最大案例已经不能直接满足，R811 改小耗电也不足以关闭此项。需要最小 BSP/bootloader 的低功耗进入/恢复实现与首板波形。按照本轮人工要求，这些实验随首板验证，不再要求先买开发板；也不把未经证明的 USB 合规性写成 PASS。USB-IF 的挂起与电源变化要求见[官方更新](https://compliance.usb.org/index.asp?UpdateFile=Electrical)。

## 时钟与软件成本

隔离编译探针验证了三个静态配置：枚举前 CPU/AHB=100/100MHz，USB 配置后=200/100MHz，VBAT=400/200MHz。USB 48MHz、PLL1Q 80MHz、UART PLL2Q 100MHz、I2C PLL3R 32MHz 保持；VBAT 原计时器 200MHz 保留。曾考虑把 VBAT AHB 也改到100MHz，会降低部分高频 PWM 分辨率，已放弃，没有写进正式固件。

TIM5 1MHz 时基的 PSC 为 USB99、VBAT199。计划仅在 RTOS 启动前按电源模式选择；USB100→200保持AHB100，避免运行时重设全局计时器。电源选择必须进入 early clock init，晚到 boardInit 才降频无法避免前面的高功耗启动。固件描述符、USB configured/unconfigured/suspend hook、IO安全状态、Flash写入及源变化重新枚举仍未实现验证。**这只是配置编译通过，不是完整固件构建或实板功能通过。**

## 布局与推进

当前候选已完成结构同步，但新增39个封装仍堆叠在原点，尚未采用放置计算结果。现有器件不移动的尝试只找到13个新增件位置，26个未放下；这证明需要紧凑布局/局部重排，不能据此断言45mm不可行，也不能直接运行自动布线。候选 DRC 报告1531项、451未连接，部分类别有报告上限，不能当作完整缺陷总数。

继续方向：在45×45mm与孔位不变的约束下，评估新增普通R/C采用适当小封装、重排局部功率/SD区；不降低全局DRC、不变冻结MCU/IMU/气压计、不反复申请J401。完成具体器件机械焊盘/可采购性和布局验证后，再把新增电源架构及 exact MPN 作为一份具体可审查结果申请正式采用。

`POWER_SAFETY_REVIEW=NOT_COMPLETE`；`DRC_FINAL=NOT_PASS`；`PCB_MANUFACTURING_PACKAGE=NOT_READY`。还没有生成投板用制造包。[首板测试计划](FIRST_BOARD_USB_BRINGUP.md)已明确列出不能在制板前完成的实验。


2026-10-23补充：正式源已另行采用[紧凑测试点](COMPACT_PROBE_LAYOUT_REVIEW.md)，Stage3候选仍保留旧测点尺寸。后续集成先基于新正式基线；本页“正式源哈希未变”是Stage3审查时的历史事实。新增USB架构/IC依旧未正式采用。
