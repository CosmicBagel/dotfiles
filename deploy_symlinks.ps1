New-Item -ItemType Directory -Path ~\.config -Force
New-Item -ItemType SymbolicLink -Path ~\.config\wezterm -Target "$HOME\dotfiles\config\wezterm\"

New-Item -ItemType Directory -Path ~\AppData\Roaming -Force
New-Item -ItemType SymbolicLink -Path ~\AppData\Roaming\alacritty -Target "$HOME\dotfiles\config\alacritty\"

New-Item -ItemType Directory -Path ~\AppData\Local -Force
New-Item -ItemType SymbolicLink -Path ~\AppData\Local\nvim -Target "$HOME\dotfiles\config\nvim\"

New-Item -ItemType Directory -Path ~\AppData\Roaming\yazi -Force
New-Item -ItemType SymbolicLink -Path ~\AppData\Roaming\yazi\config -Target "$HOME\dotfiles\config\yazi\"

New-Item -ItemType Directory -Path ~\AppData\Roaming -Force
New-Item -ItemType SymbolicLink -Path ~\AppData\Roaming\neovide -Target "$HOME\dotfiles\config\neovide\"

#New-Item -ItemType Directory -Path ~\Documents\WindowsPowerShell\ -Force
#New-Item -ItemType SymbolicLink -Path ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -Target "$HOME\dotfiles\config\Microsoft.PowerShell_profile.ps1"

New-Item -ItemType Directory -Path ~\Documents\PowerShell\ -Force
New-Item -ItemType SymbolicLink -Path ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Target "$HOME\dotfiles\config\Microsoft.PowerShell_profile.ps1"

New-Item -ItemType SymbolicLink -Path ~\.eslintrc.json -Target "$HOME\dotfiles\config\.eslintrc.json"
New-Item -ItemType SymbolicLink -Path ~\.gitconfig -Target "$HOME\dotfiles\gitconfig"

New-Item -ItemType SymbolicLink -Path ~\AppData\Roaming\Zed\keymap.json -Target "$HOME\dotfiles\config\zed\keymap.json"
New-Item -ItemType SymbolicLink -Path ~\AppData\Roaming\Zed\settings.json -Target "$HOME\dotfiles\config\zed\settings.json"

$WshShell = New-Object -COMObject WScript.Shell
$hotkeyShortcut = $WshShell.CreateShortcut("$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\myHotkeys.ahk.lnk")
$hotkeyShortcut.TargetPath = "$HOME\dotfiles\config\myHotkeys.ahk"
$hotkeyShortcut.Save()