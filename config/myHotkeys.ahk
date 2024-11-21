#Requires AutoHotkey v2.0

SetNumLockState "AlwaysOn"
SetCapsLockState "AlwaysOff"

Pause::Media_Play_Pause

RWin & Right::Volume_Up
RWin & Left::Volume_Down

AppsKey & Right::Volume_Up
AppsKey & Left::Volume_Down


; Can also do this via SharpKeys, which will work in admin eleveted prompts
CapsLock::Esc

; UserProfile := EnvGet("UserProfile")
; ^!T::Run 'pwsh.exe --NoLogo', UserProfile
^!T::Run 'wezterm.exe', "", "Hide"