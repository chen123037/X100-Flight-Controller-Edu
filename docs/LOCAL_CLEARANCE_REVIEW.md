# 测试点与局部阻容净空正式复核 — 2026-10-23

## 当前正式基线：MCU 左侧空间调整

唯一执行器 `plant_kicad_v1` 完成26件位置更新：U201与多数局部去耦/滤波器件整体向右1mm，C208储能电容及相关测点配合重排，C111向右0.125mm。原型号、数值、封装、pad/net/UUID/path、非目标器件、45mm板框/孔位、SCH/PRO/规则/库保持。未正式采用新晶体或USB电源方案。

fresh ERC **0错误/0警告**、原生一致性 **0问题**。全量庭院 **177→172对**，没有新配对；实体/孔/跨面PTH/关键上下重叠/插拔方向检查为0，NPTH/PTH在庭院内的报告未新增。DRC为 **602条 +411未连接**，仍未正式布线。分类：庭院172、NPTH庭院13、PTH庭院3、丝印板边16、字高2、丝印铜197、丝印相互199（该类别仍触及报告上限）。

局部供电脚距离单独比较：VCAP1/2仍0.575/0.500mm；其余随MCU一起平移的供电、VDDA、VBAT、NRST电容保持原距离。C204为避开C116实体而保留原位，到U201.27的焊盘边距离0.825→1.825mm；这里只采用2mm的工程放置筛查，绝不代表原厂保证的回路指标。C204的短供电线、近邻GND过孔及实际回流仍需在后续ADC/LDO整理和布线中重点复核，电源完整性未通过。

C208仍为原10µF/有效电容要求，到最近MCU供电脚3.600→2.752mm。C111到背面U102 VIN/GND的投影焊盘边距离0.873/0.211→0.750/0.093mm，跨面连接仍需真实过孔/铜线。HSE输入焊盘边距离2.846→3.479mm，输出串阻侧1.375mm保持；这些均是几何距离，不是走线长度或启动实测。

空白方向标记预留区仍为6×4mm，从 `(109,94)–(115,98)` 移到 `(110.25,94)–(116.25,98)`。旧框会碰到平移后的MCU，报告明确保留这一事实；新框已检查空白。它原本是绘图预留，并非KiCad电气keepout，本次没有删除/修改禁布区或DRC规则。正式板尚无FRONT/NOSE图形，物理轴到固件的方向核对仍未完成，不能宣称箭头或IMU方向已通过。

当前本地基线 `POST_MCU_CORRIDOR_SHIFT_FORMAL_BASELINE.json`；[原生复核](evidence/LOCAL_CLEARANCE_FORMAL_20261023/MCU_CORRIDOR_SHIFT_FORMAL_REVIEW.json)、[fresh ERC](evidence/LOCAL_CLEARANCE_FORMAL_20261023/MCU_CORRIDOR_SHIFT_FORMAL_ERC.json)、[fresh DRC](evidence/LOCAL_CLEARANCE_FORMAL_20261023/MCU_CORRIDOR_SHIFT_FORMAL_DRC.json)。旧晶体/电源候选必须按获批差异集成并重证当前几何，不得整板覆盖。`DRC_FINAL=NOT_PASS`、`FABRICATION_READY=NO`。

以下为阶段历史记录，其中“当前”仅对应当时的基线。

---

最新正式更新：在下述两批32件放置之后，追加 C208、J807、TP103、TP111、TP305、TP804 六件重排。完整庭院 **185→177对**，无新增配对；fresh ERC0/0、native parity0，DRC报告 **608+411未连接**。仍无正式布线、不能下单。下面230→201→185及612计数是前两批的历史记录。

C208保持原10µF、封装、网络和有效电容要求，改到MCU右下侧，释放左侧VBAT/去耦空间；距最近MCU供电脚的焊盘边距离3.7→3.6mm，各脚100nF电容与VCAP电容未动。最终3.3V供电与低电感GND回流须布线后检查，此处不是电源完整性PASS。

J807保持原五针SWD接口和插接方向，仅微调到(103.725,107.375,90°,F)，避开背面C102与电感；逐针异网铜最小间距至少0.225mm（既定规则0.20mm），原PTH-庭院报告没有新增。TP103/TP111保持1.5mm大点，分别是VBAT_PROTECTED和GND；TP305是BMI088_ACC_CS、TP804是CURRENT_IN_RAW。四点均保留原网络与同面，至其它同面实体保留≥0.5mm。TP305到近邻同网焊盘边距离2.588→5.582mm，需在SPI布线时检查支线；该距离不是实际走线长度。

当前DRC分类：庭院177、NPTH在庭院内13、PTH在庭院内3、丝印板边16、字高2、丝印铜198、丝印相互199（此类别仍达到报告上限）。相较前批新增的1条丝印板边、3条丝印铜也保留在报告中，尚待整理，没有隐藏或降低规则。源SCH/PRO/规则/库、器件身份/值/封装/焊盘网络、非目标位置保持；板框、孔位和冻结器件保持。

