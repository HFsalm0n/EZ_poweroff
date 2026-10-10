@echo off
color 4F
choice /c YN /m "Power off PC? Press Y to power off, press N to cancel"
if errorlevel 2 exit
echo Your PC will turn off in 20 seconds...
shutdown /s /t 20
choice /c YN /m "Press N to abort turning off, Y to continue"
if errorlevel 2 shutdown /a
choice /c NY /m "Press Y to power off PC right now or N to abort"
if errorlevel 2 shutdown /s /f /t 0
shutdown /a
