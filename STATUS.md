# X100 V1 当前状态（Project Status）

记录日期：2026-10-13。当前为**布线前教学基线**：`X100_V1_PRE_ROUTING_TEACHING_BASELINE`，来源为`PCB02C2_BLOCKER_CHECKPOINT`。

| 项目 | 当前事实 / 状态 |
| --- | --- |
| 原理图（Schematic） | POST-ECO FROZEN：受控ECO后冻结 |
| 电气封装（Electrical footprints） | 201 |
| 器件放置（Placement） | 201/201 COMPLETE |
| PCB板框 | 45×45 mm，XY边界77.5…122.5 mm |
| 安装孔（Mounting） | H1–H4，Ø4 NPTH，30.5×30.5 mm孔距 |
| 装配架构 | 选择性双面装配（double-side selective） |
| 正式布线（Routing） | NOT STARTED |
| 走线 / 过孔 / 铺铜（Tracks / Vias / Zones） | 0 / 0 / 0 |
| 电气规则检查（ERC） | 0 error / 0 warning |
| 当前真实制造阻塞 | J601/J401两类 / 7条DRC |
| PRE_ROUTING_FUNCTIONAL_BLOCKER | USB_ONLY_CORE_POWER_SUPPORT=NOT_IMPLEMENTED |
| USB_ONLY_CORE_POWER_V1_REQUIREMENT | REQUIRED / REQUIRED_FOR_V1 |
| USB_POWER_ECO_REQUIRED_BEFORE_PCB03 | YES |
| J601 | 3条：2处板边铜距＋1处H1孔铜距 |
| J401 | 4条逻辑报告，对应2个物理位置 |
| 实际装配实体冲突 | 0，仅限已核查的Fab/pad/PTH/孔几何范围 |
| 库封装不一致 | 0 |
| PCB02C2_PARTIAL_PASS | YES；局部部分通过，不能当作全板通过 |
| PCB03_FORMAL_ROUTING_READY | NO |
| ROUTING_PRECONDITIONS_MET | NO |
| 制造放行（MANUFACTURING_RELEASE） | NO |
| 可投板（FABRICATION_READY） | NO |
| 台架验证 | BENCH_NOT_VALIDATED |
| 飞行验证 | NOT STARTED / FLIGHT_NOT_VALIDATED |

最后基线原生DRC为 **644 violations＋405 unconnected**。405条未连接与尚未布线有关；644项中还包含丝印、装配边界等报告。这里列出的7条是当前真实制造阻塞，不能用7替代原生DRC总数，也不能把它们排除后宣称整板PASS。本轮隔离副本fresh ERC仍为0/0，硬件文件没有改变。USB-only新需求不会凭空增加原生DRC报告数，不能由ERC0/0证明功能满足。

microSD的10条板边问题已关闭，保留已接受的位置；J501的官方land证据重新实证、样品机械核验及装机插卡访问仍为`PENDING_SAMPLE_VERIFICATION`。底面净空、USB反灌/热插拔、TVS、启动过冲和温升均待实测。后续入口见[接手指南](HANDOFF.md)与[已知问题](docs/KNOWN_ISSUES.md)。

## 新增V1要求：USB独立核心供电（USB-only Core Power）

**当前公开baseline中，USB-only尚不能启动飞控核心。这是KNOWN DESIGN LIMITATION，不是最终X100 V1预期行为。** 当前USB-C为self-powered/data-only，USB_VBUS_RAW没有向5V_MAIN、3V3_MCU或3V3_SENSOR提供预定运行电源；没有VBAT/J808独立供电时，STM32H743不能按设计正常启动。不得把当前baseline直接当作最终USB供电方案。

人工新裁决：`USB_ONLY_CORE_POWER_SUPPORT=REQUIRED_FOR_V1`。未来必须仅插电脑USB、无VBAT即可完成MCU启动、USB设备枚举、DFU/bootloader/firmware flashing、ArduPilot刷写、地面站连接与参数配置、基础桌面调试及SWD/USB必要核心逻辑运行。**这些是需求，不是当前能力或已测试结果。**

推荐支持BMI088/SPL06-001核心传感器，但3V3_SENSOR完整域、microSD/3V3_SD是否一起供电必须由后续ECO的电流预算和供电架构裁决，本轮不假定。USB只用于CORE LOGIC / BENCH DEBUG POWER，不供ESC推进、电机、舵机、外部高电流5V、EXT_SWITCH_OUT大负载或其它动力负载。

`USB_ONLY_CORE_POWER_CURRENT_IMPLEMENTATION=NOT_IMPLEMENTED`；`USB_ONLY_CORE_POWER_V1_REQUIREMENT=REQUIRED`；`USB_POWER_ECO_REQUIRED_BEFORE_PCB03=YES`。这是功能/电源架构阻塞，独立于J601/J401共7条制造DRC。两处制造问题即使关闭，也必须先完成独立`USB_ONLY_CORE_POWER_ECO`并通过技术裁决，才能批准PCB03。接手顺序见[接手指南](HANDOFF.md)，详细边界见[电源架构](docs/POWER_ARCHITECTURE.md)。
