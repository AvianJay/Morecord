@echo off 
title Morecord Installer
echo Press any key to install.
pause > nul
cd %USERPROFILE%
%SYSTEMDRIVE%
echo Making dir...
md morecord
cd morecord
echo Downloading file...
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.bat --output morecord.bat
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.ico --output morecord.ico
echo Running Setup Script...
md accounts
if exist "%SYSTEMDRIVE%\Program Files (x86)\Google\Chrome\Application\chrome_proxy.exe" (echo %SYSTEMDRIVE%\Program Files\Google\Chrome\Application\chrome_proxy.exe >> cl.cfg
if exist "%SYSTEMDRIVE%\Program Files\Google\Chrome\Application\chrome_proxy.exe"
echo Creating Shortcut...
echo set WshShell = WScript.CreateObject("WScript.Shell") >> findDesktop.vbs
echo strDesktop = WshShell.SpecialFolders("Desktop") >> findDesktop.vbs
echo wscript.echo(strDesktop) >> findDesktop.vbs
cscript //Nologo findDesktop.vbs >> deskdir.tmp
set /p deskdir=<deskdir.tmp
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%deskdir%\Morecord.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oShellLink.IconLocation = "%USERPROFILE%\morecord\morecord.ico, 0" >> CreateShortcut.vbs
echo oLink.TargetPath = "%USERPROFILE%\morecord\morecord.bat" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript //b CreateShortcut.vbs
del CreateShortcut.vbs
echo Creating Uninstall script...
echo @echo off >> uninstall.bat
echo title Morecord Uninstaller >> uninstall.bat
echo echo Do You Want To Uninstall Morecord? >> uninstall.bat
echo echo Press Any Key To Uninstall. >> uninstall.bat
echo pause >> uninstall.bat
echo cd %USERPROFILE% >> uninstall.bat
echo rmdir /S /Q %USERPROFILE%\morecord >> uninstall.bat
echo echo Uninstalled.Press Any Key To Exit. >> uninstall.bat
echo pause >> uninstall.bat
echo exit >> uninstall.bat
echo Installed.
echo Press Any Key To exit Installer.
pause > nul
exit