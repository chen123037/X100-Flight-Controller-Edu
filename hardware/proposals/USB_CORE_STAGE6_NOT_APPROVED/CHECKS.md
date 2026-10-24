# 复核方式

使用KiCad10.0.6，打开project/X100_CleanSheet.kicad_pro。项目库均使用${KIPRJMOD}，标准新电源IC封装来自KiCad10公共库。

```text
kicad-cli sch erc --format json --severity-all -o ERC_fresh.json project/X100_CleanSheet.kicad_sch
kicad-cli sch export netlist --format kicadxml -o NETLIST_fresh.xml project/X100_CleanSheet.kicad_sch
kicad-cli pcb drc --format json --severity-all --schematic-parity -o DRC_fresh.json project/X100_CleanSheet.kicad_pcb
```

CLI退出0不等于无违规；检查JSON类别和unconnected/parity。SHA256SUMS.json用于确认实际文件字节，不能替代电气/制造检查。报告中的路径可指向隔离工作目录，文件以本候选project内容为准。完整原厂PDF未复制到公开仓库，使用README原厂链接。
