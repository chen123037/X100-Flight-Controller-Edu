# 测试点局部净空修复与原生同步

2026-10-22。正式 CAD 修改仅通过 `plant_kicad_v1`，从 J401 已正式接受的基线继续。23个测试点仅在原面局部移动，未改变201个电气器件的封装、pad/net、UUID或层级绑定。没有移动J401、J601、其它功能器件、板框或安装孔，也未修改DRC规则。原理图和BOM保持。

完整读取全部courtyard多边形，重叠由324对降为280对，消除44对且未增加新的courtyard配对。高速/敏感网采用更小位移范围；实体、孔位、跨面器件、插拔通道及预留区检查未发现新增冲突。这只是本次局部放置检查，剩余courtyard、装配和布线均未通过。

原生 `--schematic-parity` 检查同时发现旧同步接口只同步网名、没有完整复制原理图字段。修复 `plant_kicad_v1` 同步接口后，按原理图原值补齐 Manufacturer、MPN、采购状态、Datasheet、Description及焊桥装配说明等字段，没有重新选型。新鲜原生检查：ERC 0错误/0警告，原理图一致性问题0；201个器件的既有电气网表与BOM源保持。

原生DRC报告634条、411个未连接，tracks/vias/zones仍为0/0/0。**634不是全部违规总数**：courtyard与部分丝印类别触及199条报告上限。KiCad源代码定义了普通类别199条、扩展类别499条上限，见[原厂源代码](https://docs.kicad.org/doxygen/drc__engine_8cpp_source.html)。因此本次使用完整courtyard几何作为补充，后续修复仍须反复运行原生DRC直到所有类别关闭，不能把报告截断当作缺陷消失。

正式[检查结果](evidence/TESTPOINT_FORMAL_20261022/REVIEW.json)、[新基线](evidence/TESTPOINT_FORMAL_20261022/BASELINE.json)、[原生DRC](evidence/TESTPOINT_FORMAL_20261022/DRC.json)、[原生网表](evidence/TESTPOINT_FORMAL_20261022/NET.xml)及[MCP执行记录](evidence/TESTPOINT_FORMAL_20261022/MCP_EXECUTION.json)支持上述局部结论。

`DRC_FINAL = NOT_PASS`；`FABRICATION_READY = NO`。USB电源设计仍未闭合。后续电源ECO必须从此后的正式源克隆，禁止把较早的电源候选PCB复制回来覆盖本次放置和字段修复。
