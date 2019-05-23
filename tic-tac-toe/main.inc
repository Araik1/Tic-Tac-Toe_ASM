include \masm32\include\masm32rt.inc


Main                    proto
SetWindowSize           proto :DWORD,:DWORD
HideCursor              proto
;------------------------------------------------
gotoxy                  proto :DWORD,:DWORD
;------------------------------------------------

        cBlack         = 0
        cBlue          = 1
        cGreen         = 2
        cCyan          = 3
        cRed           = 4
        cMagenta       = 5
        cBrown         = 6
        LightGray      = 7
        DarkGray       = 8
        LightBlue      = 9
        LightGreen     = 10
        LightCyan      = 11
        LightRed       = 12
        LightMagenta   = 13
        cYellow        = 14
        cWhite         = 15




.const
    MAX_WIDTH          equ 82
    MAX_HEIGHT         equ 37




.data?




.data
srect                  SMALL_RECT <0,0,MAX_WIDTH  - 1, MAX_HEIGHT - 1>



