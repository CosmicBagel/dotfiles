From home folder

```
# enable running scripts (CurrentUser scope doesn't need admin for CurrentUser scope)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

winget install Git.Git
git clone https://github.com/CosmicBagel/dotfiles.git
cd dotfiles
.\deploy_symlinks.ps1
.\sensible_uac.ps1
.\regedits.ps1
.\personalizations.ps1
.\wingets.ps1
```

make ~/bin
unzip zigup.exe https://marler8997.github.io/zigup/ to bin dir
run `zigup 0.13.0` (or w/e latest stable is)
unzip zed.exe https://github.com/deevus/zed-windows-builds to bin dir

```
.\~\dotfiles\path_items.ps1
```
