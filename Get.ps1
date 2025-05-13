param (
    [switch]$Silent,
    [switch]$Verbose,
    [switch]$Sysprep,
    [string]$User,
    [switch]$RunAppConfigurator,
    [switch]$RunDefaults, [switch]$RunWin11Defaults,
    [switch]$RunSavedSettings,
    [switch]$RemoveApps, 
    [switch]$RemoveAppsCustom,
    [switch]$RemoveGamingApps,
    [switch]$RemoveCommApps,
    [switch]$RemoveDevApps,
    [switch]$RemoveW11Outlook,
    [switch]$ForceRemoveEdge,
    [switch]$DisableDVR,
    [switch]$DisableTelemetry,
    [switch]$DisableBingSearches, [switch]$DisableBing,
    [switch]$DisableDesktopSpotlight,
    [switch]$DisableLockscrTips, [switch]$DisableLockscreenTips,
    [switch]$DisableWindowsSuggestions, [switch]$DisableSuggestions,
    [switch]$ShowHiddenFolders,
    [switch]$ShowKnownFileExt,
    [switch]$HideDupliDrive,
    [switch]$TaskbarAlignLeft,
    [switch]$HideSearchTb, [switch]$ShowSearchIconTb, [switch]$ShowSearchLabelTb, [switch]$ShowSearchBoxTb,
    [switch]$HideTaskview,
    [switch]$DisableStartRecommended,
    [switch]$DisableCopilot,
    [switch]$DisableRecall,
    [switch]$DisableWidgets, [switch]$HideWidgets,
    [switch]$DisableChat, [switch]$HideChat,
    [switch]$ClearStart,
    [switch]$ClearStartAllUsers,
    [switch]$RevertContextMenu,
    [switch]$DisableMouseAcceleration,
    [switch]$HideHome,
    [switch]$HideGallery,
    [switch]$ExplorerToHome,
    [switch]$ExplorerToThisPC,
    [switch]$ExplorerToDownloads,
    [switch]$ExplorerToOneDrive,
    [switch]$DisableOnedrive, [switch]$HideOnedrive,
    [switch]$Disable3dObjects, [switch]$Hide3dObjects,
    [switch]$DisableMusic, [switch]$HideMusic,
    [switch]$DisableIncludeInLibrary, [switch]$HideIncludeInLibrary,
    [switch]$DisableGiveAccessTo, [switch]$HideGiveAccessTo,
    [switch]$DisableShare, [switch]$HideShare
)

# Show error if current powershell environment does not have LanguageMode set to FullLanguage 
if ($ExecutionContext.SessionState.LanguageMode -ne "FullLanguage") {
   Write-Host "Error: Win11Debloat is unable to run on your system. Powershell execution is restricted by security policies" -ForegroundColor Red
   Write-Output ""
   Write-Output "Press enter to exit..."
   Read-Host | Out-Null
   Exit
}

Clear-Host
Write-Output "-------------------------------------------------------------------------------------------"
Write-Output " Win11Debloat Script - Get"
Write-Output "-------------------------------------------------------------------------------------------"

Write-Output "> Creating temp dir ..."
New-Item -ItemType Directory -Path C:\TionIT -Force | Out-Null

Write-Output ""

Write-Output "> Downloading Win11Debloat..."

# Download latest version of Win11Debloat from github as zip archive
Invoke-WebRequest http://github.com/BenLoghmanian/Win11Debloat/archive/master.zip -OutFile "C:\TionIT/win11debloat-temp.zip"

# Remove old script folder if it exists, except for CustomAppsList and SavedSettings files
if (Test-Path "C:\TionIT/Win11Debloat/Win11Debloat-master") {
    Write-Output ""
    Write-Output "> Cleaning up old Win11Debloat folder..."
    Get-ChildItem -Path "C:\TionIT/Win11Debloat/Win11Debloat-master" | Remove-Item -Recurse -Force
}

Write-Output ""
Write-Output "> Unpacking..."

# Unzip archive to Win11Debloat folder
Expand-Archive "C:\TionIT/win11debloat-temp.zip" "C:\TionIT/Win11Debloat"

# Remove archive
Remove-Item "C:\TionIT/win11debloat-temp.zip"

Write-Output ""
Write-Output "> Running Win11Debloat..."

# Run Win11Debloat script with the provided arguments
& powershell.exe -ExecutionPolicy Bypass -File "C:\TionIT\Win11Debloat\Win11Debloat-master\Win11Debloat.ps1" -Silent -DisableFastStartup -RemoveAppsCustom -DisableDVR -DisableTelemetry -DisableSuggestions -DisableDesktopSpotlight -DisableLockscreenTips -DisableBing -DisableCopilot -ShowKnownFileExt -HideTaskview -HideChat -DisableWidgets -DisableStartRecommended -HideHome -HideGapllery -ExplorerToThisPC

Write-Output ""