当前本地基线为 `POST_SWD_ROW_REFLOW_FORMAL_BASELINE.json`；[六件原生复核](evidence/LOCAL_CLEARANCE_FORMAL_20261023/SWD_ROW_REFLOW_FORMAL_REVIEW.json)、[fresh ERC](evidence/LOCAL_CLEARANCE_FORMAL_20261023/SWD_ROW_REFLOW_FORMAL_ERC.json)、[fresh DRC](evidence/LOCAL_CLEARANCE_FORMAL_20261023/SWD_ROW_REFLOW_FORMAL_DRC.json)。未批准晶体或电源候选须按差异集成，不能整项目覆盖当前正式PCB。

---

正式源从右侧接口基线继续，由唯一 CAD 执行器 `plant_kicad_v1` 分两批实施并保存。第一批只移动20个测试点XY；第二批仅改变12个既有阻容的XY/朝向。测试候选先通过同一套检查，再由执行器应用到正式源并重新检查。未采用新晶体或USB电源方案。

| 检查 | 正式结果 |
| --- | --- |
| 电气封装 / 安装孔 / 测试点 | 201 / 4 / 65，数量不变 |
| 测试点封装 | 60个0.6mm、5个1.5mm，不变 |
| 全部原生庭院多边形重叠 | 230 → 201 → 185对；两批分别消除29、16对，无新增配对 |
| ERC / 原生原理图一致性 | 0错误0警告 / 0问题 |
| 网表 / pad-net / 封装与符号绑定 | 不变，逐封装UUID/path/pad几何及网络比较通过 |
| 非目标器件 / 板框与孔位 / 规则与叠层 | 不变；SCH、PRO、规则和库逐文件保持 |
| 实体重叠、孔侵入、跨面PTH、关键上下重叠、连接器插拔通道 | 本次全板几何检查均为0 |
| Tracks / vias / zones | 0 / 0 / 0，仍未正式布线 |
| fresh完整DRC报告 | 612条violations + 411个unconnected；不是DRC PASS |

612条报告分类：庭院185、孔在庭院内13、PTH在庭院内3、丝印板边15、字高2、丝印铜195、丝印相互199。丝印相互类别仍达到报告上限，不能把612当成完整缺陷总数。第一批测试点移动后丝印铜报告增加1，第二批后共195；丝印整理仍是明确待办，没有通过隐藏规则排除。

## 测试点放置

移动：TP101、TP106、TP110、TP204、TP205、TP206、TP208、TP301、TP304、TP305、TP401、TP404、TP405、TP702、TP709、TP801、TP802、TP803、TP805、TP809。五个大电源/地测点未移动。

同面保持；每点位移不超过4mm，测试铜到其他同面器件实体保留至少0.5mm，外层铜板边至少0.5mm，另检查异面PTH和插拔方向。每点到非测试点同网焊盘的最短几何距离增长不超过2mm；这个距离不是实际走线长度。

VCAP1/2测点仍接原网络，VCAP电容保持紧邻MCU。TP304为SPI1_MISO、TP404为USB_DM，后续正式布线必须复核沿主路径接入和支线长度；本次放置审查不替代USB差分或SPI布线审查。ADC测点仍保留，最终噪声与输入/回流检查待布线完成。

## 阻容放置

移动：C201、C202、C205、C303、C304、C402、C805、R301、R304、R404、R504、R505。型号、封装、数值及网络不变，同面保持。

| 去耦电容与指定供电脚 | 焊盘边最短距离：前 → 后 (mm) |
| --- | --- |
| C201 → U201.48 (VCAP1) | 0.325 → 0.575 |
| C202 → U201.73 (VCAP2) | 0.375 → 0.500 |
| C205 → U201.50 | 0.175 → 0.550 |
| C303 → U302.8 | 0.688 → 1.055 |
| C304 → U302.6 | 0.375 → 0.875 |
| C402 → U402.5 | 0.729 → 0.832 |
| C805 → U801.14 | 0.175 → 0.550 |

均检查具体引脚，而非仅寻找同电源网络上的任意近邻焊盘。地回流、贯通过孔及最终实际走线仍需后续完成。本阶段不宣称电源完整性或传感器噪声通过。

## 当前交付边界

正式基线为本地 `POST_PASSIVE_CLEARANCE_FORMAL_BASELINE.json`；完整正式CAD已镜像至 `hardware/X100_V1`。原理图、BOM、采购器件身份和8处右侧接口更新保持；未批准的旧晶体/电源候选不得整项目覆盖本次32件放置更新。新型号必须按经批准的差异集成。

`DRC_FINAL = NOT_PASS`；`FABRICATION_READY = NO`。还需完成185对庭院、孔/丝印等余项，USB-only正式电源方案、全板布线/铺铜、回流与DFM/叠层、Gerber钻孔制造包。无板的电流/枚举/瞬态验证按用户要求列入首板计划，不虚报为实测通过。

[测试点证据](evidence/LOCAL_CLEARANCE_FORMAL_20261023/PROBE_CLEARANCE_FORMAL_REVIEW.json)、[阻容证据](evidence/LOCAL_CLEARANCE_FORMAL_20261023/PASSIVE_CLEARANCE_FORMAL_REVIEW.json)、[fresh ERC](evidence/LOCAL_CLEARANCE_FORMAL_20261023/PASSIVE_CLEARANCE_FORMAL_ERC.json)、[fresh DRC](evidence/LOCAL_CLEARANCE_FORMAL_20261023/PASSIVE_CLEARANCE_FORMAL_DRC.json)。
