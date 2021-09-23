REM Modos de iniciar

@shift
@echo off
mode con: cols=50 lines=18  
color 9f
title Juan El Bueno

REM Ruta general

set Ruta=C:\Juanelbuenocopiadelosarcivos
set Titulo= Juan El Bueno

IF NOT EXIST "%Ruta%" md "%Ruta%"
IF NOT EXIST "%Ruta%\progamas" md "%Ruta%\progamas"
IF NOT EXIST "%Ruta%\progamas\rar" md "%Ruta%\progamas\rar" 
echo **************************************************
echo.
echo                  Para Win 10 Y 11 
echo.
echo        Version Beta De la Aplicacion V1.13.96  
echo.
echo **************************************************
timeout /T 5 >nul
REM Programas necesarios para iniciar

cd %Ruta%
IF EXIST "%Ruta%\winrar\Winrar-cmd-main\WinRAR.exe" goto wget1
IF NOT EXIST "%Ruta%\winrar\Winrar-cmd-main\WinRAR.exe" echo [+]Programas necesarios WinRAR & timeout /T 5 >nul & goto desrar

:wget1 
IF EXIST C:\Windows\System32\wget.exe goto menu
IF NOT EXIST C:\Windows\System32\wget.exe echo [+]Programas necesarios Wget & timeout /T 5 >nul & goto wgetinstalar

:wgetinstalar
mode con: cols=80 lines=18
::si no exist la carpeta que me lo cres 
IF NOT EXIST %Ruta%\admin md %Ruta%\admin
:: si exite se pone en admin
IF EXIST %Ruta%\admin\PowerRun_x64.exe cd %Ruta%\admin & goto wgetinstalarexe
:: si no exite se descarga
IF NOT EXIST %Ruta%\admin\PowerRun_x64.exe cd %Ruta%\admin & powershell -command iwr 'https://github.com/JuanElBueno/Command-Cmd/raw/main/PowerRun_x64.exe' -OutFile 'PowerRun_x64.exe' & goto wgetinstalarexe
:wgetinstalarexe
IF EXIST %Ruta%\WgetCmd.bat "C:\Juanelbuenocopiadelosarcivos\admin\PowerRun_x64.exe" "%Ruta%\WgetCmd.bat" & mode con: cols=50 lines=18 & timeout /T 17 >nul & goto menu
IF NOT EXIST %ruta%\WgetCmd.bat cd %ruta% & powershell -command iwr 'https://raw.githubusercontent.com/JuanElBueno/Command-Cmd/main/WgetCmd.bat' -OutFile 'WgetCmd.bat'; "C:\Juanelbuenocopiadelosarcivos\admin\PowerRun_x64.exe" "WgetCmd.bat" & mode con: cols=50 lines=18 & timeout /T 17 >nul & goto menu

:desrar
mode con: cols=80 lines=18
IF NOT EXIST %Ruta%\winrar md %Ruta%\winrar
IF EXIST "%Ruta%\winrar\Winrar-cmd-main\WinRAR.exe" goto wget1
IF NOT EXIST "%Ruta%\winrar\Winrar-cmd-main\WinRAR.exe" cd %Ruta%\winrar & powershell -command iwr 'https://github.com/JuanElBueno/Winrar-cmd/archive/refs/heads/main.zip' -OutFile 'WinRAR_6.2.zip' & powershell Expand-Archive -LiteralPath '%Ruta%\winrar\WinRAR_6.2.zip' -DestinationPath %Ruta%\winrar & mode con: cols=50 lines=18 & goto wget1

