> **实际货源核查已补充：** [62项商品页、库存、起订量、交期及同封装候选](actual_sourcing/)。核查快照为2026-10-31；54种原型国内足量、2种原型代购，5组立创供货缺口另列候选；SPL06按负责人确认淘宝有售保留，具体详情未独立核实。原工程及BOM未改。

# 当前淘宝器件搜索与购买清单

来源是本目录对应六层工程的 fresh KiCad 网表，逐位号比对厂家、MPN、参数和封装；不是旧45mm或c8的BOM。

- [Excel清单](X100_当前淘宝器件清单.xlsx)：采购汇总、142位号明细、配套与不采购。汇总B4默认为1块板，可修改板数，计划数量自动重算，不含备件和焊接损耗。
- [62种MPN汇总CSV](淘宝采购汇总_62种.csv) · [142位号CSV](器件位号明细_142项.csv)
- [另购线束等](配套线束及另购事项.csv) · [32项不购实体](无需采购的PCB实体_32项.csv)

**每板需采购142个器件实例，合并为62种完整MPN。** 174个PCB封装还包含26个裸铜测点、4个安装孔、JP601焊锡桥和J808焊线焊盘；这32项不采购电子元器件。

淘宝链接都是按“厂家＋完整MPN＋封装”构造的搜索入口，不是已经验真或确认现货的商品链接。未核验店铺、售价、库存、批次、真伪或交期。没有用搜索结果替换冻结型号。

## 先核对这些事项

- C121、R105、U105、U106的源字段仍含候选/未批准文字，表中保留这些原字段，没有擅自改成最终接受。它们也可能含尚未回写的旧状态，应结合已有人工裁决核对，不能把这张表当作新增采购批准或重复设计审批。
- R105当前设计为53.6k、0.1%、0805，YAGEO RT0805BRD0753K6L；不能买回旧52.3k，也不能不核对精度就替换普通电阻。
- MCU是STM32H743VIT6，LQFP100；保留项目对硅版本V的要求，不能用其它Flash容量/封装或开发板模块替代。
- IMU买BMI088裸芯片，不买BMI088模块；气压计是SPL06-001，不是未经确认的SPL06兼容模块。
- J401买Amphenol 124019772112A；L101买Bourns SRP1038A-100M；D103保留STPS8H100G-TR的D2PAK，未采用小封装候选。
- 电阻、电容不能只按阻值/容量买：同时核对0805/0603/1210、精度、耐压、X7R/C0G及功率。C105/C108/C119/C121为有极性的指定OS-CON系列。
- Y201为TAITIEN XJHCELNANF-8M，8MHz/CL20pF、指定大封装；不要按“8MHz”随意买成2520小晶振。
- JST GH为1.25mm系列，别买成外观相近的PH、SH或其它“1.25”接插件。配套GHR-04V-S两组、GHR-06V-S四组；若自行压接，一板端全部接满共32枚SSHL-002T-P0.2端子。买成品线则不重复买端子；线序按原理图，不按线色猜。
- microSD本体完整型号尚未冻结。已记录要求为microSDHC16/32GB、3.3V/FAT32，启动/初始化/读写瞬态均≤200mA需型号资料或验证；Molex1040310811只是卡座，速度等级不能证明电流上限。

