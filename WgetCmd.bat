@echo off
color 9f

IF EXIST C:\Windows\System32\wget.exe ( 
echo Execuction Exitosa
echo.
echo [+] Salendo...
timeout /T 3 >nul 
Exit
) else (
goto 32o64
)
:32o64
if $SYSTEM_os_arch==x86 (
cd C:\Windows\System32
powershell -command iwr 'https://eternallybored.org/misc/wget/1.21.1/32/wget.exe' -OutFile 'wget.exe'
echo Usando 32bits 
echo.
echo [+] Salendo...
timeout /T 6 >nul 
Exit
) else (
cd C:\Windows\System32
powershell -command iwr 'https://eternallybored.org/misc/wget/1.21.1/64/wget.exe' -OutFile 'wget.exe'
echo Usando 64bits
echo.
echo [+] Salendo... 
timeout /T 6 >nul 
Exit
)
