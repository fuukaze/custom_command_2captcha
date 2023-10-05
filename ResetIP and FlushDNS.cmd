:MENU_START
@echo off
cls
set INPUT=false
set "MENU_OPTION="
echo +===============================================+
echo . BATCH SCRIPT - USER MENU                      .
echo +===============================================+
echo .                                               .
echo .  1) Reset Netsh Winsock                       .
echo .  2) Reset IP                                  .
echo .  3) Reset DNS                                 .
echo .  4) Persiapan 2captcha                        .
echo .  5) Hapus Semua Cache App                     .
echo .  6) Belum Tersedia                                  .  
echo .  7) ShutDown                                   .
echo .  8) Restart                                      .
echo .  9) EXIT                                      .
echo .                                               .
echo +===============================================+
set /p MENU_OPTION="OPTION: "

IF %MENU_OPTION%==1 GOTO OPTION1
IF %MENU_OPTION%==2 GOTO OPTION2
IF %MENU_OPTION%==3 GOTO OPTION3
IF %MENU_OPTION%==4 GOTO OPTION4
IF %MENU_OPTION%==5 GOTO OPTION5
IF %MENU_OPTION%==6 GOTO OPTION6
IF %MENU_OPTION%==7 GOTO OPTION7
IF %MENU_OPTION%==8 GOTO OPTION8
IF %MENU_OPTION%==9 GOTO OPTION9
IF %INPUT%==false GOTO DEFAULT

:OPTION1
netsh winsock reset
echo +===============================================+
echo +               berhasil reset                  +
echo +===============================================+
timeout 10 > NUL
GOTO MENU_START

:OPTION2
ipconfig /release
ipconfig /renew
echo +===============================================+
echo +          sukses release renew ip              +
echo +===============================================+
timeout 10 > NUL
GOTO MENU_START

:OPTION3
ipconfig /flushdns
echo +===============================================+
echo +             sukses ngurus DNS                 +
echo +===============================================+
timeout 10 > NUL
GOTO MENU_START

:OPTION4
netsh winsock reset
ipconfig /flushdns
ipconfig /release
echo start /wait powershell E:\2captcha\clearDNSCache.ps1
start /wait powershell E:\2captcha\clearDNSCache.ps1
del /f /s /q %temp%\*
del /f /s /q C:\Sandbox\*.tmp
ipconfig /renew
timeout 10 > NUL
GOTO MENU_START

:OPTION5
del /f /s /q %temp%\*
del /f /s /q %systemdrive%\*.tmp
echo del /f /s /q %systemdrive%\*._mp
echo del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
echo +===============================================+
echo +        Sukses Hapus Sampah Aplikasi           +
echo +===============================================+
timeout 10 > NUL
GOTO MENU_START

:OPTION6
echo +===============================================+
echo +        Perintah Masih dalam upgrade           +
echo +===============================================+
GOTO MENU_START

:OPTION7
echo +======================+
echo +    Good Bye BRO      +
echo +======================+
shutdown /f /s /t 5

:OPTION8
echo +======================+
echo +    Good Bye BRO      +
echo +======================+
shutdown /f /r /t 5

:OPTION9
echo +===============================================+
echo +    Good Bye, Hope You'll come back to me      +
echo +===============================================+
timeout 2 > NUL
exit /b

:DEFAULT
echo +===============================================+
echo +               Perintah Salah                  +
echo +===============================================+
timeout 10 > NUL
GOTO MENU_START