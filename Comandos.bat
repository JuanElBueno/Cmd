@shift
@echo off
mode con: cols=50 lines=18  
color 9f
title Juan El Bueno 
IF NOT EXIST "C:\Juanelbuenocopiadelosarcivos" md "C:\Juanelbuenocopiadelosarcivos"
IF NOT EXIST "C:\Juanelbuenocopiadelosarcivos\progamas" md "C:\Juanelbuenocopiadelosarcivos\progamas"
IF NOT EXIST "C:\Juanelbuenocopiadelosarcivos\progamas\rar" md "C:\Juanelbuenocopiadelosarcivos\progamas\rar" 
echo **************************************************
echo.
echo        Version Beta De la Aplicacion V1.11.50  
echo.
echo **************************************************
timeout /T 5 >nul
cd C:\Juanelbuenocopiadelosarcivos
IF NOT EXIST C:\Windows\System32\wget.exe echo [+]Programas necesarios Wget & timeout /T 5 >nul & goto Administradorwget
:rar
IF NOT EXIST "C:\Program Files\WinRAR\WinRAR.exe" echo [+]Programas necesarios WinRAR & timeout /T 5 >nul & goto desrar

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
		REM if "%var%"=="w" goto Administradorwget
		
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
systeminfo > "informacion del equipo.txt"
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
del *.* /f /S /q echo >> achivos_borrados.txt & copy achivos_borrados.txt C:\Juanelbuenocopiadelosarcivos
timeout /T 20
@echo off
del achivos_borrados.txt /f /s /q
cls
goto menu

:Administradorcmd
cd C:\Juanelbuenocopiadelosarcivos
::powershell -command iwr 'https://www.sordum.org/files/download/power-run/PowerRun.zip' -OutFile 'PowerRun.zip'
::si no exist la carpeta que me lo cres 
IF NOT EXIST %cd%\admin md %cd%\admin
:: si exite se pone en admin
IF EXIST %cd%\admin\PowerRun\PowerRun_x64.exe cd %cd%\admin\PowerRun & goto exploreradmin
:: si no exite se descarga
IF NOT EXIST %cd%\admin\PowerRun\PowerRun_x64.exe cd %cd%\admin & powershell -command iwr 'https://www.sordum.org/files/download/power-run/PowerRun.zip' -OutFile 'PowerRun.zip' & goto Administradorcmdrar
:Administradorcmdrar
cd C:\Juanelbuenocopiadelosarcivos\admin
"C:\Program Files\WinRAR\WinRAR.exe" x %cd%\PowerRun.zip %cd% & goto exploreradmin
:exploreradmin
cd C:\Juanelbuenocopiadelosarcivos\admin\PowerRun
"%cd%\PowerRun_x64.exe" "%UserProfile%\Desktop\Comandos.bat" & echo [+] Salendo... & timeout /T 2 >nul & Exit 

::***************************************************************************************

:Administradorwget
cd C:\Juanelbuenocopiadelosarcivosa
::si no exist la carpeta que me lo cres 
IF NOT EXIST %cd%\admin md %cd%\admin
:: si exite se pone en admin
IF EXIST %cd%\admin\PowerRun\PowerRun_x64.exe cd %cd%\admin\PowerRun & goto Administradorwgetexe
:: si no exite se descarga
IF NOT EXIST %cd%\admin\PowerRun\PowerRun_x64.exe cd %cd%\admin & powershell -command iwr 'https://www.sordum.org/files/download/power-run/PowerRun.zip' -OutFile 'PowerRun.zip' & goto Administradorwgetrar
:Administradorwgetrar
d C:\Juanelbuenocopiadelosarcivos\admin
"C:\Program Files\WinRAR\WinRAR.exe" x %cd%\PowerRun.zip %cd%
cd C:\Juanelbuenocopiadelosarcivos\admin\PowerRun & goto Administradorwgetexe
:Administradorwgetexe
cd C:\Juanelbuenocopiadelosarcivos
IF EXIST %cd%\WgetCmd.bat "C:\Juanelbuenocopiadelosarcivos\admin\PowerRun\PowerRun_x64.exe" "%cd%\WgetCmd.bat" & goto rar
IF NOT EXIST %cd%\WgetCmd.bat powershell -command iwr 'https://raw.githubusercontent.com/JuanElBueno/Cmd/main/WgetCmd.bat' -OutFile 'WgetCmd.bat' & "C:\Juanelbuenocopiadelosarcivos\admin\PowerRun\PowerRun_x64.exe" "%cd%\WgetCmd.bat" & goto rar

