# 功能设计清单（Feature List）

依据本基线原理图重新导出的fresh netlist整理。这里的“功能”表示硬件设计意图，当前没有已验证的整板样机。

- `DESIGNED`：已在冻结原理图中设计。
- `PLACED`：对应封装已放置；不等于电气互连或机械样品验收。
- `ROUTING_NOT_STARTED`：尚未正式布线，tracks/vias/zones=0。
- `BENCH_NOT_VALIDATED` / `FLIGHT_NOT_VALIDATED`：台架/飞行未验证。

## 1. 主控与计算（MCU / Flight-Control Computing）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | 主控与计算 |
| English name | MCU / Flight-Control Computing |
| 主要器件 / Reference | U201 STM32H743VIT6；Y201 XJHCELNANF-8M |
| 功能说明 | 承担传感器读取、接口与后续飞控计算；HSE为8MHz晶体 |
| 外部接口 | 通过USB、SWD及各通信/输出接口访问 |
| 电压域（Voltage Domain） | 3V3_MCU；模拟域MCU_VDDA |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | 本板固件、时钟启动和资源映射待验证；不宣称固定运行频率/飞控闭环通过 |

## 2. 姿态与运动传感（IMU / Motion Sensing）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | 姿态与运动传感 |
| English name | IMU / Motion Sensing |
| 主要器件 / Reference | U301 BMI088 |
| 功能说明 | 加速度计与陀螺仪；SPI1共用时钟/数据、独立ACC/GYRO片选 |
| 外部接口 | 无独立外部IMU连接器，板内SPI1 |
| 电压域（Voltage Domain） | 3V3_SENSOR供电/逻辑 |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | 单IMU；安装轴向、噪声/振动和实板读数待验证 |

## 3. 气压高度感知（Barometer / Pressure Sensing）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | 气压高度感知 |
| English name | Barometer / Pressure Sensing |
| 主要器件 / Reference | U302 SPL06-001 |
| 功能说明 | 板内BARO_I2C2_SCL/SDA读取气压，用于后续高度估计 |
| 外部接口 | 无独立外部气压接口，板内I2C2 |
| 电压域（Voltage Domain） | 3V3_SENSOR |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | 单气压计；压力口处理、原厂资料可追溯性和实板读数待验证 |

## 4. 数据存储（microSD / SDMMC Storage）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | 数据存储 |
| English name | microSD / SDMMC Storage |
| 主要器件 / Reference | J501 Molex 1040310811；R501及总线上拉 |
| 功能说明 | SDMMC1四位总线，后续用于日志/数据存储 |
| 外部接口 | J501 microSD卡座 |
| 电压域（Voltage Domain） | 3V3_SD，由3V3_MCU经R501分支 |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | 8个卡接触点＋2个detect接触点；detect 9/10明确NC，不宣称卡检测功能已启用；样品机械待核验 |

## 5. USB接口（USB FS Interface）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | USB接口 |
| English name | USB FS Interface |
| 主要器件 / Reference | J401 USB4105-GF-A；U401/U403/U404；U402 |
| 功能说明 | USB_DP/USB_DM数据通信；独立VBUS检测、数据/VBUS/CC ESD保护 |
| 外部接口 | J401 USB-C |
| 电压域（Voltage Domain） | 数据为USB FS电气域；USB_VBUS_RAW为外部5V检测域 |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | 当前baseline的USB_BUS_POWER=DISABLED_FOR_V1；USB-only core power=NOT IMPLEMENTED，新V1 requirement=REQUIRED；已知host backfeed topology ECO=DESIGNED / STATIC TOPOLOGY CLOSED；无bench PASS；J401仍有4条阻塞 |

## 6. CAN总线（CAN Bus）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | CAN总线 |
| English name | CAN Bus |
| 主要器件 / Reference | U601 TCAN3414DR；J601；R602；JP601 |
| 功能说明 | CAN_TX/RX逻辑转CANH/CANL；120Ω终端由焊桥选择 |
| 外部接口 | J601 GH4 |
| 电压域（Voltage Domain） | U601=3V3_MCU；CANH/CANL为差分总线；EXT_5V外设电源 |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | JP601默认OPEN，焊接闭合才启用120Ω；仅按总线端点需要启用；J601仍有3条阻塞；整板IEC未验证 |

