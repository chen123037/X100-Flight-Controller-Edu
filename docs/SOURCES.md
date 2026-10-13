# 资料来源（Sources）

不随仓库复制ST/TI/JST/GCT/Molex/JLC第三方PDF。日期为本次公开交接的资料入口/本地冻结记录复核日；未注明重新下载的资料不能视为本节点再次完成器件资格审查。

| 厂家 / Manufacturer | 资料名称 / Document | 型号或范围 | 官方入口 | 访问/复核日期 | 中文用途及证据边界 |
| --- | --- | --- | --- | --- | --- |
| ST | STM32H743 datasheet | STM32H743VIT6 | [Datasheet](https://www.st.com/resource/en/datasheet/stm32h743vi.pdf) | 2026-10-13，冻结资料复核 | MCU身份、封装、电气边界 |
| ST | RM0433 / AN4938 | STM32H743 | [RM0433](https://www.st.com/resource/en/reference_manual/rm0433-stm32h742-stm32h743753-and-stm32h750-value-line-advanced-armbased-32bit-mcus-stmicroelectronics.pdf)；[AN4938](https://www.st.com/resource/en/application_note/an4938-getting-started-with-stm32h743753-hardware-development-stmicroelectronics.pdf) | 2026-10-13，冻结资料复核 | MCU外设/硬件连接参考，非本仓库软件验证 |
| Bosch Sensortec | BMI088 datasheet | BMI088 | [Datasheet](https://www.bosch-sensortec.com/media/boschsensortec/downloads/datasheets/bst-bmi088-ds001.pdf) | 2026-10-13，冻结资料复核 | IMU选定身份与接口/封装 |
| Goertek | SPL06-001 Datasheet V7.0 | SPL06-001 | [Official manufacturer entry](https://www.goertek.com/en/) | 2026-10-13，入口核对及冻结记录复核 | 既有厂家署名V7.0输入用于冻结设计，但原厂可追溯性限制仍待闭合；公司首页不是已核实PDF |
| TI | TPS54360B datasheet | TPS54360BDDAR | [Datasheet](https://www.ti.com/lit/ds/symlink/tps54360b.pdf) | 2026-10-13，冻结资料复核 | 主5V buck器件身份与功率架构 |
| TI | TPS7A20 / TPS2553 | TPS7A2033PDBVR / TPS2553DBVR | [TPS7A20](https://www.ti.com/lit/ds/symlink/tps7a20.pdf)；[TPS2553](https://www.ti.com/lit/ds/symlink/tps2553.pdf) | 2026-10-13，冻结资料复核 | sensor LDO、外部5V限流 |
| Diodes | AP63200/01/03/05 | AP63203WU-7 | [Datasheet](https://www.diodes.com/assets/Datasheets/AP63200-AP63201-AP63203-AP63205.pdf) | 2026-10-13，冻结资料复核 | 后级3V3 buck |
| TI | TPD2E2U06-Q1 datasheet | TPD2E2U06QDBZRQ1 | [Datasheet](https://www.ti.com/lit/ds/symlink/tpd2e2u06-q1.pdf) | 2026-10-13，冻结ECO记录复核 | DP/DM、VBUS、CC ESD安全ECO身份；不宣称bench已通过 |
| TI | TCAN3414 datasheet | TCAN3414DR | [Datasheet](https://www.ti.com/lit/ds/symlink/tcan3414.pdf) | 2026-10-13，冻结资料复核 | CAN transceiver及接口保护边界 |
| JST | GH connector catalog | SM04B-GHS-TB / SM06B-GHS-TB | [Catalog](https://www.jst-mfg.com/product/pdf/eng/eGH.pdf) | 2026-10-13，先前官方图复核记录 | GH官方land、插拔与MP尺寸 |
| GCT | USB4105 product drawing Rev B4 | USB4105-GF-A | [Official drawing](https://gct.co/files/drawings/usb4105.pdf) | 2026-10-13，官方PDF已核查 | USB接触land/NPTH；不能代替板厂对0.1944mm的接受 |
| Molex | 1040310811 product / sales drawing | 1040310811 | [Product](https://www.molex.com/en-us/products/part-detail/1040310811)；[Sales drawing](https://www.molex.com/content/dam/molex/molex-dot-com/products/automated/en-us/salesdrawingpdf/104/104031/1040310811_sd.pdf) | 2026-10-13，identity已核查；sales drawing视觉复核未完成 | 8 contacts/detect/retention身份；land与样品证据仍PENDING |
| JLCPCB | PCB capabilities / impedance calculator | JLC3313 4-layer 1.6mm | [Capabilities](https://jlcpcb.com/capabilities/Capabilities)；[JLC capabilities](https://www.jlc.com/portal/vtechnology.html)；[Official calculator](https://tools.jlc.com/jlcTools/index.html#/impedanceCalculatenew) | 2026-10-12～13 | 冻结制造规则和90Ω width0.1537/gap0.20的名义模型；CAM/TDR未验收 |
| KiCad community | Libraries licence | Derived symbol/footprint collections | [Library licence](https://www.kicad.org/libraries/license/) | 2026-10-13，公开页面核查 | 第三方库的原有许可与设计使用例外 |
| CERN | CERN Open Hardware Licence v2 | P / S decision | [Official overview](https://cern-ohl.web.cern.ch/) | 2026-10-13，公开页面核查 | LICENSE_DECISION的两种分享政策简介 |
| ArduPilot | Development / board porting docs | Software target | [Developer docs](https://ardupilot.org/dev/) | 2026-10-13，目标引用 | 后续软件bring-up方向，不表示X100已完成移植/飞行验证 |

## SPL06-001

既有工程输入保留过Goertek署名V7.0 PDF，但第三方托管来源的原厂可追溯性限制没有因本次公开化而解除。遵照公开资料规则，这份PDF不随仓库分发。staging副本里指向仓库外的Datasheet字段仅改为本SOURCES索引；正式私有工程原字段保持。需要完整技术资料时，应通过原厂或经授权渠道取得该版资料；不能把公司首页当作datasheet技术证据。

## 本轮文档数据来源

功能和接口取自本基线原理图重新导出的fresh netlist，并逐pin与PCB焊盘网络核对；采购表由工程BOM和元件状态派生，规格字段从同一网表读取，机械孔来自PCB。所有硬件与原BOM字节保持冻结。资料入口复核不等于在本轮再次完成器件资格、bench或CAM验收。
