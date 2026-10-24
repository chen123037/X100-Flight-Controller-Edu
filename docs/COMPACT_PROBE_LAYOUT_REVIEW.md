# 正式测试点紧凑化复核

2026-10-23，唯一CAD执行器`plant_kicad_v1`。本次仅调整PCB测试铜点，不采用尚未批准的USB电源架构/新IC；普通0805阻容、冻结MCU/IMU/气压计、45×45mm板框和安装孔保持。

46个原1.5mm测点改用已有`TP0p6_Inline_NoPaste`。全部65个测点保持：60个0.6mm点；TP102/103/104/105/111五个电源/地大测点仍为1.5mm。小点仍保留0.5mm局部探针包络，无孔、无Paste，需使用细针探测。没有降低全局DRC、缩小其它器件courtyard或改用小阻容。

| 实际检查 | 结果 |
| --- | --- |
| 电气器件/PCB封装 | 201 /205（含四孔）保持 |
| 引脚网络、Value、源UUID、PCB UUID与层级路径 | 无变化 |
| 坐标、朝向、面别 | 无变化；执行器替换背面封装时的额外180°翻转已修复，并经MCP恢复后复核 |
| 非测试点封装与焊盘 | 无变化 |
| fresh ERC /native schematic parity | 0错误0警告 /0问题 |
| 完整courtyard几何 | 280→234对；移除46对，无新增配对 |
| courtyard面积 | 减少168.912mm²；不代表已获得连续区域或足够布线空间 |
| 原生DRC | 报告632项+411未连接，部分类型触及199条上限；632不是完整缺陷总数 |
| NPTH/PTH落入courtyard | 15 /3，仍需处理 |
| Tracks/vias/zones | 0 /0 /0，布线未开始 |

[实质审查](evidence/COMPACT_PROBE_FORMAL_20261023/COMPACT_PROBE_FORMAL_REVIEW.json)、[ERC](evidence/COMPACT_PROBE_FORMAL_20261023/COMPACT_PROBE_FORMAL_ERC.json)、[DRC](evidence/COMPACT_PROBE_FORMAL_20261023/COMPACT_PROBE_FORMAL_DRC.json)、[网表](evidence/COMPACT_PROBE_FORMAL_20261023/COMPACT_PROBE_FORMAL.net.xml)、[正式CAD哈希基线](evidence/COMPACT_PROBE_FORMAL_20261023/POST_COMPACT_PROBE_FORMAL_BASELINE.json)。工程BOM、元件状态与采购清单已同步46项PCB feature；无独立测试点器件采购。

USB电源Stage3候选保留历史范围，后续正式集成须基于本基线，避免恢复旧大测点。隔离Stage4候选另把SD_PG上臂分压改为68.1kΩ，未正式采用；按明确容差、温漂和输入偏置假设计算，PG上升门限约3.072–3.176V，给开关、跳线与走线压降留出余量。该计算不是实测PASS，且CCM供电、卡负载和动态时序仍需后续验证。

布局试算识别到顶边连接器/MCU间距、右侧连接器间距及J401/J501/J808组合需要区域重排。矩形模型尚无完整可用解，不能据此宣称45mm不可行或放置完成。继续在板框、孔位和功能保持的前提下处理这些区域。

`ERC_FORMAL=PASS`仅限原生ERC；`DRC_FINAL=NOT_PASS`、`FABRICATION_READY=NO`、`PCB_MANUFACTURING_PACKAGE=NOT_READY`。未付款、采购或下单。
