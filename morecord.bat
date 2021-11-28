@echo off
title Morecord
%SYSTEMDRIVE%
set /p chromel=<%USERPROFILE%\morecord\cl.cfg

:check
if exist %USERPROFILE%\morecord\accounts\list.cfg (goto ask)
echo New Discord Account
set /p name="Account Name(No Space):"
cd %USERPROFILE%\morecord\accounts\
echo %name% > list.cfg
md %name%
%chromel% --user-data-dir="%USERPROFILE%\morecord\accounts\%name%" --app="https://discord.com/app"
exit

:ask
echo (1)Add Account
echo (2)Load Account
set /p ask="Select:"
if %ask%=1 (goto add)
if %ask%=2 (goto load)
echo Type 1 or 2
goto ask

:add
cls
title New Discord Account
set /p name="Account Name(No Space):"
cd %USERPROFILE%\morecord\accounts\
echo %name% > list.cfg
md %name%
%chromel% --user-data-dir="%USERPROFILE%\morecord\accounts\%name%" --app="https://discord.com/app"
exit

:load
cls
title Load Discord Account
type %USERPROFILE%\morecord\accounts\list.cfg
set /p acc="Select A Account:"
if exist %USERPROFILE%\morecord\accounts\%acc% (echo error & goto load) else (%chromel% --user-data-dir="%USERPROFILE%\morecord\accounts\%acc%" --app="https://discord.com/app")
exit