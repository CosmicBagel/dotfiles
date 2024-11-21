# 24 hour time format
$internationalPath = "HKCU:\Control Panel\International"
Set-ItemProperty -Path $internationalPath -Name "sTimeFormat" -Value "HH:mm:ss"
Set-ItemProperty -Path $internationalPath -Name "sShortTime" -Value "HH:mm"

$explorerPath = "HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
# Don't group tasks in alt+tab
Set-ItemProperty -Path $explorerPath -Name "EnableTaskGroups" -Value 0

# show hidden files and file extensions
Set-ItemProperty -Path $explorerPath -Name "HideFileExt" -Value 0
Set-ItemProperty -Path $explorerPath -Name "Hidden" -Value 1

# hide taskbar buttons
Set-ItemProperty -Path $explorerPath -Name "ShowTaskViewButton" -Value 0
Set-ItemProperty -Path $explorerPath -Name "ShowCopilotButton" -Value 0
Set-ItemProperty -Path $explorerPath -Name "ShowCortanaButton" -Value 0

# more icons, less recommendations in start menu
Set-ItemProperty -Path $explorerPath -Name "Start_Layout" -Value 1
# Start_Layout REG_DWORD 1


# left aligned task bar
# TaskbarAl REG_DWORD 0

#don't show recommendations
# Start_TrackDocs REG_DWORD 0
# Start_IrisRecommendations REG_DWORD 0

# HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Search
# SearchboxTaskbarMode REG_DWORD 0

# HKCU:Software\Microsoft\Windows\CurrentVersion\Start
# ShowRecentList REG_DWORD 0

# VisiblePlaces REG_BINARY (zero-length binary value)

# Dark mode is enabling
Set-ItemProperty `
  -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize `
  -Name AppsUseLightTheme `
  -Value 0
Set-ItemProperty `
  -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize `
  -Name SystemUsesLightTheme `
  -Value 0

# Restart explorer to apply settings
Stop-Process -Name explorer
