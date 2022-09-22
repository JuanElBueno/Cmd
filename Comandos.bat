@echo off
@shift
chcp 65001
REM Colores
set fore_black=[30m
set fore_dred=[31m
set fore_dgreen=[32m
set fore_dyellow=[33m
set fore_dblue=[34m
set fore_dmagenta=[35m
set fore_dcyan=[36m
set fore_dwhite=[37m
 
set fore_bblack=[90m
set fore_bred=[91m
set fore_bgreen=[92m
set fore_byellow=[93m
set fore_bblue=[94m
set fore_bmagenta=[95m
set fore_bcyan=[96m
set fore_bwhite=[97m

REM Ruta general
set Beta=Alfa
set ruta=C:\Juanelbuenocopiadelosarcivos
set programas=%ruta%\programas
set admin=%ruta%\admin
set winrar=%ruta%\winrar
set rar=%programas%\rar
set winrarexe=%winrar%\Winrar-cmd-main\WinRAR.exe
set titulo1=Juan El Bueno
set modo=on
set wifi=

set ERRORLEVEL=
echo Comprobando conectividad ...
ping -n 1 8.8.8.8

if %ERRORLEVEL%==0 ( 
set wifi=true
goto Update
) else ( 
set wifi=false
goto sinconexioni
) 

:Update
if %wifi% == "true" (
set Version=V2.10
set Versiondos=%Version%
if exist "%temp%\Updater.bat" DEL /S /Q /F "%temp%\Updater.bat" >nul 2>&1
curl -g -L -# -o "%temp%\Updater.bat" "https://raw.githubusercontent.com/JuanElBueno/Command-Cmd/main/Update" >nul 2>&1
call "%temp%\Updater.bat"
IF "%Version%" gtr "%Versiondos%" (
	cls
	echo.
	echo  --------------------------------------------------------------
	echo                           Update found
	echo  --------------------------------------------------------------
	echo.
	echo                    Your current version: %Version%
	echo.
	echo                          New version: %Versiondos%
	echo.
	echo.
	echo.
	echo      [Y] Yes, Update
	echo      [N] No
	echo.
	choice /c:YN /n /m "%DEL%                                >:"
	set choice=!errorlevel!
	if !choice! equ 1 (
		curl -L -o %0 "https://raw.githubusercontent.com/JuanElBueno/Command-Cmd/main/Comandos.bat" >nul 2>&1
		call %0
		exit /b
	)
)
)


:titulot
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
  set Titulo=%titulo1% %Version% %sinconexiona% (32 bits)
) else (
  set Titulo=%titulo1% %Version% %sinconexiona% (64 bits)
)

REM Modos de iniciar
:general
mode con: cols=52 lines=18  
title %Titulo%
IF NOT EXIST "%ruta%" md "%ruta%"
IF NOT EXIST "%programas%" md "%programas%"
IF NOT EXIST "%rar%" md "%rar%" 
IF NOT EXIST "%admin%" md "%admin%"
IF NOT EXIST "%winrar%" md "%winrar%"
cd %ruta%
echo ==================================================
echo.
echo                  Para Win 10 Y 11 
echo.
echo        Version %Beta% De la Aplicacion %Version%  
echo.
echo ==================================================
timeout /T 5 >nul

REM Programas necesarios para iniciar

IF EXIST %winrarexe% (
echo [+]Progama Istalado Exitosa WinRAR & timeout /T 5 >nul
goto admin
) else if "%wifi%"=="true" (
echo [+]Programas Necesarios WinRAR & timeout /T 5 >nul
goto desrar
) else (
echo [+]Estas sin conexion de internet & timeout /T 5 >nul
goto admin
)

:desrar
IF EXIST %winrarexe% (
goto admin
) else (
cd %Ruta%\winrar 
powershell -command iwr 'https://github.com/JuanElBueno/Winrar-cmd/archive/refs/heads/main.zip' -OutFile 'WinRAR_6.2.zip' 
powershell Expand-Archive -LiteralPath '%Ruta%\winrar\WinRAR_6.2.zip' -DestinationPath %Ruta%\winrar 
goto admin
)

:admin
IF EXIST %admin%\PowerRun_x64.exe (
echo [+]Progama Istalado Exitosa PowerRun & timeout /T 5 >nul
goto wget1
) else if "%wifi%"=="true" (
echo [+]Programas Necesarios PowerRun & timeout /T 5 >nul
goto admindes
) else (
echo [+]Estas sin conexion de internet & timeout /T 5 >nul
goto wget1
)

:admindes
:: si exite se pone en admin
IF EXIST %admin%\PowerRun_x64.exe ( 
goto wget1
) else (
:: si no exite se descarga
cd %admin%
powershell -command iwr 'https://github.com/JuanElBueno/Command-Cmd/raw/main/PowerRun_x64.exe' -OutFile 'PowerRun_x64.exe' 
goto wget1f
)


:wget1
openfiles >nul 2>&1
if %ErrorLevel% equ 0 ( 
set wgetvof=y
) else ( 
set wgetvof=n
)

if "%wgetvof%"=="y" (
IF EXIST C:\Windows\System32\wget.exe ( 
echo [+]Progama Istalado Exitosa Wget [administracion] & timeout /T 5 >nul 
goto menu
) else if "%wifi%"=="true" (
echo [+]Programas Necesarios Wget [administracion] & timeout /T 5 >nul
goto wgetinstalar
) else (
echo [+]Estas sin conexion de internet & timeout /T 5 >nul
goto menu
))
 
if "%wgetvof%"=="n" (
IF EXIST %Ruta%\wget.exe ( 
echo [+]Progama Istalado Exitosa Wget [No administracion] & timeout /T 5 >nul 
goto menu
) else if "%wifi%"=="true" (
echo [+]Programas Necesarios Wget [No administracion] & timeout /T 5 >nul
goto wgetsinad
) else (
echo [+]Estas sin conexion de internet & timeout /T 5 >nul
goto menu
))

:wgetsinad
set rutaw="%ruta%\wget.exe"

IF EXIST %Ruta%\wget.exe ( 
echo [+]Progama Istalado Exitosa Wget [No administracion]
timeout /T 5 >nul
goto menu
) else (
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
cd %ruta%
powershell -command iwr 'https://eternallybored.org/misc/wget/1.21.3/32/wget.exe' -OutFile 'wget.exe'
echo.
timeout /T 6 >nul
goto menu
) else (
cd %ruta%
powershell -command iwr 'https://eternallybored.org/misc/wget/1.21.3/64/wget.exe' -OutFile 'wget.exe' 
echo. 
timeout /T 6 >nul 
goto menu
))

:wgetinstalar
set rutaw="C:\Windows\System32\wget.exe"

IF EXIST %Ruta%\WgetCmd.bat (
goto menu
) else (
cd %ruta% 
powershell -command iwr 'https://raw.githubusercontent.com/JuanElBueno/Command-Cmd/main/WgetCmd.bat' -OutFile 'WgetCmd.bat'
start WgetCmd.bat
mode con: cols=50 lines=18 
timeout /T 17 >nul
goto menu
)

REM 						Menu de inicio
:menu                                                    
	cls
	echo ==================================================
	echo ║                      MENU                      ║
	echo ==================================================
	echo * 1) Eliminar achivos malos                      *
	echo * 2) Ip                                          *
	echo * 3) Programas que no responde                   *
	echo * 4) Informacion del equipo                      *
	echo * 5) Comandos para ejecutar rapidamente          *
	echo * 6) Informacion del wifi                        *
	echo * 7) Explore no funciona nada                    *
	echo * 8) Administracion                              *
	echo * 9) Salir                                       *
	echo ==================================================
		set /p var=Seleccione una opcion [1-9]: 
		if "%var%"=="1" goto deltemp
		if "%var%"=="2" goto ip
		if "%var%"=="3" goto noresponde
		if "%var%"=="4" goto informaciondelequipo
		if "%var%"=="5" goto admintareas
		if "%var%"=="6" goto informaciondelwifi
		if "%var%"=="7" goto norespondeexplore
		if "%var%"=="8" goto Administradorcmd
		if "%var%"=="9" echo [+] Salendo..." & timeout /T 2 >nul & Exit 
		REM modo de ingeneria
		if "%modo%"=="on" (
		if "%var%"=="o" goto menu2
		if "%var%"=="r" goto general
		REM if "%var%"=="y" goto Combertidor_de_yt
		REM if "%var%"=="d" goto Istalador_de_paquetes
		) else (
		echo [+] No disponible modo Administracion de que a hecho la aplicacion %Titulo1%...
		timeout /T 6 >nul
		goto menu 
		)
		
:: Error de comandos
:error
cls
echo ==================================================
echo.
echo =        OPCION SELECCIONADA NO VALIDA!          =
echo.
echo ==================================================
timeout /T 5 >nul
goto menu

:informaciondelequipo
cls
cd %ruta%
systeminfo > "Informacion Del Equipo.txt"
goto menu

:informaciondelwifi
:: nombre de wifi y la contraseña
mode con: cols=65 lines=15
echo ===============
echo Nombre del wifi
echo ===============
netsh wlan show profile
set /p nombredewifi=Nombre del wifi:
netsh wlan show profile name=%nombredewifi% key=clear 
pause
mode con: cols=50 lines=18  
goto menu

:: Achivos borrados %tempoales%
:deltemp
cls
cd %temp%
@echo on
mode con: cols=65 lines=15
del *.* /f /S /q >> %Ruta%\achivos_borrados.txt
rmdir /s /q "%UserProfile%\AppData\Local\Temp" >> %Ruta%\achivos_borrados.txt
@echo off
timeout /T 10
mode con: cols=50 lines=18
cls
goto menu

::powershell -command iwr 'https://www.sordum.org/files/download/power-run/PowerRun.zip' -OutFile 'PowerRun.zip'

:Administradorcmd
"%admin%\PowerRun_x64.exe" "%UserProfile%\Desktop\Comandos.bat" 
echo [+] Salendo...
timeout /T 2 >nul 
Exit 

:: Ip cuando estas sin intertet
:ip
cls
mode con: ols=70 lines=18
title Ip De Google (Acuedate de N para salir)
ping google.es -t
cls
mode con: cols=50 lines=18
title %Titulo%
goto menu

:: No responde los porgramas
:noresponde
cls
taskkill.exe /f /fi "status eq Not Responding" & timeout /T 10 & goto menu

:: No Responde Explore 
:norespondeexplore
cls
TASKKILL /F /IM explorer.exe & timeout /nobreak 10 & start explorer.exe
goto menu

REM :Istalador_de_paquetes
REM IF EXIST %programas%\Progamas.bat ( 
REM echo [+]Progama Istalado Exitosamente & timeout /T 5 >nul
REM goto menu
REM ) else (
REM :: si no exite se descarga
REM cd %programas%
REM powershell -command iwr '' -OutFile '' 
REM goto menu
REM )

:admintareas
	cls
	echo ================================================= 
	echo ║                      MENU                     ║
	echo =================================================
	echo = 1) Administrador de tareas                    =
	echo = 2) Calculadora                                =
	echo = 3) Teclado en pantalla                        =
	echo = 4) Panel de control                           =
	echo = 5) Atualizar el windows                       =
	echo = 6) Explorer                                   =
	echo = 7) Recorte de pantalla                        =
	echo = 8) Descargar_Achivos_powershell               =
	echo = 9) Descargar_Achivos                          =
	echo = 10) Administracion de equipos                 =
	echo = s) Salir del menu volver a anterior.          =
	echo =================================================
		set /p var=Seleccione una opcion [1-8]: 
		if "%var%"=="1" call "taskmgr" & goto admintareas
		if "%var%"=="2" call "calc" & goto admintareas
		if "%var%"=="3" call "osk" & goto admintareas
		if "%var%"=="4" call "control" & goto admintareas
		if "%var%"=="5" start ms-settings:windowsupdate & goto admintareas
		if "%var%"=="6" call "explorer" & goto admintareas
		if "%var%"=="7" call "SnippingTool" & goto admintareas
		if "%var%"=="8" goto descagar_archivos
		if "%var%"=="9" goto descagar_archivos_lazamiento
		if "%var%"=="10" call compmgmt & goto admintareas
		if "%var%"=="s" goto menu
		
		
:error
cls
echo =================================================
echo.
echo =        OPCION SELECCIONADA NO VALIDA!         =
echo.
echo =================================================
timeout /T 5 >nul
goto admintareas

REM :descagar_archivos
REM cd C:\Juanelbuenocopiadelosarcivos\programas
REM :: si exite se pone la aplicacion
REM IF EXIST C:\Juanelbuenocopiadelosarcivos\programas\wget.exe goto descagar_lazamiento 
REM :: si no exite se descarga
REM IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\programas\wget.exe wget https://eternallybored.org/misc/wget/1.20.3/64/wget.exe & goto descagar_lazamiento

:descagar_archivos
set /p descargar=Que archivo quieres descagar:
cd %programas%
%rutaw% "%descargar%" --no-check-certificate
pause 
title %titulo% 
cls 
goto admintareas

:descagar_archivos_lazamiento
cd %programas%
set /p descagar1=Que archivo quieres descagar:
set /p nombre2=Nombre del achivo: 
powershell -command iwr '%descagar1%' -OutFile '%nombre2%' & explorer %programas% & goto admintareas	

REM :Combertidor_de_yt
REM cls
	REM echo ================================================= 
	REM echo =                     Menu                      =
	REM echo =================================================
	REM echo = 1)  Descargar yt                              =
	REM echo = 2)  Convertir a mp3 (Fase de pruebas)         =
	REM echo = 3)  Salir al menu                             =
	REM echo ================================================= 
		REM set /p var=Seleccione una opcion [1-3]: 
		REM if "%var%"=="1" goto Descargaryt
		REM if "%var%"=="2" goto mp3_combertidor
		REM if "%var%"=="3" goto menu
		
REM :error
REM cls
REM echo =================================================
REM echo.
REM echo =        OPCION SELECCIONADA NO VALIDA!         =
REM echo.
REM echo =================================================
REM timeout /T 5 >nul
REM goto Combertidor_de_yt

REM :Descargaryt
REM IF EXIST %programas%\youtube-dl.exe (
REM goto descagar_yt_programa
REM ) else (
REM cd %programas%
REM powershell -command iwr 'https://youtube-dl.org/downloads/latest/youtube-dl.exe' -OutFile 'youtube-dl.exe'
REM title %Titulo% 
REM goto descagar_yt_programa
REM )

REM :descagar_yt_programa
REM cd %programas%
REM set /p enlace=Enlace del yt y de todo:
REM @echo on
REM youtube-dl.exe %enlace%
REM @echo off
REM pause
REM goto Combertidor_de_yt

REM :mp3_combertidor
REM cd %programas%
REM IF EXIST %programas%\ffmpeg.exe (
REM goto mp3_combertidor_haciendo
REM ) else (
REM %rutaw% https://github.com/JuanElBueno/Command-Cmd/releases/download/publish/ffmpeg.exe
REM title %Titulo% 
REM goto mp3_combertidor_haciendo
REM )
REM :mp3_combertidor_haciendo
REM cd %programas%
REM set /p ORIGEN=Origen del achivo:
REM set /p DESTINO=Destino del achivo:
REM @echo on
REM ffmpeg.exe -i %ORIGEN% %DESTINO%
REM @echo off
REM pause
REM goto Combertidor_de_yt


