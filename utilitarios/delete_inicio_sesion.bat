@echo off
:: Título y color
title Eliminar acceso directo del inicio
color 0a

:: Ruta del acceso directo
set "inicio=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\firmaperu.lnk"

echo Buscando el acceso directo en el inicio automatico...

:: Verificar si el archivo existe
if not exist "%inicio%" (
    echo.
    echo No se encontro el acceso directo en el inicio automatico.
    pause
    exit /b
)

echo.
echo Se ha encontrado el acceso directo:
echo %inicio%
echo.
echo ¿Deseas eliminarlo del inicio automatico? (S/N)
choice /n /c:sn

if errorlevel 2 goto cancelar
if errorlevel 1 goto eliminar

:eliminar
cls
echo Eliminando acceso directo...
del /q "%inicio%"

if %errorlevel% equ 0 (
    echo Acceso directo eliminado correctamente.
) else (
    echo Hubo un error al intentar eliminar el acceso directo.
)
goto final

:cancelar
echo.
echo Operacion cancelada. El acceso directo no fue eliminado.
goto final

:final
echo.
pause