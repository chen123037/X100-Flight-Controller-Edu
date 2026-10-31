# X100 飞控硬件平台

基于STM32H743、BMI088、SPL06-001，面向ArduPilot适配与教学的六层飞控项目。

> **当前PCB下单资料入口：[六层V4，DFM零危险版本](hardware/current/X100_6L_DFM_ZERO_DANGER/)。**
> 可用于上传嘉立创创建订单及工程审稿；U101/D103整板热审查和实际工厂工艺接受尚未闭合，未宣告整板制造放行或飞行验收。

## 直接下载

- [完整当前工程、制造资料与购买清单](hardware/current/X100_6L_DFM_ZERO_DANGER/download/X100_六层当前版_工程制造及清单.zip)
- [当前Gerber/钻孔ZIP](hardware/current/X100_6L_DFM_ZERO_DANGER/manufacturing/X100_6L_DFM_gap_silk_v4.zip)
- [嘉立创参数与U101树脂塞孔盖帽说明](hardware/current/X100_6L_DFM_ZERO_DANGER/manufacturing/嘉立创下单参数与六孔说明.md)
- [淘宝器件清单：62种MPN、每板142件](hardware/current/X100_6L_DFM_ZERO_DANGER/procurement/)
- [KiCad当前工程](hardware/current/X100_6L_DFM_ZERO_DANGER/project/X100_CleanSheet.kicad_pro)
- [原生DFM报告](hardware/current/X100_6L_DFM_ZERO_DANGER/evidence/JLC_DFM_NATIVE_REPORT_0_DANGER.pdf)

## 当前事实

| 项目 | 当前六层版 |
|---|---|
| 结构 | 六层、1.6mm、JLC06161H-3313、约70×52mm外廓及四个安装耳 |
| 安装孔 | 四个Ø4 NPTH、孔距60×42mm、双面Ø7接触包络 |
| 数量 | 174个总封装；144功能位号、26TP、4孔；采购142实例/62种MPN |
| 连接与检查 | ERC0；DRC电气错误0、未连接0、parity0；另56条库副本差异警告 |
| PCB DFM | 实际嘉立创任务所报危险0、黄色468；黄色项目仍在报告中 |
| 工艺条件 | 沉金、绿油白字、高精字符；U101六孔树脂填孔并电镀盖帽，实际范围/生产稿待工厂确认 |
| 当前未放行项 | U101/D103整板热设计风险接受；实板电流/温升、固件、无桨及飞行验证未执行 |

PCB SHA256：`09537241b43be8cdf2aa150a8214c6ce9225da4f3d8592bd108919dc2d73b529`。

本次实际DFM制造ZIP SHA256：`85254aca1ba4356953ddff8653cff87964dce0b77bb30dd6c1584126908b1bfc`。详细资料身份见[当前目录](hardware/current/X100_6L_DFM_ZERO_DANGER/)和[状态](STATUS.md)。

## 后续工作与历史

[接手说明](HANDOFF.md) · [剩余路线图](docs/ROADMAP.md) · [采购指南](docs/PROCUREMENT_GUIDE.md) · [首板计划](docs/BRINGUP_PLAN.md)。旧功能/电源背景文档可能对应早期基线；当前器件、层数、孔位、TP及网络以当前六层工程为准。

`hardware/reviews/X100_C8_LAYOUT_REVIEW/`保留c8四层、96项未连接的历史评审包；`hardware/X100_V1/`保留旧45×45源。本次没有覆盖它们。旧首页与状态快照见[历史目录](docs/history/pre_6L_DFM/)。当前工作在`feature/pcb-fabrication-readiness`，不自动合并main。

![当前零危险DFM](hardware/current/X100_6L_DFM_ZERO_DANGER/images/JLC_DFM_0危险_全部项目.jpg)

原创硬件采用CERN-OHL-P-2.0，原创文档采用CC BY 4.0，KiCad派生部分保留原许可。见[LICENSE](LICENSE)、[许可决定](LICENSE_DECISION.md)及[第三方说明](docs/THIRD_PARTY_NOTICES.md)。开放许可与设计验证状态分别记录。
