# X100 V1 当前状态

更新2026-10-23，分支`feature/pcb-fabrication-readiness`。用户已正式批准J401替换，并授权常规工程修复、PCB设计及制造文件生成；不含付款或实际下单。目标仍为完整可提交嘉立创打样的制造包，不在局部完成后宣告成功。

| 项目 | 当前正式源 |
| --- | --- |
| 原理图 | J401受控替换已执行；201个电气器件，fresh ERC0/0 |
| PCB | 201电气封装+4孔，45×45mm、30.5mm孔距、Ø4 NPTH保持 |
| J601 | 原3条孔/板边阻塞已关闭，局部重排保持 |
| J401 | Amphenol124019772112A / C5430474已正式接受；原4条孔铜阻塞关闭，官方板边基准已对齐 |
| J401局部规则 | 仅SH/GND>=0.30mm，实际0.325mm；全局板边>=0.50mm保持 |
| 原生DRC | 报告612 violations +411 unconnected；丝印相互类别触及199条报告上限，612不是完整总数；原理图一致性问题0 |
| 完整courtyard几何 | 324→280→234→230→201→185对：最近20测点与12阻容两批再消除45对，无新配对；剩余仍未通过 |
| Tracks / vias / zones | 0 /0 /0，正式布线未开始 |
| USB-only | MCU启动/枚举/刷写/地面站/参数必须；推荐BMI088/SPL06；SD非强制且不得干扰核心；电源ECO未完成 |
| ROUTING_PRECONDITIONS_MET | NO：USB-only电源/预算/SD支路尚需闭合 |
| FABRICATION_READY / MANUFACTURING_RELEASE | NO /NO |
| BENCH /FLIGHT | NOT_VALIDATED /NOT_VALIDATED |

[J401正式接受及实质检查](docs/J401_FORMAL_ACCEPTANCE.md)与[原生证据](docs/evidence/J401_FORMAL_20261022/REVIEW.json)为当前事实；`hardware/proposals/J401_AMPHENOL_UNAPPROVED`保留历史候选，不能覆盖正式源。采购/BOM/选型记录已同步。连接器样品焊接/保持力、外形/槽孔CAM公差、最终DFM未完成。

后续先完成[USB电源事项](docs/USB_CORE_POWER_REVIEW.md)，再推进routing、回流/信号/热/机械检查及制造包。未通过完整检查不标记PASS。J401不再等待同一器件批准或GCT旧孔铜结论。

本轮[测试点净空与同步检查](docs/TESTPOINT_CLEARANCE_REVIEW.md)已正式保存；电气网表/BOM、45mm板框、孔位、J401等功能器件姿态保持。USB-A→C与USB-C→C均为必需兼容目标；USB-only最高200MHz、VBAT400MHz获准继续评估。200MHz静态时钟编译探针通过不代表分阶段启动或USB电流通过。


2026-10-22 USB-only续推进：用户确认目前没有开发板/测试条件，不额外购买；电流、枚举和切换波形安排首板Bring-up，不再因缺实板暂停设计。[Stage3候选](docs/USB_CORE_STAGE3_REVIEW.md)已完成240器件ERC0/0、精确27处既有引脚改网及候选PCB逐焊盘/UUID/Value/封装同步检查，原生parity0；正式源55项CAD哈希未变。该候选新增39个封装尚未完成放置，未布线；预配置/挂起仍未资格验证，新电源器件/架构未正式采用。上述正式源状态与NO结论保持。


2026-10-23当前正式源完成[测试点紧凑化复核](docs/COMPACT_PROBE_LAYOUT_REVIEW.md)：201器件、65测点保持，46点采用已有0.6mm无孔/无Paste封装，五个电源/地测点仍1.5mm；网络、坐标、朝向、非测试点器件与板框/孔位/规则保持。fresh ERC0/0、native parity0。后续从POST_COMPACT_PROBE_FORMAL_BASELINE继续，不覆盖为Stage3旧测点。USB新电源架构仍未正式采用，制造包仍未就绪。


2026-10-23新增[Y201紧凑晶体候选](hardware/proposals/Y201_YXC_5032_NOT_APPROVED/README.md)：YXC XG1EL89CSI-111YLC-8M/C5280575，8MHz/20pF保持，R205初装100Ω；独立候选ERC0/0、native parity0、网表和身份保持，courtyard234→224，无新增配对。正式源未替换，待新型号人工裁决；启动/激励首板验证未完成，全板布线与制造包仍未完成。


2026-10-23正式源另完成[右侧接口净空](docs/RIGHT_PORT_CLEARANCE_REVIEW.md)：J703/J809之间及J703/安装孔的courtyard冲突关闭，八件放置受控更新；201器件/65测点/网表/身份/规则保持，ERC0/0、native parity0。当前基线POST_RIGHT_PORT_FORMAL_BASELINE；新晶体仍未正式采用。


2026-10-23最新正式源完成[两批局部净空](docs/LOCAL_CLEARANCE_REVIEW.md)，32件放置改变、原理图/网络/身份/封装/规则不变；ERC0/0、native parity0。基线更新为POST_PASSIVE_CLEARANCE_FORMAL_BASELINE；当前185对庭院、612条DRC报告及411未连接，仍未布线、不可下单。此前230/234等均为阶段历史值。晶体与USB电源候选仍未正式采用。