REM 						Menu de inicio
:menu                                                    
	cls
	echo **************************************************
	echo *                      MENU                      *
	echo **************************************************
	echo * 1) Eliminar achivos malos                      *
	echo * 2) Ip                                          *
	echo * 3) Programas que no responde                   *
	echo * 4) Informacion del equipo                      *
	echo * 5) Comandos para ejecutar rapidamente          *
	echo * 6) Informacion del wifi                        *
	echo * 7) Explore no funciona nada                    *
	echo * 8) Administracion                              *
	echo * 9) Salir                                       *
	echo **************************************************
		set /p var=Seleccione una opcion [1-9]: 
		if "%var%"=="1" goto deltemp
		if "%var%"=="2" goto ip
		if "%var%"=="3" goto noresponde
		if "%var%"=="4" goto informaciondelequipo
		if "%var%"=="5" goto admintareas
		if "%var%"=="6" goto informaciondelwifi
		if "%var%"=="7" goto norespondeexplore
		if "%var%"=="8" goto Administradorcmd
		if "%var%"=="9" echo [+] Salendo... & timeout /T 2 >nul & Exit
		:: o=menu2 r=reset 
		if "%var%"=="o" goto menu2
		if "%var%"=="r" goto reset
		if "%var%"=="d" goto Combertidor_de_yt
		
:: Error de comandos
:error
cls
echo **************************************************
echo.
echo *        OPCION SELECCIONADA NO VALIDA!          *
echo.
echo **************************************************
timeout /T 5 >nul
goto menu

:informaciondelequipo
cls
cd C:\Juanelbuenocopiadelosarcivos
systeminfo > "Informacion Del Equipo.txt"
goto menu

:informaciondelwifi
:: nombre de wifi y la contraseña
mode con: cols=65 lines=15
echo ***************
echo Nombre del wifi
echo ***************
netsh wlan show profile
set /p nombredewifi=Nombre del wifi:
 name=%nombredewifi% key=clear
pause
mode con: cols=50 lines=18  
goto menu

:: Achivos borrados %tempoales%
:deltemp
cls
cd %temp%
@echo on
del *.* /f /S /q echo >> achivos_borrados.txt & copy achivos_borrados.txt %Ruta%
timeout /T 20
@echo off
del achivos_borrados.txt /f /s /q
cls
goto menu

:Administradorcmd
::powershell -command iwr 'https://www.sordum.org/files/download/power-run/PowerRun.zip' -OutFile 'PowerRun.zip'
::si no exist la carpeta que me lo cres 
IF NOT EXIST %Ruta%\admin md %Ruta%\admin
:: si exite se pone en admin
IF EXIST %Ruta%\admin\PowerRun\PowerRun_x64.exe cd %Ruta%\admin\PowerRun & goto exploreradmin
:: si no exite se descarga
IF NOT EXIST %Ruta%\admin\PowerRun\PowerRun_x64.exe cd %Ruta%\admin & powershell -command iwr 'https://github.com/JuanElBueno/Command-Cmd/raw/main/PowerRun_x64.exe' -OutFile 'PowerRun_x64.exe' & goto exploreradmin
:exploreradmin
cd C:\Juanelbuenocopiadelosarcivos\admin
"%Ruta%\PowerRun_x64.exe" "%UserProfile%\Desktop\Comandos.bat" & echo [+] Salendo... & timeout /T 2 >nul & Exit 

:: Ip cuando estas sin intertet
:ip
cls
mode con: cols=70 lines=18
title Ip De Google (Acuedate de N para salir)
ping google.es -t 
cls
mode con: cols=50 lines=18
title Juan El Bueno 
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

:reset
@shift
@echo off
mode con: cols=50 lines=18  
color 9f
title Juan El Bueno 
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos md C:\Juanelbuenocopiadelosarcivos
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas md C:\Juanelbuenocopiadelosarcivos\progamas
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\rar md C:\Juanelbuenocopiadelosarcivos\progamas\rar
goto menu

::Exit
::exit

