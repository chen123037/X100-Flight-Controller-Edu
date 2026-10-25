> **最新入口：** [c8状态](../STATUS.md) / [中文评审资料](../hardware/reviews/X100_C8_LAYOUT_REVIEW/)。下文涉及45mm、30.5孔距、零布线或旧正式源的描述属于历史基线，不代表c8；数值规则须结合c8的PRO/DRU和后续裁决。当前仍不可投板。

# 总体硬件架构（Hardware Architecture）

本设计采用四层、选择性双面装配，板框45×45 mm，安装孔距30.5×30.5 mm，H1–H4为Ø4 NPTH。以下解释已冻结架构，不重新分配器件或引脚。

## 模块名称与原理图子页

| 子页 / ASCII标识 | 统一中文名称（English） | 主要内容 |
| --- | --- | --- |
| 01_POWER | 电源管理模块（Power Management） | 飞控支路输入保护、主5V、后级3V3和外部限流5V |
| 02_MCU | 主控与时钟模块（MCU and Clock） | U201、HSE、复位/启动、供电去耦及指示灯 |
| 03_SENSORS | 传感器模块（Sensors） | U301 BMI088与U302 SPL06-001 |
| 04_USB | USB通信与保护模块（USB Interface and Protection） | J401及数据/VBUS/CC保护、VBUS逻辑检测 |
| 05_SD | microSD数据存储模块（microSD Storage） | J501、SDMMC1四位总线及卡供电 |
| 06_CAN | CAN通信模块（CAN Interface） | U601、J601、R602和JP601终端支路 |
| 07_UART_IO | 串口与通用IO模块（UART and General I/O） | J701 GPS、J702 TELEM、J703 RC、J704外部I2C |
| 08_PWM_ADC_DEBUG | PWM、ADC与调试模块（PWM, ADC and Debug） | 六路输出、SWD、电池输入、电流模拟监测及ADC隔离 |

## 为什么这样组织

| 冻结架构 | 工程目的与当前边界 |
| --- | --- |
| 四层PCB（4-Layer PCB） | 提供信号、电源和连续接地参考的分层空间，减少敏感信号回流被电源/接口切断的风险；仍需布线后复核 |
| 选择性双面贴装（Double-Side Assembly） | 在45mm范围内容纳201个电气实体，把电源高件/储能件与主控、传感器区域分开；底部高度和返修访问须实物验证 |
| 45×45 mm板框 | 当前人工接受的紧凑结构边界；局部接口问题需局部裁决，不能自行扩大尺寸 |
| 30.5×30.5 mm安装孔距 | 保留冻结的机架安装接口与孔位；是否适配具体机架仍需尺寸、螺钉和净空检查 |
| MCU/IMU靠中心 | 保留集中核心与局部时钟/传感总线，减少边缘连接器线束对核心布局的牵制；IMU最终轴向与机体rotation尚需验证 |
| MAIN BUCK置于另一面 | 分开功率回路/高件与敏感核心区域，保留主电源局部回路质量；双面投影仍须检查孔铜、热路径和装配间隙 |
| In1连续GND参考平面 | 为高速/敏感信号提供短而连续的回流，避免跨平面分割；当前zone=0，该平面是冻结布线目标，还未实现 |

TOP主要为MCU、BMI088、SPL06-001和接口局部支持；BOTTOM主要为电源、microSD/支持器件和无源器件，HSE固定BOTTOM。FRONT仅预留方向标识空间，不能据此宣布机体方向已验证。

WFG100A只作为成熟架构参考（architecture reference），借鉴四层、双面与功能分区原则，**没有复制其坐标、封装或尺寸**。参考板成熟不证明X100已经可制造或可飞行。

部分接口本体/卡片可以伸出板框，但需要铜支撑的焊盘必须满足边距；不能用丝印或courtyard矩形代替真实Fab、焊盘、孔与插拔几何。

![两面共同XY投影](../images/pcb_two_side_overlay.png)

图为共同板XY的两面投影，不是镜像装配视图，也不是三维净空验收。两处真实局部阻塞见[已知问题](KNOWN_ISSUES.md)。
