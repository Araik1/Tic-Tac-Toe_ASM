Keyboard_check_pressed      proto
GameInit 			       proto
DrawLevel                                  proto
defaulte                                       proto

.const
;-------------- Keys -----------------------

 KEY_ENTER     equ 13
 ;--------------------------------------------
 include messages.inc
 include polygon.asm
 

 
.data
bKey db 0
gameOver      db 0
closeConsole  db 0
gamer     dword  1
winner dword  "W"

printForm   db      "%c",0
scanForm    db      "%c",0
;--------------------------------------------------

szLeverl         db "map.txt", 0

.data?
    num         dword   ?
    r                dword   ?
    
.code

Win proc uses ebx esi edi g: DWORD
         
          fn SetConsoleTextAttribute, rv(GetStdHandle, -11), cYellow
          
           fn gotoxy, 35, 26
            
            .if g == 1
                fn crt_printf, offset player1Win
            .elseif g ==2
                 fn crt_printf, offset player2Win
             .else
                fn crt_printf, offset draw
            .endif
	
	fn SetConsoleTextAttribute, rv(GetStdHandle, -11), cWhite

	mov gameOver, 1

	RET
Win ENDP
;****************************************************

Redraw proc uses ebx esi edi

          fn DrawPolygon
        
	Ret
Redraw EndP
;***************************************************

defaulte proc uses ebx esi edi        
        fn PolygonInit
   
        mov winner, "W"
        mov gamer, 1
        mov num, 0
        mov r, 0
        
	RET
defaulte ENDP

;*********************************************

SetCel proc uses ebx esi edi

        .if num == "1"
            .if cel1 == "*"
                .if gamer == 1
                     mov cel1,"X"
                     .if gamer == 1
                         mov gamer, 2
	             .else
		       mov gamer, 1
		    .endif
                .else
                     mov cel1, "0" 
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .endif
            .endif
        .endif
        
        .if num == "2"
            .if cel2 == "*"
                .if gamer == 1
                     mov cel2,"X"
                     .if gamer == 1
                         mov gamer, 2
	             .else
		       mov gamer, 1
		    .endif
                .else
                     mov cel2, "0" 
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .endif
            .endif
        .endif
        
        
         .if num == "3"
            .if cel3 == "*"
                .if gamer == 1
                     mov cel3,"X"
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .else
                     mov cel3, "0" 
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .endif
            .endif
        .endif	
	
	 .if num == "4"
            .if cel4 == "*"
                .if gamer == 1
                     mov cel4,"X"
                       .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .else
                     mov cel4, "0" 
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .endif
            .endif
        .endif
        
          .if num == "5"
            .if cel5 == "*"
                .if gamer == 1
                     mov cel5,"X"
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .else
                     mov cel5, "0" 
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .endif
            .endif
        .endif
        
        .if num == "6"
            .if cel6 == "*"
                .if gamer == 1
                     mov cel6,"X"
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .else
                     mov cel6, "0" 
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .endif
            .endif
        .endif
        
         .if num == "7"
            .if cel7 == "*"
                .if gamer == 1
                     mov cel7,"X"
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .else
                     mov cel7, "0" 
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .endif
            .endif
        .endif
        
         .if num == "8"
            .if cel8 == "*"
                .if gamer == 1
                     mov cel8,"X"
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .else
                     mov cel8, "0" 
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .endif
            .endif
        .endif
        
        .if num == "9"
            .if cel9 == "*"
                .if gamer == 1
                     mov cel9,"X"
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .else
                     mov cel9, "0" 
                     .if gamer == 1
                         mov gamer, 2
                     .else
                         mov gamer, 1
                     .endif
                .endif
            .endif
        .endif
        
	Ret
SetCel EndP
;****************************************************

readChar proc uses ebx esi edi
        mov num, " "
       .while num != "1" && num != "2" && num != "3" && num != "4" && num != "5" && num != "6" &&  num != "7" && num != "8" && num != "9"
	   fn gotoxy, 35, 22
	   invoke      crt_scanf, offset scanForm, offset num
        .endw
        
	RET
readChar ENDP 
;****************************************************

Turn proc uses ebx esi edi gm: DWORD

          fn gotoxy, 3, 22
	.if gm == 1
                fn crt_printf, offset player1
            .elseif gm==2
                 fn crt_printf, offset player2
          .endif
         
         fn readChar
         fn SetCel
         
	RET
Turn ENDP
;***************************************************

