> **当前入口更新：** [六层V4工程、DFM零危险和下单资料](../hardware/current/X100_6L_DFM_ZERO_DANGER/)。本文保留旧阶段背景；涉及层数、孔位、器件/TP数量及进度时，以当前源工程和[STATUS](../STATUS.md)为准。旧的审批约束不用于撤销已经取得的后续人工授权。

# 外部接口与引脚定义
## Interfaces and Pinout

依据本基线fresh schematic/netlist逐pin生成并与PCB焊盘网名核对，覆盖全部16个J连接器/接口。所有方向以飞控为基准：IN为进入飞控，OUT为飞控输出；电源脚、地、信号和NC分别标明。这里只记录当前设计，当前板不可直接制造或带动力测试。新增V1需求要求USB-only核心运行，但尚NOT_IMPLEMENTED；表中“无USB供板”仅是当前baseline事实，后续ECO必须重新导出/核对接口与供电表。

线序以**KiCad焊盘编号和原厂插接图**为准，不用照片中的左/右或线色判断。对插壳体与端子的朝向可能镜像；尚无已验证线束/CPL/装配线序图。接线前逐脚导通检查，不可依据接口名称套用另一块飞控的线序。

## J401：USB-C通信接口（USB-C / USB FS）

**Reference：J401；Connector Type：USB4105-GF-A，16触点＋屏蔽壳。** USB设备通信；VBUS检测，无USB整板供电。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| A1 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |
| A4 | USB_VBUS_RAW | USB主机VBUS检测/保护输入 | USB VBUS，标称5V域 | 输入（IN） | USB主机VBUS | 只接保护与检测，不连接5V_MAIN/3V3供电轨 |
| A5 | USB_CC1 | USB Type-C配置通道 | USB CC配置电气域（Rd到GND） | 配置 / 被动（CONFIG） | USB-C主机/线缆CC | R401/R402的Rd连接与U404 ESD；非5V供电输出，无PD升压设计 |
| A6 | USB_DP | USB数据正线 | USB FS差分数据域 | 双向（BIDIR） | USB主机相应数据线 | 同名A/B触点并到同一网；非TTL通用GPIO |
| A7 | USB_DM | USB数据负线 | USB FS差分数据域 | 双向（BIDIR） | USB主机相应数据线 | 同名A/B触点并到同一网；非TTL通用GPIO |
| A8 | unconnected-(J401-PadA8) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| A9 | USB_VBUS_RAW | USB主机VBUS检测/保护输入 | USB VBUS，标称5V域 | 输入（IN） | USB主机VBUS | 只接保护与检测，不连接5V_MAIN/3V3供电轨 |
| A12 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |
| B1 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |
| B4 | USB_VBUS_RAW | USB主机VBUS检测/保护输入 | USB VBUS，标称5V域 | 输入（IN） | USB主机VBUS | 只接保护与检测，不连接5V_MAIN/3V3供电轨 |
| B5 | USB_CC2 | USB Type-C配置通道 | USB CC配置电气域（Rd到GND） | 配置 / 被动（CONFIG） | USB-C主机/线缆CC | R401/R402的Rd连接与U404 ESD；非5V供电输出，无PD升压设计 |
| B6 | USB_DP | USB数据正线 | USB FS差分数据域 | 双向（BIDIR） | USB主机相应数据线 | 同名A/B触点并到同一网；非TTL通用GPIO |
| B7 | USB_DM | USB数据负线 | USB FS差分数据域 | 双向（BIDIR） | USB主机相应数据线 | 同名A/B触点并到同一网；非TTL通用GPIO |
| B8 | unconnected-(J401-PadB8) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| B9 | USB_VBUS_RAW | USB主机VBUS检测/保护输入 | USB VBUS，标称5V域 | 输入（IN） | USB主机VBUS | 只接保护与检测，不连接5V_MAIN/3V3供电轨 |
| B12 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |
| SH | GND | 屏蔽壳接地 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

