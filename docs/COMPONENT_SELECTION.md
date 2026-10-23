# 器件选型说明（Component Selection）

本文只整理已冻结的工程决定，来源为当前原理图/fresh netlist及既有设计输入，不重做MCU、IMU或气压计比较。中文器件类别不能代替exact MPN，原Reference、MPN、Package和库标识保持原文。关键器件为`FINAL_SELECTED_FOR_V1`，实物/台架/飞行状态分别记录。

| Reference | 器件中文名称 | Manufacturer | MPN | Package |
| --- | --- | --- | --- | --- |
| U201 | 32位微控制器 | ST | STM32H743VIT6 | LQFP100 14x14 P0.5 |
| U301 | 六轴惯性测量单元 | Bosch | BMI088 | LGA16 3x4.5 |
| U302 | 数字气压传感器 | Goertek | SPL06-001 | LGA8 2x2.5 |
| U101 | 降压型开关稳压器 | TI | TPS54360BDDAR | DDA0008B HSOIC8 EP |
| U102 | 降压型开关稳压器 | Diodes | AP63203WU-7 | TSOT26 |
| U103 | 低压差线性稳压器 | TI | TPS7A2033PDBVR | DBV5 SOT23-5 |
| U104 | 限流电源开关 | TI | TPS2553DBVR | DBV6 SOT23-6 |
| U401 | 双通道ESD保护器件 | Texas Instruments | TPD2E2U06QDBZRQ1 | DBZ / SOT-23-3 |
| U403 | 双通道ESD保护器件 | Texas Instruments | TPD2E2U06QDBZRQ1 | DBZ / SOT-23-3 |
| U404 | 双通道ESD保护器件 | Texas Instruments | TPD2E2U06QDBZRQ1 | DBZ / SOT-23-3 |
| U402 | 施密特触发缓冲器 | TI | SN74LVC1G17DBVR | DBV5 SOT23-5 |
| U601 | CAN收发器 | Texas Instruments | TCAN3414DR | TI D0008A SOIC-8 |
| U801 | 四通道模拟开关 | TI | TMUX1511PWR | PW14 TSSOP14 0.65mm visible leads |
| D101 | 栅源钳位稳压二极管 | Nexperia | BZT52H-C12,115 | SOD123F |
| D102 | 双向瞬态电压抑制二极管 | ST | SMBJ26CA-TR | SMB DO214AA |
| D103 | 肖特基整流二极管 | ST | STPS8H100G-TR | D2PAK A/K/tabK |
| F101 | 贴片熔断保险丝 | Littelfuse | 0451003.MRL | NANO2 451 SMD |
| F102 | 自恢复保险丝 | Littelfuse | 1812L200/12DR | 1812 PTC |
| Q101 | P沟道反接保护MOSFET | Diodes | DMP6023LSS-13 | SO8 |
| L101 | 屏蔽功率电感 | Bourns | SRP1038A-100M | Lead-frame SMD; case max11.5x10.3x4.0mm |
| L102 | 功率电感 | Bourns | SRN6045-4R7Y | 6x6x4.5 SMD visible end terminals |
| Y201 | 8MHz石英晶体 | TAITIEN | XJHCELNANF-8M | HC49-class 2SMD 12.5x4.5x4 |
| C105 | 聚合物铝电容 | Panasonic | 50SVPF39M | OS-CON E12 diameter8 height11.9 |
| J401 | USB Type-C母座 | Amphenol | 124019772112A / C5430474 | USB-C dual-row SMT / 4 plated SH slots |
| J501 | microSD卡座 | Molex | 1040310811 | microSD SMT push-pull8+2detect |
| J601 | JST GH侧插连接器 | JST | SM04B-GHS-TB(LF)(SN) | GH1.25 4P side-entry SMT |
| D201 | 绿色发光二极管 | Lite-On | LTST-C170GKT | 0805 LED |
| D202 | 绿色发光二极管 | Lite-On | LTST-C170GKT | 0805 LED |

## U201：32位微控制器（STM32H743VIT6）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 主控与时钟模块 / 32位微控制器（MCU / flight-control processor） |
| 器件类别中文名 | 32位微控制器 |
| Reference | U201 |
| Manufacturer | ST |
| MPN | STM32H743VIT6 |
| Package | LQFP100 14x14 P0.5 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 课程指定STM32H743VIT6/LQFP100主控；保留已核对最小系统与引脚计划 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 主控没有本轮可替换授权，原厂引脚/硅版/温度和固件需样机确认 |