:desrar
cd C:\Juanelbuenocopiadelosarcivos\progamas
IF EXIST "C:\Program Files\WinRAR\WinRAR.exe" goto menu
IF NOT EXIST "C:\Program Files\WinRAR\WinRAR.exe" wget https://d.winrar.es/d/103z1630683189/F0xrIEZsuPJTaQYxjRVerg/winrar-x64-602es.exe & winrar-x64-602es.exe /S /I & wget https://gist.githubusercontent.com/MuhammadSaim/de84d1ca59952cf1efaa8c061aab81a1/raw/ca31cbda01412e85949810d52d03573af281f826/rarreg.key & cd "C:\Program Files\WinRAR" & copy "C:\Juanelbuenocopiadelosarcivos\progamas\rarreg.key" "C:\Program Files\WinRAR" & goto menu


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
cd C:\Juanelbuenocopiadelosarcivos\progamas
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\youtube-dl.exe goto descagar_yt_programa
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\youtube-dl.exe cd C:\Juanelbuenocopiadelosarcivos\progamas & wget https://youtube-dl.org/downloads/latest/youtube-dl.exe & goto descagar_yt_programa

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
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\ffmpeg.exe cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & wget "" & goto mp3_combertidor_winrar
:mp3_combertidor_winrar
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\ffmpeg md C:\Juanelbuenocopiadelosarcivos\progamas\ffmpeg 
"C:\Program Files\WinRAR\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\ffmpeg.zip C:\Juanelbuenocopiadelosarcivos\progamas\ffmpeg
cd C:\Juanelbuenocopiadelosarcivos\progamas\ffmpeg\                                      \bin
copy ffmpeg.exe C:\Juanelbuenocopiadelosarcivos\progamas & goto mp3_combertidor_haciendo

:mp3_combertidor_haciendo
cd C:\Juanelbuenocopiadelosarcivos\progamas
set /p ORIGEN=Origen del achivo:
set /p DESTINO=Destino del achivo:
@echo on
ffmpeg.exe -i %ORIGEN% %DESTINO%
@echo off
pause
goto Combertidor_de_yt


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
		if "%var%"=="1,2" call cmd /c "taskmgr" & call cmd /c "calc" & goto admintareas
		
		
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


:: menu2 de progamas de descagar
:menu2
if $SYSTEM_os_arch==x86 (
  goto 32
) else (
  goto 64
)


::32
:32
	cls
	echo *************************************************
	echo *           Progama desatualizado               *
	echo *************************************************
	echo *************************************************
	echo *                      MENU                     *
	echo *************************************************
	echo * 1) Progamas procexp64                         *
	echo * 2) Progamas MegaBasterd                       *
	echo * 3) Salir del menu volver a anterior.          *
	echo *************************************************
		set /p var=Seleccione una opcion [1-3]: 
		if "%var%"=="1" goto progamasm3
		if "%var%"=="2" goto progamas1m3
		if "%var%"=="3" goto menu
		
:: error de comandos
:error
cls
echo *************************************************
echo.
echo *        OPCION SELECCIONADA NO VALIDA!         *
echo.
echo *************************************************
timeout /T 5 >nul
goto 32

:progamasm3
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\procexp64.exe start procexp.exe
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\procexp64.exe wget https://download.sysinternals.com/files/ProcessExplorer.zip & start procexp.exe
title Juan El Bueno
goto 
"C:\Program Files\WinRAR\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\ProcessExplorer.zip C:\Juanelbuenocopiadelosarcivos\progamas 
cd C:\Juanelbuenocopiadelosarcivos\progamas 
start procexp64.exe
goto 64

:progamas1m3
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\MegaBasterd.jar start MegaBasterd.jar
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\MegaBasterd.jar wget https://github.com/tonikelope/megabasterd/releases/download/v7.24/MegaBasterd_7.24.jar & start MegaBasterd.jar
title Juan El Bueno
goto m3