SH屏蔽壳在PCB中有四个同名焊盘，全部连接GND；表中SH只列一次。J401另有两个无编号定位NPTH，不是电气pin。

## J501：microSD卡接口（microSD / SDMMC1）

**Reference：J501；Connector Type：1040310811，8卡触点＋2detect＋屏蔽壳。** 四位SDMMC1；detect未连接；样品验证待完成。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | SDMMC1_D2 | 卡数据2 | 3.3V / 3V3_SD信号域 | 双向（BIDIR） | microSD卡对应触点 | 四位SDMMC1；不用于SPI外接卡线序 |
| 2 | SDMMC1_D3 | 卡数据3 | 3.3V / 3V3_SD信号域 | 双向（BIDIR） | microSD卡对应触点 | 四位SDMMC1；不用于SPI外接卡线序 |
| 3 | SDMMC1_CMD | 卡命令 | 3.3V / 3V3_SD信号域 | 双向（BIDIR） | microSD卡对应触点 | 四位SDMMC1；不用于SPI外接卡线序 |
| 4 | 3V3_SD | 存储卡供电 | 3.3V / 3V3_SD | 输出（OUT） | microSD卡VDD | 非外部电源入口 |
| 5 | SDMMC1_CK | 卡时钟 | 3.3V / 3V3_SD信号域 | 输出（OUT） | microSD卡对应触点 | 四位SDMMC1；不用于SPI外接卡线序 |
| 6 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |
| 7 | SDMMC1_D0 | 卡数据0 | 3.3V / 3V3_SD信号域 | 双向（BIDIR） | microSD卡对应触点 | 四位SDMMC1；不用于SPI外接卡线序 |
| 8 | SDMMC1_D1 | 卡数据1 | 3.3V / 3V3_SD信号域 | 双向（BIDIR） | microSD卡对应触点 | 四位SDMMC1；不用于SPI外接卡线序 |
| 10 | unconnected-(J501-DET_A-Pad10) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| 9 | unconnected-(J501-DET_B-Pad9) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| SH | GND | 屏蔽壳接地 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

SH屏蔽壳在PCB中有四个同名焊盘，全部连接GND；表中SH只列一次。

## J601：CAN接口（CAN Bus）

**Reference：J601；Connector Type：SM04B-GHS-TB(LF)(SN)，GH4侧插。** 当前3条制造阻塞；120Ω终端由JP601选择。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | EXT_5V | 受保护外设5V供电 | 5V外设域 | 输出（OUT） | 兼容的低功率外设 | 所有EXT接口共享1A设计总预算；禁反向灌电、禁短接主轨 |
| 2 | CANH | CAN高线 | CAN差分总线域（非3.3V GPIO） | 双向（BIDIR） | 外部CAN节点同名线 | 经U601收发；共地/端点终端配置；不能当UART连接 |
| 3 | CANL | CAN低线 | CAN差分总线域（非3.3V GPIO） | 双向（BIDIR） | 外部CAN节点同名线 | 经U601收发；共地/端点终端配置；不能当UART连接 |
| 4 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

两只MP固定焊盘在PCB中均无电气Net，不是外接针脚，也不能当作GND接线脚。

## J701：GPS串口与共用I2C接口（GPS UART / Shared I2C）

**Reference：J701；Connector Type：SM06B-GHS-TB(LF)(SN)，GH6侧插。** pins4/5与J704是同一I2C1总线。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | EXT_5V | 受保护外设5V供电 | 5V外设域 | 输出（OUT） | 兼容的低功率外设 | 所有EXT接口共享1A设计总预算；禁反向灌电、禁短接主轨 |
| 2 | GPS_TX | 飞控串口发送 | 3.3V逻辑 / 3V3_MCU | 输出（OUT） | 外设RX | TX/RX方向均以飞控为基准；不可直接接RS232电平 |
| 3 | GPS_RX | 飞控串口接收 | 3.3V逻辑 / 3V3_MCU | 输入（IN） | 外设TX | 外设5V电源不代表允许5V UART逻辑 |
| 4 | EXT_I2C1_SCL | I2C时钟 | 3.3V开漏，上拉到3V3_MCU | 双向开漏（BIDIR） | 3.3V兼容I2C外设 | J701/J704同总线；核对地址及外部上拉，禁止上拉到5V |
| 5 | EXT_I2C1_SDA | I2C数据 | 3.3V开漏，上拉到3V3_MCU | 双向开漏（BIDIR） | 3.3V兼容I2C外设 | J701/J704同总线；核对地址及外部上拉，禁止上拉到5V |
| 6 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