:: menu2 de programas de descagar
:menu2
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
  echo Programa no compatible de 32 & timeout /T 10 >nul & goto menu
) else (
  goto 64
)

REM 32
REM :32
	REM cls
	REM echo =================================================
	REM echo =           Progama desatualizado               =
	REM echo =================================================
	REM echo =================================================
	REM echo =                      MENU                     =
	REM echo =================================================
	REM echo = 1) programas procexp64                         =
	REM echo = 2) programas MegaBasterd                       =
	REM echo = 3) Salir del menu volver a anterior.          =
	REM echo =================================================
		REM set /p var=Seleccione una opcion [1-3]: 
		REM if "%var%"=="1" goto programasm3
		REM if "%var%"=="2" goto programas1m3
		REM if "%var%"=="3" goto menu
		
REM :: error de comandos
REM :error
REM cls
REM echo =================================================
REM echo.
REM echo =        OPCION SELECCIONADA NO VALIDA!         =
REM echo.
REM echo =================================================
REM timeout /T 5 >nul
REM goto 32

REM :programasm3
REM cd C:\Juanelbuenocopiadelosarcivos\programas
REM :: si exite se pone la aplicacion
REM IF EXIST C:\Juanelbuenocopiadelosarcivos\programas\procexp64.exe start procexp.exe
REM :: si no exite se descarga
REM IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\programas\procexp64.exe wget https://download.sysinternals.com/files/ProcessExplorer.zip & title Juan El Bueno & start procexp.exe
REM title Juan El Bueno
REM "%winrarexe%" x C:\Juanelbuenocopiadelosarcivos\programas\rar\ProcessExplorer.zip C:\Juanelbuenocopiadelosarcivos\programas 
REM cd C:\Juanelbuenocopiadelosarcivos\programas 
REM start procexp64.exe
REM goto 64