:admintareas
	cls
	echo ************************************************* 
	echo *                      MENU                     *
	echo *************************************************
	echo * 1) Administrador de tareas                    *
	echo * 2) Calculadora                                *
	echo * 3) Teclado en pantalla                        *
	echo * 4) Panel de control                           *
	echo * 5) Atualizar el windows                       *
	echo * 6) Explorer                                   *
	echo * 7) Recorte de pantalla                        *
	echo * 8) Descargar_Achivos_powershell               *
	echo * 9) Descargar_Achivos                          *
	echo * 10) Administracion de equipos                 *
	echo * s) Salir del menu volver a anterior.          *
	echo *************************************************
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
		:: Menu de configuracion
		if "%var%"=="1,2" call cmd /c "taskmgr" | call cmd /c "calc" & goto admintareas
		
		
:error
cls
echo *************************************************
echo.
echo *        OPCION SELECCIONADA NO VALIDA!         *
echo.
echo *************************************************
timeout /T 5 >nul
goto admintareas

:descagar_archivos
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\wget.exe goto descagar_lazamiento 
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\wget.exe wget https://eternallybored.org/misc/wget/1.20.3/64/wget.exe & goto descagar_lazamiento

:descagar_lazamiento
set /p descargar=Que archivo quieres descagar:
cd C:\Juanelbuenocopiadelosarcivos\progamas
wget "%descargar%" --no-check-certificate
pause 
title Juan El Bueno 
cls 
goto admintareas

:descagar_archivos_lazamiento
cd C:\Juanelbuenocopiadelosarcivos\progamas
set /p descagar1=Que archivo quieres descagar:
set /p nombre2=Nombre del achivo: 
powershell -command iwr '%descagar1%' -OutFile '%nombre2%' & explorer C:\Juanelbuenocopiadelosarcivos\progamas & goto admintareas	

:Combertidor_de_yt
cls
	echo ************************************************* 
	echo *                     Menu                      *
	echo *************************************************
	echo * 1)  Descargar yt                              *
	echo * 2)  Convertir a mp3 (Fase de pruebas)         *
	echo * 3)  Salir al menu                             *
	echo ************************************************* 
		set /p var=Seleccione una opcion [1-3]: 
		if "%var%"=="1" goto Descargaryt
		if "%var%"=="2" goto mp3_combertidor
		if "%var%"=="3" goto menu
		
:error
cls
echo *************************************************
echo.
echo *        OPCION SELECCIONADA NO VALIDA!         *
echo.
echo *************************************************
timeout /T 5 >nul
goto Combertidor_de_yt

:Descargaryt
cd %Ruta%\progamas
IF EXIST %Ruta%\progamas\youtube-dl.exe goto descagar_yt_programa
IF NOT EXIST %Ruta%\progamas\youtube-dl.exe cd %Ruta%\progamas & wget https://youtube-dl.org/downloads/latest/youtube-dl.exe & title %Titulo% & goto descagar_yt_programa

:descagar_yt_programa
cd C:\Juanelbuenocopiadelosarcivos\progamas
set /p enlace=Enlace del yt y de todo:
@echo on
youtube-dl.exe %enlace%
@echo off
pause
goto Combertidor_de_yt

:mp3_combertidor
cd C:\Juanelbuenocopiadelosarcivos\progamas
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\ffmpeg.exe goto mp3_combertidor_haciendo
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\ffmpeg.exe wget https://github.com/JuanElBueno/Command-Cmd/raw/main/ffmpeg.exe & title %Titulo% & goto mp3_combertidor_haciendo

:mp3_combertidor_haciendo
cd C:\Juanelbuenocopiadelosarcivos\progamas
set /p ORIGEN=Origen del achivo:
set /p DESTINO=Destino del achivo:
@echo on
ffmpeg.exe -i %ORIGEN% %DESTINO%
@echo off
pause
goto Combertidor_de_yt


:: menu2 de progamas de descagar
:menu2
if $SYSTEM_os_arch==x86 (
  Echo Programa no compatible & timeout /T 10 >nul & goto menu
) else (
  goto 64
)

