suspend
; CoordMode,Mouse,Screen
;----- 表示ウインドウの設定 -----
Gui, +AlwaysOnTop -Caption
Gui, Font, s20 bold
Gui, Add, Text, cWhite vMode, MMM

;****** グローバル変数 ******
mouseDoEvent = 0
leftDown = 0
middleDown = 0
rightDown = 0

;****** サスペンド Toggle ******
;$!^m::
;suspend
;showSuspend()
;return

; 無変換キーで切替
$vk1D::
suspend
showSuspend()
return


showSuspend(){
  ; suspend
  ; msgbox, %A_Issuspended%
  Gui, hide
  ;gui, show, x624 y998 NA
  
  if (A_Issuspended = 1) {
    GuiControl,, Mode, OFF
    Gui, Color, 245DDB
  } else {
    GuiControl,, Mode, ON
    Gui, Color, DB5D24
  }
  Gui, Show, AutoSize Center  NA  
  SetTimer, GuiHide, 500
  return
}

; ***** 画面を消す **** 
GuiHide:
SetTimer, GuiHide, off
Gui, Hide
Return

; ***キーが押されたかを判定***
isDown(key){
  ; GetKeyState, state, %key%, P
  ; if (state == "D") {
  ; return true
  ; } else {
  ; return false
  ; }
  state := GetKeyState(key , "P")
  return state
}

; *** マウスの移動処理 ***
doMouseMove(){
  global mouseDoEvent
  if (mouseDoEvent == 1) {
    return
  }
  mouseDoEvent = 1
  
  loop {
    moveX = 0
    moveY = 0
    moveFast = 8
    sleepTime = 0
    
    downF := isDown("f")
    downD := isDown("d")
    downI := isDown("i")
    downK := isDown("k")
    downL := isDown("l")
    downJ := isDown("j")
    downO := isDown("h")
    downDot := isDown("n")
    
    if not (downF or downD or downI or downK or downL or downJ or downO or downDot) {
      break
    }
    
    if (downO or downDot) {
      ; ホイール Up
      if (downO) {
        ; send {WheelUp}
        MouseClick, WheelUp
      }
      
      ; ホイール Down
      if (downDot) {
        ; send {WheelDown}
        MouseClick, WheelDown
      }
      
      ; ホイールの移動の速さはスリープで制御
      sleepTime := 50
      if (downF){
        sleepTime := 10
      }
      if (downD){
        sleepTime := 100
      }
      
    } else {
      ; マウスの移動速度は移動幅で制御
      if (downF){
        moveFast := moveFast * 4
      }
      
      if (downD){
        moveFast := moveFast / 4
      }
      
      ; マウス上へ移動
      if (downI) {
        moveY = -%moveFast%
      }
      
      ; マウス右へ移動
      if (downL) {
        moveX = %moveFast%
      }
      
      ; マウス下へ移動
      if (downK) {
        moveY = %moveFast%
      }
      
      ; マウス左へ移動
      if (downJ) {
        moveX = -%moveFast%
      }
      
      ; MouseGetPos,x,y,hwnd,ctrl,3
      MouseMove moveX, moveY, 0, R
    }
    sleep %sleepTime%
  }
  mouseDoEvent = 0
  return
}

; *** マウス移動 ***
$i::doMouseMove()
$l::doMouseMove()
$k::doMouseMove()
$j::doMouseMove()
$h::doMouseMove()
$n::doMouseMove()

; *** クリック操作 ***
; * 左クリック *
; $Space::MouseClick, left
$Space up::
MouseClick, left, , , , , U, R
leftDown = 0
return

$Space::
if (leftDown = 0) {
  leftDown = 1
  MouseClick, left, , , , , D, R
}
return

; * 中クリック *
; $u::MouseClick, MIDDLE
$u up::
MouseClick, middle, , , , , U, R
middleDown = 0
return
$u::
if (middleDown = 0) {
  middleDown = 1
  MouseClick, middle, , , , , D, R
}
return

; * 右クリック *
; $vk1Csc079::MouseClick, right
$vk1Csc079 up::
MouseClick, right, , , , , U, R
rightDown = 0
return
$vk1Csc079::
if (rightDown = 0) {
  rightDown = 1
  MouseClick, right, , , , , D, R
}
return


$f::return
$d::return