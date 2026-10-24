# 当前已知问题（Known Issues）

当前不可制造、不可试飞。J601原3条与J401原4条局部制造问题已关闭；USB-only电源、完整布线/DRC/DFM尚未完成，另有USB-only核心供电功能/电源架构阻塞，不能靠扩大板框或全局放宽规则获得DRC PASS。

## 新增V1要求：USB独立核心供电（USB-only Core Power）

**当前公开baseline中，USB-only尚不能启动飞控核心。这是KNOWN DESIGN LIMITATION，不是最终X100 V1预期行为。** 当前USB-C为self-powered/data-only，USB_VBUS_RAW没有向5V_MAIN、3V3_MCU或3V3_SENSOR提供预定运行电源；没有VBAT/J808独立供电时，STM32H743不能按设计正常启动。不得把当前baseline直接当作最终USB供电方案。

人工新裁决：`USB_ONLY_CORE_POWER_SUPPORT=REQUIRED_FOR_V1`。未来必须仅插电脑USB、无VBAT即可完成MCU启动、USB设备枚举、DFU/bootloader/firmware flashing、ArduPilot刷写、地面站连接与参数配置、基础桌面调试及SWD/USB必要核心逻辑运行。**这些是需求，不是当前能力或已测试结果。**

尽可能支持BMI088/SPL06-001桌面检测与校准；microSD不是强制负载，且不得妨碍MCU启动、USB和参数配置。USB只用于CORE LOGIC / BENCH DEBUG POWER，不供ESC推进、电机、舵机、外部高电流5V、EXT_SWITCH_OUT大负载或其它动力负载。

`USB_ONLY_CORE_POWER_CURRENT_IMPLEMENTATION=NOT_IMPLEMENTED`；`USB_ONLY_CORE_POWER_V1_REQUIREMENT=REQUIRED`；`USB_POWER_ECO_REQUIRED_BEFORE_PCB03=YES`。这是功能/电源架构阻塞，独立于已完成的J601/J401局部闭合。两处制造问题即使关闭，也必须先完成独立`USB_ONLY_CORE_POWER_ECO`并通过技术裁决，才能批准PCB03。接手顺序见[HANDOFF](../HANDOFF.md)，详细边界见[电源架构](POWER_ARCHITECTURE.md)。

## 1. J601 局部制造问题已关闭（2026-10-22）

本次授权下由 plant_kicad_v1 完成局部15项重排，原两处板边和一处H1孔铜报告消失。未动孔/板框/核心电路，未削官方land或放宽规则；逐项读回和fresh DRC见[当前状态](../STATUS.md)。不代表全板放行。

## 2. J401已正式更换（2026-10-22最终授权）

Amphenol124019772112A / C5430474已通过plant_kicad_v1写入正式源，官方板边基准已对齐，仅4个SH/GND采用>=0.30mm局部规则，实际0.325mm；全局>=0.50mm保持。孔铜/板边错误0。[正式接受记录](J401_FORMAL_ACCEPTANCE.md)覆盖1.6mm名义安装结构及fresh检查。旧候选HOLD为历史，不再等待同一型号批准或旧GCT结构确认；实物焊接/保持力和最终CAM/DFM仍未通过。

## 其它待验证或收尾事项

- **J501：** microSD的10条edge问题已关闭；Molex 1040310811的样品、官方drawing/land重新实证和装机插卡访问仍`PENDING_SAMPLE_VERIFICATION`。
- **机械：** 底部高件、机架净空、线束和插拔方向待实物确认；当前Fab/pad/孔核查的实体冲突0不等于三维装机验收。
- **电源与USB：** 已知反灌前向拓扑路径由硬件ECO关闭；leakage、hotplug、TVS、overshoot、温升和台架测试未通过。
- **气压计资料：** SPL06-001已选型；既有V7.0文件的原厂可追溯性限制尚未解除，公开可核实的完整PDF入口仍缺失。
- **DRC收尾：** 丝印/文字与courtyard元数据需后续分类处理，尚无整板制造DRC PASS。
- **软件与飞行：** 本板ArduPilot hwdef、实板外设、安装方向、台架和飞行验证均未完成。

当前推进按[接手指南](../HANDOFF.md)，未闭合完整技术条件不进入制造放行。