REM :programas1m3
REM cd C:\Juanelbuenocopiadelosarcivos\programas
REM :: si exite se pone la aplicacion
REM IF EXIST C:\Juanelbuenocopiadelosarcivos\programas\MegaBasterd.jar start MegaBasterd.jar
REM :: si no exite se descarga
REM IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\programas\MegaBasterd.jar wget https://github.com/tonikelope/megabasterd/releases/download/v7.24/MegaBasterd_7.24.jar & title Juan El Bueno & start MegaBasterd.jar
REM title Juan El Bueno
REM goto m3


::64
:64

	cls
	echo =================================================
	echo =                      MENU                     =
	echo =================================================
	echo = 1) Programas procexp64                       =
	echo = 2) Programas MegaBasterd                     =
	echo = 3) Programas Test de velocidad               =
	echo = 4) Programas Autoruns64                      =
	echo = 5) Programas Task Manager                    =
	echo = 6) Programas Administrador de archivo        =
	echo = 7) Programas Buscador achivos                =
	echo = 8) Programas Descargar_Achivos               =
	echo = 9) Salir del menu volver a anterior          =
	echo = o) Continuacion del programa                 =	
	echo =================================================
		set /p var=Seleccione una opcion [1-9]: 
		:: programas de equipo de wifi
		if "%var%"=="1" goto programas
		if "%var%"=="2" goto programas1
		if "%var%"=="3" goto programas2
		if "%var%"=="4" goto programas3
		if "%var%"=="5" goto programas4
		if "%var%"=="6" goto programas5
		if "%var%"=="7" goto programas6
		if "%var%"=="8" goto programas7
		if "%var%"=="9" goto salir
		if "%var%"=="o" goto menu3
		:: if "%var%"=="15" goto prueba
		
