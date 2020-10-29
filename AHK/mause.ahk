suspend
; CoordMode,Mouse,Screen
;----- �\���E�C���h�E�̐ݒ� -----
Gui, +AlwaysOnTop -Caption
Gui, Font, s20 bold
Gui, Add, Text, cWhite vMode, MMM

;****** �O���[�o���ϐ� ******
mouseDoEvent = 0
leftDown = 0
middleDown = 0
rightDown = 0

;****** �T�X�y���h Toggle ******
;$!^m::
;suspend
;showSuspend()
;return

; ���ϊ��L�[�Őؑ�
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

; ***** ��ʂ����� **** 
GuiHide:
SetTimer, GuiHide, off
Gui, Hide
Return

; ***�L�[�������ꂽ���𔻒�***
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

; *** �}�E�X�̈ړ����� ***
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
      ; �z�C�[�� Up
      if (downO) {
        ; send {WheelUp}
        MouseClick, WheelUp
      }
      
      ; �z�C�[�� Down
      if (downDot) {
        ; send {WheelDown}
        MouseClick, WheelDown
      }
      
      ; �z�C�[���̈ړ��̑����̓X���[�v�Ő���
      sleepTime := 50
      if (downF){
        sleepTime := 10
      }
      if (downD){
        sleepTime := 100
      }
      
    } else {
      ; �}�E�X�̈ړ����x�͈ړ����Ő���
      if (downF){
        moveFast := moveFast * 4
      }
      
      if (downD){
        moveFast := moveFast / 4
      }
      
      ; �}�E�X��ֈړ�
      if (downI) {
        moveY = -%moveFast%
      }
      
      ; �}�E�X�E�ֈړ�
      if (downL) {
        moveX = %moveFast%
      }
      
      ; �}�E�X���ֈړ�
      if (downK) {
        moveY = %moveFast%
      }
      
      ; �}�E�X���ֈړ�
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

; *** �}�E�X�ړ� ***
$i::doMouseMove()
$l::doMouseMove()
$k::doMouseMove()
$j::doMouseMove()
$h::doMouseMove()
$n::doMouseMove()

; *** �N���b�N���� ***
; * ���N���b�N *
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

; * ���N���b�N *
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

; * �E�N���b�N *
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