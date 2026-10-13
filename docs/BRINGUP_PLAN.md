# 首板上电与调试计划（Bring-up Plan）

**以下是未来测试计划，尚未执行；当前工程NOT FABRICATION READY。** 只有USB-only power ECO设计门槛和制造阻塞关闭、布线后ERC/DRC/DFM/CAM通过并获人工放行，才进入首板流程。每步记录板号、仪器、接线、输入电压/限流、波形/读数与PASS/FAIL；异常立即断电并停在当前步骤。测试阈值沿用已批准的器件/电源合同，不凭教学文档新增未经审查的容限。

1. **外观检查（Visual Inspection）：** 对BOM检查型号、方向、缺件、桥连；确认JP601默认OPEN、压力口无污染、USB/卡座和孔边无加工缺陷。
2. **断电阻值检查（Unpowered Resistance）：** 测VBAT_RAW、5V_MAIN、各3V3对GND和相邻电源，排除明显短路；考虑电容充电和器件静态路径，不能仅凭蜂鸣器判定。
3. **限流电源供电（Current-Limited Supply）：** 只接J808飞控支路、断开PC/USB/动力负载；先核对极性、3S–6S输入合同和批准的限流/升压步骤，记录输入电流。
4. **VBAT路径：** 分别核对VBAT_RAW→VBAT_FUSED→VBAT_PROTECTED及F101/Q101压降、极性和D102保护布局，不做未经批准的高能量故障注入。
5. **主5V轨：** 检查5V_MAIN稳态，既有工程目标4.90～5.10V；同步核对EXT_SWITCH_OUT/EXT_5V和保护支路，不能保证外设端精确5V。
6. **3V3分轨：** 检查3V3_MCU、3V3_SENSOR、3V3_SD、MCU_VDDA，记录启动顺序；不能向VCAP引脚或SWD参考脚注入电源。
7. **启动过冲（Startup Overshoot）：** 用合适探头和短接地测电源与ADC上/掉电波形，与冻结边界对照；稳态合格不替代瞬态合格。
8. **温升（Thermal Check）：** 检查U101/D103/L101、Q101、U102/U103/U104、保险丝和电容；分空载及批准负载，记录环境温度/输入/稳态时间。
9. **USB反灌测试（Backfeed）：** 不接真实PC，使用受控USB源/负载或合适夹具，按USB power ECO批准合同测单源/双源/顺序/移除电源/host-off下VBUS泄漏、回灌、限流、时序、brownout、hotplug波形与检测；有ESD器件不等于测试通过。
10. **首次连接真实电脑与USB-only验证：** 仅在步骤4–9合格后，从已验证的限流单源模式开始，按新ECO批准的VBAT-only/USB-only/双源测试计划连接PC；观察输入/USB电流，验证核心启动、USB枚举、DFU/bootloader/ArduPilot刷写、地面站参数配置和基础调试，禁止首次上电就同时插动力电池＋PC USB。
11. **MCU与时钟/调试：** 经J807检查SWD、NRST、BOOT0、HSE启动、基本固件下载、两灯行为；SWD pin1只作VTref。
12. **BMI088：** 验证SPI1、独立ACC/GYRO片选、两子器件身份及静止/运动数据；记录轴向与噪声，不套用参考板rotation。
13. **SPL06-001：** 检查BARO_I2C2、地址strap、身份/压力温度读数和压力口处理；资料来源与真料问题仍须实际闭合。
14. **microSD：** 先验证J501机械插拔与卡接触，再验证SDMMC1四位读写、掉电恢复；detect脚9/10是NC，不声称已启用插卡检测。
15. **CAN：** 检查J601线序/共地、电源和CANH/CANL，用受控第二节点通信；按总线两端配置R602/JP601终端，测阻值与波形，记录错误与掉电行为。
16. **UART/I2C/模拟IO：** GPS/TELEM/RC做收发与协议核对；外部I2C核对共享总线/上拉；J809正常0～5V模拟输入，板内VBAT_ADC和CURRENT_ADC做比例/offset、启动/掉电校准。
17. **PWM输出：** 在无桨、去动力或受控台架检查OUT1–OUT6的电平、时序和故障安全输出，再验证目标ESC；PWM口无电源脚，推进电流不得经过飞控PCB。
18. **ArduPilot硬件移植（hwdef / Firmware Bring-up）：** 将已验证引脚、时钟、传感器rotation、SD、CAN、UART和ADC比例落实到本板hwdef与固件；保留构建与实板验证证据。完成后再按独立门槛进行机架集成与飞行验证。

每一步失败都不能靠跳步、放宽规则或直接飞行消除。路线图中的软件/台架/飞行放行互相独立；**首次上电绝不同时直接插动力电池与真实电脑USB**。具体接口见[引脚定义](INTERFACES.md)。

## 新增USB供电ECO验收要求

本计划必须应用到**完成USB_ONLY_CORE_POWER_ECO后的新批准版本**；当前baseline USB-only不能启动，不能在当前板上直接试接电源证明新需求。现有18步保留限流单源起步；完成受控夹具安全测试后再接真实PC，绝不首次同时直接插动力电池＋PC。

### USB目标状态与实板验收矩阵（未来）

| 状态 | 输入/转换 | 必须验证的结果 |
| --- | --- | --- |
| A | No VBAT / No USB | 放电后全部rails off |
| B | USB only | MCU启动、USB枚举、DFU/bootloader/ArduPilot刷写、地面站配置与基础调试；批准core rails合格；无外部高电流rail启用 |
| C | VBAT only | 正常飞控运行，满足已批准电源合同 |
| D | USB first → then VBAT | 无rail fight、host backfeed、复位或破坏性瞬态 |
| E | VBAT first → then USB | 无host backfeed；USB正常attach |
| F | Both → remove VBAT | 若架构允许，批准核心安全由USB保持供电；后续必须明确连续性边界 |
| G | Both → remove USB | 由VBAT安全继续，无异常rail transient |
| Host-off边界 | 主机关闭 / VBUS low / 故障组合 | 无向PC反灌；限流、反向阻断、时序及brownout行为符合批准合同 |

当前上述USB-only目标未实现、未测。完整门槛见[STAGE USB-PWR](ROADMAP.md)，本轮只记录，完成文档后STOP。
