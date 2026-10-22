# USB-only Stage6 合并候选：未批准、未布线、不可下单

在Stage5基础上组合已分别验证但未正式批准的[Y201晶体](../Y201_YXC_5032_NOT_APPROVED/README.md)与[L101电感](../L101_BOURNS_SRP1038A_NOT_APPROVED/README.md)，并将C121/C127的2×82µF合并为C121=180µF。复用C108已选Panasonic16SVPF180M/CP_C6，不引入额外电容型号；C127移除。此处只是隔离候选，既有器件待裁决项保持，没有覆盖正式工程，也不重新申请J401同型号批准。

实际保存的工程为241个电气器件+4孔。fresh原生ERC0错误/0警告、schematic parity0；逐焊盘网络/Value/封装/UUID路径同步检查一致。Stage5除移除C127外的既有引脚网络全部保持。原Stage5父工程59项CAD和正式工程55项CAD哈希未变。新候选的40个新增封装仍未完成放置，tracks/vias/zones=0/0/0；原生DRC报告1527条+453 unconnected，多个类别触及报告数量上限，绝不是DRC通过。

## 电容缩减的依据与边界

- 原2×82µF：容差计算最小131.2µF；新180µF：容差计算144～216µF。这不是全寿命/温度保证容量。原厂C6与既有CP_C6封装复用，占位由110.5802降至79.6101mm²，减少30.9701mm²。
- 原两颗100kHz ESR并联约13.5mΩ，新器件22mΩ，ESR及总纹波额定值较原并联方案有取舍。0.45A/8µs灵敏度计算的新电容+ESR压降约34.9mV；8µs仅为TI典型切换时间，没有最大切换时间保证。50/200µs表格是工程假设，不能冒充保证值。
- TI反向阻断章节建议输出钳位或约100µF大容量；144µF容差下界保留这一工程建议。电容仍在TPS2116输出、U107之前，未将216µF接到U107直接QOD放电端。其余1µF/100nF及U107下游C111继续保留。
- 新电容额定电压条件下最大漏电576µA，原两颗合计524µA。预算另加0.576mA保守漏电预留，原0.5mA上游预留保留；初始浪涌不由稳态漏电规格限定。理想仅充电、50mA/5V时216µF需21.6ms，不能据此证明实际Buck启动。

来源：[TPS2116 RevA](https://www.ti.com/lit/ds/symlink/tps2116.pdf)、[Panasonic16SVPF180M](https://industrial.panasonic.com/ww/products/pt/os-con/models/16SVPF180M)、[16SVPF82M](https://industrial.panasonic.com/ww/products/pt/os-con/models/16SVPF82M)。完整参数及估算分类见[BULK_PARAMETER_SCREEN.json](BULK_PARAMETER_SCREEN.json)和[CURRENT_BUDGET.json](CURRENT_BUDGET.json)。预配置最大电流失败案例仍保留；2.5mA挂起、枚举和源切换未资格验证。

## SD 软件核查与布局

源码追踪见[SD_FIRMWARE_SCOPE.md](SD_FIRMWARE_SCOPE.md)。没有确认“ArduPilot必须靠SD才能启动/存参数”；必须在最终X100构建中选用独立Flash参数存储并验证无卡启动。默认SDMMC上拉、文件系统重试和源切换瞬间的IO状态使得仅跳过首次SD初始化不足以取代硬件隔离，因此本轮保留U109及PG/OE保护。

大器件及配套去耦正在联合试排。单独大器件可放入并不代表配套阻容、测试点、关键回路和布线已可行；违背USB保护位置、占用MCU Buck去耦空间或剩余器件无位置的试排均未执行。不得将求解器FEASIBLE当作整板PASS或把局部失败当作45mm全局无解。最新模型联合47个器件/配套电容可行，但余下129个小器件在每件最多600个选项的离散模型中无可接受解；全部试排均未应用到CAD，见PLACEMENT_REJECTED.json。该结果不证明完整45mm布局无解。

当前不具备实板条件，不额外购买开发板，不以缺实测暂停PCB设计。启动、浪涌、枚举、刷写、挂起/恢复、两源切换、反灌和SD时序列入[首板计划](../../../docs/FIRST_BOARD_USB_BRINGUP.md)。真实超规格或不可制造问题仍须排除，无法验证的功能项保持NOT_TESTED。

`PCB_MANUFACTURING_PACKAGE=NOT_READY`；`POWER_SAFETY_REVIEW=NOT_COMPLETE`。后续完成布局、供电候选裁决/集成、全部routing/铺铜和制造检查后，再生成供人工验收的正式制造包。禁止付款或实际下单。
