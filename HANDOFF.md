# 接手指南（Handoff Guide）

**如果你第一次接手本项目，不要重新选器件，也不要重新画原理图。** 当前冻结教学baseline需受控增补USB-only核心供电功能，不能因新需求重做全部硬件。

先读[当前状态](STATUS.md)、[电源架构](docs/POWER_ARCHITECTURE.md)、[已知问题](docs/KNOWN_ISSUES.md)和[接口表](docs/INTERFACES.md)，再打开`hardware/X100_V1/X100_CleanSheet.kicad_pro`。当前201个电气封装已放置，走线/过孔/铺铜为0；USB-only供电是`NOT_IMPLEMENTED`，不是最终V1预期行为。

1. **完成USB-only core power architecture adjudication。** 单独启动`USB_ONLY_CORE_POWER_ECO`，先定义供电/不供电轨、电流预算、双源管理、reverse blocking和故障路径，再核验候选数据手册并裁决exact MPN。此步骤是未来任务，本轮不选IC、不估算或实现电源方案。
2. **执行已批准范围内的最小schematic ECO。** 按裁决新增/修改必要电源路径，保留USB主机禁止反灌原则，控制placement影响；不要借机重新选择MCU/IMU/气压计或全局重排。未获ECO范围批准，不实施。
3. **Fresh ERC / netlist / power-path safety review。** 复核新ECO真实网表、供电域、startup/boot/idle/flashing/configuration电流预算、双源上/掉电、host-off/VBUS low、rail sequencing、brownout与hotplug；保存新的批准基线。ECO后数量以新基线为准，不能把当前201当作不得更新的统计，也不能仍沿用旧PASS。
4. **关闭J601。** 先取得仅释放R204/J801/J802局部位置的人工裁决，再工程重排J601/J701接口带；检查J702、CAN支持/JP601的线束、焊接与吸锡空间。每个局部阻塞最多3轮主要候选，每轮有限局部核查；无可靠解就`PCB_BLOCKER=YES`并STOP，不再高成本穷举。
5. **关闭J401。** 取得JLCPCB对USB4105-GF-A官方land两处约0.1944mm内部孔铜结构的明确制造结论；接受后仅审查具体pad/hole pair局部规则，拒绝则提交官方替代land或connector ECO人工裁决。
6. **重新完成pre-routing DRC / geometry / power review。** 制造7条阻塞关闭，新ECO实体数量与库/网表一致，实际几何冲突闭合，USB-only核心供电架构/反灌/电流预算审查通过，冻结尺寸与制造规则保持；其余报告逐类解释，保存checkpoint。
7. **人工确认`ROUTING_PRECONDITIONS_MET=YES`。** 即使J601/J401关闭，只要USB power ECO未完成，仍为`PCB03_FORMAL_ROUTING_READY=NO`。
8. **明确授权后才进入PCB03 formal routing。** 本轮没有PCB03执行授权；文档完成即STOP。

已有J601/J401制造资料确认可以与USB ECO文档评审并行，但不能跳过USB供电门槛。保持45×45mm、30.5×30.5mm孔距、H1–H4 Ø4 NPTH及核心架构；禁止移动孔、扩大板框、削JST官方land、全局放宽clearance、排除整个连接器或复制TEST铜。不回滚已通过的microSD位置，不重新比较ICM-42688-P/DPS310。

后续正式PCB修改由`plant_kicad_v1`执行，Codex负责分析、只读核查、证据与STOP判断。除非有明确能力缺口且特殊操作已授权，不用脚本绕过plant改正式placement。USB供电必须禁止USB_VBUS_RAW与5V_MAIN硬并、未经反灌/故障分析的普通Schottky拼接，以及5V_MAIN/3V3/VBAT向PC反灌。

完整[路线图](docs/ROADMAP.md)已增加STAGE USB-PWR；采购表仅反映**当前硬件**，不包含尚未选择的USB ECO器件。没有制造放行前，不下单当前工程。
