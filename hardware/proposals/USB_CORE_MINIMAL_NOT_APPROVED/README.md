# X100统一候选：完整布局与MCU供电第一轮

打开[KiCad工程](project/X100_CleanSheet.kicad_pro) / [PCB](project/X100_CleanSheet.kicad_pcb)。这是唯一工作候选，**不可投板**。全部CAD由唯一指定的plant_kicad_v1写入；正式hardware/X100_V1未覆盖。

截至2026-10-24，原生板有 **1212段铜线 /111个0.6/0.3mm标准过孔 /2个填充铜区**（In1 GND、In2 VBAT_PROTECTED）。236电气器件 /240实体，含65测试点和4孔。35个新增USB电源器件仍属候选，BOM不是采购批准。

| 要求 | 当前结果 |
| --- | --- |
| USB_CORE_ARCHITECTURE_MINIMAL_SET | DEFINED；未正式采用 |
| ALL_FOOTPRINTS_WITHIN_45MM | YES |
| REAL_BODY_CONFLICTS | 0 |
| CONNECTOR_ACCESS | PASS；裸板插头/插卡与Ø7接触包络CAD范围 |
| CRITICAL_ROUTING_SPACE | REVIEWED；布局出口及预留通道范围 |
| FULL_PLACEMENT_READY_FOR_ROUTING | YES；正在实际布线 |
| Fresh ERC /native parity | 0 /0 |
| DRC_FINAL /PCB_MANUFACTURING_PACKAGE | NOT_PASS /NOT_READY |

## 已实际接通

- VBAT入口、保险丝、保护MOS、TVS、输入储能和栅极偏置。
- 主Buck的SW/BOOT、输入/输出去耦、COMP/RC、RT、FB、EN及指定地节点。
- 5V_MAIN全部12个焊盘、U105优先级分压器，以及U104/C117/C118输入支路。
- U104输出至保险丝F102输入、输出电容C119；R109限流支路、EXT_FAULT及TP110/R110。保险丝后的EXT_5V各接口仍待连接。
- U105核心MUX输出、C121保持电容、U107受控开关、C126/C128/C122，以及AP63203输入/使能、自举、L102和C113/C114本地3V3输出。CORE5V已到R108输入；滤波后的传感器供电仍待连接。
- 本轮接通VCAP1/2及VDDA/VBAT局部网络；VDD27/75/100接入AP输出。VDD11与C203局部成网但尚未接主供电，VDD50未接；VDDA/VBAT上游R201/R202也尚未供电。

