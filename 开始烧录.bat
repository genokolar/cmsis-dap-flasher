@echo off

:Init
REM ======设置编码为utf8======
chcp 65001
set ver=yyyymmdd-xxxxxxxx
Set tle=固件日期:%ver:~-0,8%
Set var=0

:Start
Title CMSIS-DAP烧录 %tle%
MODE con: Cols=50 Lines=36
Color 3F
GOTO USEPYOCD

REM ======首先选择烧录工具======
:CHO
cls
echo 「 选择烧录工具 」
echo.
echo 选项:
echo       [1].   OpenOCD
echo.
echo       [2].   PyOCD
echo.
echo       [Ｑ].  退出
echo.
echo.
echo.
echo    OpenOCD 与 PyOCD 烧录效果一致
echo.
echo    如不明白区别可以随意选择
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto USEOPENOCD
if /i "%choice%" == "2" cls&Goto USEPYOCD
if /i "%choice%" == "q" Popd&Exit
Set var=1
Goto CHO

REM ======设置OpenOCD相关参数======
:USEOPENOCD
:: ocdcmd0 = 清空芯片  ocdcmd1=烧录命令前段 ocdcmd2=烧录命令后段
:: ocdcmd3 = 重启芯片  ocdcmd4=列表烧录器   ocdcmd5=完整清空芯片
Set PATH=%PATH%%~dp0%openocd;
Set ocdcmd0=openocd -f nrf52.cfg -c init -c "reset init" -c "nrf5 mass_erase" -c exit 
Set ocdcmd1=openocd -f nrf52.cfg -c "program
Set ocdcmd2=verify reset" -c exit
Set ocdcmd3=openocd -f nrf52.cfg -c init -c "reset run" -c exit 
Set ocdcmd4=openocd -c "adapter driver cmsis-dap" -c "init;cmsis-dap info"
Set ocdcmd5=openocd -f nrf52.cfg -c init -c "reset init" -c "nrf5 mass_erase" -c exit
cd openocd
Goto Menu

REM ======设置PyOCD相关参数======
:USEPYOCD
Set PATH=%PATH%%~dp0%pyocd;
Set ocdcmd0=pyocd cmd -t nrf52 -c erase
Set ocdcmd1=pyocd flash -t nrf52 -e sector -f 1M
Set ocdcmd2= 
Set ocdcmd3=pyocd cmd -t nrf52 -c reset
Set ocdcmd4=pyocd list
Set ocdcmd5=pyocd erase -t nrf52 -c
cd pyocd
Goto Menu


REM ======键盘选择菜单======
:Menu
Title CMSIS-DAP烧录 %tle%
MODE con: Cols=50 Lines=36
Color 3F
cls
echo 「 完整固件烧录 版本：%ver% 」
echo.
echo 选项:
echo       [1].   烧录固件 Farad69
echo.
echo       [2].   烧录固件 Omega50
echo.
echo       [3].   烧录固件 GT BLE60
echo.
echo       [4].   烧录固件 Omega45
echo.
echo       [5].   烧录固件 Omega84
echo.
echo       [6].   烧录固件 Omega64
echo.
echo       [7].   烧录固件 NewHope64
echo.
echo       [8].   烧录固件 GT PAD
echo.
echo       [9].   烧录固件 GT Planck
echo.
echo       [10].  烧录固件 Omega40
echo.
echo       [11].  烧录固件 GT Volta9
echo.
echo       [L].   显示烧录器信息
echo.
echo       [O].   完全清空重置键盘
echo.
echo       [C].   手动输入命令
echo.
echo       [Ｑ].  退出
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto MENUFARAD69
if /i "%choice%" == "2" cls&Goto MENUOMEGA50
if /i "%choice%" == "3" cls&Goto MENUBLE60
if /i "%choice%" == "4" cls&Goto MENUOMEGA45
if /i "%choice%" == "5" cls&Goto FLASH84
if /i "%choice%" == "6" cls&Goto FLASH64
if /i "%choice%" == "7" cls&Goto MENUNEWHOPE64
if /i "%choice%" == "8" cls&Goto MENUPAD
if /i "%choice%" == "9" cls&Goto MENUPLANCK
if /i "%choice%" == "10" cls&Goto MENUOMEGA40
if /i "%choice%" == "11" cls&Goto FLASHVOLTA9
if /i "%choice%" == "0" cls&Goto TEST
if /i "%choice%" == "L" cls&Goto LIST
if /i "%choice%" == "O" cls&Goto CLEAN
if /i "%choice%" == "C" cls&Goto GOCMD
if /i "%choice%" == "Q" Popd&Exit
Set var=1
Goto Menu