::32
REM :32
	REM cls
	REM echo *************************************************
	REM echo *           Progama desatualizado               *
	REM echo *************************************************
	REM echo *************************************************
	REM echo *                      MENU                     *
	REM echo *************************************************
	REM echo * 1) Progamas procexp64                         *
	REM echo * 2) Progamas MegaBasterd                       *
	REM echo * 3) Salir del menu volver a anterior.          *
	REM echo *************************************************
		REM set /p var=Seleccione una opcion [1-3]: 
		REM if "%var%"=="1" goto progamasm3
		REM if "%var%"=="2" goto progamas1m3
		REM if "%var%"=="3" goto menu
		
REM :: error de comandos
REM :error
REM cls
REM echo *************************************************
REM echo.
REM echo *        OPCION SELECCIONADA NO VALIDA!         *
REM echo.
REM echo *************************************************
REM timeout /T 5 >nul
REM goto 32

REM :progamasm3
REM cd C:\Juanelbuenocopiadelosarcivos\progamas
REM :: si exite se pone la aplicacion
REM IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\procexp64.exe start procexp.exe
REM :: si no exite se descarga
REM IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\procexp64.exe wget https://download.sysinternals.com/files/ProcessExplorer.zip & title Juan El Bueno & start procexp.exe
REM title Juan El Bueno
REM "C:\Juanelbuenocopiadelosarcivos\winrar\Winrar-cmd-main\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\ProcessExplorer.zip C:\Juanelbuenocopiadelosarcivos\progamas 
REM cd C:\Juanelbuenocopiadelosarcivos\progamas 
REM start procexp64.exe
REM goto 64

REM :progamas1m3
REM cd C:\Juanelbuenocopiadelosarcivos\progamas
REM :: si exite se pone la aplicacion
REM IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\MegaBasterd.jar start MegaBasterd.jar
REM :: si no exite se descarga
REM IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\MegaBasterd.jar wget https://github.com/tonikelope/megabasterd/releases/download/v7.24/MegaBasterd_7.24.jar & title Juan El Bueno & start MegaBasterd.jar
REM title Juan El Bueno
REM goto m3


::64
:64

set ruta_programas=C:\Juanelbuenocopiadelosarcivos\progamas

	cls
	echo *************************************************
	echo *                      MENU                     *
	echo *************************************************
	echo * 1) Programas procexp64                       *
	echo * 2) Programas MegaBasterd                     *
	echo * 3) Programas Test de velocidad               *
	echo * 4) Programas Autoruns64                      *
	echo * 5) Programas Task Manager                    *
	echo * 6) Programas Administrador de achivo         *
	echo * 7) Programas Buscador achivos                *
	echo * 8) Programas Descargar_Achivos               *
	echo * 9) Salir del menu volver a anterior          *
	echo * o) Continuacion del programa                 *	
	echo *************************************************
		set /p var=Seleccione una opcion [1-9]: 
		:: progamas de equipo de wifi
		if "%var%"=="1" goto progamas
		if "%var%"=="2" goto progamas1
		if "%var%"=="3" goto progamas2
		if "%var%"=="4" goto progamas3
		if "%var%"=="5" goto progamas4
		if "%var%"=="6" goto progamas5
		if "%var%"=="7" goto progamas6
		if "%var%"=="8" goto progamas7
		if "%var%"=="9" goto salir
		if "%var%"=="o" goto menu3
		:: if "%var%"=="15" goto prueba
		
:: error de comandos
:error
cls
echo *************************************************
echo.
echo *        OPCION SELECCIONADA NO VALIDA!         *
echo.
echo *************************************************
timeout /T 5 >nul
goto 64

:progamas
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\procexp64.exe start procexp64.exe & goto 64 
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\procexp64.exe cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & wget https://download.sysinternals.com/files/ProcessExplorer.zip & title Juan El Bueno & goto procexp64
:: Extraer en winrar
:procexp64
"C:\Juanelbuenocopiadelosarcivos\winrar\Winrar-cmd-main\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\ProcessExplorer.zip C:\Juanelbuenocopiadelosarcivos\progamas 
cd C:\Juanelbuenocopiadelosarcivos\progamas 
start procexp64.exe
goto 64