## 7. UART串口（UART Serial Interfaces）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | UART串口 |
| English name | UART Serial Interfaces |
| 主要器件 / Reference | U201；J701/J702/J703 |
| 功能说明 | GPS、TELEM、RC三个用途的UART收发连接 |
| 外部接口 | J701 GPS；J702 TELEM；J703 RC |
| 电压域（Voltage Domain） | 3V3_MCU逻辑；EXT_5V仅供外设 |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | 连接对象是用途名称；外设/协议/固件配置未冻结，不宣称RS232、5V逻辑或额外反相器 |

## 8. I2C接口（External I2C）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | I2C接口 |
| English name | External I2C |
| 主要器件 / Reference | J701 pins4/5；J704；R701/R702 |
| 功能说明 | 同一EXT_I2C1总线在两接口引出，上拉到3V3_MCU |
| 外部接口 | J701共用口及J704独立口 |
| 电压域（Voltage Domain） | 3.3V开漏信号；EXT_5V供外设 |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | 不是两个独立I2C控制器；地址、线长和外设上拉兼容性待验证 |

## 9. PWM输出（PWM Signal Outputs）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | PWM输出 |
| English name | PWM Signal Outputs |
| 主要器件 / Reference | U201；J801–J806 |
| 功能说明 | OUT1–OUT6共六路信号输出 |
| 外部接口 | 每路2pin：信号＋GND |
| 电压域（Voltage Domain） | 3V3_MCU逻辑 |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | 无舵机/ESC供电脚；PWM时序和ESC输入兼容性待台架，协议不预先宣称已验证 |

## 10. ADC模拟采集（ADC Monitoring）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | ADC模拟采集 |
| English name | ADC Monitoring |
| 主要器件 / Reference | J808；J809；U801 TMUX1511PWR及R/C网络 |
| 功能说明 | 板内VBAT分压到VBAT_ADC；外部CURRENT_IN_RAW到CURRENT_ADC，含掉电隔离 |
| 外部接口 | J808电池输入；J809 pin3电流传感模拟电压输入 |
| 电压域（Voltage Domain） | J808=3S–6S；CURRENT正常0～5V共地；MCU侧为3.3V模拟域 |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | J809无5V电源脚、无动力电流测量导体；实际电流传感模块和比例/offset待选定校准；0～6V有限DC故障合同不等于允许误接VBAT |

## 11. 调试与SWD（SWD Debug）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | 调试与SWD |
| English name | SWD Debug |
| 主要器件 / Reference | J807；U201；NRST/BOOT0测试点 |
| 功能说明 | SWDIO、SWCLK、NRST用于后续下载与调试 |
| 外部接口 | J807 5pin插针；测试点 |
| 电压域（Voltage Domain） | 3V3_MCU |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | pin1为目标电压参考，不是给本板供电入口；MCO1_DIAG_RESERVED仅板内测试保留 |

## 12. 电源输入与电源管理（Power Input and Management）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | 电源输入与电源管理 |
| English name | Power Input and Management |
| 主要器件 / Reference | J808/F101/Q101/D102；U101/D103/L101；U102/U103/U104/F102 |
| 功能说明 | 从飞控低功率支路生成5V_MAIN、3V3_MCU、3V3_SENSOR、3V3_SD及EXT_5V |
| 外部接口 | J808输入；J601/J701/J702/J703/J704外设供电 |
| 电压域（Voltage Domain） | 3S–6S输入；5V及3.3V分轨 |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | EXT_5V所有接口共享1A设计总预算，非每口1A保证；电源热态/瞬态待验证；动力电流不能经过PCB |

## 13. 状态指示（Status Indicators）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | 状态指示 |
| English name | Status Indicators |
| 主要器件 / Reference | D201/D202 LTST-C170GKT；R206/R207 |
| 功能说明 | D201由MCU状态信号驱动；D202直接指示3V3_MCU存在 |
| 外部接口 | 板载绿色LED，无外部插口 |
| 电压域（Voltage Domain） | 3V3_MCU |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | D201含义由软件定义；D202亮不等于电源合格、固件正常或可飞行 |

## 14. 测试点与维护功能（Test Points and Maintenance）