REM ======以下为键盘版本选择菜单======
:MENUFARAD69
cls
echo 「 选择 Farad69 版本 」
echo.
echo 选项:
echo       [1].   烧录固件 Farad69 rev.B
echo.
echo       [2].   烧录固件 Farad69 rev.C
echo.
echo       [3].   烧录固件 Farad69 rev.D
echo.
echo       [R].   返回上一级
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASH69B
if /i "%choice%" == "2" cls&Goto FLASH69C
if /i "%choice%" == "3" cls&Goto FLASH69D
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUFARAD69

:MENUOMEGA50
cls
echo 「 选择 Omega50 版本 」
echo.
echo 选项:
echo       [1].   烧录固件 Omega50 rev.A
echo.
echo       [2].   烧录固件 Omega50 rev.B
echo.
echo       [3].   烧录固件 Omega50 rev.C
echo.
echo       [R].   返回上一级
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASH50A
if /i "%choice%" == "2" cls&Goto FLASH50B
if /i "%choice%" == "3" cls&Goto FLASH50C
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUOMEGA50

:MENUBLE60
cls
echo 「 选择 GT BLE60 版本 」
echo.
echo 选项:
echo       [1].   烧录固件 GT BLE60 rev.E
echo.
echo       [2].   烧录固件 GT BLE60 rev.F
echo.
echo       [3].   烧录固件 GT BLE60 rev.G
echo.
echo       [R].   返回上一级
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASH60E
if /i "%choice%" == "2" cls&Goto FLASH60F
if /i "%choice%" == "3" cls&Goto FLASH60G
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUBLE60

:MENUOMEGA45
cls
echo 「 选择 Omega45 版本 」
echo.
echo 选项:
echo       [1].   烧录固件 Omega45 rev.C
echo.
echo       [2].   烧录固件 Omega45 rev.D
echo.
echo       [3].   烧录固件 Omega45 rev.E
echo.
echo       [4].   烧录固件 Omega45 rev.F
echo.
echo       [R].   返回上一级
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASH45C
if /i "%choice%" == "2" cls&Goto FLASH45D
if /i "%choice%" == "3" cls&Goto FLASH45E
if /i "%choice%" == "4" cls&Goto MENUOMEGA45F
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUOMEGA45

:MENUOMEGA45F
cls
echo 「 选择Omega45 Rev.F的芯片版本 」
echo.
echo 选项:
echo       [1].   烧录固件 nRF52832芯片版
echo.
echo       [2].   烧录固件 nRF52810芯片版
echo.
echo       [R].   返回上一级
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASHOMEGA45F52832
if /i "%choice%" == "2" cls&Goto FLASHOMEGA45F52810
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUOMEGA45F

:MENUPAD
cls
echo 「 选择 GT PAD 版本 」
echo.
echo 选项:
echo       [1].   烧录固件 GT PAD rev.A
echo.
echo       [2].   烧录固件 GT PAD rev.B
echo.
echo       [3].   烧录固件 GT PAD rev.C
echo.
echo       [R].   返回上一级
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASHPADA
if /i "%choice%" == "2" cls&Goto FLASHPADB
if /i "%choice%" == "3" cls&Goto FLASHPADC
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUPAD

:MENUNEWHOPE64
cls
echo 「 选择 NewHope64 版本 」
echo.
echo 选项:
echo       [1].   烧录固件 NewHope64 Rev.A
echo.
echo       [2].   烧录固件 NewHope64 Rev.B
echo.
echo       [R].   返回上一级
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASHNEWHOPE64A
if /i "%choice%" == "2" cls&Goto FLASHNEWHOPE64B
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUNEWHOPE64


