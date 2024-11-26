# set sensible UAC settings
$uacKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
if (-not (Test-Path -Path $uacKeyPath)) {
    New-Item -Path $uacKeyPath
}
New-ItemProperty -Path $uacKeyPath -Name "ConsentPromptBehaviorAdmin" -Value 5 -PropertyType DWord -Force
New-ItemProperty -Path $uacKeyPath -Name "EnableLUA" -Value 1 -PropertyType DWord -Force