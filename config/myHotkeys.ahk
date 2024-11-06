#Requires AutoHotkey v2.0

;; #Persistent
;; #InstallKeybdHook

;; SetCapsLockState, AlwaysOff

; PrintScreen::Media_Play_Pause
Pause::Media_Play_Pause
;vkFF & F11::F12
;XButton1::Media_Play_Pause
;RAlt::MButton

RWin & Right::Volume_Up
RWin & Left::Volume_Down

AppsKey & Right::Volume_Up
AppsKey & Left::Volume_Down

vkFF & vkBB::Media_Next
RWin & vkBB::Media_Next
vkFF & vkBD::Media_Prev
RWin & vkBD::Media_Prev

; Can also do this via SharpKeys now, so that it will work in admin eleveted prompts
CapsLock::Esc

; UserProfile := EnvGet("UserProfile")
; ^!T::Run 'pwsh.exe --NoLogo', UserProfile
^!T::Run 'wezterm.exe', "", "Hide"

; block the widgets panel hotkey from working
; use registry to disable wigdets instead
;LWin & W::return
;RWin & W::return
