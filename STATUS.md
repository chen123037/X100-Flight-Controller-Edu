# X100 V1 当前状态

更新：2026-10-22，分支 `feature/pcb-fabrication-readiness`。用户已授权清除阻塞并推进布线到可投板；最新明确仅确认 USB-only 功能需求，具体电源架构与器件尚未批准。

| 项目 | 当前正式源事实 |
| --- | --- |
| 原理图 | 原有受控电气源保持，201 个电气器件；USB-only 尚未实现 |
| PCB | 201 个电气封装 + H1–H4；45×45mm、30.5mm 孔距、Ø4 NPTH |
| J601 | 局部 15 个器件/测试点重排已由 plant_kicad_v1 实施；原 3 条孔/板边阻塞关闭 |
| J401 | 原 USB4105-GF-A 的 4 条孔铜报告仍在；Amphenol候选验证HOLD：1.6mm适配未闭合；对齐官方板边后新增2条铜边距错误 |
| 原生 DRC | 635 violations + 405 unconnected；原始检查为 644 + 405 |
| Tracks / vias / zones | 0 / 0 / 0，正式布线尚未开始 |
| 几何审查 | 既定 Fab/pad/PTH/孔模型内硬实体冲突计数 0；不等于完整三维装机验证 |
| USB-only 功能 | MCU 枚举/刷写/参数必须；BMI088/SPL06 尽可能支持；microSD 不强制且不得干扰核心 |
| 电源候选 | 隔离研究稿 ERC0/0；启动电流/浪涌/SD支路/固件适配尚未闭合，未推广 |
| ROUTING_PRECONDITIONS_MET | NO |
| FABRICATION_READY / MANUFACTURING_RELEASE | NO / NO |
| BENCH / FLIGHT | NOT_VALIDATED / NOT_VALIDATED |

正式 PCB 的所有焊盘网络、封装身份、symbol path/UUID、板框、叠层/setup 与规则保持；只修改局部位置/朝向/面。见 [逐项读回](docs/J601_PLACEMENT_READBACK.json) 和 [DRC 分类](docs/PCB_READINESS_CHECK.json)。

[J401 可打开的 connector-only 候选](hardware/proposals/J401_AMPHENOL_UNAPPROVED/README.md) 与正式源分开；该候选ERC0/0、引脚网络保持，但[完整机械/制造验证未通过](hardware/proposals/J401_AMPHENOL_UNAPPROVED/VALIDATION.md)，已按用户要求暂停。原姿态DRC629+411；隔离副本对齐官方板边后631+411。[USB 需求与 ArduPilot/电流审查](docs/USB_CORE_POWER_REVIEW.md) 说明 microSD 不必提升为 USB-only 必需负载，也列出电源研究稿尚不能接受的原因。

远端检查未发现 2026-10-14 可读性提交之后的学弟学妹更新；本分支是本次主动推进，不代表他们已更新或审核。microSD 样品、底面净空、连接器插拔、完整丝印/courtyard、台架反灌与切换仍须后续验证。
