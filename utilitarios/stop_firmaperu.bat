@echo off
title Matar proceso en el puerto 48596
color 0a

echo Buscando proceso en el puerto 48596...

:: Obtener el PID del proceso que usa el puerto 48596
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :48596') do set pid=%%a

:: Si no se encontró ningún proceso
if "%pid%"=="" (
    echo No se encontró ningun proceso escuchando en el puerto 48596.
    pause
    exit /b
)

echo Proceso encontrado con PID: %pid%
echo.

:: Confirmar antes de matar el proceso
echo =============== ADVERTENCIA ===============
echo Se va a terminar el proceso con PID: %pid%
echo ¿Deseas continuar? (S/N)
choice /n /c:sn

if errorlevel 2 goto cancelar
if errorlevel 1 goto matarproceso

:matarproceso
echo Matando el proceso...

:: Matar el proceso
taskkill /f /pid %pid%

:: Verificar si el proceso fue terminado
if %errorlevel% equ 0 (
    echo El proceso con PID %pid% ha sido terminado correctamente.
) else (
    echo Hubo un error al intentar matar el proceso.
)

goto final

:cancelar
echo Operacion cancelada. No se mato ningun proceso.

:final
pause