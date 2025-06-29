@echo off
title Verificar estado del puerto 48596
color 0a

echo Verificando si hay procesos en el puerto 48596...
echo.

:: Ejecutar el comando netstat con filtro
netstat -ano | findstr :48596

echo.
if %errorlevel% equ 0 (
    echo Hay procesos escuchando en el puerto 48596.
) else (
    echo No hay procesos activos en el puerto 48596.
)

echo.
pause