## U301：六轴惯性测量单元（BMI088）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 传感器模块 / 六轴惯性测量单元（IMU / accelerometer and gyroscope） |
| 器件类别中文名 | 六轴惯性测量单元 |
| Reference | U301 |
| Manufacturer | Bosch |
| MPN | BMI088 |
| Package | LGA16 3x4.5 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 冻结的单IMU方案；SPI共用数据线、加速度/陀螺独立片选，已有ArduPilot驱动参考 |
| 为什么没有选择主要替代方案 | ICM-42688-P=NOT_SELECTED_FOR_V1；V1保留BMI088，不新增第二IMU |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | LGA例外已接受；轴向、焊接、启动和实板驱动待验证 |

## U302：数字气压传感器（SPL06-001）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 传感器模块 / 数字气压传感器（Barometer） |
| 器件类别中文名 | 数字气压传感器 |
| Reference | U302 |
| Manufacturer | Goertek |
| MPN | SPL06-001 |
| Package | LGA8 2x2.5 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 冻结的单气压计方案；板内I2C2与传感3V3供电 |
| 为什么没有选择主要替代方案 | DPS310=NOT_SELECTED_FOR_V1；V1保留SPL06-001，不同时装两颗气压计 |
| 当前验证状态 | BENCH_VERIFY（实板未验证）；原厂资料可追溯性限制待闭合 |
| 采购注意事项 | LGA与压力口需按原厂处理；既有V7.0来源限制、真料和实板待核验 |

## U101：降压型开关稳压器（TPS54360BDDAR）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 降压型开关稳压器（Main 5V buck） |
| 器件类别中文名 | 降压型开关稳压器 |
| Reference | U101 |
| Manufacturer | TI |
| MPN | TPS54360BDDAR |
| Package | DDA0008B HSOIC8 EP |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 人工批准的主5V Buck；固定3S–6S输入与既有功率/补偿架构 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | DDA0008B含GND散热pad9；只买B版exact型号，不混用同系列别版 |

## U102：降压型开关稳压器（AP63203WU-7）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 降压型开关稳压器（Secondary 3V3 buck） |
| 器件类别中文名 | 降压型开关稳压器 |
| Reference | U102 |
| Manufacturer | Diodes |
| MPN | AP63203WU-7 |
| Package | TSOT26 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 5V_MAIN后级3V3_MCU降压方案已冻结 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | TSOT26与L102 exact身份保持；不把额定电流当作本PCB已通过热验收 |

## U103：低压差线性稳压器（TPS7A2033PDBVR）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 低压差线性稳压器（Sensor 3V3 LDO） |
| 器件类别中文名 | 低压差线性稳压器 |
| Reference | U103 |
| Manufacturer | TI |
| MPN | TPS7A2033PDBVR |
| Package | DBV5 SOT23-5 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 滤波5V_MAIN输入的独立传感器3V3 LDO，保留既有分轨 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 3V3_SENSOR不是新外设电源口，压差/噪声/启动待测 |

## U104：限流电源开关（TPS2553DBVR）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 限流电源开关（External 5V current limit switch） |
| 器件类别中文名 | 限流电源开关 |
| Reference | U104 |
| Manufacturer | TI |
| MPN | TPS2553DBVR |
| Package | DBV6 SOT23-6 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 外部5V支路限流开关；后接F102再到EXT_5V |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 所有接口共享1A设计预算，不能按每口1A采购外设 |

## U401：双通道ESD保护器件（TPD2E2U06QDBZRQ1）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | USB通信与保护模块 / 双通道ESD保护器件（USB DP/DM ESD） |
| 器件类别中文名 | 双通道ESD保护器件 |
| Reference | U401 |
| Manufacturer | Texas Instruments |
| MPN | TPD2E2U06QDBZRQ1 |
| Package | DBZ / SOT-23-3 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | USB安全ECO：无外接VBUS steering供电脚的双通道ESD保护 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | DBZ三脚exact；不能替回会形成已知反灌路径的旧件 |

## U403：双通道ESD保护器件（TPD2E2U06QDBZRQ1）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | USB通信与保护模块 / 双通道ESD保护器件（USB VBUS ESD） |
| 器件类别中文名 | 双通道ESD保护器件 |
| Reference | U403 |
| Manufacturer | Texas Instruments |
| MPN | TPD2E2U06QDBZRQ1 |
| Package | DBZ / SOT-23-3 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | USB安全ECO：VBUS独立ESD保护 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | ESD保护不是USB给整板供电开关；反灌/热插拔仍待测 |

