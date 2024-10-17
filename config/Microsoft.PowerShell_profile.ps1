Set-Alias -Name n -value nvim
Set-Alias -Name ll -value Get-ChildItem
Set-Alias -Name l -value Get-ChildItem
Set-Alias -Name lg -value lazygit

## yazi
function yy {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath $cwd
    }
    Remove-Item -Path $tmp
}

## zig aliases
function zb {
    zig build $args
}
function zbr {
    zig build run $args
}

oh-my-posh init pwsh | Invoke-Expression

## zoxide
Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })
