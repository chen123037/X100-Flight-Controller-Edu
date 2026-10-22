# 元器件采购表使用说明（Procurement Guide / README）

这份说明是[采购清单](../bom/X100_V1_PROCUREMENT_LIST.csv)的README。[工程BOM](../bom/X100_V1_BOM.csv)和[元件状态](../bom/component_status.csv)保持源数据不变；采购表是便于学生读懂器件名称、归组数量和备料的派生文件。**当前版本不可投板，采购清单不表示制造放行或建议立即批量下单。**

## 三种“数量”不要混淆

- 工程BOM：200个非排除源条目，每条Quantity=1；含65个测试点与135个装配component条目。
- PCB：201个电气封装，包括原BOM排除的JP601，另有H1–H4四孔，合计205个封装对象。
- 独立采购：134个每板零件实例；J808虽在源BOM中，但为板上焊线焊盘，和65个TP、JP601、4个安装孔一起列`Purchase_required=NO`。机械螺钉、隔离柱、线束、对插壳体/端子、microSD卡和外部传感模块另定，没有虚构采购型号。

## 列怎样看

`Qty_per_board`是每板实例数，不能改成备料数。`Reference Group`用空格列出同组编号。仅在MPN、厂家、Value、Package、Footprint、规格、公差/介质/额定值、采购与验证状态均一致时归组，不合并“看上去一样”的不同规格件。`Notes_CN`保留源Value、Footprint和规格字段；标识保持英文原文。

建议数量是透明的教学备料策略，不是价格、MOQ、现货保证或已完成采购：

| 类型 | 1板建议 | 5板建议 |
| --- | --- | --- |
| 规格冻结的普通阻容（PREFERRED_NOT_EXACT） | Q＋max(2,向上取整20%×Q) | 5Q＋max(2,向上取整20%×5Q) |
| exact IC/连接器/特殊器件 | Q＋1 | 5Q＋max(1,向上取整10%×5Q) |
| 非采购feature、未采用候选 | 0 | 0 |

Q为该组每板数量。J501优先少量样品机械核验，未核验前不按5板列直接批量买。无未经核实的价格或供应商SKU。CSV为UTF-8；Excel导入时把MPN、Package、Reference Group等设为文本，保留`0603`等前导零。

## 状态释义

| 状态 | 中文含义 | 怎样使用 |
| --- | --- | --- |
| FINAL_SELECTED_FOR_V1 | V1正式选型 | exact件不自行换型；普通R/C按已冻结规格和源采购策略 |
| PENDING_SAMPLE_VERIFICATION | 已选型，样品机械核验待完成 | 当前J501；不等于样品已通过 |
| BENCH_VERIFY | 实板后必须验证 | 是验证任务，不是已测PASS |
| NOT_SELECTED_FOR_V1 | V1未采用的候选 | 只作状态记录，数量0，不采购，不自行替入 |
| DNP | 默认不装（Do Not Populate） | 必须有原工程DNP标志；当前基线未发现DNP器件，不把OPEN焊桥或NC脚自动当DNP |
| NO_PURCHASE | 不是独立采购件 | TP、焊桥、板载焊盘和板孔由PCB制造，不买“feature MPN” |
| NOT_TESTED / BENCH_NOT_VALIDATED | 尚未实板测试 | 保留源状态，不包装成VERIFIED |
| PCB_FEATURE | PCB几何/铜feature | 不用于独立零件资格认证 |

`Selection_status`、`Purchase_required`、`Sample_verification_status`分别表示选型、是否买件、验证程度，不能互相替代。R602默认仍按原BOM计数；JP601默认OPEN只表示CAN终端支路未接通，不等于R602为DNP。

## 采购与收料检查

对照[器件选型](COMPONENT_SELECTION.md)与[资料来源](SOURCES.md)，核对exact完整订货号、厂家、封装脚数/映射、极性和器件标识。替换普通R/C也必须核对全部冻结规格和实际焊盘兼容性，不能只比容量/阻值。未经人工授权，不改变原理图、MPN或pin plan。当前USB/JST制造阻塞、microSD样品和SPL06资料可追溯性事项继续保留。

新增USB-only核心供电需求尚未实现，表内只有当前冻结BOM，**不含尚未选择的USB power ECO零件**；不能据此采购最终V1全部器件。待正式ECO实施后按新批准BOM重新派生采购表。

## 2026-10-22 J401正式ECO

J401已获人工最终批准为Amphenol124019772112A，立创C5430474，优先立创；不再要求淘宝查找或重复同型号批准。三份BOM/采购/状态表已与fresh源同步，数量策略保持。DESIGN_REVIEWED_BENCH_PENDING表示本次设计/网表/布局审查完成而实物焊接、保持力及台架未验证，不表示已采购或可制造。