CheckWin proc uses ebx esi edi
     
      .if cel1 != "*" && cel2 != "*" && cel3 != "*" && cel4 != "*" && cel5 != "*" && cel6 != "*" && cel7 != "*" && cel8 != "*" && cel9 != "*"
            mov winner, "D"
      .else 
          .if cel1=="X" && cel2 == "X" && cel3 == "X"
                mov winner, "X"
          .endif
          .if cel4=="X" && cel5 == "X" && cel6 == "X"
                mov winner, "X"
          .endif
           .if cel7=="X" && cel8== "X" && cel9 == "X"
                mov winner, "X"
          .endif
          .if cel1=="X" && cel4 == "X" && cel7 == "X"
                mov winner, "X"
          .endif
          .if cel2=="X" && cel5 == "X" && cel8 == "X"
                mov winner, "X"
          .endif
          .if cel3=="X" && cel6 == "X" && cel9 == "X"
                mov winner, "X"
          .endif
           .if cel1=="X" && cel5 == "X" && cel9 == "X"
                mov winner, "X"
          .endif
          .if cel3=="X" && cel5 == "X" && cel7 == "X"
                mov winner, "X"
          .endif     
          
          
                    .if cel4=="0" && cel5 == "0" && cel6 == "0"
                mov winner, "0"
          .endif
           .if cel7=="0" && cel8== "0" && cel9 == "0"
                mov winner, "0"
          .endif
          .if cel1=="0" && cel4 == "0" && cel7 == "0"
                mov winner, "0"
          .endif
          .if cel2=="0" && cel5 == "0" && cel8 == "0"
                mov winner, "0"
          .endif
          .if cel3=="0" && cel6 == "0" && cel9 == "0"
                mov winner, "0"
          .endif
           .if cel1=="0" && cel5 == "0" && cel9 == "0"
                mov winner, "0"
          .endif
          .if cel3=="0" && cel5 == "0" && cel7 == "0"
                mov winner, "0"
          .endif     
      .endif
       
       .if winner == "X"
            fn Win, 1
        .elseif  winner == "D"
            fn Win, 0
        .endif
        .if winner == "0"
            fn Win, 2
        .endif
	RET
CheckWin ENDP
;**************************************************

UpData   proc uses ebx esi edi
         
         
         fn Turn, gamer
        
         fn CheckWin
       
         

         
	Ret
UpData EndP




;***************************************************
GameInit   proc uses ebx esi edi

   fn DrawLevel 
   ;-----------------------------
   or eax, eax
   ;----------------------------
   je @@Error
   ;----------------------------
    fn gotoxy, 3, 22
    fn crt_printf, offset player1



  ;-------------------------------
@@Ret:
	Ret
	
@@Error:
	mov byte ptr[closeConsole], 1
	mov byte ptr[gameOver], 0
	;---------------------------------------	
	fn gotoxy, 16, 19
	;--------------------------------------
 	fn crt_puts, "Load File failed"
 	;-------------------------------------
	fn Sleep, 2000	
	jmp @@Ret
GameInit EndP
;********************************************************

DrawLevel proc uses ebx esi edi
	LOCAL hfile:DWORD
	LOCAL buffer[256]: BYTE

	
	fn crt_fopen, offset szLeverl, "r"
	;-------------------------------------
	or eax, eax
	je @@Ret
         ;------------------------------------
         mov dword ptr[hfile], eax
         ;-----------------------------------
         push eax
         ;-----------------------------------
         
         fn SetConsoleTextAttribute, rv(GetStdHandle, -11), cWhite
	
	lea ebx, buffer
@@while:
 		
 		fn crt_fgets, ebx, 256, hfile
 		;---------------------------------------
 		or eax, eax
 		je @@CloseFile 
 		fn crt_printf, eax
 		jmp @@while
         
         
         ;-------------------------------------
@@CloseFile:
	pop eax
	;------------------------------------
	fn crt_fclose, eax
	;-----------------------------------
	mov eax, 1


@@Ret:
	Ret
DrawLevel EndP
;**********************************************************

Keyboard_check_pressed proc uses ebx esi edi

   fn FlushConsoleInputBuffer,rv(GetStdHandle,-10)
   ;-----------------------------------------
@@:
   fn Sleep,1
   fn crt__kbhit
   ;-------------
   or eax,eax
   je @B
   ;------------
   fn crt__getch
   ;------------
   mov byte ptr[bKey],al
   ret
Keyboard_check_pressed endp