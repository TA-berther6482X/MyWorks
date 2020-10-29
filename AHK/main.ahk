;----Window + z キーでウインドウを閉じる----
#z::WinClose,A

;----scrolllock キーを無効----
scrolllock::Return

;----CapsLock キーを無効----
CapsLock::Return

;----Insert キーで mouse.ahkを起動----
Insert::
    Process, Exist, mause.ahk
        if ErrorLevel<>0
        Return
    else
        Run, "C:\Users\main\Documents\mouse.ahk"
Return

;----テンキー操作----
LAlt & j::
    if GetKeyState("shift", "P"){
        Send, +{Left}
    }else{
        Send,{Left}
    }
    return

LAlt & l::
    if GetKeyState("shift", "P"){
        Send, +{Right}
    }else{
        Send,{Right}
    }
    return

LAlt & i::
    If GetKeyState("shift", "P"){
        Send, +{Up}
    }else{
        Send,{Up}
    }
    return

LAlt & k::
    If GetKeyState("shift", "P"){
        Send, +{Down}
    }else{
        Send,{Down}
    }
    return

;----Home, End 操作----
LAlt & h::
    If GetKeyState("shift", "P"){
        Send, +{Home}
    }else{
        Send,{Home}
    }
    return

LAlt & n::
    If GetKeyState("shift", "P"){
        Send, +{End}
    }else{
        Send,{End}
    }
    return