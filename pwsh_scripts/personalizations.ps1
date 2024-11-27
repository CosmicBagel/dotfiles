# 24 hour time format
$internationalRegPath = "HKCU:\Control Panel\International"
Set-ItemProperty -Path $internationalRegPath -Name "sTimeFormat" -Value "HH:mm:ss"
Set-ItemProperty -Path $internationalRegPath -Name "sShortTime" -Value "HH:mm"

# Don't group tasks in alt+tab
$explorerRegPath = "HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $explorerRegPath -Name "EnableTaskGroups" -Value 0

# show hidden files and file extensions
Set-ItemProperty -Path $explorerRegPath -Name "HideFileExt" -Value 0
Set-ItemProperty -Path $explorerRegPath -Name "Hidden" -Value 1

# hide taskbar buttons
Set-ItemProperty -Path $explorerRegPath -Name "ShowTaskViewButton" -Value 0
Set-ItemProperty -Path $explorerRegPath -Name "ShowCopilotButton" -Value 0
Set-ItemProperty -Path $explorerRegPath -Name "ShowCortanaButton" -Value 0

# more icons, less recommendations in start menu
Set-ItemProperty -Path $explorerRegPath -Name "Start_Layout" -Value 1

# left aligned task bar
Set-ItemProperty -Path $explorerRegPath -Name "TaskbarAl" -Value 0

#don't show recommendations
Set-ItemProperty -Path $explorerRegPath -Name "Start_TrackDocs" -Value 0
Set-ItemProperty -Path $explorerRegPath -Name "Start_IrisRecommendations" -Value 0

$searchRegPath = "HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
Set-ItemProperty -Path $searchRegPath -Name "SearchboxTaskbarMode" -Value 0

$startRegPath = "HKCU:Software\Microsoft\Windows\CurrentVersion\Start"
# don't show recent items
Set-ItemProperty -Path $startRegPath -Name "ShowRecentList" -Value 0
# no extra buttons in start menu
Set-ItemProperty -Path $startRegPath -Name "VisiblePlaces" -Value ([byte[]]@())

# Dark mode is enabling
$personalizeRegPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
Set-ItemProperty -Path $personalizeRegPath -Name AppsUseLightTheme -Value 0
Set-ItemProperty -Path $personalizeRegPath -Name SystemUsesLightTheme -Value 0
# Restart explorer to apply settings
Stop-Process -Name explorer
