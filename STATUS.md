# 当前状态：六层V4，PCB DFM零危险

当前入口为[六层工程与下单资料](hardware/current/X100_6L_DFM_ZERO_DANGER/)，不是旧c8或旧45mm板。制造ZIP可用于提交嘉立创订单和工程审稿；没有因此自动得到完整制造放行。

- 174个PCB封装：144个功能位号、26个TP、4个安装孔；采购142实例、62种MPN。
- 61项源CAD/库表与本地已检查V4逐字节相同；PCB SHA256 `09537241b43be8cdf2aa150a8214c6ce9225da4f3d8592bd108919dc2d73b529`。
- 6层、JLC06161H-3313、名义1.6mm；约70×52mm外廓，四个Ø4 NPTH、孔距60×42mm。
- KiCad10.0.6 fresh ERC0；DRC0错误、0未连接、0parity，另56条lib_footprint_mismatch警告，完整记录未隐藏。
- 实际嘉立创PCB DFM任务DFMP2610310277：35结果行所报危险0、黄色468。没有把软件显示计数当作全部物理对象总数。
- 实际上传ZIP SHA256 `85254aca1ba4356953ddff8653cff87964dce0b77bb30dd6c1584126908b1bfc`；未混用旧包。

## 已完成与剩余

全部连接与本轮DFM红项已处理；新增局部路由与过孔读回核对、网表同一性及源文件身份已有证据。R113位置已改变，装联坐标必须使用当前版；原生CPL还需贴片方审核，不能当作SMT放行。

尚未关闭的是U101/D103整板热扩散、互热及有效热阻的设计风险接受，以及实际工厂填孔范围/叠层/生产稿确认。此前功耗与热指标是计算参考，不是当前整板温升实测或PASS；参考记录保留在当前目录的evidence/power_reference中。没有以缺实板为理由反复要求购买开发板，也没有把热设计缺口悄悄删成首板测试。

U101.9的六颗散热孔必须树脂填孔＋电镀盖帽，普通盖油不替代。当前官方六层默认工艺及J401原厂0.45mm槽的处理见[制造参数](hardware/current/X100_6L_DFM_ZERO_DANGER/manufacturing/嘉立创下单参数与六孔说明.md)。

采购表中C121/R105/U105/U106仍保留候选原字段，需结合已有人工裁决核对。淘宝链接仅为按完整型号搜索，店铺/价格/库存/批次未核验。没有采购、付款、下单或飞行测试。

| 状态项 | 当前记录 |
|---|---|
| PCB_DFM_REPORTED_DANGER | 0 |
| ERC_CHECK | 0违规 |
| DRC_ELECTRICAL_ERRORS / UNCONNECTED / PARITY | 0 / 0 / 0 |
| PCB_ORDER_INPUTS_CURRENT | YES，当前订单上传和工艺审稿资料 |
| POWER_SAFETY_REVIEW | NOT_SIGNED_OFF，整板热接受仍未闭合 |
| FACTORY_PROCESS_ACCEPTANCE | 待当前实际订单生产稿确认 |
| FULL_MANUFACTURING_RELEASE | 未宣告 |
| FLIGHT_VALIDATION | 未执行 |

main未合并；旧c8和旧正式目录保持。此前96/282等未连接数字只对应历史工程，不再作为当前板的状态。
