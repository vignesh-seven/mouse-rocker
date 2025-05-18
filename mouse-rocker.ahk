#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu, Tray, Icon, mouse-rocker.ico

browsers := ["ahk_exe firefox.exe", "ahk_exe msedge.exe", "ahk_exe chrome.exe", "ahk_exe brave.exe"]

RButton::RButton
Return

RButton & LButton::
  ; check for browsers
  For i, bro in browsers {
    If(WinActive(bro)) {
      ; GO BACK
      Send !{Left}
    }
  }
  ; check for explorer
  If (WinActive("ahk_exe Explorer.EXE")) {
    ; GO BACK
    Send !{Left}
  }
Return

~LButton & RButton::
  ; check for browsers
  For i, bro in browsers {
    If(WinActive(bro)) {
      ; GO FORWARD
      Send !{Right}
    }
  }
  ; check for explorer
  If (WinActive("ahk_exe Explorer.EXE")) {
    ; GO FORWARD
    Send !{Right}
  }
Return


RButton & MButton::
; TASK VIEW
Send #{Tab}
Return

; Cycle Tabs in Browser
MButton & WheelUp::
For i, bro in browsers {
  If(WinActive(bro)) {
    Send ^+{Tab}
  }
}
Return
MButton & WheelDown::
For i, bro in browsers {
  If(WinActive(bro)) {
    Send ^{Tab}
  }
}
Return

; MButton 2
~MButton::
if (A_PriorHotkey <> "~MButton" or A_TimeSincePriorHotkey > 500)
{
    KeyWait, MButton
    return
}
For i, bro in browsers {
  If(WinActive(bro)) {
    Send ^w
  }
}
If (WinActive("ahk_exe Explorer.EXE")) {
  ; GO FORWARD
  Send ^w
}
return

; ALT TABBB!!!
MButton & LButton::
Send !{Tab}
Return

; change volume
LButton & WheelUp::
Send {Volume_Up}
Return
LButton & WheelDown::
Send {Volume_Down}
Return

; EXTRAS
+F1::
Reload
Return