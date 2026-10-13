# 冻结PCB制造与routing基础

**仅记录当前工程，不重新设计。生产CAM／阻抗确认仍须在制造前完成，当前不能投板。**

| 参数 | 冻结值 |
| --- | --- |
| FAB_VENDOR | JLCPCB |
| Stackup target | JLC3313 / JLC04161H-3313，4层，1.6 mm订单规格 |
| In1 | continuous solid GND plan；目前正式没有zone |
| In2 | 电源分配及精选信号，保持In1回流完整 |
| Standard through via | 0.60 / 0.30 mm；无VIP/blind/buried/microvia |
| USB FS differential | 90Ω，当前width≈0.1537 mm，pair gap=0.20 mm |
| Electrical clearance | 0.20 mm |
| Global hole clearance | 0.25 mm |
| Foreign PTH-hole clearance | 0.35 mm |
| Global copper-edge | 0.50 mm |
| Minimum track | 0.15 mm |
| Minimum via OD / drill | 0.60 / 0.30 mm |
| Hole-to-hole | 0.45 mm |
| Mask | 1:1；green dam0.10 mm |

TP601/TP803有既有0.25mm边距局部规则，仅限相应非承力表面测试feature，不能推广给连接器、孔、tracks/vias/zones。J601/J401没有新增例外。USB保持USB_DP/USB_DM原网名，F.Cu参照In1，非共面模型要求同层其它铜侧向keepaway≥0.50mm，尽量避免vias。

外铜1oz、内铜0.5oz；官方表nominal foil和阻抗计算器finished-copper模型不同，不能直接混用。官方计算器记录成品厚度名义1.56mm／范围1.41…1.72mm，订单属于1.6mm系列；CAM/TDR及材料确认仍未完成。

| Engineering netclass | 当前默认外层width mm | 用途 |
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
