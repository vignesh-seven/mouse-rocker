#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

browsers := ["ahk_exe firefox.exe", "ahk_exe msedge.exe", "ahk_exe chrome.exe"]

;  BACK
RButton & ~LButton::
  ; check for browsers
  For i, bro in browsers {
    If(WinActive(bro)) {
      Send !{Left}
    }
  }
  ; check for explorer
  If (WinActive("ahk_exe Explorer.EXE")) {
    Send !{Left}
  }
Return

; FORWARD (?)
~LButton & RButton::
  ; check for browsers
  For i, bro in browsers {
    If(WinActive(bro)) {
      Send !{Right}
    }
  }
  ; check for explorer
  If (WinActive("ahk_exe Explorer.EXE")) {
    Send !{Right}
  }
Return


; TASK VIEW
RButton & MButton::
Send #{Tab}
Return

; Cycle Tabs in Browser
~MButton & WheelUp::
For i, bro in browsers {
  If(WinActive(bro)) {
    Send ^+{Tab}
  }
}
Return
~MButton & WheelDown::
For i, bro in browsers {
  If(WinActive(bro)) {
    Send ^{Tab}
  }
}
Return

; EXTRAS
F1::
Reload
Return