# 接手顺序

先读 [STATUS](STATUS.md)、[KNOWN_ISSUES](docs/KNOWN_ISSUES.md)，再打开 `hardware/X100_V1/X100_CleanSheet.kicad_pro`。

**DO NOT restart component selection. DO NOT redo schematic architecture. DO NOT resize board.**

保持45×45、安装孔、MCU/BMI088、主Buck核心及USB安全ECO。没有明确 PCB_BLOCKER 证据和技术授权，不移动核心、不改 pin/net/MPN。不得靠全局放宽 clearance 或 blanket exclusion 清 DRC。

1. **关闭 J601。** 先提出只释放 R204、J801、J802 局部 pose 的人工裁决，再手工工程重排 J601/J701 接口带。J702、CAN support/JP601需一起检查插拔与可焊可吸锡空间。每个局部 blocker 最多3轮主要方案，少量候选后直接 readback/DRC 接受或拒绝，不做大规模packing。
2. **关闭 J401。** 先取得 JLCPCB 对 exact GCT 官方 land 两处内部孔/铜结构的明确制造/CAM结论。接受后才可设置严格限定 pad/hole pair 的局部规则；拒绝则提出官方替代 land 或 connector ECO。禁止全局降低 hole clearance。
3. **Fresh ERC / DRC / geometry。** 电气实体仍201，七条真实问题全部关闭，实际body冲突0、库mismatch0，冻结制造规则保持。检查CAN终端分支、USB安全和Buck局部质量。
4. 只有门槛成立并经人工确认 `ROUTING_PRECONDITIONS_MET=YES`，再等待明确 **PCB03 FORMAL ROUTING** 授权；当前教学基线没有该授权。

不回滚已通过的microSD五项pose，不再次选择ICM-42688-P/DPS310，不复制历史TEST铜。不从本仓库直接生成制造订单。器件首电和ArduPilot软件bring-up见 [BRINGUP_PLAN](docs/BRINGUP_PLAN.md)。
