# X100统一候选：HSE/USB实际布线与SD供电支路

打开[KiCad工程](project/X100_CleanSheet.kicad_pro) / [PCB](project/X100_CleanSheet.kicad_pcb)。保存板 **1398铜线 / 127个0.6/0.3mm标准过孔 / 3个填充铜区**。所有CAD修改通过唯一指定的plant_kicad_v1执行，由Codex规划与检查路径。整板仍未完成，不能投板。

236电气器件/240实体，含65测试点和4安装孔；45×45mm、Ø4 NPTH、30.5mm孔距保持。正式201器件/205实体及57项CAD未覆盖，新增35个USB电源器件仍属未正式采用的候选，BOM不是采购批准。

| 检查 | 当前结果与范围 |
| --- | --- |
| USB_CORE_ARCHITECTURE_MINIMAL_SET | DEFINED；未正式采用 |
| ALL_FOOTPRINTS_WITHIN_45MM | YES |
| REAL_BODY_CONFLICTS | 0 |
| CONNECTOR_ACCESS | PASS；插头/插卡与Ø7接触包络CAD范围 |
| CRITICAL_ROUTING_SPACE | REVIEWED；初始出口，不表示所有信号已布通 |
| FULL_PLACEMENT_READY_FOR_ROUTING | YES；实际布线与局部调整进行中 |
| MCU VDD/GND、3V3_MCU | 5/5、6/6；47/47相关焊盘接主供电，VDDA上游接通 |
| HSE_IN/OUT/XOUT | 指定焊盘全部连通；两个负载电容地接通 |
| USB_DP/DM | 各5个相关焊盘连通；F.Cu、0过孔、线宽0.1537mm |
| Fresh ERC / native parity | 0 / 0 |
| DRC_FINAL / PCB_MANUFACTURING_PACKAGE | NOT_PASS / NOT_READY |

## 实际变化

主输入保护、主Buck、5V_MAIN全部12个焊盘、受保护外设5V、核心MUX/保持电容/受控5V、AP63203和MCU供电/VCAP/备份域的既有指定连接保持。新增VDDA上游、U111电源、SD开关输入和SWD参考；修正R102过孔，避免同网VIP。

SD开关U108输出经R501接入卡座VDD、U109电源及输出电容/部分上拉。3V3_SD接通10/13个焊盘，未接入 **R502.1、R506.1、R507.1**。R511放电、SD_SLEW及控制/默认状态网络仍未完成。R501、R510、C134做了局部位置调整，C134接地保留。曾尝试的长In2 CT线会切开电源平面，已撤回；CT器件、网络及功能要求保留，信号线仍待完成。

传感器LDO U103至输出电容C116的局部连接完成；R108至LDO输入、传感器分配、地及使能仍未完成，不能宣称传感器已供电。

删除一条穿过HSE出口的冗余3V3支线；保存后仍确认47/47相关供电焊盘接主电源。HSE三个网络、负载电容地，以及USB MCU/ESD/测试点/Type-C两排数据触点全部接通。HSE起振裕量、寄生电容和实板波形仍需最终审查与Bring-up。

USB实际异网铜线/过孔最小间距0.2063mm，限MCU VDD50扇出窗口，满足既有0.20mm规则；窗口外最小0.5128mm。Type-C双排DM外围合并支路仍需按USB全速电容支路审查。没有宣布均匀90Ω、SI、USB枚举或合规通过。

## 电源、制造与下一步

In1为GND，In2为VBAT_PROTECTED和3V3_MCU分区。无In1信号线、In2窄电源线、VIP或HDI，全部过孔双面盖油。3V3主干声明窗口内横/纵并行截面最小12.13/13.55mm，要求6.75mm；输入主干最小9.48mm，要求8.3mm。数值规则和DRU未降低；这些截面不是热态、过孔电流分配或全部支路通过证据。主Buck C108独立反馈支路和AP63203 L102输出焊盘独立FB保持，完整负载/限流/热/短路/回流审查待完成。

继续完成传感器供电、SD CT/放电/控制、USB限定输入和保险丝后接口，以及IMU、SDMMC、CAN、ADC与其余信号。当前618条庭院/丝印/文字报告、282项未连接；庭院相交275对，实际实体冲突0。仍需最终装配、板边、阻焊、丝印、DFM、JLC3313实际下单参数、BOM/CPL及Gerber/钻孔审查。

普通USB-A→C/C→C、枚举前100mA、挂起和分阶段启动需求保留。保证值、典型值、估计和实测分开；无法在打样前完成的电流、枚举、切换和故障波形纳入首板Bring-up，不冒充实测PASS。USB插头与插入microSD卡片的CAD平面间距0.57mm；机械结论限已声明的模型范围。

未采购、付款、下单、合并main或正式采用新增USB器件。最终投板须人工验收。

证据：[铜线连通](evidence/ACTUAL_ROUTING_REVIEW.json)、[放置](evidence/PLACEMENT_REVIEW.json)、[ERC](evidence/ERC.json)、[DRC](evidence/DRC.json)、[网表](evidence/NET.xml)、[BOM](BOM_CANDIDATE.csv)、[60项CAD哈希](evidence/CAD_SHA256.json)、[USB铜距](evidence/3V3_USB_ACCESS_REVIEW.json)。已执行阶段的计划和MCP结果保存在evidence目录。

![保存后的原生铜线](evidence/PLACEMENT.png)
