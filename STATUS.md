# X100 V1 当前状态

2026-10-23最新正式基线 **POST_L101_FORMAL_BASELINE**：[L101已正式接受](docs/L101_FORMAL_ACCEPTANCE.md)，Bourns SRP1038A-100M/C780184、10µH。ERC0/0、native parity0、其余204个PCB实体/全部网络保持；庭院170对、DRC599条报告+411未连接，0轨迹/过孔/铺铜。实际负载容量筛查2.448A；原3.5A极端风险保留，电源安全与制造包未通过。未采购/未下单。

以下阶段记录以本段为最新状态；旧“当前基线”仅对应记录当时。

最新隔离评估为[USB-only Stage6 合并候选](hardware/proposals/USB_CORE_STAGE6_NOT_APPROVED/README.md)：保留Stage5的外I2C门控、独立PWR指示与SD硬件隔离，组合待批准的Y201及现已批准的L101，并以既有型号180µF合并2×82µF，减少一颗器件和30.9701mm²封装占位。241电气器件、245封装fresh ERC0/0、native parity0；除移除C127外，Stage5全部引脚网络保持。40个新增封装仍未完成放置，联合试排未取得全器件可接受解；轨迹/过孔/铺铜仍0/0/0。启动/挂起、源切换及电源安全未通过。该Stage6检查时正式源55项CAD和Stage5父工程59项CAD未变；随后正式L101已独立集成，未批准器件/架构未推广，不能下单。

新增独立[L101紧凑电感候选](hardware/proposals/L101_BOURNS_SRP1038A_NOT_APPROVED/README.md)：SRP1038A-100M/C780184，保持10µH，原厂焊盘核对、ERC0/0、native parity0、库封装一致性通过，节省40.192mm²。L101现已正式批准并集成；下文为当时的候选检查记录；候选正常/故障计算不代表实测或完整电源通过。Y201历史候选同时补齐SMD库属性，fresh ERC0/0、lib mismatch0，未更换正式晶体。

更新2026-10-23，分支`feature/pcb-fabrication-readiness`。用户已正式批准J401替换，并授权常规工程修复、PCB设计及制造文件生成；不含付款或实际下单。目标仍为完整可提交嘉立创打样的制造包，不在局部完成后宣告成功。

| 项目 | 当前正式源 |
| --- | --- |
| 原理图 | J401受控替换已执行；201个电气器件，fresh ERC0/0 |
| PCB | 201电气封装+4孔，45×45mm、30.5mm孔距、Ø4 NPTH保持 |
| J601 | 原3条孔/板边阻塞已关闭，局部重排保持 |
| J401 | Amphenol124019772112A / C5430474已正式接受；原4条孔铜阻塞关闭，官方板边基准已对齐 |
| J401局部规则 | 仅SH/GND>=0.30mm，实际0.325mm；全局板边>=0.50mm保持 |
| 原生DRC | 报告599 violations +411 unconnected；丝印相互类别触及199条报告上限，599不是完整总数；原理图一致性问题0 |
| 完整courtyard几何 | 170对：L101替换再消除2对，无新配对；剩余仍未通过 |
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


2026-10-23最新正式基线：POST_SWD_ROW_REFLOW_FORMAL_BASELINE。追加六件放置后庭院177对、DRC608+411未连接、ERC0/0/native parity0；[当前证据](docs/LOCAL_CLEARANCE_REVIEW.md)。此前185/612等是阶段记录。C208值/型号与所有各脚去耦电容、SWD五针及65测点保持；未正式采用新晶体/USB电源，布线及制造包未完成。


2026-10-23最新正式基线：POST_MCU_CORRIDOR_SHIFT_FORMAL_BASELINE。26件位置更新，MCU及局部去耦向右1mm；庭院172、DRC602+411未连接、ERC0/0/native parity0。C204留原位，距U201.27为1.825mm，实际供电/GND回路仍待布线审查。6×4mm空白方向标记预留区右移1.25mm，真实轴向/箭头尚未闭合。见[当前布局证据](docs/LOCAL_CLEARANCE_REVIEW.md)。此前177/608等均为历史阶段，仍未布线和生成制造包。
