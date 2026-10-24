# 右侧接口与指示区正式净空复核

2026-10-23。唯一CAD执行器`plant_kicad_v1`在检查副本验证后，正式调整J703、J809、D201、D202、R206、R207、C111、TP706八个放置。没有采用新晶体或USB电源候选。

| 器件 | 新坐标(mm) | 朝向/面别 |
| --- | --- | --- |
| J809 | 119.3,95.2 | 90° /F.Cu |
| J703 | 119.3,107.2 | 90° /F.Cu |
| D201 | 120,88 | 0° /F.Cu |
| R206 | 114.1,92.6 | 0° /F.Cu |
| D202 | 118.7,117 | 90° /F.Cu |
| R207 | 121,117 | 90° /F.Cu |
| C111 | 113.5,90 | 0° /F.Cu |
| TP706 | 115.2,104.675 | 0° /F.Cu |

J703/J809右侧插拔方向和板边X基准保持；两者courtyard重叠及J703与右下安装孔的courtyard冲突关闭。PWR硬件指示移到USB附近的右下区域，STATUS指示位于右上；电路功能、LED/R值保持。C111仍是原10µF输入电容，未改VCAP或其它电容。所有201个电气器件、65个测点、全部网表/值/封装/UUID/层级身份保持，45mm板框、四孔、叠层和规则保持；只有PCB CAD文件改变。

实际检查：

- fresh ERC：0错误0警告；原生schematic parity：0。
- 实体/安装孔/跨面/PTH/插拔通道/未支撑焊盘与既定FRONT保留区检查均无新增冲突。
- 完整courtyard几何234→230对，消除4对，无新增配对。全板仍未通过。
- 原生DRC报告628项+411未连接；courtyard与部分丝印类别触及199条报告上限，628不是完整缺陷总数。NPTH/PTH落入courtyard仍有14/3项。
- C111与U102物理VIN/GND的平面焊盘间距约0.873/0.211mm；两端均找到符合现有间距、无via-in-pad的0.6/0.3mm通孔过孔出线位置。这是几何出线检查，**没有布线/过孔生成，也不替代后续Buck电流环与回流复核**。
- Tracks/vias/zones仍为0/0/0；丝印全板整理、底边重排、USB电源集成及制造文件仍未完成。

证据：[实质审查](evidence/RIGHT_PORT_FORMAL_20261023/RIGHT_PORT_FORMAL_REVIEW.json)、[ERC](evidence/RIGHT_PORT_FORMAL_20261023/RIGHT_PORT_FORMAL_ERC.json)、[DRC](evidence/RIGHT_PORT_FORMAL_20261023/RIGHT_PORT_FORMAL_DRC.json)、[网表](evidence/RIGHT_PORT_FORMAL_20261023/RIGHT_PORT_FORMAL.net.xml)、[基线](evidence/RIGHT_PORT_FORMAL_20261023/POST_RIGHT_PORT_FORMAL_BASELINE.json)、[C111出线检查](evidence/RIGHT_PORT_FORMAL_20261023/RIGHT_PORT_C111_VIA_ESCAPE.json)。

后续以POST_RIGHT_PORT_FORMAL_BASELINE为正式源，不把旧晶体/电源候选整个项目覆盖回来；获批选型须按具体改动集成，保留本次八处放置。新晶体完整型号与初装参数仍待选型裁决。制造包、下单与实物功能均未放行。
