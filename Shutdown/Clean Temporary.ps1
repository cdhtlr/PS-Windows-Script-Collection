function CleanTemporary {
    # Delete SnippingTool temporary files
    Remove-Item -Path "C:\Users\username\AppData\Local\Packages\Microsoft.ScreenSketch_8wekyb3d8bbwe\TempState\*" -Force -Recurse
    
    # Delete WinGet temporary files
    Remove-Item -Path "C:\Users\username\AppData\Local\Temp\WinGet\defaultState\*" -Force -Recurse
}

CleanTemporary
