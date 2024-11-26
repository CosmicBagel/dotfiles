# C:\Program Files\PowerShell\7\
# C:\Program Files\nodejs\
# C:\Program Files\Go\bin
# C:\Program Files\7-Zip
# C:\Program Files\WezTerm
# C:\Program Files\Neovim\bin
# %USERPROFILE%\go\bin

$desiredPaths = @(
    "$env:USERPROFILE\bin"
)

$userPathVar = [Environment]::GetEnvironmentVariable("PATH", "User")
$pathSplit = $userPathVar.Split(";")
foreach ($pathToAdd in $desiredPaths) {
    if (-not $pathSplit.Contains($pathToAdd)) {
        [Environment]::SetEnvironmentVariable("PATH", $userPathVar + ";$pathToAdd", "User")
    }
}

[Environment]::SetEnvironmentVariable("GOPATH_TWO", "$env:USERPROFILE\go", "User")
[Environment]::SetEnvironmentVariable("YAZI_FILE_ONE_TWO", "$env:ProgramFiles\Git\usr\bin\file.exe", "User")
