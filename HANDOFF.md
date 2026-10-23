# 接手指南

当前唯一[统一USB候选](hardware/proposals/USB_CORE_MINIMAL_NOT_APPROVED/README.md)已完成主输入/Buck、5V_MAIN输入分配，U104输出至F102/C119、限流/故障信号，以及核心MUX/保持电容/受控5V、AP63203本地3V3和MCU供电第一轮的实际连接：**1212段铜线 /111过孔 /2个填充铜区**。236电气器件 /240实体全部落板，实体/跨面通孔冲突0，器件Fab壳体间距≥0.20mm，四孔双面Ø7接触区保持净空。正式201器件/205实体及57项CAD未覆盖。

Fresh ERC0 /native parity0；当前DRC无电气/孔铜/线宽/VIP/禁止层类别报告。输入平面最小并行有效截面9.48mm，满足8.3mm几何要求；不等于电流分配/热/保护安全PASS。DRC_FINAL仍未PASS：618条庭院/丝印/文字报告、336项未连接。MCU VDD27/75/100已接入主供电，VCAP1/2及VDDA/VBAT局部成网；VDD11/50、C208主干、R201/R202上游和其余供电仍待连接。继续局部供电出口调整、外设/传感器供电、保险丝后EXT5V接口及核心状态逻辑；随后HSE、USB、IMU、SDMMC、CAN及其余信号。全部CAD由plant_kicad_v1执行，不采购或下单。

以下为历史阶段记录；与以上冲突时以上为准。

主电源另有[可打开的局部布线检查点](hardware/proposals/MAIN_POWER_PARTIAL_ROUTING_NOT_APPROVED/README.md)：22轨迹/14贯通过孔/1填充In1 GND面，原生确认SW/BOOT与关键GND回流真实连通。完整245实体保留，但174个仍在板外待排；局部DRC149条、未连接报告499封顶，不是完整PCB。未正式推广USB/Y201，正式源仍为POST_L101。

2026-10-23最新正式基线 **POST_L101_FORMAL_BASELINE**：[L101已正式接受](docs/L101_FORMAL_ACCEPTANCE.md)，Bourns SRP1038A-100M/C780184、10µH。ERC0/0、native parity0、其余204个PCB实体/全部网络保持；庭院170对、DRC599条报告+411未连接，0轨迹/过孔/铺铜。实际负载容量筛查2.448A；原3.5A极端风险保留，电源安全与制造包未通过。未采购/未下单。

以下阶段记录以本段为最新状态；旧“当前基线”仅对应记录当时。

供电后续评估从[Stage6隔离合并候选](hardware/proposals/USB_CORE_STAGE6_NOT_APPROVED/README.md)继续：组合待裁决的Y201及现已批准的L101，保留Stage5外I2C门控/硬件PWR指示/SD隔离，并将2×82µF合并为复用C108型号的180µF。241器件fresh ERC0/0、native parity0；旧引脚网络除移除C127外保持。40个新封装未完成放置，联合试排仍未取得全器件可接受解，方案/型号尚未正式集成。该检查时正式CAD与Stage5父候选未变；随后正式L101已独立集成；不要用任何候选整板覆盖当前正式源。Stage5单独候选继续保留用于差异复核。

L101另有[可打开的SRP1038A-100M/C780184候选](hardware/proposals/L101_BOURNS_SRP1038A_NOT_APPROVED/README.md)，只改L101及对应库/字段，非目标204个PCB实体保持，L101现已正式批准并集成；不要据此认定完整电源或制造通过。旧Y201候选已补齐库SMD属性，原PCB/原理图未变，旧父基线的几何数据不能替代当前MCU位置检查。

最新正式基线（2026-10-23）：[MCU/局部去耦空间调整](docs/LOCAL_CLEARANCE_REVIEW.md)。完整庭院172对、fresh DRC602+411未连接、ERC0/0/native parity0；正式PCB/身份/网络同步完成。后续从POST_MCU_CORRIDOR_SHIFT_FORMAL_BASELINE继续，勿用旧候选整板覆盖；C204距离增加后的实际回路与方向标记尚待闭合。下文177/185/280/234/230计数是阶段历史。

