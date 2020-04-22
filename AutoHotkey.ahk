;;
;; An autohotkey script that provides emacs-like keybinding on Windows
;;
#InstallKeybdHook
#UseHook

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay 0

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  IfWinActive,ahk_class ConsoleWindowClass ; Cygwin
    Return 1 
  IfWinActive,ahk_exe WindowsTerminal.exe ; Windows Terminal
    Return 1
  IfWinActive,ahk_class MEADOW ; Meadow
    Return 1 
  IfWinActive,ahk_class cygwin/x X rl-xterm-XTerm-0
    Return 1
  IfWinActive,ahk_class MozillaUIWindowClass ; keysnail on Firefox
    Return 1
  IfWinActive,ahk_class VMwareUnityHostWndClass
    Return 1
  IfWinActive,ahk_class Vim ; GVIM
    Return 1
  Return 0
}

key_del()
{
  If is_target()
    Send {Blind}^d
  Else
    Send {Del}
  Return
}
key_backspace()
{
  If is_target()
    Send {Blind}^h
  Else
    Send {BS}
  Return
}
kill_line()
{
  If is_target()
    Send {Blind}^k
  Else
    Send {ShiftDown}{END}{ShiftUp}
    Sleep 10
    Send ^x
  Return
}
quit()
{
  If is_target()
    Send {Blind}^g
  Else
    Send {ESC}
  Return
}
key_home()
{
  If is_target()
    Send {Blind}^a
  Else
    Send {Blind}{HOME}
  Return
}
key_end()
{
  If is_target()
    Send {Blind}^e
  Else
    Send {Blind}{END}
  Return
}
key_up()
{
  If is_target()
    Send {Blind}^p
  Else
    Send {Blind}{Up}
  Return
}
key_down()
{
  If is_target()
    Send {Blind}^n
  Else
    Send {Blind}{Down}
  Return
}
key_right()
{
  If is_target()
    Send {Blind}^f
  Else
    Send {Blind}{Right}
  Return
}
key_left()
{
  If is_target()
    Send {Blind}^
  Else
    Send {Blind}{Left}
  Return
}
delete_line()
{
  Send {Home}{ShiftDown}{End}{ShiftUp}
  Sleep 10
  Send {Del}{Del}
  Return
}
backspace_line()
{
  Send {End}{ShiftDown}{Home}{ShiftUp}
  Sleep 10
  Send {BS}{BS}
  Return
}

; TODO: all key remap with ctrl
; *F13::LCtrl

; Capslock to F13 to Ctrl & Emacs cursor
F13 & Enter::Send {Blind}^{Enter}
F13 & Space::Send {Blind}^{Space}
F13 & Tab::Send {Blind}^{Tab}
F13 & BS::backspace_line()
F13 & Del::delete_line()
F13 & Ins::Send {Blind}^{Ins}
F13 & Up::Send {Blind}^{Up}
F13 & Down::Send {Blind}^{Down}
F13 & Left::Send {Blind}^{Left}
F13 & Right::Send {Blind}^{Right}
F13 & Home::Send {Blind}^{Home}
F13 & End::Send {Blind}^{End}
F13 & PgUp::Send {Blind}^{PgUp}
F13 & PgDn::Send {Blind}^{PgDn}
F13 & AppsKey::Send {Blind}^{AppsKey}
F13 & PrintScreen::Send {Blind}^{PrintScreen}
F13 & CtrlBreak::Send {Blind}^{CtrlBreak}
F13 & Pause::Send {Blind}^{Pause}
F13 & Esc::Send {Blind}^{Esc}
F13 & F1::Send {Blind}^F1
F13 & F2::Send {Blind}^F2
F13 & F3::Send {Blind}^F3
F13 & F4::Send {Blind}^F4
F13 & F5::Send {Blind}^F5
F13 & F6::Send {Blind}^F6
F13 & F7::Send {Blind}^F7
F13 & F8::Send {Blind}^F8
F13 & F9::Send {Blind}^F9
F13 & F10::Send {Blind}^F10
F13 & F11::Send {Blind}^F11
F13 & F12::Send {Blind}^F12
F13 & sc029::Send {Blind}^{sc029} ; `
F13 & 1::Send {Blind}^1
F13 & 2::Send {Blind}^2
F13 & 3::Send {Blind}^3
F13 & 4::Send {Blind}^4
F13 & 5::Send {Blind}^5
F13 & 6::Send {Blind}^6
F13 & 7::Send {Blind}^7
F13 & 8::Send {Blind}^8
F13 & 9::Send {Blind}^9
F13 & 0::Send {Blind}^0
F13 & -::Send {Blind}^-
F13 & =::Send {Blind}^=
F13 & q::Send {Blind}^q
F13 & w::Send {Blind}^w
F13 & e::key_end()
F13 & r::Send {Blind}^r
F13 & t::Send {Blind}^t
F13 & y::Send {Blind}^y
F13 & u::Send {Blind}^u
F13 & i::Send {Blind}^i
F13 & o::Send {Blind}^o
F13 & p::key_up()
F13 & {::Send {Blind}^{[}
F13 & }::Send {Blind}^{]}
F13 & \::Send {Blind}^{\}
F13 & a::key_home()  
F13 & s::Send {Blind}^s
F13 & d::key_del()
F13 & f::key_right()
F13 & g::quit()
F13 & h::key_backspace()
F13 & j::Send {Blind}^j
F13 & k::kill_line()
F13 & l::Send {Blind}^l
F13 & sc027::Send {Blind}^{sc027}
F13 & '::Send {Blind}^'
F13 & z::Send {Blind}^z
F13 & x::Send {Blind}^x
F13 & c::Send {Blind}^c
F13 & v::Send {Blind}^v
F13 & b::key_left()
F13 & n::key_down()
F13 & m::Send {Blind}^m
F13 & ,::Send {Blind}^,
F13 & .::Send {Blind}^.
F13 & /::Send {Blind}^/
; /Capslock to F13 to Ctrl & Emacs move

; for like mac
!q::Send,!{F4}
!w::Send,^w
; / for like mac

RAlt::RCtrl

;; for ErgoDox EZ
; !Esc::send,^{sc029}