两只MP固定焊盘在PCB中均无电气Net，不是外接针脚，也不能当作GND接线脚。

## J702：遥测串口接口（TELEM UART）

**Reference：J702；Connector Type：SM06B-GHS-TB(LF)(SN)，GH6侧插。** pins4/5明确不连接。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | EXT_5V | 受保护外设5V供电 | 5V外设域 | 输出（OUT） | 兼容的低功率外设 | 所有EXT接口共享1A设计总预算；禁反向灌电、禁短接主轨 |
| 2 | TELEM_TX | 飞控串口发送 | 3.3V逻辑 / 3V3_MCU | 输出（OUT） | 外设RX | TX/RX方向均以飞控为基准；不可直接接RS232电平 |
| 3 | TELEM_RX | 飞控串口接收 | 3.3V逻辑 / 3V3_MCU | 输入（IN） | 外设TX | 外设5V电源不代表允许5V UART逻辑 |
| 4 | unconnected-(J702-Pad4) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| 5 | unconnected-(J702-Pad5) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| 6 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

两只MP固定焊盘在PCB中均无电气Net，不是外接针脚，也不能当作GND接线脚。

## J703：接收机串口接口（RC UART）

**Reference：J703；Connector Type：SM06B-GHS-TB(LF)(SN)，GH6侧插。** 协议/反相兼容性待验证；pins4/5不连接。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | EXT_5V | 受保护外设5V供电 | 5V外设域 | 输出（OUT） | 兼容的低功率外设 | 所有EXT接口共享1A设计总预算；禁反向灌电、禁短接主轨 |
| 2 | RC_TX | 飞控串口发送 | 3.3V逻辑 / 3V3_MCU | 输出（OUT） | 外设RX | TX/RX方向均以飞控为基准；不可直接接RS232电平 |
| 3 | RC_RX | 飞控串口接收 | 3.3V逻辑 / 3V3_MCU | 输入（IN） | 外设TX | 外设5V电源不代表允许5V UART逻辑 |
| 4 | unconnected-(J703-Pad4) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| 5 | unconnected-(J703-Pad5) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| 6 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

两只MP固定焊盘在PCB中均无电气Net，不是外接针脚，也不能当作GND接线脚。

## J704：外部I2C接口（External I2C1）

**Reference：J704；Connector Type：SM04B-GHS-TB(LF)(SN)，GH4侧插。** 与J701 pins4/5共用总线。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | EXT_5V | 受保护外设5V供电 | 5V外设域 | 输出（OUT） | 兼容的低功率外设 | 所有EXT接口共享1A设计总预算；禁反向灌电、禁短接主轨 |
| 2 | EXT_I2C1_SCL | I2C时钟 | 3.3V开漏，上拉到3V3_MCU | 双向开漏（BIDIR） | 3.3V兼容I2C外设 | J701/J704同总线；核对地址及外部上拉，禁止上拉到5V |
| 3 | EXT_I2C1_SDA | I2C数据 | 3.3V开漏，上拉到3V3_MCU | 双向开漏（BIDIR） | 3.3V兼容I2C外设 | J701/J704同总线；核对地址及外部上拉，禁止上拉到5V |
| 4 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

两只MP固定焊盘在PCB中均无电气Net，不是外接针脚，也不能当作GND接线脚。

## J801：第1路PWM输出（PWM Output 1）

