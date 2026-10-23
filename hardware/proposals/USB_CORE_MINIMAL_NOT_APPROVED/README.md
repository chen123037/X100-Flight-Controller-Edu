# USB 核心供电统一候选：完整原生放置检查点

这是当前继续工作的唯一 USB 布局候选，尚未正式采用、不可投板。直接打开 [KiCad 工程](project/X100_CleanSheet.kicad_pro) 或 [PCB](project/X100_CleanSheet.kicad_pcb)。

2026-10-23，`plant_kicad_v1` 已实际写入并保存 236 个电气器件、240 个 PCB 实体（含四孔、65 个测试点）的完整双面位置。35 个新增器件均已落板；保留原 TAITIEN XJHCELNANF-8M / 120R HSE，采用已批准的 J401 / L101。45×45mm 板框、Ø4mm/30.5mm 安装孔保持。没有覆盖正式 `hardware/X100_V1`；本地正式 57 项 CAD 哈希保持。

## 当前真实结果

| 要求 | 保存后的原生工程结果 |
| --- | --- |
| USB_CORE_ARCHITECTURE_MINIMAL_SET | DEFINED；统一候选，未正式接受 |
| ALL_FOOTPRINTS_WITHIN_45MM | YES；所有安装焊盘受板支承，连接器允许的插卡/壳体外伸单独审核 |
| REAL_BODY_CONFLICTS | 0；全体含测试点、跨面通孔、实际四孔核查 |
| 原生 ERC / schematic parity | 0 / 0；所有焊盘网络与原生 XML 一致 |
| 异网铜间距 <0.20mm / 板边规则失败 | 0 / 0；保持精确 J401 SH/GND 0.30mm 例外，其余规则未降低 |
| IMU/HSE 对面热器件与 MAIN_SW 投影冲突模型 | 0；主 Buck/BOOT 与 IMU 分开 |
| 连接器轴向通道模型阻塞 | 0；完整插拔/插头包络仍待复核 |
| CONNECTOR_ACCESS | PENDING_MECHANICAL_ENVELOPE_REVIEW |
| CRITICAL_ROUTING_SPACE | PENDING |
| FULL_PLACEMENT_READY_FOR_ROUTING | NOT_YET_ACCEPTED |
| tracks / vias / zones | 0 / 0 / 0 |
| PCB_MANUFACTURING_PACKAGE | NOT_READY |

当前 fresh DRC 报告 631 项，未连接报告 499（达到报告上限，不代表真实未连接总数）；原生 courtyard 类 199 条达到类别上限，完整几何计数为 **242 对**。剩余报告为 courtyard/孔进入 courtyard、丝印和文字；没有铜间距、短路、孔铜/板边或阻焊桥类别。不能称为 DRC PASS。

242 对 courtyard 不是 242 对器件实体碰撞。须继续对装配余量逐项处置；目前有 12 对 Fab/焊盘联合包络间距小于 0.20mm，详见原生检查 JSON。尤其 H2/J805 只有 0.03mm 名义壳体—孔边间距，H4/U404 为 0.1515mm，需结合器件公差与安装要求调整/核验。未据“无相交”自动接受装配。工程没有靠缩 courtyard、全局放宽或批量排除获得通过。

## 架构收敛与边界

相对 Stage6 移除 U113/C129 外部复位监督器、U115/C137 冗余使能缓冲及 R512 冗余下拉，净新增由 40 降到 35。H743 LQFP100 内置 POR/PDR/BOR 与原 R203/C212 保留；U114 只驱动传感器 LDO EN。U109 六路 SD IO 隔离保留，另两路用于外部 I2C 本地上拉电源，USB-only 关闭这些外部上拉，不改 MCU 信号引脚；内部气压计仍保留。各 IC 独立局部旁路保留。

USB 限流、源隔离/反向阻断、核心缓升、SD 电源与 IO 隔离、BAT/SD-PG 逻辑、CAN shutdown、独立硬件电源指示均保留。电流预算及软件分阶段启动不是实测 PASS。普通 USB-A→C 与 C→C 支持目标保持，不假设电脑提供 1.5A 或枚举前 500mA；软件最小适配、启动/挂起/切换瞬态仍需关闭或纳入首板验证。不得把此候选称为电源安全/USB 合规通过。

## 下一步

完成实际装配/连接器包络及关键走线通道审查，必要时只做同一工程内的局部位置修复；布局被接受后，依次主电源 → 3V3 → HSE → USB → IMU → SDMMC → CAN → 其余 → GND。保持连续 In1 GND、标准贯通过孔、禁止 via-in-pad，不复用阻碍全局布局的旧局部铜线。

证据：[保存后几何/身份/网表检查](evidence/PLACEMENT_REVIEW.json)、[ERC](evidence/ERC.json)、[DRC](evidence/DRC.json)、[原生网表](evidence/NET.xml)、[完整候选 BOM](BOM_CANDIDATE.csv)、[CAD 哈希](evidence/CAD_SHA256.json)。BOM 是设计审查清单，不是采购批准。

![保存后原生正反面位置](evidence/PLACEMENT.png)
