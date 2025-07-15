#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2

; Initial settings
winID := ""               ; Will hold window ID
transparencyLevel := 180  ; Initial transparency level
transparencyStep := 10

; Ctrl+Alt+S — select window under cursor
^!s::
    MouseGetPos,,, winID
    if (!winID) {
        MsgBox, Could not get window under cursor!
        return
    }
    WinGetTitle, selectedTitle, ahk_id %winID%
    ToolTip, Selected window:`n%selectedTitle%
    SetTimer, RemoveToolTip, -500
return

; Ctrl+Alt+T — toggle transparency and click-through
^!t::
    if (!winID) {
        MsgBox, Please select a window first with Ctrl+Alt+S!
        return
    }

    if !WinExist("ahk_id " . winID) {
        MsgBox, Selected window no longer exists!
        return
    }

    WinGet, ExStyle, ExStyle, ahk_id %winID%
    MouseTransparentOn := ExStyle & 0x20

    if (MouseTransparentOn) {
        WinSet, Transparent, OFF, ahk_id %winID%
        WinSet, ExStyle, -0x20, ahk_id %winID%
        WinSet, AlwaysOnTop, OFF, ahk_id %winID%
         ; ToolTip, Transparency OFF
    } else {
        WinSet, Transparent, %transparencyLevel%, ahk_id %winID%
        WinSet, ExStyle, +0x20, ahk_id %winID%
        WinSet, AlwaysOnTop, ON, ahk_id %winID%
         ; ToolTip, Transparency ON (%transparencyLevel%)
    }
    SetTimer, RemoveToolTip, -500
return

; Ctrl+Alt+Up — increase transparency
^!Up::
    if (!winID) {
        MsgBox, Please select a window first with Ctrl+Alt+S!
        return
    }
    transparencyLevel += transparencyStep
    if (transparencyLevel > 255)
        transparencyLevel := 255
    if WinExist("ahk_id " . winID)
        WinSet, Transparent, %transparencyLevel%, ahk_id %winID%
    ; ToolTip, Transparency increased: %transparencyLevel%
    ; SetTimer, RemoveToolTip, -500
return

; Ctrl+Alt+Down — decrease transparency
^!Down::
    if (!winID) {
        MsgBox, Please select a window first with Ctrl+Alt+S!
        return
    }
    transparencyLevel -= transparencyStep
    if (transparencyLevel < 0)
        transparencyLevel := 0
    if WinExist("ahk_id " . winID)
        WinSet, Transparent, %transparencyLevel%, ahk_id %winID%
    ; ToolTip, Transparency decreased: %transparencyLevel%
    ; SetTimer, RemoveToolTip, -500
return

RemoveToolTip:
    ToolTip
return

; Ctrl+Alt+W — show title of active window
^!w::
    WinGetTitle, currentTitle, A
    ToolTip, Active window:`n%currentTitle%
    SetTimer, RemoveToolTip, -500
return