**Reference：J801；Connector Type：TSW-102-07-G-S，1×2 2.54mm插针。** 仅信号＋GND，无ESC/舵机供电脚。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | OUT1 | PWM信号输出 | 3.3V逻辑 / 3V3_MCU | 输出（OUT） | 兼容ESC/执行器信号输入 | 外部ESC另走动力供电；电平/协议需台架验证 |
| 2 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

## J802：第2路PWM输出（PWM Output 2）

**Reference：J802；Connector Type：TSW-102-07-G-S，1×2 2.54mm插针。** 仅信号＋GND，无ESC/舵机供电脚。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | OUT2 | PWM信号输出 | 3.3V逻辑 / 3V3_MCU | 输出（OUT） | 兼容ESC/执行器信号输入 | 外部ESC另走动力供电；电平/协议需台架验证 |
| 2 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

## J803：第3路PWM输出（PWM Output 3）

**Reference：J803；Connector Type：TSW-102-07-G-S，1×2 2.54mm插针。** 仅信号＋GND，无ESC/舵机供电脚。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | OUT3 | PWM信号输出 | 3.3V逻辑 / 3V3_MCU | 输出（OUT） | 兼容ESC/执行器信号输入 | 外部ESC另走动力供电；电平/协议需台架验证 |
| 2 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

## J804：第4路PWM输出（PWM Output 4）

**Reference：J804；Connector Type：TSW-102-07-G-S，1×2 2.54mm插针。** 仅信号＋GND，无ESC/舵机供电脚。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | OUT4 | PWM信号输出 | 3.3V逻辑 / 3V3_MCU | 输出（OUT） | 兼容ESC/执行器信号输入 | 外部ESC另走动力供电；电平/协议需台架验证 |
| 2 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

## J805：第5路PWM输出（PWM Output 5）

**Reference：J805；Connector Type：TSW-102-07-G-S，1×2 2.54mm插针。** 仅信号＋GND，无ESC/舵机供电脚。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | OUT5 | PWM信号输出 | 3.3V逻辑 / 3V3_MCU | 输出（OUT） | 兼容ESC/执行器信号输入 | 外部ESC另走动力供电；电平/协议需台架验证 |
| 2 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

## J806：第6路PWM输出（PWM Output 6）

**Reference：J806；Connector Type：TSW-102-07-G-S，1×2 2.54mm插针。** 仅信号＋GND，无ESC/舵机供电脚。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | OUT6 | PWM信号输出 | 3.3V逻辑 / 3V3_MCU | 输出（OUT） | 兼容ESC/执行器信号输入 | 外部ESC另走动力供电；电平/协议需台架验证 |
| 2 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

## J807：SWD调试接口（SWD Debug）

**Reference：J807；Connector Type：TSW-105-07-G-S，1×5 2.54mm插针。** pin1是目标电压参考，不是供板入口。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 3V3_MCU | 调试器目标电压参考（VTref） | 3.3V / 3V3_MCU | 参考输出 | SWD调试器VTref | 只作电平参考，不作为给本板供电入口 |
| 2 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |
| 3 | SWDIO | 串行线调试数据 | 3.3V逻辑 / 3V3_MCU | 双向（BIDIR） | 调试器SWDIO | 共地并核对线序 |
| 4 | SWCLK | 串行线调试时钟 | 3.3V逻辑 / 3V3_MCU | 输入（IN） | 调试器SWCLK | 使用目标参考电压；不是外设时钟输出 |
| 5 | NRST | 低有效复位 | 3.3V / 3V3_MCU上拉 | 控制输入（IN） | 调试器复位脚 | 用兼容开漏复位；不可接高压 |

## J808：飞控电池/台架供电输入（FC Battery / Bench Input）

**Reference：J808；Connector Type：VBAT_PAD_PAIR_V1，板载焊线焊盘对。** 3S–6S ONLY；不用USB/ESC动力电流经过PCB。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | VBAT_RAW | 飞控独立支路正输入 | VBAT，3S–6S：9.0～25.2V输入包络 | 输入（IN） | 电池/PDB飞控支路或限流台架电源 | pin2为GND；不支持2S；过冲/极性需检查 |
| 2 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

