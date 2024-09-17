# Set screen brightness to 15%
(Get-WmiObject -NameSpace root/WMI -Class WmiMonitorBrightnessMethods).WmiSetBrightness(1, 15)