## U404：双通道ESD保护器件（TPD2E2U06QDBZRQ1）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | USB通信与保护模块 / 双通道ESD保护器件（USB CC ESD） |
| 器件类别中文名 | 双通道ESD保护器件 |
| Reference | U404 |
| Manufacturer | Texas Instruments |
| MPN | TPD2E2U06QDBZRQ1 |
| Package | DBZ / SOT-23-3 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | USB安全ECO：CC独立ESD保护 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | CC保护与Rd配置保持，不能宣称USB PD设计 |

## U402：施密特触发缓冲器（SN74LVC1G17DBVR）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | USB通信与保护模块 / 施密特触发缓冲器（USB VBUS logic sense） |
| 器件类别中文名 | 施密特触发缓冲器 |
| Reference | U402 |
| Manufacturer | TI |
| MPN | SN74LVC1G17DBVR |
| Package | DBV5 SOT23-5 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | USB VBUS逻辑检测；SN74LVC1G17缓冲与原检测网络已冻结 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 检测信号不是电源OR；掉电行为/电平需bench验证 |

## U601：CAN收发器（TCAN3414DR）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | CAN通信模块 / CAN收发器（CAN transceiver） |
| 器件类别中文名 | CAN收发器 |
| Reference | U601 |
| Manufacturer | Texas Instruments |
| MPN | TCAN3414DR |
| Package | TI D0008A SOIC-8 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 受控CAN闭合采用3.3V TCAN3414DR；原CAN_TX/RX与GH4功能保持 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | SOIC8无EP；不能买回旧收发器；芯片总线保护不等于整板IEC认证 |

## U801：四通道模拟开关（TMUX1511PWR）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | PWM、ADC与调试模块 / 四通道模拟开关（PWM / ADC / debug interface） |
| 器件类别中文名 | 四通道模拟开关 |
| Reference | U801 |
| Manufacturer | TI |
| MPN | TMUX1511PWR |
| Package | PW14 TSSOP14 0.65mm visible leads |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | VBAT/CURRENT掉电隔离采用可见脚TMUX1511PWR，无新增GPIO |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | TSSOP14 exact；静态边界不等于上/掉电波形已实测 |

## D101：栅源钳位稳压二极管（BZT52H-C12,115）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 栅源钳位稳压二极管（FC input TVS） |
| 器件类别中文名 | 栅源钳位稳压二极管 |
| Reference | D101 |
| Manufacturer | Nexperia |
| MPN | BZT52H-C12,115 |
| Package | SOD123F |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | Q101栅源12V钳位，保留反接保护局部电路 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 这是稳压钳位二极管，不能误当VBAT主TVS |

## D102：双向瞬态电压抑制二极管（SMBJ26CA-TR）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 双向瞬态电压抑制二极管（Power rail / protection support） |
| 器件类别中文名 | 双向瞬态电压抑制二极管 |
| Reference | D102 |
| Manufacturer | ST |
| MPN | SMBJ26CA-TR |
| Package | SMB DO214AA |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | VBAT_PROTECTED双向26V TVS，输入瞬态保护方案已冻结 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 不能把TVS额定值当整板热插拔保证；与F101/线束协同待测 |

## D103：肖特基整流二极管（STPS8H100G-TR）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 肖特基整流二极管（Main buck rectifier） |
| 器件类别中文名 | 肖特基整流二极管 |
| Reference | D103 |
| Manufacturer | ST |
| MPN | STPS8H100G-TR |
| Package | D2PAK A/K/tabK |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 主Buck功率整流肖特基，exact身份与A/K/tabK映射已冻结 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | D2PAK tab=K；检查焊接、铜散热与极性 |

## F101：贴片熔断保险丝（0451003.MRL）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 贴片熔断保险丝（FC input fuse） |
| 器件类别中文名 | 贴片熔断保险丝 |
| Reference | F101 |
| Manufacturer | Littelfuse |
| MPN | 0451003.MRL |
| Package | NANO2 451 SMD |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 飞控独立输入支路3A/125V熔断保险丝 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 3A保险丝不是允许推进电流经过飞控的依据 |

