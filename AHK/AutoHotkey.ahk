; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

;#z::Run www.autohotkey.com

;#Ctrl::#r
;return

#z::WinClose,A
return

Insert::Return		;無効化
;CapsLock::return	;無効化

AppsKey::#s
AppsKey & Ctrl::
    if GetKeyState("shift", "P"){
        Send, +{AppsKey}
    }else{
        Send,{AppsKey}
    }
    return

;======================================================

;LAlt+h→左
LAlt & j::
    if GetKeyState("shift", "P"){
        Send, +{Left}
    }else{
        Send,{Left}
    }
    return

;LAlt+j→下
LAlt & k::
    if GetKeyState("shift", "P"){
        Send, +{Down}
    }else{
        Send,{Down}
    }
    return

;LAlt+k→上
LAlt & i::
    If GetKeyState("shift", "P"){
        Send, +{Up}
    }else{
        Send,{Up}
    }
    return

;LAlt+l→右
LAlt & l::
    If GetKeyState("shift", "P"){
        Send, +{Right}
    }else{
        Send,{Right}
    }
    return








; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
