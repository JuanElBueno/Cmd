@echo off
IF NOT EXIST C:\Windows\System32\wget.exe goto 32o64
:32o64
if $SYSTEM_os_arch==x86 (
cd C:\Windows\System32
powershell -command iwr 'https://eternallybored.org/misc/wget/1.21.1/32/wget.exe' -OutFile 'wget.exe'
echo Usando 32bits & timeout /T 3 >nul & echo [+] Salendo... & timeout /T 2 >nul & Exit
) else (
cd C:\Windows\System32
powershell -command iwr 'https://eternallybored.org/misc/wget/1.21.1/64/wget.exe' -OutFile 'wget.exe'
echo Usando 64bits & timeout /T 3s >nul & echo [+] Salendo... & timeout /T 2 >nul & Exit
)
