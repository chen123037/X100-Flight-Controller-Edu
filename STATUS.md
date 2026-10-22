# X100 V1 当前状态

更新2026-10-22，分支`feature/pcb-fabrication-readiness`。用户已正式批准J401替换，并授权常规工程修复、PCB设计及制造文件生成；不含付款或实际下单。目标仍为完整可提交嘉立创打样的制造包，不在局部完成后宣告成功。

| 项目 | 当前正式源 |
| --- | --- |
| 原理图 | J401受控替换已执行；201个电气器件，fresh ERC0/0 |
| PCB | 201电气封装+4孔，45×45mm、30.5mm孔距、Ø4 NPTH保持 |
| J601 | 原3条孔/板边阻塞已关闭，局部重排保持 |
| J401 | Amphenol124019772112A / C5430474已正式接受；原4条孔铜阻塞关闭，官方板边基准已对齐 |
| J401局部规则 | 仅SH/GND>=0.30mm，实际0.325mm；全局板边>=0.50mm保持 |
| 原生DRC | 报告634 violations +411 unconnected；部分类别触及199条报告上限，634不是完整总数；原理图一致性问题0 |
| 完整courtyard几何 | 324→280对重叠：本轮23个测试点局部移动消除44对；剩余仍未通过 |
| Tracks / vias / zones | 0 /0 /0，正式布线未开始 |
| USB-only | MCU启动/枚举/刷写/地面站/参数必须；推荐BMI088/SPL06；SD非强制且不得干扰核心；电源ECO未完成 |
| ROUTING_PRECONDITIONS_MET | NO：USB-only电源/预算/SD支路尚需闭合 |
| FABRICATION_READY / MANUFACTURING_RELEASE | NO /NO |
| BENCH /FLIGHT | NOT_VALIDATED /NOT_VALIDATED |

[J401正式接受及实质检查](docs/J401_FORMAL_ACCEPTANCE.md)与[原生证据](docs/evidence/J401_FORMAL_20261022/REVIEW.json)为当前事实；`hardware/proposals/J401_AMPHENOL_UNAPPROVED`保留历史候选，不能覆盖正式源。采购/BOM/选型记录已同步。连接器样品焊接/保持力、外形/槽孔CAM公差、最终DFM未完成。

后续先完成[USB电源事项](docs/USB_CORE_POWER_REVIEW.md)，再推进routing、回流/信号/热/机械检查及制造包。未通过完整检查不标记PASS。J401不再等待同一器件批准或GCT旧孔铜结论。

本轮[测试点净空与同步检查](docs/TESTPOINT_CLEARANCE_REVIEW.md)已正式保存；电气网表/BOM、45mm板框、孔位、J401等功能器件姿态保持。USB-A→C与USB-C→C均为必需兼容目标；USB-only最高200MHz、VBAT400MHz获准继续评估。200MHz静态时钟编译探针通过不代表分阶段启动或USB电流通过。
