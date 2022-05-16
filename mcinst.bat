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
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.zip --output morecord.zip
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.z01 --output morecord.z01
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.z02 --output morecord.z02
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.z03 --output morecord.z03
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.z04 --output morecord.z04
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.z05 --output morecord.z05
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.z06 --output morecord.z06
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.z07 --output morecord.z07
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.z08 --output morecord.z08
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.z09 --output morecord.z09
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/morecord.z10 --output morecord.z10
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/7z.exe --output 7z.exe
curl https://raw.githubusercontent.com/AvianJay/Morecord/main/7z.dll --output 7z.dll
echo Unzipping App...
7z x -aoa morecord.zip
echo Deleteing zip file...
del morecord.z*
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
