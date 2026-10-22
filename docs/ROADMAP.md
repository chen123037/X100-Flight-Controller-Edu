# X100 V1 后续开发路线图
## Development Roadmap

当前处于**布线前：STAGE USB-PWR与Stage 0门槛均未关闭**，后续阶段是计划，均未执行。文件存在、placement完成或模型通过不能替代阶段验收。2026-10-22已授权清障并推进布线到可投板；具体电源架构与新器件仍待裁决，技术前置条件保持。

## STAGE USB-PWR：USB独立核心供电设计（USB-only Core Power ECO）

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | current pre-routing baseline；新增USB-only V1需求已明确，但当前NOT_IMPLEMENTED；单独启动并批准ECO范围 |
| 主要工作（MAIN WORK） | define powered rails / not-powered rails；分状态current budget；power-path architecture；reverse blocking；dual-source sequencing；exact component selection；minimal schematic ECO；placement impact；safety review |
| 完成条件（EXIT CONDITION） | USB_ONLY_CORE_POWER_ARCHITECTURE=PASS；USB_HOST_BACKFEED_REVIEW=PASS；USB_CURRENT_BUDGET=PASS；ERC=PASS；PRE_ROUTING_POWER_ARCHITECTURE=PASS；新网表/BOM/rail清单/检查证据固化 |

此处PASS是未来ECO设计审查门槛，不代表当前实现或实板验收；状态A–G与host-off测试仍须在样机上完成。Stage0的制造确认可并行，但Stage1必须等USB-PWR和制造/几何门槛同时闭合。不得直接把USB与主Buck 5V并联；隔离研究稿不等于正式ECO，具体架构/新器件经用户裁决后才能推广。

## Stage 0：关闭布线前阻塞

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 2026-10-22正式源：J6013条和J4014条已关闭；USB电源前置条件未通过 |
| 主要工作（MAIN WORK） | 复核J601已保存的局部结果；复核已正式接受的Amphenol J401与局部SH规则；复核fresh ERC/DRC/几何 |
| 完成条件（EXIT CONDITION） | 原7条真实制造问题全部关闭（2026-10-22：J6013条和J4014条已关闭），规则/板框保持；ECO后数量依新批准基线核对，不能继续假定201；其余报告分类，保存checkpoint并提交人工review |

## Stage 1：PCB03正式布线

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | STAGE USB-PWR与阶段0均完成，技术确认ROUTING_PRECONDITIONS_MET=YES；具体电源架构/新器件已裁决，已有本轮推进布线授权 |
| 主要工作（MAIN WORK） | 按冻结顺序布线功率、时钟、USB、传感/SD/CAN、模拟和IO；每步readback、DRC与checkpoint |
| 完成条件（EXIT CONDITION） | 全部必要网络互连及GND参考/回流实现，未连接闭合，保留阶段验证证据 |

## Stage 2：布线后DRC/回流/SI复核

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 完整布线版本与冻结制造规则已保存 |
| 主要工作（MAIN WORK） | 全板DRC、ERC和网表一致性；USB差分/参考平面、Buck回路、时钟、SD/SPI、CAN支路、ADC回流复核 |
| 完成条件（EXIT CONDITION） | 无未裁决阻塞；例外严格有证据；回流、长度/耦合与信号完整性问题闭合 |

## Stage 3：DFM/机械/丝印/BOM/CPL复核

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 阶段2通过，有可审核的完整PCB |
| 主要工作（MAIN WORK） | 实物核验卡座/接口、高件与机架；丝印极性/pin1；焊桥/压力口/焊膏；BOM/CPL双面对齐 |
| 完成条件（EXIT CONDITION） | DFM、装配净空、关键样品、BOM身份/数量和贴片坐标/旋转/面别审核通过 |

## Stage 4：生成制造包

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 所有设计与DFM门槛完成；人工制造放行 |
| 主要工作（MAIN WORK） | 输出Gerber/钻孔、叠层/阻抗要求、BOM/CPL和装配说明，独立CAM查看并固化版本/校验值 |
| 完成条件（EXIT CONDITION） | 制造包完整可追溯，CAM确认JLC3313及孔铜/阻抗，人工接受投板；不从当前未布线基线下单 |

## Stage 5：PCB打样与贴装

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 制造包接受，采购/替代与许可证事项由负责人处理 |
| 主要工作（MAIN WORK） | 采购exact/同规格件，收料检查、首板制作与受控返修 |
| 完成条件（EXIT CONDITION） | 样板收到，器件/焊接/机械检查合格；有板号及制造批次记录 |

## Stage 6：限流首次上电

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 生产板外观和断电阻值检查通过，测试方案批准 |
| 主要工作（MAIN WORK） | 按Bring-up步骤测VBAT、5V、3V3、过冲、温升与USB反灌；先不接PC |
| 完成条件（EXIT CONDITION） | 电源/瞬态/热态与USB安全门槛通过，异常关闭，记录测试证据 |

## Stage 7：USB/CAN/SD/传感器/IO台架验证

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 首电通过，有受控台架与基本测试固件 |
| 主要工作（MAIN WORK） | 逐模块验证数据、读写、通信、PWM/ADC与掉电；不装桨做接口检查 |
| 完成条件（EXIT CONDITION） | 各接口正常/边界/掉电测试通过，比例/噪声/误差和未闭合问题有记录 |

## Stage 8：ArduPilot hwdef与固件Bring-up

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 硬件资源和关键外设台架事实已确认 |
| 主要工作（MAIN WORK） | 构建本板hwdef、传感器rotation/地址、接口/定时器、存储、ADC比例和故障安全配置 |
| 完成条件（EXIT CONDITION） | 可复现构建、实板启动/传感/日志/输出通过；不等于飞行放行 |

## Stage 9：机架集成

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 硬件/固件台架合格，有明确机架和动力系统 |
| 主要工作（MAIN WORK） | 核验机械净空、方向、线束、电源预算、EMI/振动和去桨动力台架；确认故障安全 |
| 完成条件（EXIT CONDITION） | 集成检查和地面测试通过，风险/试飞方案经人工批准 |

## Stage 10：飞行验证

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 机架/地面门槛通过，明确安全条件与人工试飞放行 |
| 主要工作（MAIN WORK） | 由合格操作者执行分级受控试飞，检查姿态/高度/日志/供电/温升与异常 |
| 完成条件（EXIT CONDITION） | 声明的飞行测试范围通过，有日志、配置、条件和问题闭合证据 |

## Stage 11：X100 V1已验证发布（Validated Release）

| 阶段字段 | 中文说明 |
| --- | --- |
| 进入条件（ENTRY CONDITION） | 阶段0–10在声明范围内验收完成，许可证明确 |
| 主要工作（MAIN WORK） | 冻结硬件/制造/固件/测试版本，发布校验值、兼容边界、测试报告与已知限制 |
| 完成条件（EXIT CONDITION） | 仅对有证据覆盖的硬件/台架/飞行范围标记validated，保留未测边界，不扩大声明 |

制造放行、PCB03布线授权、上电/动力/飞行授权分开；阶段1之前不得自动routing。接手入口见[HANDOFF](../HANDOFF.md)。
