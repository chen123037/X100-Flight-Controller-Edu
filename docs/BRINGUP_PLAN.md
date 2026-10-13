# 首电与bring-up计划

**本文件是后续计划；当前版本NOT FABRICATION READY，测试尚未执行。**

1. 在制造门槛关闭、ERC/DRC和CAM通过、人工批准后，才收到生产板并进入此流程。
2. Visual inspection：器件方向/型号、焊桥默认OPEN、焊接/短路、孔/板边和装配间隙。
3. Unpowered resistance check：输入与各rail对GND、相邻电源、USB连接器；先排除明显短路。
4. 使用current-limited bench supply，只接飞控供电支路；先核对极性、额定输入和限流设置。
5. 依次确认5V rail、3V3 rail；用合适探头检查startup overshoot，记录静态电流和thermal check。
6. 独立做USB backfeed测量，检查主供电、USB供电及掉电状态；未通过前不接PC。
7. 完成上述门槛后再first PC USB connection；继续sensor enumeration、SD读写、CAN与终端配置、PWM输出。
8. 最后进行ArduPilot bring-up、板级资源/传感器/日志验证；飞行验证需单独放行。

**不要第一次上电直接插动力电池＋电脑。** 不把动力电机电流引入X100，不因设计ECO关闭而跳过实测。具体测试限值沿用批准的器件/电源合同，不在此增设未经审查的新阈值。
