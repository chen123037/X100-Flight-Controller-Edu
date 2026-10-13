# 第三方库与资料说明

本项目自定义symbol/footprint文件包含从KiCad官方库派生的定义及项目自行建立的封装。KiCad官方库集合适用CC-BY-SA 4.0及其设计使用例外；作为库集合分发的派生部分保留原有条款与KiCad community归属，不能以本项目选择的CERN-OHL-P-2.0覆盖这些已有权利。

原许可说明保留在`licenses/KICAD_LIBRARIES_LICENSE.md`。依据：[KiCad官方说明](https://www.kicad.org/libraries/license/)及[官方footprints许可文件](https://github.com/KiCad/kicad-footprints/blob/master/LICENSE.md)。仓库不收录额外datasheet PDF、厂商图、WFG100A原始资料或ArduPilot源码。

3D模型引用KiCad 10标准安装变量，模型文件未另行分发。请安装标准库；缺少可选3D模型不应由经验修改真实pad/孔几何来掩盖。

## 首次公开发布的许可边界

2026-10-13：X100原创硬件源采用CERN-OHL-P-2.0，项目原创教学文档采用CC BY 4.0，见[适用范围](../LICENSE_DECISION.md)。根LICENSE只覆盖明确声明的原创硬件部分，不重新许可KiCad-derived内容、厂商资料或任何其它受不同许可保护的第三方内容。

`X100_Physical.kicad_sym`及项目`.pretty`目录含项目自建与KiCad官方库派生定义；文件集中分发不抹去各定义的来源与原许可。KiCad-derived/官方库derived部分保留CC BY-SA 4.0及原例外、KiCad community归属和原通知，完整[KiCad库原许可文件](../licenses/KICAD_LIBRARIES_LICENSE.md)保持字节不变；项目原创部分的CERN声明不能覆盖派生部分。对第三方来源不明确的内容，不仅凭文件前缀或自定义库名宣称项目独占原创。

厂商datasheet/drawing/catalog只提供官方外部引用，不纳入原创CC BY许可，也未把PDF随仓库发布。第三方许可正文及原库文档不因出现在docs/或licenses/而改为CC BY 4.0。ArduPilot源码未复制；未来软件许可另行裁决。
