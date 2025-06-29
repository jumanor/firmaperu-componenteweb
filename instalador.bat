@echo off
title Instalar Firma Peru - Componente Web
color 0a
:: Objetivo: Crear carpeta, copiar .jnlp y configurar ejecución al inicio

echo ================================================
echo    INSTALADOR DE FIRMA PERU - COMPONENTE WEB
echo ================================================
echo.
echo Este instalador realizara las siguientes acciones:
echo.
echo 1. Crear la carpeta %USERPROFILE%\firmaperu
echo 2. Copiar el archivo jwslauncher.jnlp a la carpeta
echo 3. Crear acceso directo de Firma Peru
echo 4. Preguntar si desea configurar el inicio automatico
echo 5. Copiar acceso directo al Escritorio
echo 6. Copiar utilidades en la carpeta de instalacion
echo.
echo ¿Desea continuar con la instalacion? (S/N)
choice /c SN /m "Seleccione una opcion"

if errorlevel 2 (
    echo.
    echo Instalacion cancelada por el usuario.
    pause
    exit /b 0
)

echo.
echo Iniciando instalacion...
echo.

:: Variables para Firma Peru
set "carpeta=%USERPROFILE%\firmaperu"
set "origen_jnlp=jwslauncher.jnlp"
set "destino_jnlp=%carpeta%\jwslauncher.jnlp"

:: EXTREMADEMANTE IMPORTANTE!!!!!!
:: set "ruta_javaws=C:\Program Files\Java\jre1.8.0_XXX\bin\javaws.exe"
set "ruta_javaws=javaws"

:: 1. Crear carpeta si no existe
if not exist "%carpeta%" (
    echo Creando carpeta %carpeta%...
    mkdir "%carpeta%"
)

:: 2. Copiar el archivo JNLP
if exist "%origen_jnlp%" (
    echo Copiando jwslauncher.jnlp a %carpeta%...
    copy /Y "%origen_jnlp%" "%destino_jnlp%" >nul
) else (
    echo ERROR: No se encuentra el archivo 'jwslauncher.jnlp' en la ubicacion actual.
    pause
    exit /b 1
)

:: 2.1. Copiar el archivo de icono
set "origen_icono=icono.ico"
set "destino_icono=%carpeta%\icono.ico"
if exist "%origen_icono%" (
    echo Copiando %origen_icono% a %carpeta%...
    copy /Y "%origen_icono%" "%destino_icono%" >nul
    set "ruta_icono=%destino_icono%"
) else (
    echo ADVERTENCIA: No se encuentra el archivo de icono 'icono.ico' en la ubicacion actual.
    echo Se usara el icono predeterminado de Java Web Start.
    set "ruta_icono=%ruta_javaws%,0"
)

:: 3. Crear acceso directo para Firma Perú
echo Creando acceso directo para Firma Perú...

:: Creamos un acceso directo temporal que usaremos como base
set "acceso_base=%carpeta%\firmaperu.lnk"

:: Usamos PowerShell para crear el acceso directo base
powershell "$WshShell = New-Object -comObject WScript.Shell; $shortcut = $WshShell.CreateShortcut('%acceso_base%'); $shortcut.TargetPath = '%ruta_javaws%'; $shortcut.Arguments = '%destino_jnlp%'; $shortcut.WorkingDirectory = '%carpeta%'; $shortcut.Description = 'Firma Peru Componente Web'; $shortcut.IconLocation = '%ruta_icono%'; $shortcut.Save()"

:: 4. Preguntar si quiere copiar el acceso directo en Inicio (arranque automático)
echo.
echo ¿Desea configurar la ejecucion automatica al iniciar sesion? (S/N)
choice /c SN /m "Seleccione una opcion"

:: Ruta de inicio automático
set "inicio=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\firmaperu.lnk"

if errorlevel 2 (
    echo.
    echo No se configurara el inicio automatico.
) else (
    echo.
    echo Copiando acceso directo para inicio automático...
    copy /Y "%acceso_base%" "%inicio%" >nul
)

:: 5. Copiar acceso directo al Escritorio y a la carpeta firmaperu
echo Copiando accesos directos...

:: Definimos la ruta para el acceso directo en el Escritorio
set "escritorio=%USERPROFILE%\Desktop\firmaperu.lnk"

:: Copiamos el acceso directo base al Escritorio
echo Copiando acceso directo al Escritorio...
copy /Y "%acceso_base%" "%escritorio%" >nul

:: 6. Copiar archivos de utilidades
echo.
echo Copiando archivos de utilidades a %carpeta%\utilitarios...

:: Crear carpeta de utilitarios si no existe
if not exist "%carpeta%\utilitarios" (
    echo Creando carpeta %carpeta%\utilitarios...
    mkdir "%carpeta%\utilitarios"
)

:: Copiar archivos desde la carpeta utilitarios
echo Copiando archivos de utilidades...

if exist "utilitarios\delete_inicio_sesion.bat" (
    echo Copiando delete_inicio_sesion.bat a %carpeta%\utilitarios...
    copy /Y "utilitarios\delete_inicio_sesion.bat" "%carpeta%\utilitarios\delete_inicio_sesion.bat" >nul
) else (
    echo ADVERTENCIA: No se encuentra el archivo 'delete_inicio_sesion.bat' en la ubicacion actual.
)

if exist "utilitarios\status_firmaperu.bat" (
    echo Copiando status_firmaperu.bat a %carpeta%\utilitarios...
    copy /Y "utilitarios\status_firmaperu.bat" "%carpeta%\utilitarios\status_firmaperu.bat" >nul
) else (
    echo ADVERTENCIA: No se encuentra el archivo 'status_firmaperu.bat' en la ubicacion actual.
)

if exist "utilitarios\stop_firmaperu.bat" (
    echo Copiando stop_firmaperu.bat a %carpeta%\utilitarios...
    copy /Y "utilitarios\stop_firmaperu.bat" "%carpeta%\utilitarios\stop_firmaperu.bat" >nul
) else (
    echo ADVERTENCIA: No se encuentra el archivo 'stop_firmaperu.bat' en la ubicacion actual.
)

echo.
echo ================================================
echo    INSTALACION COMPLETADA CORRECTAMENTE
echo ================================================
echo.
echo - Accesos directos creados en:
if not errorlevel 2 (
    echo   * Inicio automatico
)
echo   * Escritorio
echo   * Carpeta FirmaPeru
echo - Archivos de utilidades copiados a %carpeta%\utilitarios
echo.
if not errorlevel 2 (
    echo La aplicacion se ejecutara automaticamente al iniciar sesion.
) else (
    echo La aplicacion NO se ejecutara automaticamente al iniciar sesion.
)
echo.
pause