2026-10-22最终人工授权：J401_REPLACEMENT=APPROVED；已写入正式源。继续推进完整PCB与制造包到READY_FOR_HUMAN_FABRICATION_APPROVAL，届时STOP供人工验收；不付款、不实际下单。已授权常规工程修复，不再申请同一J401型号批准。

后续已保存[23个测试点净空修复与字段同步](docs/TESTPOINT_CLEARANCE_REVIEW.md)。完整courtyard重叠280对，原生报告634条是受类别上限影响的下界，411未连接、原理图一致性问题0。必须继续关闭实际几何问题，不能以计数达到199不变误判修复无效或遗漏其它重叠。

1. 先读[当前状态](STATUS.md)与[J401正式接受记录](docs/J401_FORMAL_ACCEPTANCE.md)。正式源为`hardware/X100_V1`。原J6013条和J4014条孔/板边问题已关闭，J401板边基准已对齐。
2. 关闭[USB-only供电事项](docs/USB_CORE_POWER_REVIEW.md)：必须支持USB-A→C与USB-C→C，不以1.5A端口为前提；允许USB-only最高200MHz及最小必要板级适配，VBAT保持400MHz目标。核心功能必须保留，SD非强制且不得拖垮核心；需要分阶段电流、浪涌、反向阻断和双源/SD支路处理，不得直接并USB VBUS和5V_MAIN。隔离旧研究稿ERC0不是功能通过。
3. 电源ECO后native ERC/XML→PCB同步、逐脚/UUID/封装核对、局部放置复查。正式PCB修改由plant_kicad_v1执行，保留checkpoint；不要使用旧的几何推断网名同步器。
4. 技术前置条件闭合后执行已授权routing、标准贯通过孔和铺铜。先Buck回路/GND、HSE、USB、BMI088、SD/CAN/ADC，再其它IO；In1保持连续GND参考。
5. 完成完整ERC/DRC、板边/孔铜/装配/丝印/阻焊、JLC3313叠层及真实制造参数、BOM/CPL，导出并回读Gerber/钻孔、完成最终DFM。只有真实证据覆盖全部要求才宣布可提交打样。

保持45×45mm、H1–H4 Ø4 NPTH和30.5mm孔距、MCU/IMU/气压计冻结选型。J401精确SH/GND局部0.30mm规则有制造依据，全局0.50mm及其它规则保持，不泛化例外、不排除整只连接器。仅学习参考的模块边框、标题、聚类和局部完整电路绘图语法，不复制他人电路。


## USB-only Stage3续推进（2026-10-22）

用户确认无开发板/实物条件，不额外购开发板；启动、电流、枚举和切换实验纳入[首板计划](docs/FIRST_BOARD_USB_BRINGUP.md)，继续资料设计和PCB工作。[Stage3具体候选与计算边界](docs/USB_CORE_STAGE3_REVIEW.md)已保存，工程在`hardware/proposals/USB_CORE_STAGE3_NOT_APPROVED/project`。240器件ERC0/0，候选原生parity0、逐焊盘网络和符号绑定核对通过；正式源55项CAD哈希未变。新增39个封装仍在原点、未完成放置，不能自动布线或制造。接下来做紧凑布局/必要局部重排与候选IC焊盘/可采购性核查；新增架构/exact MPN尚未正式采用。J401已批准，不重复申请。


## 2026-10-23正式布局基线

见[测试点紧凑化实质检查](docs/COMPACT_PROBE_LAYOUT_REVIEW.md)。完整courtyard重叠234对；所有65测点和引脚网络保持，0.6mm点需要细针探测。正式源hardware/X100_V1及三份BOM/采购表已同步。仍有411未连接；J401/J501/J808组合、ADC/SWD等区域需重新安排，尚无完整可用放置解。USB电源Stage3是历史候选，不能直接覆盖当前正式测试点。


## 右侧接口净空正式更新（2026-10-23）

见[八件放置及证据](docs/RIGHT_PORT_CLEARANCE_REVIEW.md)。正式courtyard重叠230对、DRC报告628+411未连接、ERC0/0/native parity0。旧晶体/电源候选不得覆盖整个PCB；新选型应按改动集成并保留本次右侧接口、LED和C111位置。新晶体选型待用户裁决；未进入正式布线或制造放行。
