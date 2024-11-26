# disable start menu web search
$bingSearchEnabledPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
if (-not (Test-Path -Path $bingSearchEnabledPath)) {
    New-Item -Path $bingSearchEnabledPath
}
New-ItemProperty -Path $bingSearchEnabledPath -Name "BingSearchEnabled" -Value 0 -PropertyType DWord -Force

# disable widgets (news and interests)
$newsAndInterestsPath = "HKLM:\Software\Policies\Microsoft\Dsh"
if (-not (Test-Path -Path $newsAndInterestsPath)) {
    New-Item -Path $newsAndInterestsPath
}
New-ItemProperty -Path $newsAndInterestsPath -Name "AllowNewsAndInterests" -Value 0 -PropertyType DWord -Force

# disable cortana
$allowCortanaPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows"
if (-not (Test-Path -Path $allowCortanaPath)) {
    New-Item -Path $allowCortanaPath
}
New-ItemProperty -Path $allowCortanaPath -Name "AllowCortana" -Value 0 -PropertyType DWord -Force