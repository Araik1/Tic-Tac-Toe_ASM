DrawPolygon                  proto


include         \masm32\include\kernel32.inc
include         \masm32\include\msvcrt.inc

includelib      \masm32\lib\kernel32.lib
includelib      \masm32\lib\msvcrt.lib 

.const



.data
cel1  db "*", 0
cel2  db "*", 0
cel3  db "*", 0
cel4  db "*", 0
cel5  db "*", 0
cel6  db "*", 0
cel7  db "*", 0
cel8  db "*", 0
cel9  db "*", 0


;--------------------------------------------------

.code

PolygonInit proc uses ebx esi edi

         mov cel1, "*"
         mov cel2, "*"
         mov cel3, "*"
         mov cel4, "*"
         mov cel5, "*"
         mov cel6, "*"
         mov cel7, "*"
         mov cel8, "*"
         mov cel9, "*"
         
	RET
PolygonInit ENDP

;**********************************************
DrawPolygon proc  uses ebx esi edi
          
         fn gotoxy,15, 10
         invoke crt_printf, offset cel1
         
         fn gotoxy,21, 10
         invoke crt_printf, offset cel2
         
         fn gotoxy,27, 10
         invoke crt_printf, offset cel3
         
         fn gotoxy,15, 13
         invoke crt_printf, offset cel4
         
         fn gotoxy,21, 13
         invoke crt_printf, offset cel5
         
         fn gotoxy,27, 13
         invoke crt_printf, offset cel6
         
         fn gotoxy,15, 16
         invoke crt_printf, offset cel7
         
         fn gotoxy,21, 16
         invoke crt_printf, offset cel8
         
         fn gotoxy,27, 16
         invoke crt_printf, offset cel9
         
	RET
DrawPolygon ENDP
;***************************************************