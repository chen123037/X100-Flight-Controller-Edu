# 接手指南

2026-10-22：用户授权清除阻塞并推进布线至可投板；USB-only需求已确认，**具体电源架构及器件未批准**。从[当前状态](STATUS.md)、[USB工程审查](docs/USB_CORE_POWER_REVIEW.md)、[已知问题](docs/KNOWN_ISSUES.md)读取最新事实。

1. 正式源仍是 `hardware/X100_V1`。J601已局部重排关闭3条制造问题；J401未替换，仍4条孔铜报告。不要恢复旧位置或按旧7条统计报告当前状态。
2. [Amphenol连接器候选](hardware/proposals/J401_AMPHENOL_UNAPPROVED/README.md)有独立工程、ERC、网表与几何证据。先取得用户对 exact MPN/采购及替换的裁决，才能推广正式源。没有新电源电路混在这个候选中。
3. USB-only必须MCU启动/枚举/刷写/地面站/参数，推荐核心传感器；SD不强制且不得妨碍核心。ArduPilot Flash参数与无卡后台重试有源码证据；X100自己的hwdef/bootloader、描述符和阶段电流仍未验证。
4. 先闭合USB浪涌、枚举前电流、配置后预算、SD支路、反灌与双源故障分析，再提交具体架构/可采购器件。隔离电源研究稿ERC0/0不是功能通过，不能直接推广。
5. 通过裁决后执行最小正式ECO，fresh ERC/XML/native同步、逐脚身份/网络核对、局部放置和制造几何复查；满足技术前置条件才执行已授权布线。正式PCB修改仍由plant_kicad_v1执行。
6. 完成关键电源/USB/时钟/传感器回流与信号布线，保持In1连续GND、现有四层规则和标准贯通孔。自动布线结果必须经过约束、连通及native DRC审查。
7. 最后完成丝印/courtyard解释、DRC、Gerber回读、BOM/CPL/钢网和板厂在线DFM，才能形成可下单结论；没有制造放行不下单。

保持45×45mm、H1–H4 Ø4 NPTH及30.5mm孔距、MCU/IMU/主Buck架构和已接受microSD向内位置。禁止扩大板框、削官方land、全局放宽clearance、排除整个连接器或复制TEST铜。只学习参考的模块化绘图语法，不复制他人的电路。具体供电方案和器件的审批要求来自用户2026-10-22的明确边界。