:progamas1
cd C:\Juanelbuenocopiadelosarcivos\progamas
REM IF NOT EXIST "C:\Program Files\Java\jre1.8.0_301\bin\java.exe" echo [+]Programas necesarios Java & timeout /T 5 >nul & goto 64

:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\MegaBasterd_7.43.jar start cmd /c java -jar MegaBasterd_7.43.jar
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\MegaBasterd_7.43.jar wget https://github.com/tonikelope/megabasterd/releases/download/v7.43/MegaBasterd.jar & title Juan El Bueno & cd C:\Juanelbuenocopiadelosarcivos\progamas & start cmd /c java -jar MegaBasterd_7.43.jar
goto 64

:progamas2
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\speedtest.exe start speedtest.exe & goto 64
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\speedtest.exe cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & powershell -command iwr 'https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-win64.zip' -OutFile 'speedtest-win64.zip' & goto speed
:: Extraer en winrar
:speed
"C:\Juanelbuenocopiadelosarcivos\winrar\Winrar-cmd-main\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\speedtest-win64.zip C:\Juanelbuenocopiadelosarcivos\progamas
cd C:\Juanelbuenocopiadelosarcivos\progamas
start speedtest.exe
goto 64

:progamas3
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\Autoruns64.exe start Autoruns64.exe & goto 64
:: si no exite se descarga
:: https://download.sysinternals.com/files/Autoruns.zip
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\Autoruns64.exe cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & powershell.exe -ExecutionPolicy Bypass -Command (new-object System.Net.WebClient).DownloadFile('https://download.sysinternals.com/files/Autoruns.zip','Autoruns.zip') & goto Autoruns1 
:: Extraer en winrar
:Autoruns1
"C:\Juanelbuenocopiadelosarcivos\winrar\Winrar-cmd-main\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\Autoruns.zip C:\Juanelbuenocopiadelosarcivos\progamas 
cd C:\Juanelbuenocopiadelosarcivos\progamas 
start Autoruns64.exe
goto 64

:progamas4
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\TMX64.exe start TMX64.exe & goto 64
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\TMX64.exe cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & powershell -command iwr 'https://mitec.cz/Downloads/TMX.zip' -OutFile 'TMX64.zip' & goto TMX64
:TMX64
:: Extraer en winrar
"C:\Juanelbuenocopiadelosarcivos\winrar\Winrar-cmd-main\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\TMX64.zip C:\Juanelbuenocopiadelosarcivos\progamas
cd C:\Juanelbuenocopiadelosarcivos\progamas
start TMX64.exe 
goto 64

:progamas5
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\Everything.exe start Everything.exe & goto 64
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\Everything.exe cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & powershell -command iwr 'https://www.voidtools.com/Everything-1.4.1.969.x64.zip' -OutFile 'Everything-1.4.1.969.x64.zip' & goto Everything
:Everything
:: Extraer en winrar
"C:\Juanelbuenocopiadelosarcivos\winrar\Winrar-cmd-main\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\Everything-1.4.1.969.x64.zip C:\Juanelbuenocopiadelosarcivos\progamas
cd C:\Juanelbuenocopiadelosarcivos\progamas
start Everything.exe
goto 64

:progamas6
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\WizTree64.exe start WizTree64.exe & goto 64
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\WizTree64.exe cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & powershell -command iwr 'https://wiztreefree.com/files/wiztree_3_39_portable.zip' -OutFile 'wiztree_3_39_portable.zip' & goto wiztreeportable 
:: Extraer en winrar
:wiztreeportable
"C:\Juanelbuenocopiadelosarcivos\winrar\Winrar-cmd-main\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\wiztree_3_39_portable.zip C:\Juanelbuenocopiadelosarcivos\progamas 
cd C:\Juanelbuenocopiadelosarcivos\progamas 
start WizTree64.exe
goto 64

