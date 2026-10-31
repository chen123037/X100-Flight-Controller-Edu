> **当前入口更新：** [六层V4工程、DFM零危险和下单资料](../hardware/current/X100_6L_DFM_ZERO_DANGER/)。本文保留旧阶段背景；涉及层数、孔位、器件/TP数量及进度时，以当前源工程和[STATUS](../STATUS.md)为准。旧的审批约束不用于撤销已经取得的后续人工授权。

> **最新入口：** [c8状态](../STATUS.md) / [中文评审资料](../hardware/reviews/X100_C8_LAYOUT_REVIEW/)。下文涉及45mm、30.5孔距、零布线或旧正式源的描述属于历史基线，不代表c8；数值规则须结合c8的PRO/DRU和后续裁决。当前仍不可投板。

# PCB制造与布线规则（PCB Rules）

**仅记录当前工程，不重新设计。生产CAM／阻抗确认仍须在制造前完成，当前不能投板。**

| 参数 | 冻结值 |
| --- | --- |
| 制造商（FAB_VENDOR） | JLCPCB / 嘉立创 |
| 叠层目标（Stackup） | JLC3313 / JLC04161H-3313，4层，1.6 mm订单规格 |
| In1 | 连续完整GND参考平面；目前正式没有zone |
| In2 | 电源分配及精选信号，保持In1回流完整 |
| 标准通孔过孔（Standard Via） | 0.60 / 0.30 mm；无VIP/blind/buried/microvia |
| USB FS差分对 | 90Ω，当前width≈0.1537 mm，pair gap=0.20 mm |
| 电气间距（Clearance） | 0.20 mm |
| 全局孔铜距 | 0.25 mm |
| Foreign PTH-hole clearance | 0.35 mm |
| 全局铜到板边 | 0.50 mm |
| 最小走线宽度 | 0.15 mm |
| 最小过孔外径 / 钻孔 | 0.60 / 0.30 mm |
| 孔间距 | 0.45 mm |
| 阻焊（Mask） | 1:1；green dam0.10 mm |

TP601/TP803有既有0.25mm边距局部规则，仅限相应非承力表面测试feature，不能推广给连接器、孔、tracks/vias/zones。J601/J401没有新增例外。USB保持USB_DP/USB_DM原网名，F.Cu参照In1，非共面模型要求同层其它铜侧向keepaway≥0.50mm，尽量避免vias。

外铜1oz、内铜0.5oz；官方表nominal foil和阻抗计算器finished-copper模型不同，不能直接混用。官方计算器记录成品厚度名义1.56mm／范围1.41…1.72mm，订单属于1.6mm系列；CAM/TDR及材料确认仍未完成。

| 工程网络规则类（Net Class） | 当前默认外层线宽 mm | 用途 |
| --- | ---: | --- |
| MAIN_POWER_HIGH_CURRENT | 1.5 | 主电源／VBAT／MAIN_SW，短宽路径 |
| 5V_POWER | 1.5 | 5V及受保护EXT支路 |
| 3V3_POWER | 1.2 | MCU/SD/sensor rails |
| GND_PLANE | 0.5 | 整面GND及局部控制回流 |
| USB_FS | 0.1537 | USB差分数据 |
| SDMMC | 0.2 | SDMMC1四位总线 |
| SPI_IMU | 0.2 | BMI088 SPI/CS |
| CAN | 0.25 | CANH/CANL及控制/终端 |
| HSE | 0.2 | 局部外部晶振 |
| ANALOG_ADC | 0.25 | 过滤模拟采样节点 |
| GENERAL_DIGITAL | 0.25 | 一般数字接口 |
| LOW_SPEED_CONTROL | 0.25 | 低速偏置、复位、Buck控制 |

实际约束以工程PRO/DRU为准。内层0.5oz高电流宽度另有层约束：MAIN/5V 8.30mm，3V3 6.75mm；窄信号默认值不能当作高电流内层路径。>=3A层转换从不少于4个并联标准via起步，仍需真实铜/孔铜/温升核查。经验线宽筛查不是整板负载或热态验证。

后续获准routing时按：MAIN BUCK → secondary3V3 → HSE → USB+ESD → BMI088 → SDMMC → CAN → ADC → UART/I2C/RC → PWM → remaining digital/support → testpoints → power distribution completion → GND stitching/plane cleanup。每阶段route → readback → DRC → checkpoint。当前只记录顺序，没有routing授权。

## 学生如何理解规则

clearance约束不同铜/孔/板边的制造间距，不是器件本体的三维净空。via的0.60/0.30mm分别是焊盘外径/钻孔直径。USB的0.1537mm为每根线名义宽度，0.20mm为线间边到边间隙，90Ω是差分阻抗目标，不能直接用几何值宣布整板信号完整性已验收。

嘉立创JLC3313为四层、1.6mm目标叠层；In1必须保持连续完整GND参考。当前正式没有via或zone，本文件的走线/平面描述是后续冻结约束。J601和J401没有被新建例外或排除，真实7条阻塞保持。最终投板前需CAM接受实际孔铜结构，并确认叠层、铜厚、材料与阻抗；必要的阻抗实测/TDR也属于后续验收。

新增功能门槛：USB_ONLY_CORE_POWER_ECO未完成，即使J601/J401制造DRC关闭也不能开始PCB03。USB供电ECO的预算、反灌、供电域和placement影响必须先单独裁决；本轮PRO/DRU及所有硬件不变。