## J809：电流传感模拟输入（Current Monitor Analog Input）

**Reference：J809；Connector Type：SM06B-GHS-TB(LF)(SN)，GH6侧插。** 仅pin3模拟电压；pins1/2/4明确NC，无供电输出。

| Pin | Net | 中文功能 | Voltage Domain | Direction | 连接对象 | Important Notes |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | unconnected-(J809-Pad1) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| 2 | unconnected-(J809-Pad2) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| 3 | CURRENT_IN_RAW | 电流传感器模拟电压输出采集 | 正常0～5V模拟输入（共地） | 输入（IN） | 外部电流传感模块模拟输出 | 0～6V有限DC故障合同；不支持负压/VBAT误接；模块需另供电 |
| 4 | unconnected-(J809-Pad4) | 未连接（NC） | 无指定电压域 | NC | 不连接 | 原理图明确no_connect；不可作备用电源/信号脚 |
| 5 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |
| 6 | GND | 公共地 / 回流参考 | GND / 0V | 参考地 | 共地/屏蔽 | 不承载动力推进电流 |

两只MP固定焊盘在PCB中均无电气Net，不是外接针脚，也不能当作GND接线脚。

## CAN终端配置：JP601（板内焊桥）

JP601不是外接连接器，无独立采购件。pin1=`CAN_TERM`，pin2=`CANL`；R602为120Ω，从`CANH`到`CAN_TERM`。焊桥默认OPEN时终端支路断开，手工桥接后才把120Ω接到CANH/CANL之间。没有锡膏层（NO PASTE），并非已接通的默认终端；仅在总线端点且整体终端配置需要时桥接，完成后实测阻值。该支路目前未正式布线。

## 接线速查（Quick Wiring Guide）

| 要连接什么 | 按当前设计接哪里 | 学生须检查的要点 |
| --- | --- | --- |
| 电池/限流台架电源 | J808 pin1=`VBAT_RAW`，pin2=`GND` | 3S–6S ONLY；第一次用限流台架电源；核对极性。电池/PDB到ESC到电机的推进大电流严禁经过X100 PCB |
| ESC信号 | J801–J806 pin1分别=`OUT1`…`OUT6`；pin2=`GND` | 这里只给3.3V信号和共地，无电源脚；ESC动力另接PDB；去桨台架检查电平和协议 |
| CAN外设 | J601 pin1=`EXT_5V`，2=`CANH`，3=`CANL`，4=`GND` | 外设电源与CAN信号分开；共地；全部EXT_5V接口共享1A设计预算；按端点设置JP601 |
| USB电脑 | J401 USB-C；A/B数据触点分别并到USB_DP/USB_DM | 当前baseline需独立供电，USB-only新要求未实现；先测反灌/热插拔，再首次连电脑；USB不供整板电源，不做PD高压输入 |
| SWD调试器 | J807 1=VTref/3V3_MCU，2=GND，3=SWDIO，4=SWCLK，5=NRST | pin1是目标电压参考，不把调试器电源灌入板轨 |
| GPS/UART | J701 GPS、J702 TELEM、J703 RC：pin1=EXT_5V、2=飞控TX、3=飞控RX、6=GND | 飞控TX接外设RX，飞控RX接外设TX；3.3V逻辑；J701的4/5是I2C，J702/J703的4/5为NC；不得乱接 |
| 外部I2C | J704 1=EXT_5V、2=SCL、3=SDA、4=GND | 信号上拉到3.3V；与J701共总线；检查外设地址、供电和上拉 |
| 电流传感模拟电压 | J809 3=CURRENT_IN_RAW；5/6=GND；1/2/4=NC | 正常0～5V共地；该口不供传感器电源，不传输动力电流；外部模块另供电并校准 |

接口的设计存在不等于外设已经兼容；协议、线束和样机验证均待完成。供电细节见[电源架构](POWER_ARCHITECTURE.md)，首次上电见[Bring-up计划](BRINGUP_PLAN.md)。
