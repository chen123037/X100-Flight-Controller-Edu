# 主电源局部布线检查点 — 完整PCB未完成，不可下单

这是实际通过唯一执行器 `plant_kicad_v1` 保存的局部工程，可打开 `project/X100_CleanSheet.kicad_pro` 查看。**完整241器件原理图、245个PCB实体全部保留；只有71个实体在板内，其中主电源24件，其余174个待排器件停放板外。** 不是完成245器件布局，不是制造包，不得整板覆盖正式源。

父工程是未批准USB/Y201的Stage6组合候选；L101 SRP1038A-100M现已另行正式批准并写入正式源，本项目仅用于提前推进主电源物理回路。正式 `hardware/X100_V1` 保持POST_L101_FORMAL基线、201电气器件和未布线状态；本检查点没有擅自正式接受USB架构或Y201。

## 已形成的实际铜连接

- **22条轨迹、14个0.6/0.3mm标准贯通过孔、1个已填充In1 GND面**。其中12个GND孔：EP附近3个、D103 anode附近3个、输入bulk负端2个，其余局部回流点。过孔均在焊盘外，不降低禁VIP/孔铜/线宽规则；数量不代表已完成热阻或电流资格验证。
- 原生物理连接图确认MAIN_SW：U101.8–D103.K–L101.1–C107.2；MAIN_BOOT：U101.1–C107.1。C107在F(107.5,103.5,90°)，绕开现有VCAP/MCU bulk，未引入新的庭院配对。
- GND回流物理连通：U101.7/EP9、C106.2、C103.2、D103.A、C105.2、C108.2、R104.2、R106.2，经实际轨迹/贯通过孔/填充In1面连成一体。不是仅比较相同网名。
- 负向检查仍确认C103的VBAT正端未接通U101输入，避免把GND连通误报为完整输入已布通。输入保护和完整VIN、5V输出、反馈、COMP、EN/RT及其余整板网络继续未完成。

fresh ERC **0错误/0警告**、native parity **0**。本检查点DRC报告149条，未连接报告499（触及上限）；其中庭院27、孔庭院7及丝印/文字等问题仍保留。当前轨迹没有short/clearance/physical-clearance/hole-clearance/width/via-dangling/禁内层信号等违规。检查范围与原生数据见[REVIEW](REVIEW.json)、[DRC](DRC.json)、[ERC](ERC.json)。**不能把局部电气违规为空写成DRC_FINAL=PASS**；板外174件是明确未完成工作。

24件主电源初排通过当前标称实体/孔/PTH检查，实际器件最大公差、完整装配、热耦合、过孔电流能力、低噪声反馈取样、真实Buck热回路面积及整板回流仍待审查。主电源实际负载与L101风险见[正式接受记录](../../../docs/L101_FORMAL_ACCEPTANCE.md)，实物温升/启动/短路波形纳入首板测试。`POWER_SAFETY_REVIEW=NOT_COMPLETE`、`PCB_MANUFACTURING_PACKAGE=NOT_READY`。