:MENUPLANCK
cls
echo 「 选择GT Planck的芯片版本 」
echo.
echo 选项:
echo       [1].   烧录固件 nRF52832芯片版
echo.
echo       [2].   烧录固件 nRF52811芯片版
echo.
echo       [R].   返回上一级
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASHPLANCK52832
if /i "%choice%" == "2" cls&Goto FLASHPLANCK52811
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUPLANCK


:MENUOMEGA40
cls
echo 「 选择Omega40 Rev.A的芯片版本 」
echo.
echo 选项:
echo       [1].   烧录固件 nRF52832芯片版
echo.
echo       [2].   烧录固件 nRF52810芯片版
echo.
echo       [R].   返回上一级
echo.
echo ---------------------------------------
if %var% neq 0 echo (输入无效请重新输入)
Set choice=
Set /p choice=选择: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASHOMEGA4052832
if /i "%choice%" == "2" cls&Goto FLASHOMEGA4052810
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUOMEGA40


REM ======以下为键盘刷写命令======
:FLASH69B
echo 正在刷写Farad69 Rev.B固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\farad69-b-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH69C
echo 正在刷写Farad69 Rev.C固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\farad69-c-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH69D
echo 正在刷写Farad69 Rev.D固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\farad69-d-nrf52810_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH50A
echo 正在刷写Omega50 Rev.A固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega50-a-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH50B
echo 正在刷写Omega50 Rev.B固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega50-b-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH50C
echo 正在刷写Omega50 Rev.C固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega50-c-nrf52810_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH60E
echo 正在刷写GT BLE60 Rev.E固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\gt-ble60-e-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH60F
echo 正在刷写GT BLE60 Rev.F固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\gt-ble60-f-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH60G
echo 正在刷写GT BLE60 Rev.G固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\gt-ble60-g-nrf52810_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH45C
echo 正在刷写Omega45 Rev.C固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega45-c-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH45D
echo 正在刷写Omega45 Rev.D固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega45-d-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH45E
echo 正在刷写Omega45 Rev.E固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega45-e-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHOMEGA45F52832
echo 正在刷写Omega45 Rev.F固件(nRF52832芯片)，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega45-f-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHOMEGA45F52810
echo 正在刷写Omega45 Rev.F固件(nRF52810芯片)，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega45-f-nrf52810_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHOMEGA4052832
echo 正在刷写Omega40 Rev.A nRF52832芯片版固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega40-a-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHOMEGA4052810
echo 正在刷写Omega40 Rev.AnRF52810芯片版 固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega40-a-nrf52810_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHVOLTA9
echo 正在刷写Volta9 Rev.A固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\volta9-a-nrf52810_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH84
echo 正在刷写Omega84固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega84-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASH64
echo 正在刷写Omega64固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\Omega64-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHNEWHOPE64A
echo 正在刷写NewHope64 Rev.A 固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\newhope64-a-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHNEWHOPE64B
echo 正在刷写NewHope64 REV.B 固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\newhope64-b-nrf52810_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHPADA
echo 正在刷写GT-Pad Rev.A固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\gt-pad-a-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHPADB
echo 正在刷写GT-Pad Rev.B固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\gt-pad-b-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHPADC
echo 正在刷写GT-Pad Rev.C固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\gt-pad-c-nrf52810_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHPLANCK52832
echo 正在刷写GT-PLANCK nRF52832芯片版固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\gt-planck-a-nrf52832_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

:FLASHPLANCK52811
echo 正在刷写GT-PLANCK nRF52811芯片版固件，请稍后...
%ocdcmd0%
%ocdcmd1% ..\\hex\\gt-planck-a-nrf52811_all-%ver%.hex %ocdcmd2%
%ocdcmd3%
pause
echo 按任意键继续
Goto End

REM ======查看烧录器======
:LIST
echo 查看是否正常显示烧录器
%ocdcmd4%
pause
echo 按任意键继续
Goto End

REM ======完整清空重置键盘======
:CLEAN
echo 完整清空重置键盘
%ocdcmd5%
pause
echo 按任意键继续
Goto End


REM ======手动命令行======
:GOCMD
Color 3F
MODE con: Cols=120 Lines=40
@CMD
Goto End

REM ======结束返回键盘选择菜单======
:End
if "%choice%" neq "" (
    cls
    Color FF
    if "%choice%" neq "3" (
        echo 操作完成 !!!
    )
    Goto Menu
)