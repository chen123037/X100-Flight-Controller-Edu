# J401 替代连接器候选：未批准、不可制造

日期：2026-10-22。仅用于审查 Amphenol **124019772112A**（LCSC **C5430474**）替代 GCT USB4105-GF-A。正式工程仍在 `../../X100_V1`，没有采用此器件。本目录不属于制造发布包，不含 USB-only 电源 ECO。

- [原厂机械/推荐焊盘图 C12401977 rev3](https://cdn.amphenol-cs.com/media/wysiwyg/files/drawing/c12401977-3.pdf)。已逐项核对 KiCad 10 库 `Connector_USB:USB_C_Receptacle_Amphenol_124019772112A`，保留原厂焊盘、槽孔和外形。
- [国内可采购条目](https://www.lcsc.com/product-detail/C5430474.html)。2026-10-22 查询可供货；库存和价格不是锁单承诺。请用户确认此 exact MPN 可采购并批准替换后，才推广到正式设计。
- 16 个接点、4 个外壳固定槽；0.45 mm 宽金属化槽，对照 [JLC 多层板能力表](https://jlcpcb.com/capabilities/pcb-capabilities/) 0.35 mm 最小槽宽；没有原连接器的两个定位 NPTH。没有放宽全局孔铜、板边或铜间距。
- 22 个物理焊盘、17 个不同逻辑编号。新增的两处 midplate 接地焊盘沿用 A1/GND；原 USB/CC/VBUS/屏蔽网保持。不能只按焊盘个数判断 pinout 一致。
- PCB 候选：J401=(108.6,120.6,0,F.Cu)；J501 仅切向左移 0.125 mm 至 x=97.2，保留 y=115.995 的已接受向内位置；TP501=(109.5,121.2,B.Cu)，R303=(114.45,120.575,B.Cu)，TP307=(116.125,120.025,B.Cu)。其它姿态继承正式 J601 重排结果。
- 新鲜 ERC **0 error / 0 warning**；与正式源 XML 比较，201 个电气器件的引脚—网络映射完全相同。PCB 实体几何审查计数均为 0，见 `GEOMETRY_REVIEW.json`。
- 新鲜原生 DRC **629 violations + 411 unconnected**；孔铜、铜板边、pad clearance 类报告为 0。仍有 199 courtyard overlap、21 孔/装配边界、16 丝印板边、2 文字高度、192 丝印压铜、199 丝印重叠；**不是整板 DRC PASS**。411 与正式 405 的区别含新连接器分立物理焊盘，不能理解为已完成布线。
- 机械外壳伸出板边、实际线缆/机架、样品贴合和厂商在线 DFM 仍须复核；此候选没有提高为装机验证 PASS。

打开 `X100_CleanSheet.kicad_pro`，或查看 `SCHEMATIC_REVIEW.pdf`。`NET.xml`、`ERC.json` 和几何摘要供复核；PDF 第 5 页是 USB 子页，并有未批准标记。板和原理图属于同一 connector-only 候选，电源仍是现有 data-only baseline。
