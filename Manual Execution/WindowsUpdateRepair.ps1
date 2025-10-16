# Windows Update repair
Write-Host ""
Write-Host "Windows Update repair" -ForegroundColor DarkGreen -BackgroundColor White
Write-Output "---------------------------------------------------"
sfc.exe /scannow
DISM.exe /Online /Cleanup-Image /CheckHealth
DISM.exe /Online /Cleanup-Image /ScanHealth
DISM.exe /Online /Cleanup-Image /RestoreHealth
net stop bits
net stop wuauserv
net stop appidsvc
net stop cryptsvc
regsvr32.exe /s atl.dll
regsvr32.exe /s urlmon.dll
regsvr32.exe /s mshtml.dll
netsh winsock reset
netsh winsock reset proxy
net start bits
net start wuauserv
net start appidsvc
net start cryptsvc