## F102：自恢复保险丝（1812L200/12DR）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 自恢复保险丝（Power rail / protection support） |
| 器件类别中文名 | 自恢复保险丝 |
| Reference | F102 |
| Manufacturer | Littelfuse |
| MPN | 1812L200/12DR |
| Package | 1812 PTC |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 外部5V支路自恢复PTC，保持限流后分支 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 2A hold标签不改变EXT_5V共享1A设计合同 |

## Q101：P沟道反接保护MOSFET（DMP6023LSS-13）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / P沟道反接保护MOSFET（Reverse-polarity protection） |
| 器件类别中文名 | P沟道反接保护MOSFET |
| Reference | Q101 |
| Manufacturer | Diodes |
| MPN | DMP6023LSS-13 |
| Package | SO8 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 飞控输入P-MOS反接保护 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | SO8 exact映射及方向保持，不能按普通开关管随意替代 |

## L101：屏蔽功率电感（SRP1038A-100M）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 屏蔽功率电感（Main 5V power inductor） |
| 器件类别中文名 | 屏蔽功率电感 |
| Reference | L101 |
| Manufacturer | Bourns |
| MPN | SRP1038A-100M |
| Package | Lead-frame SMD; case max11.5x10.3x4.0mm |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 人工批准紧凑10µH替换，官方焊盘与源同步已核验；实际负载/热/补偿审查继续 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | SRP1038A-100M / C780184；不是L102；不要混用SRP1038AA；饱和/热态按实际工况验证 |

## L102：功率电感（SRN6045-4R7Y）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 功率电感（Secondary 3V3 power inductor） |
| 器件类别中文名 | 功率电感 |
| Reference | L102 |
| Manufacturer | Bourns |
| MPN | SRN6045-4R7Y |
| Package | 6x6x4.5 SMD visible end terminals |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 后级3V3轨冻结4.7uH，采用可见端焊区的SRN6045 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | SRN6045-4R7Y，不能拿主Buck封装/MPN代替 |

## Y201：8MHz石英晶体（XJHCELNANF-8M）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 主控与时钟模块 / 8MHz石英晶体（MCU / clock / reset support） |
| 器件类别中文名 | 8MHz石英晶体 |
| Reference | Y201 |
| Manufacturer | TAITIEN |
| MPN | XJHCELNANF-8M |
| Package | HC49-class 2SMD 12.5x4.5x4 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 旧晶体采购不可用后，已批准8MHz/CL20pF的TAITIEN替代 |
| 为什么没有选择主要替代方案 | 原ABLS-8.000MHZ-D4-T采购不可用；既有批准替代为当前exact晶体 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 只整理既有决定；启动、负载与drive level仍需样机确认 |

## C105：聚合物铝电容（50SVPF39M）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 电源管理模块 / 聚合物铝电容（Power rail / protection support） |
| 器件类别中文名 | 聚合物铝电容 |
| Reference | C105 |
| Manufacturer | Panasonic |
| MPN | 50SVPF39M |
| Package | OS-CON E12 diameter8 height11.9 |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 冻结输入39uF/50V聚合物储能电容 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 50SVPF39M，Ø8mm高11.9mm；底部装机高度待确认，不自行减容 |

## J401：USB Type-C母座（Amphenol 124019772112A）

2026-10-22用户正式批准，立创C5430474，优先立创；无须再次申请同一器件批准或等待旧GCT孔铜确认。已通过plant_kicad_v1写入正式源，保持USB/CC/VBUS/GND/Shield功能；GCT原型号退出J401正式BOM。[正式接受记录](J401_FORMAL_ACCEPTANCE.md)说明官方板边、1.6mm安装结构、局部规则、fresh检查与实物待验证事项。当前器件状态FINAL_SELECTED_FOR_V1 / DESIGN_REVIEWED_BENCH_PENDING，不表示整板可下单。

## J501：microSD卡座（1040310811）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | microSD数据存储模块 / microSD卡座（microSD / SDMMC1 4-bit storage） |
| 器件类别中文名 | microSD卡座 |
| Reference | J501 |
| Manufacturer | Molex |
| MPN | 1040310811 |
| Package | microSD SMT push-pull8+2detect |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 冻结Molex microSD卡座，SDMMC1四位存储 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | PENDING_SAMPLE_VERIFICATION |
| 采购注意事项 | 1040310811：8卡触点＋2detect；先取样核实land/机构，不购买仅名称类似的卡座 |

## J601：JST GH侧插连接器（SM04B-GHS-TB(LF)(SN)）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | CAN通信模块 / JST GH侧插连接器（External CAN connector） |
| 器件类别中文名 | JST GH侧插连接器 |
| Reference | J601 |
| Manufacturer | JST |
| MPN | SM04B-GHS-TB(LF)(SN) |
| Package | GH1.25 4P side-entry SMT |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 冻结JST GH4 CAN接口，供电/信号/地线序保持 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 官方land不能裁剪；当前3条制造空间问题待局部裁决 |

## D201：绿色发光二极管（LTST-C170GKT）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 主控与时钟模块 / 绿色发光二极管（MCU / clock / reset support） |
| 器件类别中文名 | 绿色发光二极管 |
| Reference | D201 |
| Manufacturer | Lite-On |
| MPN | LTST-C170GKT |
| Package | 0805 LED |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | MCU驱动绿色状态指示灯已冻结 |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | 固件定义状态，发光不等于飞行验证 |

## D202：绿色发光二极管（LTST-C170GKT）

| 字段 | 冻结说明 |
| --- | --- |
| 功能中文名（English Function） | 主控与时钟模块 / 绿色发光二极管（MCU / clock / reset support） |
| 器件类别中文名 | 绿色发光二极管 |
| Reference | D202 |
| Manufacturer | Lite-On |
| MPN | LTST-C170GKT |
| Package | 0805 LED |
| Selection Status | FINAL_SELECTED_FOR_V1 |
| 为什么采用 | 受控ECO增加3V3_MCU硬件存在指示，沿用D201 exact LED |
| 为什么没有选择主要替代方案 | 已有V1方案冻结；其它替代的逐型号拒绝理由未公开，不在本轮补做比较 |
| 当前验证状态 | BENCH_VERIFY（实板未验证） |
| 采购注意事项 | R207为已批准1.2k初值；不是实板上电合格判据 |

## 接口、终端与通用器件

- J701/J702/J703/J809为JST `SM06B-GHS-TB(LF)(SN)` GH6侧插；J704与J601为`SM04B-GHS-TB(LF)(SN)` GH4侧插。相同连接器型号的不同用途不等于相同线序，见[接口表](INTERFACES.md)。对插端子/线束尚未选定。
- J801–J806采用Samtec `TSW-102-07-G-S`；J807采用`TSW-105-07-G-S`，分别为2pin输出和5pin调试，不能换成另一脚数。
- R602为0805、120Ω CAN终端电阻；JP601是默认OPEN、手工bridge=ON的板内焊桥，NO PASTE，无独立BOM零件。JP601不独立采购，R602仍按源BOM计数，不凭焊桥默认OPEN标成DNP。
- J808为`VBAT_PAD_PAIR_V1`板载焊线焊盘对，不是可购买的独立连接器。电源线/线束需另行确定，不虚构对应采购MPN。
- 普通R/C冻结value、tolerance、dielectric、voltage/power rating及package；`PREFERRED_NOT_EXACT` MPN是优选，不能据此把某一库存当作唯一选型。特殊IC、二极管、TVS、MOS、PTC、保险丝、晶体、连接器、聚合物电容、功率电感和LED保留exact身份。

## 选型与验证状态分开

| 器件 | Selection Status | V1结论 |
| --- | --- | --- |
| BMI088 | FINAL_SELECTED_FOR_V1 | 单IMU，已设计/放置，bench/flight未验证 |
| ICM-42688-P | NOT_SELECTED_FOR_V1 | 不进入V1 BOM，不重新比较 |
| SPL06-001 | FINAL_SELECTED_FOR_V1 | 单气压计，实板与资料可追溯性事项待完成 |
| DPS310 | NOT_SELECTED_FOR_V1 | 不进入V1 BOM，不重新比较 |

201个电气实体的逐项源状态见[元件状态](../bom/component_status.csv)。[工程BOM](../bom/X100_V1_BOM.csv)为200个非排除源条目，其中65个测试点、135个装配component条目；后者包含J808板载焊盘feature，不能全部当作可购买件。JP601仍为原BOM排除项，H1–H4为板孔。真正采购与备料建议见[采购说明](PROCUREMENT_GUIDE.md)。

USB-only核心供电是新增V1要求，当前NOT_IMPLEMENTED；power-path IC与exact MPN尚未选择，不在本轮重开其它选型。后续独立ECO先裁决架构/预算/反灌，再冻结新增身份。


L101于2026-10-23正式批准并集成，见[接受记录](L101_FORMAL_ACCEPTANCE.md)；不代表采购授权或电源安全PASS。
