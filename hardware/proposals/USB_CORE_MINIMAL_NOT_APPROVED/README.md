# X100 USB 核心供电统一候选：完整放置与 Ø7 安装预留

当前只在这一个候选继续工作，未覆盖正式 `hardware/X100_V1`，不可投板。打开 [KiCad 工程](project/X100_CleanSheet.kicad_pro) / [PCB](project/X100_CleanSheet.kicad_pcb)。全部 CAD 修改由唯一指定的 `plant_kicad_v1` 完成。

2026-10-23：236 电气器件 /240 PCB 实体全部落板，含四个孔和65个测试点。35个新增器件集合保持；原 TAITIEN XJHCELNANF-8M /120R HSE、已批准 J401/L101、45×45mm 板框与 Ø4mm /30.5mm 安装孔不变。本地正式57项CAD哈希保持。

| 要求 | 保存后原生工程结论 |
| --- | --- |
| USB_CORE_ARCHITECTURE_MINIMAL_SET | DEFINED；统一候选，未正式采用 |
| ALL_FOOTPRINTS_WITHIN_45MM | YES；安装焊盘全部受板支承；标准插卡/插头外伸已另审 |
| REAL_BODY_CONFLICTS | 0；含测试点、跨面通孔和四个实际孔 |
| CONNECTOR_ACCESS | PASS；裸板连接器、轴向路径、标准USB插头/插卡及尼龙垫圈 CAD 几何范围 |
| CRITICAL_ROUTING_SPACE | PENDING；主电源路径预检查通过，其余关键引出尚未闭合 |
| FULL_PLACEMENT_READY_FOR_ROUTING | NOT_YET_ACCEPTED |
| ERC / native schematic parity | 0 /0，逐焊盘网络匹配，器件UUID/path/封装身份保持 |
| 铜间距不足 /孔铜 /板边 /阻焊桥报告 | 0；精确 J401 SH/GND 0.30mm 例外及其余规则保持 |
| tracks / vias / zones | 0 /0 /0；路径预检查不是实际铜线 |
| PCB_MANUFACTURING_PACKAGE | NOT_READY |

## 本轮安装预留已落地

按人工指定的 M3 尼龙螺钉＋尼龙平垫圈，四孔正反面均按最大 Ø7.0mm 接触外径检查。旧布局侵入 H1/H2/H3/H4 分别为9/8/8/14处，共39处；当前 **39→0**。所有器件 Fab/焊盘和裸测试点距该包络至少 **0.10mm 名义余量**。没有移动孔、扩大板框或缩小元件封装。各处旧位置、侵入量、现位置及余量见 [39处修复表](evidence/MOUNTING7_RESOLUTION.csv)。

重排包括：顶部 CAN/GPS/PWM 接口与 CAN/HSE 区、ADC隔离开关及配套RC、底部输入/TVS/SD/USB和电源辅助器件。USB座与卡座共同左移，面别/插入方向保持正确。为主 Buck 的实际 SW 引出，将 HSE 负载电容C214放到正面并调整旁边NRST电容与bootstrap局部位置；电路与型号不变。

除去不装元件的探测焊盘/孔，所有同面 Fab 壳体最小间距为 **0.20mm**，实体/跨面通孔冲突均0。这里是保存后名义几何，未把它升级为统计装配公差、样品焊接或整机振动/保持力测试通过。用户未冻结的螺钉长度/柱高和具体机架不在本次结论范围；绝缘支撑板＋减振泡棉、防脱措施的安装方向保留。

## 连接器空间

轴向路径阻塞0；标准USB插头外模包络按 **12.85×7.0mm** 核对，插入的microSD与其平面间距为 **0.57mm**。采用 [USB-IF官方R2.4源包](https://usb.org/sites/default/files/usb_type-c_2.4_release_202410.zip) 中 Figure3-12、p66，已查看原图；没有把旧12.35×6.5mm范围当作当前最大值。来源PDF哈希及范围见 [连接器几何检查](evidence/CONNECTOR_REVIEW.json)。这是CAD装配范围，非USB认证或实物线缆测试。

## 实际尚未完成

Fresh native DRC 报告 **619项**、未连接499项达到报告上限；courtyard类别199条达到类别上限，完整几何计数为 **286对**。当前剩余为courtyard/丝印/文字。courtyard重叠不是器件本体相交；壳体≥0.20mm、异网焊盘≥0.20mm、安装接触区清空已分别检查，但庭院装配余量及制造前最终处置仍需完成。没有缩courtyard、降全局规则或批量排除报告。

主电源SW/BOOT/VIN/5V输出与COMP网络已有逐段宽度、两颗标准贯通孔的 [几何可行路径](evidence/POWER_PATH_PROBE.json)，与当前原生板哈希绑定；这些未写入铜线，也不是电流/热/回流安全通过。3V3/core桥接、HSE、USB、IMU、SDMMC、CAN、ADC等完整关键引出仍待核对，随后才接受整板布局并执行正式布线。

USB-only继续要求普通A→C和C→C、枚举前电流限制及最小软件分阶段启动；启动/挂起/切换、电流/热/故障、最终DFM仍未PASS。BOM是设计审查清单，不是采购批准。本候选未正式集成、不采购、不付款、不实际下单。

证据：[原生放置/身份检查](evidence/PLACEMENT_REVIEW.json)、[ERC](evidence/ERC.json)、[DRC](evidence/DRC.json)、[原生网表](evidence/NET.xml)、[完整候选BOM](BOM_CANDIDATE.csv)、[CAD哈希](evidence/CAD_SHA256.json)。

![保存后原生正反面位置；红圈为Ø7接触区](evidence/PLACEMENT.png)
