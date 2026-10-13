# 正式统一选型

以下来自冻结原理图/网表，整理现有结论，不重新比较或推荐替代。普通R/C冻结规格，原字段中的优选MPN不等于唯一Exact MPN；采购角色见BOM的`MPN Role`与`Procurement Policy`。

| Function | Reference | Exact MPN | Package | Status | Reason | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| MCU | U201 | STM32H743VIT6 | LQFP100 14x14 P0.5 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | NOT_TESTED |
| IMU | U301 | BMI088 | LGA16 3x4.5 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | NOT_TESTED |
| Barometer | U302 | SPL06-001 | LGA8 2x2.5 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | NOT_TESTED |
| microSD / SDMMC1 4-bit | J501 | 1040310811 | microSD SMT push-pull8+2detect | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | PENDING_SAMPLE_VERIFICATION；SDMMC1 4-bit |
| USB-C | J401 | USB4105-GF-A | default0.95mm stake Type-C16P | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | BENCH_VERIFY |
| USB DP/DM ESD | U401 | TPD2E2U06QDBZRQ1 | DBZ / SOT-23-3 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | 2个数据/电源通道+GND，无外接VBUS steering电源脚；ECO闭合，待bench |
| USB VBUS ESD | U403 | TPD2E2U06QDBZRQ1 | DBZ / SOT-23-3 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | 2个数据/电源通道+GND，无外接VBUS steering电源脚；ECO闭合，待bench |
| USB CC ESD | U404 | TPD2E2U06QDBZRQ1 | DBZ / SOT-23-3 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | 2个数据/电源通道+GND，无外接VBUS steering电源脚；ECO闭合，待bench |
| USB VBUS sense | U402 | SN74LVC1G17DBVR | DBV5 SOT23-5 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | BENCH_VERIFY |
| CAN transceiver | U601 | TCAN3414DR | TI D0008A SOIC-8 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | BENCH_VERIFY |
| CAN connector | J601 | SM04B-GHS-TB(LF)(SN) | GH1.25 4P side-entry SMT | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | NOT_TESTED |
| Main 5V buck | U101 | TPS54360BDDAR | DDA0008B HSOIC8 EP | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | BENCH_VERIFY |
| Main rectifier | D103 | STPS8H100G-TR | D2PAK A/K/tabK | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | NOT_TESTED |
| Main inductor | L101 | SRP1265A-100M | 13.5x12.5x6.2 SMD | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | NOT_TESTED |
| 3V3 buck | U102 | AP63203WU-7 | TSOT26 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | BENCH_VERIFY |
| 3V3 inductor | L102 | SRN6045-4R7Y | 6x6x4.5 SMD visible end terminals | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | NOT_TESTED |
| Sensor LDO | U103 | TPS7A2033PDBVR | DBV5 SOT23-5 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | BENCH_VERIFY |
| External 5V current limit | U104 | TPS2553DBVR | DBV6 SOT23-6 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | BENCH_VERIFY |
| CAN 120R | R602 | — | 0805 | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | NOT_TESTED |
| CAN solder bridge | JP601 | — | CAN_SolderJumper_2_Open_Pad1p0x1p5_NoPaste | FINAL_SELECTED_FOR_V1 | 已冻结V1决定 | OPEN=off；手工bridge=on；NO PASTE；无独立BOM零件 |
| Alternative IMU | — | ICM-42688-P | — | NOT_SELECTED_FOR_V1 | 现有V1选型已冻结为BMI088 | 不进入BOM，不重新比较 |
| Alternative barometer | — | DPS310 | — | NOT_SELECTED_FOR_V1 | 现有V1选型已冻结为SPL06-001 | 不进入BOM，不重新比较 |

完整201个电气实体状态见`bom/component_status.csv`。`X100_V1_BOM.csv`从正式原理图非排除component生成：200行，Quantity均为源实体数1，含65个测试点PCB feature。135行是装配component。JP601源`exclude_from_bom`保持，不列为采购件；它仍是201个电气footprints之一。H1–H4为板孔，不是电气BOM器件。
