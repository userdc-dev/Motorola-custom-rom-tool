@echo off
@SETLOCAL enabledelayedexpansion

set "Payload-dumper-go=%~dp0..\bin\payload-dumper-go.exe"

echo.
echo               Scirpt to automate repitive stuff
echo          The flash option flashes the boot and vb images in fastbootd
echo    (it reboots automatically if the phone is in fastboot mode)
echo                          Made by V
echo.

:startMenu
color e2

@echo off
cls
rem Flashing AIO Menu Script

echo =================================================
echo            Flashing AIO By V
echo =================================================

rem Add ADB to PATH section?
echo == Platform tools section ==
echo [0] Download and add ADB to PATH
echo -----------------------------------------------

rem Flash Custom ROM Section
echo == Flash Custom ROM ==
echo [1] Adb sideload    [2] Fastboot

rem Flash Images Section
echo -----------------------------------------------
echo == Flash Images ==
echo [7] Vendor Boot    [8] Boot    [9] Stock ROM

rem Extract Section
echo -----------------------------------------------
echo == Extract ==
echo [3] Vendor Boot    [4] Boot

rem Patch Section
echo -----------------------------------------------
echo == Patch Boot ==
echo [5] KSU            [6] Magisk

rem Miscellaneous Section
echo -----------------------------------------------
echo == Miscellaneous ==
echo [10] Exit

rem Reboot Menu
echo -----------------------------------------------
echo == Reboot Menu ==
echo [r] Reboot Options

rem Get Device Information
echo -----------------------------------------------
echo == Get Device Information ==
echo [i] Get Device Informations

rem Change Slot
echo -----------------------------------------------
echo == Change Slot ==
echo [s] Change Boot Slot 

rem Erase Data
echo -----------------------------------------------
echo == Erase Data ==
echo [e] Erase Data 


echo =================================================
echo.

    set selection=
    set /p selection= Please enter the option number(0-10):
        if /i "%selection%"=="0" cls && call :adb-set-path
        if /i "%selection%"=="1" cls && call :flashADB
        if /i "%selection%"=="2" cls && call :flashFastboot
        if /i "%selection%"=="3" cls && call :extractVendorBoot
        if /i "%selection%"=="4" cls && call :extractBoot
        if /i "%selection%"=="5" cls && call :patchKSU
        if /i "%selection%"=="6" cls && call :patchMagisk
        if /i "%selection%"=="7" cls && call :flashVB
        if /i "%selection%"=="8" cls && call :flashB
        if /i "%selection%"=="9" cls && call :flashStock
        if /i "%selection%"=="10" cls && call :exit

        if /i "%selection%"=="r" cls && call :rebootmenu
        if /i "%selection%"=="i" cls && call :getdeviceinfo
        if /i "%selection%"=="s" cls && call :changeslot
        if /i "%selection%"=="e" cls && call :erasedata
        
    cls
goto :startMenu
::
::


:adb-set-path
    echo This will download and add them to your to your PATH variable
    echo i.e. You will be able to run adb from anywhere
    echo Press any key to continue
    pause > nul
    powershell -Command "Start-Process '%~dp0bats\adb-set-path.cmd' -Verb RunAs"

    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0

:flashADB

    echo This will flash the custom rom using adb sideload
    echo You need to click the adb sideload button manually in recovery.
    echo Ths script will boot into recovery and start sideloading when adb sideload is turned on.
    echo Press any key to continue
    pause > nul

    call "%~dp0bats/flashADB.cmd"
       
    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0


:flashFastboot

    echo This will flash the custom rom using fastboot
    echo Press any key to continue

    pause > nul

    call "%~dp0bats/flashFastboot.cmd"

    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0


:extractVendorBoot
    echo Press any key to continue

    pause > nul

    call "%~dp0bats/extractVendorBoot.cmd"

    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0


:extractBoot
    echo Press any key to continue
    pause > nul

    call "%~dp0bats/extractBoot.cmd"

    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0


:patchKSU
    echo If you want to flash the boot image then boot in fastbootd mode.
    echo Press any key to continue
    pause > nul

    call "%~dp0bats/patchKSU.cmd"

    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0


:patchMagisk
    echo Currently this option flashes magisk zip using adb sideload
    echo Press any key to continue
    pause > nul

    call "%~dp0bats/patchMagisk.cmd"

    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0 


:flashVB
    echo Press any key to continue
    pause > nul

    call "%~dp0bats/flashVB.cmd"

    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0


:flashB
    echo Press any key to continue
    pause > nul

    call "%~dp0bats/flashB.cmd"

    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0


:flashStock

    echo It will flash stock rom using the commands that are present in flashfile.xml
    echo Extract flashing-AIO and stock firmware in the same folder
    echo Press any key to continue
    pause > nul

    call  "%~dp0bats/flashStock.cmd"

    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0  

:exit
exit




:rebootmenu
    echo Please Select Reboot Option
    pause > nul
    call  "%~dp0bats/rebootmenu.cmd"
    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0  

:getdeviceinfo
    echo Press any key to continue and get device Information
    pause > nul
    call  "%~dp0bats/getdeviceinfo.cmd"
    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0  

:changeslot
    echo You can change device's boot slot using this menu. 
    echo Press any key to continue.
    pause > nul
    call  "%~dp0bats/changeslot.cmd"
    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0  

:erasedata
    echo You are about to erase data in the phone.
    echo Press any key to continue.
    pause > nul
    call  "%~dp0bats/erasedata.cmd"
    echo.
    echo Press any key to return to the Main menu.
    pause > nul
exit /b 0  