[原生连接复核](evidence/ACTUAL_ROUTING_REVIEW.json)按实际焊盘、每段铜线、过孔及含孔洞的填充多边形确认38组局部指定节点连通，不代表完整供电或整板完成。3V3的47个同网焊盘中，23个与C113输出实际连通，24个仍在未供电岛内；[逐引脚结果](evidence/ACTUAL_ROUTING_REVIEW.json)明确列出，未宣称MCU可启动。[外部5V路径](evidence/EXTERNAL_5V_ROUTES.json)中，功率通路包含0.8mm背面主干约20.57mm、0.4mm跨层连接合计约20.77mm；主路径使用4颗标准通孔过孔，输出电容另有支路。**载流、压降、热态、限流/短路及瞬态尚待最终电源审查，未标为POWER_SAFETY_PASS。**原厂布局依据：[TI TPS2553，第12节](https://www.ti.com/lit/ds/symlink/tps2553.pdf#page=25)。

C108正极至R105.1为独立0.25mm取样支路，约59.80mm、2过孔；已确认其在C108正极焊盘外不与负载铜线共用。FB/COMP稳定性、耦合和回流审查仍待完成。本阶段调整U102/C112并交换R108/R510的位置与面别，保留所有器件型号、引脚网络、板框和孔位。两条新增核心供电网补入既有5V_POWER规则，所有数值设计规则及自定义规则文件保持，未放宽最小间距/线宽/孔规则。

[核心供电路径](evidence/CORE_SUPPLY_ROUTES.json)中，U102至L102的主SW路径约2.31mm。固定输出反馈从L102输出焊盘接入U102.1，B.Cu0.20mm、约19.46mm；原生检查确认它在L102输出焊盘外不与负载铜线共用。**这里不是C114专用Kelvin取样，也没有稳定性/EMI/热态实测PASS。**布局依据：[Diodes AP63203，第15页](https://www.diodes.com/datasheet/download/AP63200-AP63201-AP63203-AP63205.pdf#page=15)。本级输出连接不代表MCU或USB已经能够启动。

本轮[3V3布线与未完成项](evidence/3V3_DISTRIBUTION_ROUTES.json)保留VDD11/50、MCU地10/49、C208入口及其他负载的局部调整。没有移动元件或增加器件。原先拟议的C201旋转方案、未成功的C208主干修整均未写入CAD。VCAP1局部逃线使用既有0.20mm铜距，其与未来USB预留铜线最小距离0.2613mm；窗口外仍≥0.5128mm，[检查范围](evidence/3V3_USB_ACCESS_REVIEW.json)不等于USB阻抗/SI通过。长支路的去耦、回流和压降仍需最终电源审查。

## 铜区与机械核验范围

In2输入铜区为一个合并轮廓，局部净距0.50mm；[当前轮廓](evidence/INPUT_PLANE_MERGE.json)和[输入路径](evidence/INPUT_POWER_ROUTES.json)可复核。实际填充后，同一连通多边形面积约355.35mm²，沿源/目标过孔间每0.01mm切片，最小并行有效截面 **9.48mm**，要求8.3mm。各切片最大连续段的最小值约3.09mm；并行截面总和不能充当每个分支、电流分配或热验证PASS。四个主转接孔均接入该连通区。

In1地平面已填充，主多边形约1713.84mm²；最终回流和孤岛审查待完成。无In1信号线、VIP/HDI或全局规则放宽。所有过孔双面盖油；Ø7尼龙接触区内器件、裸焊盘/测试点和过孔保持净空，允许常规盖油走线及内层铜通过。最终Gerber/阻焊与实物装配仍需复核。

USB按USB-IF R2.4插头包络检查，与插入microSD卡片的平面间距0.57mm；[连接器检查](evidence/CONNECTOR_REVIEW.json)限CAD范围。原有65条关键连接的出口/通道已审查，历史计划路径不等于当前65条信号已同时布通；[审查及局部调整](evidence/CRITICAL_ROUTE_SPACE_PARTIAL.json)保留此边界。

## 未完成项

- MCU剩余VDD/GND出口、C208主干和未供电3V3支路；传感器供电、核心状态/使能逻辑、USB限定电源输入和保险丝后EXT5V接口；随后HSE、USB、IMU、SDMMC、CAN与其余接口的实际布线。
- 电流预算、纹波/峰值限流/热态裕量、保护故障、回流和稳定性审查。USB-only普通A→C/C→C、枚举前电流、分阶段启动要求继续保留；理论预算不写成实测，首板测试仍覆盖启动、挂起、双源切换和热故障。
- Fresh DRC仍有618条庭院/丝印/文字报告和336项未连接；完整庭院计数287对，未缩庭院、批量排除或降低全局规则。
- 最终机械、丝印/阻焊/DFM、JLC3313实际下单参数、BOM/CPL、Gerber/钻孔与投板审查包。

未采购、付款、下单、合并main或正式采用新增USB电源器件。投板须最终人工验收。

证据：[放置](evidence/PLACEMENT_REVIEW.json)、[ERC](evidence/ERC.json)、[DRC](evidence/DRC.json)、[网表](evidence/NET.xml)、[实际铜线与连接](evidence/ACTUAL_ROUTING_REVIEW.json)、[BOM](BOM_CANDIDATE.csv)、[60项CAD哈希](evidence/CAD_SHA256.json)。

![当前保存后的原生铜线](evidence/PLACEMENT.png)