| 字段 | 说明 |
| --- | --- |
| 中文功能名称 | 测试点与维护功能 |
| English name | Test Points and Maintenance |
| 主要器件 / Reference | 65个TP；JP601；NRST/BOOT0测试节点 |
| 功能说明 | 测量电源、关键总线、模拟节点和调试信号；焊桥调整CAN终端 |
| 外部接口 | 裸露PCB测试点，完整索引见下表 |
| 电压域（Voltage Domain） | 各TP继承所连Net的电压域，不是统一3.3V |
| 当前设计状态 | DESIGNED；PLACED；ROUTING_NOT_STARTED |
| 验证状态 | BENCH_NOT_VALIDATED；FLIGHT_NOT_VALIDATED |
| 备注 | TP及焊桥不独立采购、无锡膏；先查网名和探头接地，不能把VBAT/MAIN_SW当GPIO |

## 新增V1要求：USB独立核心供电（USB-only Core Power）

**当前公开baseline中，USB-only尚不能启动飞控核心。这是KNOWN DESIGN LIMITATION，不是最终X100 V1预期行为。** 当前USB-C为self-powered/data-only，USB_VBUS_RAW没有向5V_MAIN、3V3_MCU或3V3_SENSOR提供预定运行电源；没有VBAT/J808独立供电时，STM32H743不能按设计正常启动。不得把当前baseline直接当作最终USB供电方案。

人工新裁决：`USB_ONLY_CORE_POWER_SUPPORT=REQUIRED_FOR_V1`。未来必须仅插电脑USB、无VBAT即可完成MCU启动、USB设备枚举、DFU/bootloader/firmware flashing、ArduPilot刷写、地面站连接与参数配置、基础桌面调试及SWD/USB必要核心逻辑运行。**这些是需求，不是当前能力或已测试结果。**

推荐支持BMI088/SPL06-001核心传感器，但3V3_SENSOR完整域、microSD/3V3_SD是否一起供电必须由后续ECO的电流预算和供电架构裁决，本轮不假定。USB只用于CORE LOGIC / BENCH DEBUG POWER，不供ESC推进、电机、舵机、外部高电流5V、EXT_SWITCH_OUT大负载或其它动力负载。

`USB_ONLY_CORE_POWER_CURRENT_IMPLEMENTATION=NOT_IMPLEMENTED`；`USB_ONLY_CORE_POWER_V1_REQUIREMENT=REQUIRED`；`USB_POWER_ECO_REQUIRED_BEFORE_PCB03=YES`。这是功能/电源架构阻塞，独立于J601/J401共7条制造DRC。两处制造问题即使关闭，也必须先完成独立`USB_ONLY_CORE_POWER_ECO`并通过技术裁决，才能批准PCB03。接手顺序见[HANDOFF](../HANDOFF.md)，详细边界见[电源架构](POWER_ARCHITECTURE.md)。

### USB功能状态必须分开

| 项目 | 当前状态 |
| --- | --- |
| USB data interface | DESIGNED |
| USB host backfeed topology ECO | DESIGNED / STATIC TOPOLOGY CLOSED |
| USB-only core power | NOT_IMPLEMENTED |
| V1 requirement | REQUIRED |

## 功能成熟度矩阵

| 功能 | 设计 | 原理图 | Placement | Routing | Bench | Flight |
| --- | --- | --- | --- | --- | --- | --- |
| 主控与计算 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| 姿态与运动传感 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| 气压高度感知 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| 数据存储 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| USB接口 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| CAN总线 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| UART串口 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| I2C接口 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| PWM输出 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| ADC模拟采集 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| 调试与SWD | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| 电源输入与电源管理 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| 状态指示 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| 测试点与维护功能 | DESIGNED | POST-ECO FROZEN | PLACED | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |
| USB-only核心供电（新增V1需求） | NOT IMPLEMENTED / REQUIRED | 后续最小ECO未执行 | 未实现，无新增placement | ROUTING_NOT_STARTED | BENCH_NOT_VALIDATED | FLIGHT_NOT_VALIDATED |

## 测试点索引

编号、网名均来自fresh netlist；下表只描述实际存在的PCB铜测试feature，不增加测试点或更改网络。

