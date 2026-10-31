# X100 当前状态：c8待独立评审

当前入口为 [c8中文评审目录](hardware/reviews/X100_C8_LAYOUT_REVIEW/)。电路主体50×50 mm、安装耳外廓70×52 mm、孔距60×42 mm、四个Ø4孔；240总封装已包含65测试点。

PCB SHA256：`edc89ce874549e805f218a019f62ca5ebd7cc67f8088a04d4485a3e62591cce0`。

## 已有证据

- 独立重跑DRC：96项未连接、0原理图一致性。ERC全严重级别0。证据见[c8检查目录](hardware/reviews/X100_C8_LAYOUT_REVIEW/03_检查证据/)。
- 当前报告clearance/short/孔相关/track_width/板边等电气违规0，不等于DRC_FINAL通过。
- 其它报告：zones_intersect3、Courtyard199、silk_over_copper199、silk_overlap199、silk_edge13、text_height2、悬空线35、悬空过孔20。三类199触顶，不能用报告总数当真实总量。
- Courtyard几何另报告212对；6组二维焊盘-他件Fab凸包交叠均未确认三维实体干涉。
- USB VBUS和CC连接已完成；DP/DM为F面、0过孔，主段0.50mm异网铜筛查0问题。端部扇出、参考平面、SI、ESD、实际枚举和电流未验收。
- 本次仅公开源文件/文档/证据与中文ZIP；没有修改c8 CAD，也没有覆盖旧正式hardware/X100_V1。

## 尚未完成

1. 96项连接，包含核心供电/启动、传感器、SD、CAN、接口等；不是“只剩丝印收尾”。
2. 主Buck与MCU出线协同布局、U104/U105共用5V_MAIN干线、VBAT/过孔/负载/热/压降/回流检查。
3. 3处铜区重叠、6组装配疑点、插拔/焊接/底面及测试可达性、丝印/阻焊/悬空铜。
4. 35个USB供电候选的具体器件/架构正式接受边界，USB-only电流/反灌/切换；没有实物数据的项目列首板Bring-up。
5. JLC3313实际下单叠层/CAM、BOM/CPL及Gerber/钻孔/制造包和最终人工验收。

约40pF耦合、1.01A载流、0.41mm最低线宽等是带假设的模型值，不是实测。自动路由器不收敛、41%面积估算或直线穿越统计，都不能证明布局物理不可完成。应先请有经验的人给具体摆放与通道判断。

`PCB_DESIGN_COMPLETE = NO`

`DRC_FINAL = NOT_PASS`

`POWER_SAFETY_REVIEW = NOT_CLOSED`

`PCB_MANUFACTURING_PACKAGE = NOT_READY`

`READY_FOR_HUMAN_FABRICATION_APPROVAL = NO`

此前282/116/140/102/100等属于不同工程或阶段，区别见[工作说明](docs/C8_WORK_SUMMARY.md)。之前的阶段状态保存在[历史快照](docs/history/pre_c8/STATUS_5a6129b.md)。
