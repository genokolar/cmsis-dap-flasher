@echo off
:Init
set ver=20211105-11d28f72
Set tle=�汾:SDK17.1 %ver:~-8%
Set var=0
Set PATH=%PATH%%~dp0%pyocd;
cd pyocd

:Start
Title CMSIS-DAP��¼ %tle%
MODE con: Cols=50 Lines=32
Color 3F


:Menu
cls
echo �� �����̼���¼ %tle% ��
echo.
echo ѡ��:
echo       [1].   ��¼�̼� Farad69
echo.
echo       [2].   ��¼�̼� Omega50
echo.
echo       [3].   ��¼�̼� GT BLE60
echo.
echo       [4].   ��¼�̼� Omega45
echo.
echo       [5].   ��¼�̼� Omega84
echo.
echo       [6].   ��¼�̼� Omega64
echo.
echo       [7].   ��¼�̼� NewHope64
echo.
echo       [8].   ��¼�̼� GT PAD
echo.
echo       [9].   ��¼�̼� GT Planck
echo.
echo       [L].   ��ʾ��¼����Ϣ
echo.
echo       [C].   �ֶ���������
echo.
echo       [��].  �˳�
echo.
echo ---------------------------------------
if %var% neq 0 echo (������Ч����������)
Set choice=
Set /p choice=ѡ��: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto MENUFARAD69
if /i "%choice%" == "2" cls&Goto MENUOMEGA50
if /i "%choice%" == "3" cls&Goto MENUBLE60
if /i "%choice%" == "4" cls&Goto MENUOMEGA45
if /i "%choice%" == "5" cls&Goto FLASH84
if /i "%choice%" == "6" cls&Goto FLASH64
if /i "%choice%" == "7" cls&Goto FLASHNEWHOPE64
if /i "%choice%" == "8" cls&Goto MENUPAD
if /i "%choice%" == "9" cls&Goto MENUPLANCK
if /i "%choice%" == "0" cls&Goto TEST
if /i "%choice%" == "L" cls&Goto LIST
if /i "%choice%" == "C" cls&Goto GOCMD
if /i "%choice%" == "q" Popd&Exit
Set var=1
Goto Menu

:MENUFARAD69
cls
echo �� ѡ�� Farad69 �汾 ��
echo.
echo ѡ��:
echo       [1].   ��¼�̼� Farad69 rev.B
echo.
echo       [2].   ��¼�̼� Farad69 rev.C
echo.
echo       [R].   ������һ��
echo.
echo ---------------------------------------
if %var% neq 0 echo (������Ч����������)
Set choice=
Set /p choice=ѡ��: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASH69B
if /i "%choice%" == "2" cls&Goto FLASH69C
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUFARAD69

:MENUOMEGA50
cls
echo �� ѡ�� Omega50 �汾 ��
echo.
echo ѡ��:
echo       [1].   ��¼�̼� Omega50 rev.A
echo.
echo       [2].   ��¼�̼� Omega50 rev.B
echo.
echo       [R].   ������һ��
echo.
echo ---------------------------------------
if %var% neq 0 echo (������Ч����������)
Set choice=
Set /p choice=ѡ��: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASH50A
if /i "%choice%" == "2" cls&Goto FLASH50B
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUOMEGA50

:MENUBLE60
cls
echo �� ѡ�� GT BLE60 �汾 ��
echo.
echo ѡ��:
echo       [1].   ��¼�̼� GT BLE60 rev.E
echo.
echo       [2].   ��¼�̼� GT BLE60 rev.F
echo.
echo       [R].   ������һ��
echo.
echo ---------------------------------------
if %var% neq 0 echo (������Ч����������)
Set choice=
Set /p choice=ѡ��: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASH60E
if /i "%choice%" == "2" cls&Goto FLASH60F
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUBLE60