::64
:64
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
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\procexp64.exe cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & wget https://download.sysinternals.com/files/ProcessExplorer.zip & goto procexp64
:: Extraer en winrar
:procexp64
"C:\Program Files\WinRAR\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\ProcessExplorer.zip C:\Juanelbuenocopiadelosarcivos\progamas 
cd C:\Juanelbuenocopiadelosarcivos\progamas 
start procexp64.exe
goto 64

:progamas1
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\MegaBasterd.jar start cmd /c java -jar MegaBasterd.jar
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\MegaBasterd.jar wget https://github.com/tonikelope/megabasterd/releases/download/v7.42/MegaBasterd_7.42.jar & cd C:\Juanelbuenocopiadelosarcivos\progamas & start cmd /c java -jar MegaBasterd.jar
goto 64

:progamas2
cd C:\Juanelbuenocopiadelosarcivos\progamas
:: si exite se pone la aplicacion
IF EXIST C:\Juanelbuenocopiadelosarcivos\progamas\speedtest.exe start speedtest.exe & goto 64
:: si no exite se descarga
IF NOT EXIST C:\Juanelbuenocopiadelosarcivos\progamas\speedtest.exe cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & powershell -command iwr 'https://install.speedtest.net/app/cli/ookla-speedtest-1.0.0-win64.zip' -OutFile 'speedtest-win64.zip' & goto speed
:: Extraer en winrar
:speed
"C:\Program Files\WinRAR\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\speedtest-win64.zip C:\Juanelbuenocopiadelosarcivos\progamas
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
"C:\Program Files\WinRAR\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\Autoruns.zip C:\Juanelbuenocopiadelosarcivos\progamas 
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
"C:\Program Files\WinRAR\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\TMX64.zip C:\Juanelbuenocopiadelosarcivos\progamas
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
"C:\Program Files\WinRAR\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\Everything-1.4.1.969.x64.zip C:\Juanelbuenocopiadelosarcivos\progamas
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
"C:\Program Files\WinRAR\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\wiztree_3_39_portable.zip C:\Juanelbuenocopiadelosarcivos\progamas 
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
"C:\Program Files\WinRAR\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\EagleGetProtable_2.1.5.10.zip C:\Juanelbuenocopiadelosarcivos\progamas\EagleGetProtable
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
"C:\Program Files\WinRAR\WinRAR.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\master.zip C:\Juanelbuenocopiadelosarcivos\progamas\master
cd C:\Juanelbuenocopiadelosarcivos\progamas\master\win10script-master
powershell.exe C:\Juanelbuenocopiadelosarcivos\progamas\master\win10debloat.ps1
pause
goto menu3



:salir
:: del C:\Juanelbuenocopiadelosarcivos\progamas /f /s /q
timeout /T 5
goto menu

:: powershell.exe -command PowerShell -ExecutionPolicy bypass -noprofile -windowstyle hidden -command (New-Object System.Net.WebClient).DownloadFile('descagar',"donde lo descarga");Start-Process ("$executable")

:: ::Nada:: repetir los progamas y que lo ponga en admin

:: start http://download1626.mediafire.com/kb9kyqqwsklg/zpqvistkx07fqw7/wget.exe

:: "c:\archivos de programa\winrar\winrar.exe" x "C:\Juanelbuenocopiadelosarcivos\progamas\" C:\Juanelbuenocopiadelosarcivos\progamas

:: powershell -command iwr 'https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-win64.zip' -OutFile 'speedtest-win64.zip'

:: powershell.exe -ExecutionPolicy Bypass -Command (new-object System.Net.WebClient).DownloadFile('https://eternallybored.org/misc/wget/1.20.3/64/wget.exe','wget.exe') 

:: powershell wget "http://www.mediafire.com/file/dku13ib72jkjvpq" --no-check-certificate

::cd C:\Juanelbuenocopiadelosarcivos\progamas\rar & powershell -command iwr 'http://www.mitec.cz/Downloads/TMX64.zip' -OutFile 'TMX64.zip' "c:\archivos de programa\winrar\winrar.exe" x C:\Juanelbuenocopiadelosarcivos\progamas\rar\TMX64.zip C:\Juanelbuenocopiadelosarcivos\progamas cd C:\Juanelbuenocopiadelosarcivos\progamas start "TMX64.exe"
