# 当前未解决问题

## 1. J601 connector manufacturability

两只JST GH MP pad铜到板边为 **0.000 mm**；EXT_5V pin1到H1 NPTH为 **0.075 mm**，共3条真实DRC。

建议的最小下一步是取得 **R204、J801、J802局部pose** 解冻，再人工重排J601/J701接口带。现有范围内的联合候选没有可靠方案；不认为45×45整体架构已经失败。不要移动H1、增加板尺寸、修剪JST官方land或全局放宽clearance。

## 2. J401 USB4105-GF-A internal hole clearance

4条逻辑DRC对应2处内部官方land几何，约 **0.1944 mm**：A1/B12与左侧定位NPTH、A12/B1与右侧定位NPTH。当前global hole rule为0.25 mm；没有特定结构的板厂接受证据。

优先取得JLCPCB对exact GCT官方land的明确CAM/fabrication接受。接受后仅作严格局部规则；拒绝后评估官方替代land或提出connector ECO。不要exclude整个J401，不全局降低孔距。

## 后续验证项

- J501：microSD edge10条已关闭，仍待物理样品、官方drawing/land证据重新实证与装机访问核对。
- 底部器件/机架净空、热插拔/TVS、startup overshoot、温升、USB backfeed测量及整板台架/首电尚未验收。
- 丝印/文字和courtyard metadata需在后续阶段分类收尾。当前无实体body冲突，但没有全板manufacturing DRC PASS。