:: error de comandos
:error
cls
echo =================================================
echo.
echo =        OPCION SELECCIONADA NO VALIDA!         =
echo.
echo =================================================
timeout /T 5 >nul
goto 64

:programas
:: si exite se pone la aplicacion
IF EXIST %programas%\procexp64.exe (
start procexp64.exe
goto 64
) else ( 
:: si no exite se descarga
cd %rar% 
%rutaw% https://download.sysinternals.com/files/ProcessExplorer.zip 
title %Titulo%
goto procexp64
)
:: Extraer en winrar
:procexp64
"%winrarexe%" x %rar%\ProcessExplorer.zip %programas%
cd %programas% 
start procexp64.exe
goto 64

:programas1
cd %programas%
REM IF NOT EXIST "C:\Program Files\Java\jre1.8.0_301\bin\java.exe" echo [+]Programas necesarios Java & timeout /T 5 >nul & goto 64

:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\programas\MegaBasterd.jar (
start cmd /c java -jar MegaBasterd.jar
goto 64
) else (
:: si no exite se descarga
powershell -command iwr 'https://github.com/tonikelope/megabasterd/releases/download/v7.50/MegaBasterd_7.50.jar' -OutFile 'MegaBasterd.jar' 
cd %programas% 
start cmd /c java -jar MegaBasterd.jar
goto 64
)

:programas2
cd %programas%
:: si exite se pone la aplicacion
IF EXIST %programas%\speedtest.exe (
start cmd /c speedtest.exe
goto 64
) else (
:: si no exite se descarga
cd %rar% 
powershell -command iwr 'https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-win64.zip' -OutFile 'speedtest-win64.zip'
goto speed
)
:speed
cd %rar%
"%winrarexe%" x speedtest-win64.zip %programas%
cd C:\Juanelbuenocopiadelosarcivos\programas
start speedtest.exe
goto 64


:programas3
cd %porgramas%
IF EXIST %programas%\Autoruns64.exe (
start Autoruns64.exe 
goto 64
) else (
cd C:\Juanelbuenocopiadelosarcivos\programas\rar 
powershell.exe -command iwr 'https://download.sysinternals.com/files/Autoruns.zip' -OutFile 'Autoruns.zip'
goto Autoruns1 
)
:Autoruns1
"%winrarexe%" x %programas%\rar\Autoruns.zip C:\Juanelbuenocopiadelosarcivos\programas 
cd C:\Juanelbuenocopiadelosarcivos\programas 
start Autoruns64.exe
goto 64

:programas4
cd %programas%
IF EXIST %programas%\TMX64.exe (
start TMX64.exe
goto 64
) else (
cd %rar%
powershell -command iwr 'https://mitec.cz/Downloads/TMX.zip' -OutFile 'TMX64.zip'
goto TMX64
)
:TMX64
"%winrarexe%" x %rar%\TMX64.zip %programas%
cd %programas%
start TMX64.exe 
goto 64

:programas5
cd %programas%
:: si exite se pone la aplicacion
IF EXIST %programas%\Everything.exe (
start Everything.exe
goto 64 
) else (
:: si no exite se descarga
cd %rar%
powershell -command iwr 'https://www.voidtools.com/Everything-1.4.1.969.x64.zip' -OutFile 'everything-1.4.1.969.x64.zip' 
goto Everythingin
)
:Everythingin
:: Extraer en winrar
"%winrarexe%" x %rar%\everything-1.4.1.969.x64.zip %programas%
cd %programas%
start Everything.exe
goto 64

:programas6
cd %programas%
:: si exite se pone la aplicacion
IF EXIST %programas%\WizTree64.exe (
start WizTree64.exe 
goto 64
) else (
:: si no exite se descarga
cd %rar%
powershell -command iwr 'https://diskanalyzer.com/files/wiztree_4_08_portable.zip' -OutFile 'wiztree_3_39_portable.zip'
goto wiztreeportable 
)
:: Extraer en winrar
:wiztreeportable
"%winrarexe%" x %rar%\wiztree_3_39_portable.zip %programas% 
cd %programas%
start WizTree64.exe
goto 64

