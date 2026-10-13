# X100-Flight-Controller

Open Teaching Flight Controller Hardware  
STM32H743 / ArduPilot / 4-Layer

> **CURRENT STATUS: PRE-ROUTING / WORK IN PROGRESS**  
> **DO NOT FABRICATE THIS REVISION.**  
> **NOT FLIGHT VALIDATED.**  
> Manufacturing release: **NO**. Fabrication ready: **NO**.

X100 是用于飞控硬件课程与学生交接的四层飞控设计。当前保留人工接受的 `X100_V1_PRE_ROUTING_TEACHING_BASELINE`，来源为 `PCB02C2_BLOCKER_CHECKPOINT`。软件目标是 ArduPilot，当前仓库未提供已验证的飞行固件。

硬件包括 STM32H743VIT6、BMI088、SPL06-001、microSD / SDMMC1 4-bit、USB-C、CAN、PWM、UART、I2C、ADC 与调试接口。PCB 为 45×45 mm，安装孔距 30.5×30.5 mm，四层，目标嘉立创 JLC3313 / 1.6 mm，采用选择性双面装配。

201/201 电气 footprints 已放置，另有 H1–H4 四个 Ø4 NPTH。正式 tracks/vias/zones 均为 0。ERC 为 0 error / 0 warning；两个制造类别仍有 7 条真实 pre-routing DRC 问题：J601 3 条、J401 4 条。全板 DRC 尚未通过。

## 从这里开始

1. 读 [当前状态](STATUS.md)、[已知问题](docs/KNOWN_ISSUES.md) 和 [交接步骤](HANDOFF.md)。
2. 用 **KiCad 10.0.6 或兼容的 KiCad 10** 打开 [工程](hardware/X100_V1/X100_CleanSheet.kicad_pro)。安装 KiCad 官方 symbol/footprint/3D 库，项目自定义库随仓库提供。
3. 当前设计冻结用于教学。继续设计需先获得两个局部 blocker 的技术裁决，不重新选型或全局重排。

## 内容

- [统一选型](docs/COMPONENT_SELECTION.md)、[BOM](bom/X100_V1_BOM.csv)、[元件状态](bom/component_status.csv)
- [制造与布线规则](docs/PCB_RULES.md)、[供电架构](docs/POWER_ARCHITECTURE.md)、[双面架构](docs/ARCHITECTURE.md)
- [首电计划](docs/BRINGUP_PLAN.md)、[资料来源](docs/SOURCES.md)、[可移植性](docs/PORTABILITY.md)
- [净化检查与文件清单](docs/PUBLIC_REPO_AUDIT.md)、[许可证待决事项](LICENSE_DECISION.md)

BOM 保留正式原理图的 200 个非排除条目，其中 65 个是 PCB 测试点 feature，135 个是装配组件条目；不能把测试点代码当作采购 MPN。JP601 是默认 OPEN、NO PASTE 的焊桥，原理图已排除其独立 BOM 零件。

![PCB TOP](images/pcb_top.png)

![PCB BOTTOM](images/pcb_bottom.png)

最终自有硬件许可证尚待人工选择。第三方库适用其原有条款，见 [Third-party notices](docs/THIRD_PARTY_NOTICES.md)。
