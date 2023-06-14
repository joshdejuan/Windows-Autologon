@echo off

REM Solicitar al usuario el nombre de usuario y la contrasena
set /p USERNAME=Type local username: 
set /p PASSWORD=Type password: 

REM Establecer la ruta del registro para el inicio de sesion automatico
set REG_PATH=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon

REM Preguntar al usuario si desea activar o desactivar el inicio de sesion automatico
echo Select an option:
echo 1. Enable autologon
echo 2. Disable autlogon
set /p OPTION=Opcion:

IF "%OPTION%"=="1" (
    REM Configurar el inicio de sesion automatico
    reg add "%REG_PATH%" /v DefaultUserName /t REG_SZ /d "%USERNAME%" /f
    reg add "%REG_PATH%" /v DefaultPassword /t REG_SZ /d "%PASSWORD%" /f
    reg add "%REG_PATH%" /v AutoAdminLogon /t REG_SZ /d "1" /f
    echo Autlogon enabled.
) ELSE IF "%OPTION%"=="2" (
    REM Desactivar el inicio de sesion automatico
    reg delete "%REG_PATH%" /v DefaultUserName /f
    reg delete "%REG_PATH%" /v DefaultPassword /f
    reg delete "%REG_PATH%" /v AutoAdminLogon /f
    echo Autologon disabled.
) ELSE (
    echo Not a valid option. Please select 1 or 2.
)

echo Reboot your PC in order to apply changes.

pause
