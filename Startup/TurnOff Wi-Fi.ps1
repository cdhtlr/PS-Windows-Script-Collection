# TurnOff Wi-Fi
Set-NetAdapterAdvancedProperty -Name "WLAN" -AllProperties -RegistryKeyword "SoftwareRadioOff" -RegistryValue "1"
