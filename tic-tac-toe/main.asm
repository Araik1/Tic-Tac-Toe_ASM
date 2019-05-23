.386
option casemap:none 
 

include main.inc
include engine.asm

.code
start:
     fn SetConsoleTitle,"TIC TAC TOE"
     ;-----------------
     fn SetWindowSize,MAX_WIDTH,MAX_HEIGHT
     ;-----------------
     fn HideCursor
     ;-----------------
     fn Main
     ;-----------------
     exit
;******************************************
Main proc 

      fn GameInit
      fn Redraw
      .while closeConsole == 0
          .while gameOver == 0
    
              fn UpData
              fn Redraw
                    
         .endw
     
     .endw
    ;------------------------
    fn gotoxy,30,40
	ret
Main endp
;*******************************************
gotoxy proc uses ebx esi edi x:DWORD,y:DWORD

    mov ebx,y
    shl ebx,16
    or ebx,x
    ;----------------------------------------
    fn SetConsoleCursorPosition,rv(GetStdHandle,-11),ebx
    ;----------------------------------------
	ret
gotoxy endp
HideCursor proc uses ebx esi edi
    LOCAL ci:CONSOLE_CURSOR_INFO

    fn GetStdHandle,-11
    ;-----------------------------
    push eax
    lea ebx,ci
    ;-----------------------------
    fn  GetConsoleCursorInfo,eax,ebx
    ;-----------------------------
    mov ci.bVisible,0
    ;-----------------------------
    pop eax
    ;------------------------------
    fn  SetConsoleCursorInfo,eax,ebx
    ;------------------------------
	ret
HideCursor endp

SetWindowSize proc uses ebx esi edi wd:DWORD,ht:DWORD

    fn GetStdHandle,-11
    ;----------------------------------
    push eax
    ;----------------------------------
    mov ebx,ht
    shl ebx,16
    ;----------------------------------
    or ebx,wd
    ;----------------------------------
    fn  SetConsoleScreenBufferSize,eax,ebx
    ;----------------------------------
    pop eax
    ;-----------------------------------
    fn SetConsoleWindowInfo,eax,1,offset srect
    ;-----------------------------------
	ret
SetWindowSize endp
end start