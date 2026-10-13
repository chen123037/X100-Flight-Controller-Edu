# 供电架构

动力电流应直接由Battery/PDB进入ESC与motors。**Motor propulsion current MUST NOT flow through X100 PCB.** 飞控是从Battery/PDB分出的一条独立低功率支路。

```text
Battery / PDB ──→ ESCs ──→ motors
       │
       └─→ X100 J808 → F101 → Q101 → protected VBAT
                                      → U101 + D103 / L101 → 5V_MAIN
                                                           → downstream rails
```

J808为FC输入；F101为输入fuse；Q101处理反接；U101为主5V buck，D103/L101构成其功率部分。U102/L102产生后级3V3，U103为sensor LDO，U104限制外部5V支路。电机电流、ESC动力走线、动力接插件应留在PDB/线束，不通过这些FC器件。

USB host backfeed拓扑缺陷已发现并由ECO关闭：U401数据ESD替换为无外接VBUS steering供电脚的TPD2E2U06QDBZRQ1；U403独立保护VBUS，U404独立保护CC。原网和安全架构保持。

这是设计ECO闭合，不代表hotplug、TVS、startup overshoot、热态或USB backfeed bench qualification通过。当前无法按此未布线版本制造。后续首电必须先按BRINGUP_PLAN测量，再首次接电脑。

![Power architecture](../images/power_architecture.png)
