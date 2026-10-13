# X100 V1 当前状态

记录日期：2026-10-13。基线：`X100_V1_PRE_ROUTING_TEACHING_BASELINE`，来源：`PCB02C2_BLOCKER_CHECKPOINT`。

| 项目 | 状态 |
| --- | --- |
| PCB02C2_PARTIAL_PASS | YES |
| Schematic | FROZEN_POST_ECO |
| Electrical footprints | 201 |
| Placement | 201/201 COMPLETE |
| Mounting holes | H1–H4，Ø4 NPTH，30.5×30.5 mm pitch |
| PCB | 45×45 mm，bounds 77.5…122.5 mm |
| Assembly | double-side selective |
| Routing | NOT STARTED |
| Tracks / vias / zones | 0 / 0 / 0 |
| ERC | 0 error / 0 warning |
| Known real pre-routing blockers | 2 categories / 7 DRC items |
| J601 | 3 |
| J401 | 4 |
| Actual assembly body conflicts | 0，声明范围的 Fab/pad/PTH/孔几何核查 |
| Library footprint mismatch | 0 |
| PCB03_FORMAL_ROUTING_READY | NO |
| ROUTING_PRECONDITIONS_MET | NO |
| MANUFACTURING_RELEASE | NO |
| FABRICATION_READY | NO |
| Flight validation | NOT STARTED |

当前微调已关闭 microSD 的 10 条 edge 问题；已有选择保留。J501 物理样品、官方 land 资料重新实证及装机访问仍为 `PENDING_SAMPLE_VERIFICATION`。安装高度、热插拔、TVS及台架验收尚未通过。

baseline 最后原生 DRC 为 644 violations +405 unconnected。405 未连接来自尚未 routing；其余 silk/courtyard metadata 提示保留，并未当作全板 DRC PASS。当前禁止制造和试飞。
