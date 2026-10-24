# Y201 紧凑 8MHz 晶体候选：等待型号替换批准

2026-10-23。本工程仅为独立候选，**未写入正式源，不可投板或采购**。

拟采用 YXC（扬兴）`XG1EL89CSI-111YLC-8M`，立创 `C5280575`，5032两脚无源晶体；替换当前TAITIEN `XJHCELNANF-8M`。R205首板初装值拟由120Ω调整为100Ω（仍为0805、1%、TCR不高于100ppm/°C，首选RC0805FR-07100RL）。C213/C214仍为33pF C0G；MCU、IMU、气压计、全部GPIO/网络、8MHz HSE及45mm板框/孔位保持。不需要因晶体频率修改固件时钟参数。

## 具体可审查结果

- 唯一CAD执行器为`plant_kicad_v1`，候选201个电气器件/205个PCB封装。ERC0错误0警告，原生schematic parity0；引脚网络、源symbol UUID、PCB UUID/层级身份均保持。
- 晶体按原厂建议建立两块1.7×2.4mm焊盘，中间2.0mm空隙、中心距3.7mm；无孔、无via-in-pad。最大壳体按5.15×3.35×1.35mm核查，0.5mm局部courtyard包络保持。
- Y201 courtyard面积85.0401→27.7326mm²，释放57.3075mm²。移近两颗负载电容后，完整courtyard重叠234→224对，无新增配对；孔、实体、跨面与插拔通道检查无新增冲突。
- Y201、C213、C214三处PCB放置调整；R205位置保持。五项关键时钟焊盘间几何距离均缩短或保持，见REVIEW.json。它们是焊盘间距，**不是已经完成的走线长度**。
- 正式源55项CAD SHA256无变化。其它201个非目标PCB封装保持。候选原生DRC仍报告630项、411未连接，部分类别存在199条报告上限；没有全板DRC或制造PASS。

## 电气筛查与首板项目

[原厂YSX530GA机械/电气资料](https://www.yxc.hk/uploadfiles/2024/02/20240222145814706.pdf)给出8–16MHz档ESR≤80Ω、C0≤5pF；[完整型号采购记录](https://www.lcsc.com/product-detail/C5280575.html)明确8MHz、20pF、±10ppm、温漂±20ppm、−40～85°C，且对应同一原厂资料。本次不采用旧升级型号C115962，也不接受只写“5032/8M”的模糊替代。

依据[ST DS12110 Rev11](https://www.st.com/resource/en/datasheet/stm32h743bi.pdf)与[AN2867 Rev24](https://www.st.com/resource/en/application_note/an2867-oscillator-design-guide-for-stm8afals-stm32-mcus-and-mpus-stmicroelectronics.pdf)，计入外串电阻、33pF±5%及0.3%温漂包络、电阻公差/100ppm温漂及2–5pF寄生电容假设：R205=100Ω时最坏计算gmcrit约1.379mA/V，小于ST的1.5mA/V限值；120Ω在同一角落约1.533mA/V，故不沿用旧值。1.5mA/V本身是Gm_crit_max，不再额外错误除以5。详见PARAMETER_SCREEN.json。

这是有明确假设的参数筛查，寄生电容上界并非实测保证。**300µW激励功率上限、冷/热启动、负阻裕量及频率偏移尚未验证，不能写成实测PASS或认定激励安全已经通过。** 这些项目随首板按AN2867测量；若激励过高或启动不足，调整可更换的0805 R205后重新验证。无需先额外购买开发板。

申请的授权仅为：正式接受该完整晶体型号与R205初装方案，允许后续正式集成和布局/布线。它不包含采购、付款、下单、实测功能PASS或飞行放行。J401已经批准，不在本次重复申请范围内。

文件：`project/X100_CleanSheet.kicad_pro`可在KiCad10打开；`REVIEW.json`为原生/几何复核，`PARAMETER_SCREEN.json`为可区分假设的计算；`SHA256SUMS.json`标识候选快照。正式源仍为`hardware/X100_V1`。


参数标注更正：首选RC0805FR-07100RL的[原厂专用规格页](https://www.yageogroup.com/component-documentation/download/specsheet/RC0805FR-07100RL)明确TCR为±100ppm/°C。候选原理图、PCB字段及计算已据此更正；不再沿用50ppm假设。晶体完整型号、100Ω初装值与三处放置方案保持，ERC仍0/0、原生一致性0。


正式源后续更新：右侧八件放置已另行接受，见[正式净空复核](../../../docs/RIGHT_PORT_CLEARANCE_REVIEW.md)。本候选仍保持其原检查快照；获批后仅集成晶体/R205与三处时钟放置，不整项目覆盖正式源，避免回滚新接口位置。


2026-10-23封装元数据修复：通过plant_kicad_v1补齐库封装的SMD类型，原生lib mismatch由1→0；公开候选fresh ERC0/0、parity0、DRC629+411。PCB/原理图/型号/焊盘几何未变，原234→224几何结果仍仅属于旧父基线。当前正式MCU已右移1mm；批准后应按差异集成并重算HSE几何，绝不整板覆盖。此次无需重新批准同一候选型号，正式替换仍待原审批答复。
