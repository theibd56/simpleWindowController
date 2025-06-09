#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 2  ; Partial match for window titles

; Initial settings
WinTitle := ""            ; Selected window (empty at start)
transparencyLevel := 180  ; Initial transparency level (0-255)
transparencyStep := 10    ; Step to increase/decrease transparency

; Hotkey Ctrl+Alt+S — select window under cursor
^!s::
    MouseGetPos,,, winID
    WinGetTitle, selectedTitle, ahk_id %winID%
    if (selectedTitle = "") {
        MsgBox, Could not get the title of the window under the cursor!
        return
    }
    WinTitle := selectedTitle
    ToolTip, Selected window:`n%WinTitle%
    SetTimer, RemoveToolTip, -500
return

; Hotkey Ctrl+Alt+T — toggle transparency and mouse-through on selected window
^!t::
    if (WinTitle = "") {
        MsgBox, Please select a window first with Ctrl+Alt+S!
        return
    }

    if !WinExist(WinTitle) {
        MsgBox, Window "%WinTitle%" not found!
        return
    }

    WinGet, ExStyle, ExStyle, %WinTitle%
    MouseTransparentOn := ExStyle & 0x20  ; Check WS_EX_TRANSPARENT flag

    if (MouseTransparentOn) {
        ; Turn off transparency and mouse-through
        WinSet, Transparent, OFF, %WinTitle%
        WinSet, ExStyle, -0x20, %WinTitle%
        WinSet, AlwaysOnTop, OFF, %WinTitle%
        ToolTip, Window "%WinTitle%": transparency OFF
    } else {
        ; Turn on transparency and mouse-through with current level
        WinSet, Transparent, %transparencyLevel%, %WinTitle%
        WinSet, ExStyle, +0x20, %WinTitle%
        WinSet, AlwaysOnTop, ON, %WinTitle%
        ToolTip, Window "%WinTitle%": transparency ON (%transparencyLevel%)
    }
    SetTimer, RemoveToolTip, -500
return

; Ctrl+Alt+Up — increase transparency (window becomes more see-through)
^!Up::
    if (WinTitle = "") {
        MsgBox, Please select a window first with Ctrl+Alt+S!
        return
    }
    transparencyLevel += transparencyStep
    if (transparencyLevel > 255)
        transparencyLevel := 255
    if WinExist(WinTitle)
        WinSet, Transparent, %transparencyLevel%, %WinTitle%
    ToolTip, Transparency increased: %transparencyLevel%
    SetTimer, RemoveToolTip, -500
return

; Ctrl+Alt+Down — decrease transparency (window becomes more opaque)
^!Down::
    if (WinTitle = "") {
        MsgBox, Please select a window first with Ctrl+Alt+S!
        return
    }
    transparencyLevel -= transparencyStep
    if (transparencyLevel < 0)
        transparencyLevel := 0
    if WinExist(WinTitle)
        WinSet, Transparent, %transparencyLevel%, %WinTitle%
    ToolTip, Transparency decreased: %transparencyLevel%
    SetTimer, RemoveToolTip, -500
return

RemoveToolTip:
    ToolTip
return

; Ctrl+Alt+W — show active window title in tooltip
^!w::
    WinGetTitle, currentTitle, A
    ToolTip, Active window:`n%currentTitle%
    SetTimer, RemoveToolTip, -500
return
