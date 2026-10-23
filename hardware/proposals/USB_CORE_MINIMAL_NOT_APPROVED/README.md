# X100统一候选：MCU VDD/GND与分区电源铜面

打开[KiCad工程](project/X100_CleanSheet.kicad_pro) / [PCB](project/X100_CleanSheet.kicad_pcb)。保存板有 **1282铜线、118个0.6/0.3mm标准过孔、3个填充铜区**，尚不能投板。所有CAD修改通过唯一指定的plant_kicad_v1执行。

236电气器件/240实体，含65测试点及4安装孔；45×45mm、Ø4 NPTH和30.5mm孔距保持。正式201器件/205实体及57项CAD未覆盖，35个新增USB电源器件仍为未正式采用的候选，BOM不是采购批准。

| 当前检查 | 结果与范围 |
| --- | --- |
| USB_CORE_ARCHITECTURE_MINIMAL_SET | DEFINED；未正式采用 |
| ALL_FOOTPRINTS_WITHIN_45MM | YES |
| REAL_BODY_CONFLICTS | 0 |
| CONNECTOR_ACCESS | PASS；插头/插卡及Ø7接触包络CAD范围 |
| CRITICAL_ROUTING_SPACE | REVIEWED；初始布局出口及预留通道范围 |
| FULL_PLACEMENT_READY_FOR_ROUTING | YES；正在实际布线和必要局部调整 |
| MCU VDD /GND | 5/5、6/6实际接通；局部直流连通范围 |
| Fresh ERC /native parity | 0 /0 |
| DRC_FINAL /PCB_MANUFACTURING_PACKAGE | NOT_PASS /NOT_READY |

## 实际连接与未完成项

主输入保护、主Buck局部回路、5V_MAIN全部12个焊盘、U104至F102/C119、限流/故障节点、核心MUX/保持电容/受控5V和AP63203本地回路保持接通。新增C205/C208入口、MCU五个VDD与六个GND、VCAP1/2及备份域供电；R114状态上拉已接入。其0.15mm支路按静态上拉用途布置，不是已审核的SD负载主干。

[原生复核](evidence/ACTUAL_ROUTING_REVIEW.json)以实际焊盘、铜线、过孔和含孔洞填充多边形确认40组指定节点。3V3的47个同网焊盘中41个接主供电，6个未接：**C132.1, C135.1, J807.1, R201.1, U108.1, U111.5**。VDDA局部R201.2/C209/C210/MCU20/21成网，但R201.1未供电；未宣称MCU可以启动、刷写或完整电源通过。

本阶段调整R103、TP309、C201、TP205、R206、R510、C203以打开电源出口，型号、引脚网络、板框和孔位保持。[全部实际路径](evidence/3V3_DISTRIBUTION_ROUTES.json)、[MCU50出口](evidence/MCU50_ESCAPE.json)、[MCU地连接](evidence/MCU_GROUND_COMPLETION.json)保留变更。部分供电长支路仍须核查压降、载流、短路与去耦/回流，没有POWER_SAFETY_PASS。

## 电源铜区与几何范围

铜区为In1 GND、In2 VBAT_PROTECTED与3V3_MCU分区。新增3V3轮廓与VBAT轮廓间隔0.75mm，四层叠层和数值规则保持；无In1信号线、In2窄电源线、VIP或HDI，过孔全部双面盖油。

实际3V3主铜区面积约1073.59mm²；声明主干窗口内横/纵向最小并行有效截面 **12.13/13.55mm**，要求6.75mm；四个原生源过孔接入同一多边形。[轮廓](evidence/3V3_PLANE_PLAN.json)与[原生几何](evidence/ACTUAL_ROUTING_REVIEW.json)明确范围。主输入最小并行截面9.48mm，要求8.3mm。这些不是所有分支/过孔、电流分配或热态通过证据。

C108正极至R105.1保持独立0.25mm取样，约59.80mm、2过孔；焊盘外不与负载铜共用。AP63203主SW约2.31mm，FB在L102输出焊盘接入，B.Cu0.20mm、约19.46mm，保持独立。稳定性、噪声、回流和热审查仍待完成。原厂依据：[Diodes AP63203](https://www.diodes.com/datasheet/download/AP63200-AP63201-AP63203-AP63205.pdf#page=15)、[TI TPS2553](https://www.ti.com/lit/ds/symlink/tps2553.pdf#page=25)。

未来USB预留线与原生异网铜线/过孔的最小距离0.2063mm，位于MCU50局部扇出窗口并满足既有0.20mm规则；窗口外最小0.5128mm。并行转折延后0.30mm，线宽、对内间距及主路径长度保持。[检查](evidence/3V3_USB_ACCESS_REVIEW.json)不等于USB完成、阻抗或SI通过。

## 继续工作

- 接通剩余供电、传感器LDO、SD开关/状态逻辑、USB限定电源输入和保险丝后EXT_5V接口。
- HSE、USB、IMU、SDMMC、CAN、关键ADC及其余接口正式布线；旧65条通道计划是初始访问证据，不是65条信号已同时布通。
- 当前618条庭院/丝印/文字报告、316项未连接；庭院图形相交281对、实体冲突0。未缩庭院、批量排除或降低全局规则。
- 完整电流、纹波/峰值限流、热/短路和回流检查；USB-only普通A→C/C→C、枚举前100mA、挂起及分阶段启动要求保留。保证值、典型值、估计和实测分开；启动/枚举/双源切换/热故障列入首板Bring-up。
- 最终板边/孔铜/丝印/阻焊/装配/DFM、JLC3313实际下单参数、BOM/CPL、Gerber/钻孔与投板审查包。

Ø7尼龙接触区的器件、裸焊盘/测试点和过孔保持净空，盖油走线与内层铜按现有接触约定检查；最终阻焊/装配复核尚待完成。USB插头与插入microSD卡片的平面间距0.57mm，[机械结果](evidence/CONNECTOR_REVIEW.json)限声明CAD范围。

未采购、付款、下单、合并main或正式采用新增USB电源器件。投板须最终人工验收。

证据：[放置](evidence/PLACEMENT_REVIEW.json)、[ERC](evidence/ERC.json)、[DRC](evidence/DRC.json)、[网表](evidence/NET.xml)、[BOM](BOM_CANDIDATE.csv)、[60项CAD哈希](evidence/CAD_SHA256.json)。

![当前保存后的原生铜线](evidence/PLACEMENT.png)