:progamas7
IF NOT EXIST "C:\Juanelbuenocopiadelosarcivos\progamas\EagleGetProtable" md "C:\Juanelbuenocopiadelosarcivos\progamas\EagleGetProtable"
cd C:\Juanelbuenocopiadelosarcivos\progamas\EagleGetProtable
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\EagleGetProtable\EagleGet.exe start EagleGet.exe & goto 64
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\EagleGetProtable\EagleGet.exe cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & powershell -command iwr 'http://dl.eagleget.com/latest/EagleGetProtable_2.1.5.10.zip' -OutFile 'EagleGetProtable_2.1.5.10.zip' & goto EagleGetProtable 
:: Extraer en winrar
:EagleGetProtable
"C:\Juanelbuenocopiadelosarcivos\winrar\Winrar-cmd-main\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\EagleGetProtable_2.1.5.10.zip C:\Juanelbuenocopiadelosarcivos\progamas\EagleGetProtable
cd C:\Juanelbuenocopiadelosarcivos\progamas\EagleGetProtable
start EagleGet.exe
goto 64


:menu3
	cls
	echo *************************************************
	echo *                      MENU                     *
	echo *************************************************
	echo * 1) Programas Examen de seguridad de Microsoft *
	echo * 2) Programas Optimizar el windows %random%    *
	::echo * 3) Programas*
	::echo * 4) Programas*
	::echo * 5) Programas*
	::echo * 6) Programas*
	::echo * 7) Programas*
	::echo * 8) Programas*
	echo * 3) Salir del menu volver a anterior           *
	echo *************************************************
		set /p var=Seleccione una opcion [1-2]: 
		:: progamas de equipo de wifi
		if "%var%"=="1" goto Executar1
		if "%var%"=="2" goto Executar2
		if "%var%"=="3" goto menu2
		::if "%var%"=="4" goto 
		::if "%var%"=="5" goto 
		::if "%var%"=="6" goto 
		::if "%var%"=="7" goto 
		::if "%var%"=="8" goto 
		::if "%var%"=="9" goto 
		
:: error de comandos
:error
cls
echo *************************************************
echo.
echo *        OPCION SELECCIONADA NO VALIDA!         *
echo.
echo *************************************************
timeout /T 5 >nul
goto menu3

:Executar1
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\MSERT.exe start MSERT.exe
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\MSERT.exe powershell -command iwr 'https://definitionupdates.microsoft.com/download/DefinitionUpdates/VersionedSignatures/AM/1.345.357.0/amd64/MSERT.exe' -OutFile 'MSERT.exe' & start MSERT.exe
goto menu3

:Executar2
::
IF NOT EXIST "C:\Juanelbuenocopiadelosarcivos\progamas\master" md "C:\Juanelbuenocopiadelosarcivos\progamas\master"
::
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\master\win10script-master\win10debloat.ps1 powershell.exe C:\Juanelbuenocopiadelosarcivos\progamas\master\win10script-master\win10debloat.ps1 & goto menu3
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\master\win10script-master\win10debloat.ps1 cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & powershell -command iwr 'https://github.com/ChrisTitusTech/win10script/archive/refs/heads/master.zip' -OutFile 'master.zip' & goto Programon
:: Extraer en winrar
:Programon
"C:\Juanelbuenocopiadelosarcivos\winrar\Winrar-cmd-main\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\master.zip C:\Juanelbuenocopiadelosarcivos\progamas\master
cd C:\Juanelbuenocopiadelosarcivos\progamas\master\win10script-master
powershell.exe C:\Juanelbuenocopiadelosarcivos\progamas\master\win10debloat.ps1
pause
goto menu3

:salir
:: del C:\Juanelbuenocopiadelosarcivos\progamas /f /s /q
timeout /T 5 > NUL
goto menu
