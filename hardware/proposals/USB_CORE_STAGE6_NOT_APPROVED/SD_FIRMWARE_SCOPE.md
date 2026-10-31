# X100 USB-only 的 SD 软件范围核查

只读源码核查；未修改ArduPilot/ChibiOS生产代码，未声称完整固件编译或运行通过。ArduPilot基线9165d22419406556fc9815d9f4e3e299e13713a8，ChibiOS9aebaf4a40442277d01bd9dd38c13713fc45ef41。

1. `libraries/AP_HAL_ChibiOS/hwdef/scripts/chibios_hwdef.py`的`get_PUPDR_value()`默认给SDMMC CMD/D0–D3内部上拉；`hwdef/common/board.c::__early_init()`先初始化GPIO，再进行时钟初始化。因此只在应用后期停止SD不覆盖最早GPIO配置。
2. `sdcard.cpp::sdcard_init_raw()`执行sdcStart/sdcConnect；`sdcard_retry()`可以重新初始化。`AP_Filesystem/AP_Filesystem_FATFS.cpp::remount_file_system()/retry_mount()`调用重试；`USB_MSD.cpp::usb_msd_run()`直接调用raw入口；bootloader的`flash_from_sd.cpp`另有SD初始化路径。仅屏蔽一个首次调用不覆盖这些入口。默认card-inserted回调返回true，不能用它假设具备有效卡检测。
3. `Storage.cpp::_storage_open()`在配置STORAGE_FLASH_PAGE时选Flash后端；只有没有Flash后端且USE_POSIX等条件成立时才走SD存储分支。SD并非框架不可避免的参数存储依赖。最终X100必须核对实际生成的hwdef/Flash分区、引导器和应用尺寸、参数断电保持；当前静态时钟探针不代表此项完成。
4. 软件最小适配范围是板级安全GPIO初态、最底层SD初始化入口的电源模式判定、无卡/USB-only时返回不可用且保留Flash参数后端；USB mass storage及SD刷写在无SD供电时应明确拒绝。源切换和USB suspend还须关停外设并park GPIO。本文没有实施或证明这些钩子，也不要求大规模重构通用框架。
5. VBAT突然失效时，硬件供电与GPIO状态可能先于软件切换发生变化；仅源码读取不能保证无反向注入。保留当前硬件隔离，未借缺实板默认通过，也未因缺实板停止工程。

独立原厂规格、电流预算和首板示波器/USB记录仍分别需要。该核查不删除VBAT模式SD日志功能，不将SD加入USB-only强制负载，也不把估计写为实测PASS。
