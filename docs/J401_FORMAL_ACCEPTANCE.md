# J401 正式替换接受记录

2026-10-22，人工最终裁决 `J401_REPLACEMENT=APPROVED`。**已执行正式替换，不再等待同一器件批准。** Amphenol 124019772112A，立创C5430474；未购买、未下单。MCU/IMU/气压计、45×45mm板框与H1–H4保持。

## 官方安装结构与必要局部处理

以[原厂C12401977 rev3机械图](https://cdn.amphenol-cs.com/media/wysiwyg/files/drawing/c12401977-3.pdf)的实际结构为依据：该件是top mount，四个外壳固定脚进入金属化槽，没有卡住0.5mm板材的上下夹持结构。侧视0.50mm为固定脚相对贴装面的名义突出量；在1.6mm板中脚端留在槽内，不穿出板底。较低的前部外壳位于推荐板边之外。由此接受**1.6mm名义安装几何**，不把网页0.50mm字段当兼容性裁决。装配须从元件面焊接SH固定脚，检查槽壁/固定脚润湿；焊接工艺、保持力和样品验证仍属首板验证，未伪称厂家确认或实测通过。

正式姿态J401=(108.600,120.925,0°,F.Cu)，官方PCB Edge局部Y=1.575对应实际板边122.500。现有两个0.45×1.65mm前固定槽的铜边距名义0.325mm。保留原厂焊盘，不靠缩land或偏离板边基准取得通过。

[JLC公开能力](https://jlcpcb.com/capabilities/pcb-capabilities/)给出铣边铜距名义0.20mm、多层板槽宽0.35mm。本工程对**J401、SH编号、GND**增加精确局部`edge_clearance>=0.30mm`规则（实际0.325mm）；其他焊盘、连接器、走线、孔距与全局0.50mm板边规则不变。它是有制造依据的局部约束，不是忽略整只连接器或全局放宽。最终板厂CAM/槽孔/外形公差接受仍是制造包DFM门槛，尚未通过。

其余局部动作仅J501切向移动0.125mm（y=115.995已接受向内位置保持）、TP501/R303/TP307让位，与隔离候选一致。未扩大板、未移动孔。

## 正式执行及fresh检查

由正式plant_kicad_v1 MCP接口完成symbol替换、MPN/footprint属性、PCB实体封装交换、5项局部placement、原理图→PCB同步和保存。同步使用KiCad原生XML，不推断/改名层级网络；symbol UUID、PCB footprint UUID和symbol path保持。执行器修复先在隔离工程演练并独立读回，正式操作前保存54文件checkpoint。

- Fresh ERC：0 error /0 warning。
- 201个电气器件的所有原引脚—网络映射保持；22个J401物理焊盘逐个匹配原生XML，CC/DP/DM/VBUS/GND/SH均保持，A8/B8继续NC。
- Fresh native DRC：629 violations +411 unconnected；孔铜、铜板边、pad clearance、shorting类报告0。剩余courtyard/丝印/文字仍要关闭，**不是全板DRC PASS**。
- Fab/pad/PTH/孔模型内实体冲突、孔侵入、越界、正反面PTH冲突、连接器轴向通道阻塞均0。未把该模型当完整线缆/机架/样品测试。
- 原生BOM200行；全部200行Value/MPN/Manufacturer/Footprint/Package与fresh源一致，只有J401身份变化。JP601的排除策略及数量保持。

证据：[REVIEW.json](evidence/J401_FORMAL_20261022/REVIEW.json)、[ERC](evidence/J401_FORMAL_20261022/ERC.json)、[DRC](evidence/J401_FORMAL_20261022/DRC.json)、[原生网表](evidence/J401_FORMAL_20261022/NET.xml)、[原生BOM](evidence/J401_FORMAL_20261022/NATIVE_BOM.csv)、[MCP执行记录](evidence/J401_FORMAL_20261022/MCP_EXECUTION.json)。

## 当前结论

J401替换接受为后续布局/布线基线，旧候选HOLD是改变局部规则前的历史结果，不再构成重复审批阻塞。**整板仍不可投板**：USB-only电源ECO、布线、完整DRC、叠层/DFM及制造包尚未完成。按用户总体目标继续推进，最后才申请制造验收；本记录不赋予付款或实际下单权限。
