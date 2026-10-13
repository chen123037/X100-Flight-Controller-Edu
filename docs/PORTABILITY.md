# 可移植性与基线边界

在另一台计算机安装KiCad 10及标准库后，打开`hardware/X100_V1/X100_CleanSheet.kicad_pro`。项目symbol table使用`${KIPRJMOD}/X100_Physical.kicad_sym`；两个footprint library使用同目录`.pretty`。root和8个子页都随仓库提供。

所有38种实际使用的自定义footprints随仓库提供。标准3D模型由`${KICAD10_3DMODEL_DIR}`解析，没有本机盘符/账户路径。不要把缺失datasheet附件当作必须重新选型的理由，资料入口统一见SOURCES。

只在staging副本做了SPL06-001 Datasheet资料路径修正：三个文件、四处字段，由原工作区外PDF路径改为`${KIPRJMOD}/../../docs/SOURCES.md`。没有电气、几何、net、MPN、UUID、footprint、rule或板框变化。其它硬件文件保持源字节；正式工程与原audit/checkpoint文件未修改。

原正式PCB SHA256：`8040b6f955cfccfc8e2c8457916d6c75c48ca312b05f0d58f6214acf4d31fc35`。公开副本PCB SHA256：`24917ca5ed05131809634058098a457317bc46a0df5ab6cb74715cd5504e3e37`；差异仅上述资料字段。完整public相对路径checksums在BASELINE_HASHES.sha256。可移植性验证摘要在PUBLIC_REPO_AUDIT.md。

CSV采用UTF-8。使用Excel导入时，把MPN、Reference和Package列设为文本，避免自动把`0603`等封装代码显示为`603`；原CSV保留源值，Quantity为数值。
