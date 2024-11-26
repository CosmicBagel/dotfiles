$installItems =  @(
    "Git.Git",
    "Microsoft.PowerShell",
    "jqlang.jq",
    "junegunn.fzf",
    "sharkdp.bat",
    "sharkdp.fd",
    "sxyazi.yazi",
    "ezwinimports.make",
    "ajeetdsouza.zoxide",
    "JesseDuffield.lazygit",
    "BurntSushi.ripgrep.MSVC",
    "AutoHotkey.AutoHotkey",
    "Bitwarden.Bitwarden",
    "SpeedCrunch.SpeedCrunch",
    "Dropbox.Dropbox",
    "Brave.Brave",
    "wez.wezterm",
    "OpenJS.NodeJS",
    "GoLang.Go",
    "Neovim.Neovim",
    "7zip.7zip",
    "Python.Python.3.13",
    "Microsoft.WindowsTerminal",
    "JanDeDobbeleer.OhMyPosh"
    "SublimeHQ.SublimeText.4"
)

foreach ($item in $installItems) {
    Write-Output $item
    winget install $item
}
