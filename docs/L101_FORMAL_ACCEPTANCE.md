# L101 正式替换接受记录 — 2026-10-23

用户已正式批准 **Bourns SRP1038A-100M / LCSC C780184**。唯一CAD执行器 `plant_kicad_v1` 完成原理图、符号库、PCB封装与B面(114,97,0°)集成；保持10µH、pad1 MAIN_SW / pad2 5V_MAIN。复用已核验Lead Frame焊盘4.1×3.5mm、中心距9.5mm，无钻孔/VIP；最大外形11.5×10.3×4.0mm。无需再次申请该型号批准。未采购、未下单。

fresh ERC **0错误/0警告**，native schematic parity **0**，封装库一致性 **0问题**。201电气器件+4孔；全部网络、符号UUID、PCB UUID/path、其余204个PCB实体的值/封装/焊盘/网络/位置保持。板框、安装孔、规则不变；未推广Y201或USB新电源候选。庭院172→170对，节省40.192mm²；全板仍有 **599条DRC报告、411未连接**（部分报告类别封顶），轨迹/过孔/铺铜0/0/0，不能制造。

当前基线 `POST_L101_FORMAL_BASELINE`，取代POST_MCU_CORRIDOR_SHIFT作为后续正式编辑起点。[原生检查](evidence/L101_FORMAL_20261023/REVIEW.json)、[ERC](evidence/L101_FORMAL_20261023/ERC.json)、[DRC](evidence/L101_FORMAL_20261023/DRC.json)、[网表](evidence/L101_FORMAL_20261023/NETLIST.xml)、[基线](evidence/L101_FORMAL_20261023/BASELINE.json)。候选目录名NOT_APPROVED保留历史，不代表本次批准失效；旧候选不得整板覆盖正式源。

## 实际5V负载复核

依据已有0.889A MCU轨、25mA传感LDO、全部EXT接口共享1A合同，加5mA控制预留，以3.33V/4.90V和80%转换效率工程假设折算连续 **1.785A**。保留更保守的旧1.823619A热筛选点、追加64mA MCU轨增量和5mA预留，得到连续筛选 **1.883A**、30%容量要求 **2.448A**。没有削减既定外设预算，也不把USB轻载估计用于电池满功能预算。

沿用L=6.4µH、400kHz、Vin25.2V、输出5.5V保护性上界、1V续流压降和估计125°C DCR，容量点峰值约 **3.423A**，与4.5A最低限流的算术距离约1.077A。这是依赖假设的筛查，**不是保证热态安全裕量**。低输入8.55V的近似dropout需求约6.134V；BOOT及动态能力仍待核验。[逐工况计算与分类](evidence/L101_FORMAL_20261023/ACTUAL_LOAD_SCREEN.json)。

原 **3.5A→4.475A峰值** 极端合并工况完整保留；其距4.5A仅24.8mA，明确不可视为已经验证的安全裕量，也不保证本板可持续输出3.5A。原厂30mΩ是25°C DCR最大值；7.5A/40°C温升与12A/20%电感下降为规定条件值，不能当热态最小保证。原厂资料：[Bourns](https://www.bourns.com/docs/product-datasheets/srp1038a.pdf)、[TI](https://www.ti.com/lit/ds/symlink/tps54360b.pdf)。

正常连续筛选点估计125°C绕组铜损0.161W，容量点0.264W；未含core/AC loss。启动按600kHz/1024cycle和实际直接电容加传感滤波支路上界239.21µF计算平均充电0.771A；它不是瞬时上界，也未覆盖EXT/3V3下游启动波形。未批准Stage6额外大电容的条件筛查平均充电约1.467A，叠加连续筛选和半纹波约4.325A，仍须收紧启动负载与电容/时序设计，不能沿用旧200µF补偿模型直接PASS。

现阶段电流计算未显示必须撤销该10µH型号的稳态硬阻塞，可以继续电源布局/布线。补偿需按真实全部支路电容和容差重算；短路延迟120ns仍只是工程假设，热态L(I)、核心损耗、IC/二极管散热、输入TVS/保险/MOS SOA、启动/切换/短路波形均未完成。实物项目进入首板Bring-up，不因暂无实板暂停PCB设计。`POWER_SAFETY_REVIEW=NOT_COMPLETE`、`DRC_FINAL=NOT_PASS`、`PCB_MANUFACTURING_PACKAGE=NOT_READY`。