:programas7
IF NOT EXIST "%programas%\uget" md "%programas%\uget"
IF EXIST %programas%\uget\bin\uget.exe (
start %programas%\uget\bin\uget.exe
goto 64
) else (
cd %rar%
powershell -command iwr 'https://github.com/JuanElBueno/getu/raw/main/getu.7z' -OutFile 'uget.7z'
goto uget
)
:: Extraer en winrar
:uget
"%winrarexe%" x %rar%\uget.7z %programas%\uget
cd %programas%\uget\bin
start uget.exe
goto 64


:menu3
	cls
	echo =================================================
	echo =                      MENU                     =
	echo =================================================
	echo = 1) Programas Examen de seguridad de Microsoft =
	echo = 2) Programas Optimizar el windows 100%        =
	echo = 3) Programas Spotify 100%                     =
	::echo = 4) Programas=
	::echo = 5) Programas=
	::echo = 6) Programas=
	::echo = 7) Programas=
	::echo = 8) Programas=
	echo = 4) Salir del menu volver a anterior           =
	echo =================================================
		set /p var=Seleccione una opcion [1-4]: 
		:: programas de equipo de wifi
		if "%var%"=="1" goto Executar1
		if "%var%"=="2" goto Executar2
		if "%var%"=="3" goto Executar3
		if "%var%"=="4" goto menu2
		::if "%var%"=="4" goto 
		::if "%var%"=="5" goto 
		::if "%var%"=="6" goto 
		::if "%var%"=="7" goto 
		::if "%var%"=="8" goto 
		::if "%var%"=="9" goto 
		
:: error de comandos
:error
cls
echo =================================================
echo.
echo =        OPCION SELECCIONADA NO VALIDA!         =
echo.
echo =================================================
timeout /T 5 >nul
goto menu3

:Executar1
cd %programas%
:: si exite se pone la aplicacion
IF EXIST %programas%\MSERT.exe ( 
start MSERT.exe
goto menu3
)
:: si no exite se descarga
powershell -command iwr 'https://definitionupdates.microsoft.com/download/DefinitionUpdates/VersionedSignatures/AM/1.345.357.0/amd64/MSERT.exe' -OutFile 'MSERT.exe'
start MSERT.exe
goto menu3

:Executar2
::
IF NOT EXIST "%programas%\master" md "%programas%\master"
::
cd %programas%
:: si exite se pone la aplicacion
IF EXIST %programas%\master\win10script-master\win10debloat.ps1 (
powershell.exe -Command %programas%\master\win10script-master\win10debloat.ps1
goto menu3
) else (
:: si no exite se descarga 
cd C:\Juanelbuenocopiadelosarcivos\programas\rar  
powershell -command iwr 'https://github.com/ChrisTitusTech/win10script/archive/refs/heads/master.zip' -OutFile 'master.zip' 
goto Programon
)

:: Extraer en winrar
:Programon
"%winrarexe%" x %programas%\rar\master.zip %programas%\master
cd %programas%\master\win10script-master
powershell.exe %programas%\master\win10debloat.ps1
pause
goto menu3

:Executar3
powershell -Command "& {[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12}"; "& {(Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/amd64fox/SpotX/main/Install.ps1').Content | Invoke-Expression}"
echo [+] Listo Spotify Full Sin Anuncios & timeout /T 3 >nul


goto menu3

:sinconexioni
set sinconexiona=No tienes internet
mode con: cols=52 lines=18 
cls
echo =================================================
echo.
echo = %Red%No tienes internet vuelve intentalo mas tarde%Yellow% =
echo.
echo =================================================
timeout /T 5 >nul
goto titulot

:salir
::del %ruta% /f /s /q
echo [+] Salendo... & timeout /T 2 >nul
goto menu