GH配套型号依据：[JST官方GH系列页](https://www.jst-mfg.com/product/index.php?lang=2&series=105)。其它MPN的原厂资料链接随CSV保留。

## 单板完整MPN与数量

| 类别 | 厂家 | 完整MPN | 封装 | 每板数量 | 位号 |
|---|---|---|---|---:|---|
| 电容 | KEMET | C1210C106K5RACTU | 1210 | 8 | C101,C102,C103,C104,C111,C118,C208,C502 |
| 电容 | Panasonic | 50SVPF39M | OS-CON E12 diameter8 height11.9 | 1 | C105 |
| 电容 | KEMET | C0603C104K5RACTU | 0603 | 19 | C106,C107,C112,C117,C203,C204,C205,C206,C207,C210,C211,C301,C302,C303,C304,C402,C501,C601,C805 |
| 电容 | Panasonic | 16SVPF180M | OS-CON C6 diameter6.3 height5.9 | 2 | C108,C121 |
| 电容 | KEMET | C0805C223K5RACTU | 0805 | 3 | C109,C803,C804 |
| 电容 | KEMET | C0805C241J5GACTU | 0805 | 1 | C110 |
| 电容 | KEMET | C1210C226K4RACTU | 1210 | 2 | C113,C114 |
| 电容 | KEMET | C0805C225K4RACTU | 0805 | 5 | C115,C116,C201,C202,C209 |
| 电容 | Panasonic | 16SVPF82M | OS-CON B6 diameter5 height5.9 | 1 | C119 |
| 电容 | KEMET | C0805C105K4RACTU | 0805 | 5 | C120,C123,C124,C125,C126 |
| 电容 | KEMET | C0805C104K5RACTU | 0805 | 4 | C212,C401,C801,C802 |
| 电容 | YAGEO | CC0805JRNPO9BN330 | 0805 | 2 | C213,C214 |
| 二极管或LED | Nexperia | BZT52H-C12,115 | SOD123F | 1 | D101 |
| 二极管或LED | ST | SMBJ26CA-TR | SMB DO214AA | 1 | D102 |
| 二极管或LED | ST | STPS8H100G-TR | D2PAK A/K/tabK | 1 | D103 |
| 二极管或LED | Lite-On | LTST-C170GKT | 0805 LED | 2 | D201,D202 |
| 保险丝 | Littelfuse | 0451003.MRL | NANO2 451 SMD | 1 | F101 |
| 连接器 | Amphenol | 124019772112A | USB-C dual-row SMT / 4 plated SH slots | 1 | J401 |
| 连接器 | Molex | 1040310811 | microSD SMT push-pull8+2detect | 1 | J501 |
| 连接器 | JST | SM04B-GHS-TB(LF)(SN) | GH1.25 4P side-entry SMT | 2 | J601,J704 |
| 连接器 | JST | SM06B-GHS-TB(LF)(SN) | GH1.25 6P side-entry SMT | 4 | J701,J702,J703,J809 |
| 连接器 | Samtec | TSW-102-07-G-S | 1x2 2.54 THT top insertion | 6 | J801,J802,J803,J804,J805,J806 |
| 连接器 | Samtec | TSW-105-07-G-S | 1x5 2.54 THT top insertion | 1 | J807 |
| 电感 | Bourns | SRP1038A-100M | Lead-frame SMD; case max11.5x10.3x4.0mm | 1 | L101 |
| 电感 | Bourns | SRN6045-4R7Y | 6x6x4.5 SMD visible end terminals | 1 | L102 |
| MOS管 | Diodes | DMP6023LSS-13 | SO8 | 1 | Q101 |
| 电阻 | YAGEO | RC0805FR-0720KL | 0805 | 2 | R101,R806 |
| 电阻 | YAGEO | RC0805FR-07294KL | 0805 | 1 | R102 |
| 电阻 | YAGEO | RC0805FR-0754K9L | 0805 | 1 | R103 |
| 电阻 | YAGEO | RC0805FR-07200KL | 0805 | 1 | R104 |
| 电阻 | YAGEO | RT0805BRD0753K6L | 0805 | 1 | R105 |
| 电阻 | YAGEO | RT0805BRD0710KL | 0805 | 3 | R106,R112,R802 |
| 电阻 | YAGEO | RC0805FR-0718K7L | 0805 | 1 | R107 |
| 电阻 | YAGEO | RC0805FR-0710RL | 0805 | 2 | R108,R201 |
| 电阻 | YAGEO | RC0805FR-0722K1L | 0805 | 2 | R109,R805 |
| 电阻 | YAGEO | RC0805FR-0710KL | 0805 | 10 | R110,R114,R203,R204,R301,R302,R403,R603,R604,R811 |
| 电阻 | Yageo | RT0805BRD0733K2L |  | 1 | R111 |
| 电阻 | YAGEO | RT0805BRD0749K9L |  | 1 | R113 |
| 电阻 | YAGEO | RC0805FR-07120RL | 0805 | 2 | R205,R602 |
| 电阻 | YAGEO | RC0805FR-071KL | 0805 | 5 | R206,R803,R804,R807,R808 |
| 电阻 | YAGEO | RC0805FR-071K2L | 0805 | 1 | R207 |
| 电阻 | YAGEO | RC0805FR-074K7L | 0805 | 4 | R303,R304,R701,R702 |
| 电阻 | YAGEO | RC0805FR-075K1L | 0805 | 2 | R401,R402 |
| 电阻 | YAGEO | RC0805FR-07100KL | 0805 | 1 | R404 |
| 电阻 | YAGEO | RC0805JR-070RL | 0805 | 1 | R501 |
| 电阻 | YAGEO | RC0805FR-0747KL | 0805 | 5 | R502,R503,R504,R505,R506 |
| 电阻 | YAGEO | RT0805BRD07150KL | 0805 | 1 | R801 |
| 电阻 | YAGEO | RC0805FR-071M3L | 0805 | 2 | R809,R810 |
| 芯片 | TI | TPS54360BDDAR | DDA0008B HSOIC8 EP | 1 | U101 |
| 芯片 | Diodes | AP63203WU-7 | TSOT26 | 1 | U102 |
| 芯片 | TI | TPS7A2033PDBVR | DBV5 SOT23-5 | 1 | U103 |
| 芯片 | TI | TPS2553DBVR | DBV6 SOT23-6 | 2 | U104,U106 |
| 芯片 | Texas Instruments | TPS2116DRLR |  | 1 | U105 |
| 芯片 | ST | STM32H743VIT6 | LQFP100 14x14 P0.5 | 1 | U201 |
| 芯片 | Bosch | BMI088 | LGA16 3x4.5 | 1 | U301 |
| 芯片 | Goertek | SPL06-001 | LGA8 2x2.5 | 1 | U302 |
| 芯片 | TI | TPD4E1U06DBVR | DBV SOT-23-6 | 1 | U401 |
| 芯片 | TI | SN74LVC1G17DBVR | DBV5 SOT23-5 | 1 | U402 |
| 芯片 | Texas Instruments | TPD2E2U06QDBZRQ1 | DBZ / SOT-23-3 | 1 | U403 |
| 芯片 | Texas Instruments | TCAN3414DR | TI D0008A SOIC-8 | 1 | U601 |
| 芯片 | TI | TMUX1511PWR | PW14 TSSOP14 0.65mm visible leads | 1 | U801 |
| 晶振 | TAITIEN | XJHCELNANF-8M | HC49-class 2SMD 12.5x4.5x4 | 1 | Y201 |
