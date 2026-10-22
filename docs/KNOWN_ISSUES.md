# 当前已知问题（Known Issues）

当前不可制造、不可试飞。J601原3条已关闭，正式J401仍有4条孔铜报告，另有USB-only核心供电功能/电源架构阻塞，不能靠扩大板框或全局放宽规则获得DRC PASS。

## 新增V1要求：USB独立核心供电（USB-only Core Power）

**当前公开baseline中，USB-only尚不能启动飞控核心。这是KNOWN DESIGN LIMITATION，不是最终X100 V1预期行为。** 当前USB-C为self-powered/data-only，USB_VBUS_RAW没有向5V_MAIN、3V3_MCU或3V3_SENSOR提供预定运行电源；没有VBAT/J808独立供电时，STM32H743不能按设计正常启动。不得把当前baseline直接当作最终USB供电方案。

人工新裁决：`USB_ONLY_CORE_POWER_SUPPORT=REQUIRED_FOR_V1`。未来必须仅插电脑USB、无VBAT即可完成MCU启动、USB设备枚举、DFU/bootloader/firmware flashing、ArduPilot刷写、地面站连接与参数配置、基础桌面调试及SWD/USB必要核心逻辑运行。**这些是需求，不是当前能力或已测试结果。**

尽可能支持BMI088/SPL06-001桌面检测与校准；microSD不是强制负载，且不得妨碍MCU启动、USB和参数配置。USB只用于CORE LOGIC / BENCH DEBUG POWER，不供ESC推进、电机、舵机、外部高电流5V、EXT_SWITCH_OUT大负载或其它动力负载。

`USB_ONLY_CORE_POWER_CURRENT_IMPLEMENTATION=NOT_IMPLEMENTED`；`USB_ONLY_CORE_POWER_V1_REQUIREMENT=REQUIRED`；`USB_POWER_ECO_REQUIRED_BEFORE_PCB03=YES`。这是功能/电源架构阻塞，独立于J401仍保留的4条制造DRC。两处制造问题即使关闭，也必须先完成独立`USB_ONLY_CORE_POWER_ECO`并通过技术裁决，才能批准PCB03。接手顺序见[HANDOFF](../HANDOFF.md)，详细边界见[电源架构](POWER_ARCHITECTURE.md)。

## 1. J601 局部制造问题已关闭（2026-10-22）

本次授权下由 plant_kicad_v1 完成局部15项重排，原两处板边和一处H1孔铜报告消失。未动孔/板框/核心电路，未削官方land或放宽规则；逐项读回和fresh DRC见[当前状态](../STATUS.md)。不代表全板放行。

## 2. J401 USB-C内部孔铜间距（Internal Hole-to-Copper Clearance）

正式型号为 **USB4105-GF-A**。4条逻辑DRC对应2个物理位置：左侧A1/B12共用接地land对定位NPTH，右侧A12/B1共用接地land对定位NPTH。最小间距约 **0.1944 mm**，当前全局孔铜距为0.25 mm。

已核对GCT官方land；仍缺JLCPCB对该exact几何的明确CAM/制造接受结论。公开制造能力表的一般值不等于对这两处结构的批准。

优先取得板厂明确结论。若接受，只审查限定到具体pad/hole pair的局部规则；若拒绝，提交官方替代land或connector ECO人工裁决。禁止排除整个J401、修小官方接地land或全局降低孔铜距。

## 其它待验证或收尾事项

- **J501：** microSD的10条edge问题已关闭；Molex 1040310811的样品、官方drawing/land重新实证和装机插卡访问仍`PENDING_SAMPLE_VERIFICATION`。
- **机械：** 底部高件、机架净空、线束和插拔方向待实物确认；当前Fab/pad/孔核查的实体冲突0不等于三维装机验收。
- **电源与USB：** 已知反灌前向拓扑路径由硬件ECO关闭；leakage、hotplug、TVS、overshoot、温升和台架测试未通过。
- **气压计资料：** SPL06-001已选型；既有V7.0文件的原厂可追溯性限制尚未解除，公开可核实的完整PDF入口仍缺失。
- **DRC收尾：** 丝印/文字与courtyard元数据需后续分类处理，尚无整板制造DRC PASS。
- **软件与飞行：** 本板ArduPilot hwdef、实板外设、安装方向、台架和飞行验证均未完成。

2026-10-22：[Amphenol候选完整验证](../hardware/proposals/J401_AMPHENOL_UNAPPROVED/VALIDATION.md)为HOLD；1.6mm适配未闭合，官方板边基准对齐后新增2条0.325<0.500mm板边错误。用户已确认采购来源，但尚未批准替换；按发现风险即暂停的指令停止推进该候选。USB-only功能范围及固件/启动电流新发现见[工程审查](USB_CORE_POWER_REVIEW.md)。新器件与电源方案未裁决、技术前置条件未通过前，不进入正式布线。
