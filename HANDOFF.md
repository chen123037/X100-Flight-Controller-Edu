# 接手指南

2026-10-22最终人工授权：J401_REPLACEMENT=APPROVED；已写入正式源。继续推进完整PCB与制造包到READY_FOR_HUMAN_FABRICATION_APPROVAL，届时STOP供人工验收；不付款、不实际下单。已授权常规工程修复，不再申请同一J401型号批准。

1. 先读[当前状态](STATUS.md)与[J401正式接受记录](docs/J401_FORMAL_ACCEPTANCE.md)。正式源为`hardware/X100_V1`。原J6013条和J4014条孔/板边问题已关闭，J401板边基准已对齐。
2. 关闭[USB-only供电事项](docs/USB_CORE_POWER_REVIEW.md)：核心功能必须保留，SD非强制且不得拖垮核心；需要分阶段电流、浪涌、反向阻断和双源/SD支路处理，不得直接并USB VBUS和5V_MAIN。隔离旧研究稿ERC0不是功能通过。
3. 电源ECO后native ERC/XML→PCB同步、逐脚/UUID/封装核对、局部放置复查。正式PCB修改由plant_kicad_v1执行，保留checkpoint；不要使用旧的几何推断网名同步器。
4. 技术前置条件闭合后执行已授权routing、标准贯通过孔和铺铜。先Buck回路/GND、HSE、USB、BMI088、SD/CAN/ADC，再其它IO；In1保持连续GND参考。
5. 完成完整ERC/DRC、板边/孔铜/装配/丝印/阻焊、JLC3313叠层及真实制造参数、BOM/CPL，导出并回读Gerber/钻孔、完成最终DFM。只有真实证据覆盖全部要求才宣布可提交打样。

保持45×45mm、H1–H4 Ø4 NPTH和30.5mm孔距、MCU/IMU/气压计冻结选型。J401精确SH/GND局部0.30mm规则有制造依据，全局0.50mm及其它规则保持，不泛化例外、不排除整只连接器。仅学习参考的模块边框、标题、聚类和局部完整电路绘图语法，不复制他人电路。