| Reference | Net | 模块 |
| --- | --- | --- |
| TP101 | VBAT_RAW | 电源管理模块 |
| TP102 | VBAT_FUSED | 电源管理模块 |
| TP103 | VBAT_PROTECTED | 电源管理模块 |
| TP104 | 5V_MAIN | 电源管理模块 |
| TP105 | 3V3_MCU | 电源管理模块 |
| TP106 | SENSOR_LDO_IN | 电源管理模块 |
| TP107 | 3V3_SENSOR | 电源管理模块 |
| TP108 | EXT_SWITCH_OUT | 电源管理模块 |
| TP109 | EXT_5V | 电源管理模块 |
| TP110 | EXT_FAULT | 电源管理模块 |
| TP111 | GND | 电源管理模块 |
| TP201 | NRST | 主控与时钟模块 |
| TP202 | BOOT0 | 主控与时钟模块 |
| TP203 | 3V3_MCU | 主控与时钟模块 |
| TP204 | MCU_VDDA | 主控与时钟模块 |
| TP205 | VCAP1 | 主控与时钟模块 |
| TP206 | VCAP2 | 主控与时钟模块 |
| TP207 | MCO1_DIAG_RESERVED | 主控与时钟模块 |
| TP208 | GND | 主控与时钟模块 |
| TP301 | 3V3_SENSOR | 传感器模块 |
| TP302 | SPI1_SCK | 传感器模块 |
| TP303 | SPI1_MOSI | 传感器模块 |
| TP304 | SPI1_MISO | 传感器模块 |
| TP305 | BMI088_ACC_CS | 传感器模块 |
| TP306 | BMI088_GYRO_CS | 传感器模块 |
| TP307 | BARO_I2C2_SCL | 传感器模块 |
| TP308 | BARO_I2C2_SDA | 传感器模块 |
| TP309 | GND | 传感器模块 |
| TP401 | USB_VBUS_RAW | USB通信与保护模块 |
| TP402 | USB_VBUS_SENSE | USB通信与保护模块 |
| TP403 | USB_DP | USB通信与保护模块 |
| TP404 | USB_DM | USB通信与保护模块 |
| TP405 | GND | USB通信与保护模块 |
| TP501 | 3V3_SD | microSD数据存储模块 |
| TP502 | SDMMC1_CK | microSD数据存储模块 |
| TP503 | SDMMC1_CMD | microSD数据存储模块 |
| TP504 | SDMMC1_D0 | microSD数据存储模块 |
| TP505 | SDMMC1_D1 | microSD数据存储模块 |
| TP506 | SDMMC1_D2 | microSD数据存储模块 |
| TP507 | SDMMC1_D3 | microSD数据存储模块 |
| TP508 | GND | microSD数据存储模块 |
| TP601 | CAN_TX | CAN通信模块 |
| TP602 | CAN_RX | CAN通信模块 |
| TP603 | CANH | CAN通信模块 |
| TP604 | CANL | CAN通信模块 |
| TP605 | GND | CAN通信模块 |
| TP701 | GPS_TX | 串口与通用IO模块 |
| TP702 | GPS_RX | 串口与通用IO模块 |
| TP703 | TELEM_TX | 串口与通用IO模块 |
| TP704 | TELEM_RX | 串口与通用IO模块 |
| TP705 | RC_TX | 串口与通用IO模块 |
| TP706 | RC_RX | 串口与通用IO模块 |
| TP707 | EXT_I2C1_SCL | 串口与通用IO模块 |
| TP708 | EXT_I2C1_SDA | 串口与通用IO模块 |
| TP709 | EXT_5V | 串口与通用IO模块 |
| TP710 | GND | 串口与通用IO模块 |
| TP801 | VBAT_DIV | PWM、ADC与调试模块 |
| TP802 | VBAT_ADC_PRE_PROTECTION | PWM、ADC与调试模块 |
| TP803 | VBAT_ADC | PWM、ADC与调试模块 |
| TP804 | CURRENT_IN_RAW | PWM、ADC与调试模块 |
| TP805 | CURRENT_ADC | PWM、ADC与调试模块 |
| TP806 | SWDIO | PWM、ADC与调试模块 |
| TP807 | SWCLK | PWM、ADC与调试模块 |
| TP808 | NRST | PWM、ADC与调试模块 |
| TP809 | GND | PWM、ADC与调试模块 |

接线定义见[接口与引脚表](INTERFACES.md)，原器件数量见[工程BOM](../bom/X100_V1_BOM.csv)，阶段门槛见[路线图](ROADMAP.md)。
