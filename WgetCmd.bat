@echo off
color 9f

set Version=V1.3

if $SYSTEM_os_arch==x86 (
  set Titulo=Juan El Bueno %Version% (32 bits)
) else (
  set Titulo=Juan El Bueno %Version% (64 bits)
)


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
powershell -command iwr 'https://web.archive.org/web/20211101121933if_/https://eternallybored.org/misc/wget/1.21.2/32/wget.exe' -OutFile 'wget.exe'
echo Usando 32bits 
echo.
echo [+] Salendo...
timeout /T 6 >nul 
Exit
) else (
cd C:\Windows\System32
powershell -command iwr 'https://web.archive.org/web/20220218172657if_/https://eternallybored.org/misc/wget/1.21.2/64/wget.exe' -OutFile 'wget.exe'
echo Usando 64bits
echo.
echo [+] Salendo... 
timeout /T 6 >nul 
Exit
)