:MENUOMEGA45
cls
echo �� ѡ�� Omega45 �汾 ��
echo.
echo ѡ��:
echo       [1].   ��¼�̼� Omega45 rev.C
echo.
echo       [2].   ��¼�̼� Omega45 rev.D
echo.
echo       [3].   ��¼�̼� Omega45 rev.E
echo.
echo       [4].   ��¼�̼� Omega45 rev.F
echo.
echo       [R].   ������һ��
echo.
echo ---------------------------------------
if %var% neq 0 echo (������Ч����������)
Set choice=
Set /p choice=ѡ��: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASH45C
if /i "%choice%" == "2" cls&Goto FLASH45D
if /i "%choice%" == "3" cls&Goto FLASH45E
if /i "%choice%" == "4" cls&Goto FLASH45F
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUOMEGA45

:MENUPAD
cls
echo �� ѡ�� GT PAD �汾 ��
echo.
echo ѡ��:
echo       [1].   ��¼�̼� GT PAD rev.A
echo.
echo       [2].   ��¼�̼� GT PAD rev.B
echo.
echo       [R].   ������һ��
echo.
echo ---------------------------------------
if %var% neq 0 echo (������Ч����������)
Set choice=
Set /p choice=ѡ��: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASHPADA
if /i "%choice%" == "2" cls&Goto FLASHPADB
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUPAD

:MENUPLANCK
cls
echo �� ѡ��GT Planck��оƬ�汾 ��
echo.
echo ѡ��:
echo       [1].   ��¼�̼� nRF52832оƬ��
echo.
echo       [2].   ��¼�̼� nRF52811оƬ��
echo.
echo       [R].   ������һ��
echo.
echo ---------------------------------------
if %var% neq 0 echo (������Ч����������)
Set choice=
Set /p choice=ѡ��: 
Set "choice=%choice:"=%"
if "%choice:~-1%"=="=" Goto Menu
if "%choice%"=="" Goto Menu
if /i "%choice%" == "1" cls&Goto FLASHPLANCK52832
if /i "%choice%" == "2" cls&Goto FLASHPLANCK52811
if /i "%choice%" == "R" cls&Goto Menu
Set var=1
Goto MENUPLANCK


:FLASH69B
echo ����ˢдFarad69 Rev.B�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\farad69-b-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH69C
echo ����ˢдFarad69 Rev.C�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\farad69-c-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH50A
echo ����ˢдOmega50 Rev.A�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\Omega50-a-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH50B
echo ����ˢдOmega50 Rev.B�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\Omega50-b-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH60E
echo ����ˢдGT BLE60 Rev.E�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\gt-ble60-e-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH60F
echo ����ˢдGT BLE60 Rev.F�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\gt-ble60-f-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH45C
echo ����ˢдOmega45 Rev.C�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\Omega45-c-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH45D
echo ����ˢдOmega45 Rev.D�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\Omega45-d-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH45E
echo ����ˢдOmega45 Rev.E�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\Omega45-e-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH45F
echo ����ˢдOmega45 Rev.F�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\Omega45-f-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH84
echo ����ˢдOmega84�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\Omega84-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASH64
echo ����ˢдOmega64�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\Omega64-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASHNEWHOPE64
echo ����ˢдNewHope64�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\newhope64-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASHPADA
echo ����ˢдGT-Pad Rev.A�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\gt-pad-a-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASHPADB
echo ����ˢдGT-Pad Rev.B�̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\gt-pad-b-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASHPLANCK52832
echo ����ˢдGT-PLANCK nRF52832оƬ��̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\gt-planck-a-nrf52_all-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:FLASHPLANCK52811
echo ����ˢдGT-PLANCK nRF52811оƬ��̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\gt-planck-a-nrf52811_kbd_with_sd-%ver%.hex
pyocd cmd -t nrf52 -c reset
pause
echo �����������
Goto End

:TEST
echo ����ˢд���Թ̼������Ժ�...
pyocd cmd -t nrf52 -c erase
pyocd flash -t nrf52 -e sector -f 1M ..\hex\nrf52_all.hex
pyocd cmd -t nrf52 -c reset

pause
echo �����������
Goto End

:LIST
MODE con: Cols=50 Lines=32
echo �鿴�Ƿ�������ʾ��¼��
pyocd list
pause
echo �����������
Goto End

:GOCMD
Color 3F
MODE con: Cols=120 Lines=40
@CMD
Goto End

:End
if "%choice%" neq "" (
    cls
    Color FF
    if "%choice%" neq "3" (
        echo ������� !!!
    )
    Goto Start
)