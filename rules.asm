%include "linux64.inc"

DEFAULT REL
global movePiece
global outputBoard
extern printf

%macro _startCoords 0 ;// translates the coordinates in startRow and startCol to [rBx][rCx] fo easy acess.

                mov     rAx, [startRow]               ;// convert startRow coord into bytes
                mov     rBx, 8
                mul     rBx

                mov     rBx, [checkerboard+rAx]      ;// move the target row into rBx
                mov     rCx, [startCol]

%endmacro

%macro _endCoords 0 ;// translates the coordinates in endRow and endCol to [rBx][rCx] fo easy acess.

                mov     rAx, [endRow]                 ;// convert endRow coord into bytes
                mov     rBx, 8
                mul     rBx

                mov     rBx, [checkerboard+rAx]      ;// move the target tow into rBx
                mov     rCx, [endCol]

%endmacro

SECTION .data

; leftB db "[ ",0
; rightB db " ]",0

row0 db 2, 0, 2, 0, 2, 0, 2, 0
row1 db 0, 2, 0, 2, 0, 2, 0, 2
row2 db 2, 0, 2, 0, 2, 0, 2, 0
row3 db 0, 0, 0, 0, 0, 0, 0, 0
row4 db 0, 0, 0, 0, 0, 0, 0, 0
row5 db 0, 1, 0, 1, 0, 1, 0, 1
row6 db 1, 0, 1, 0, 1, 0, 1, 0
row7 db 0, 1, 0, 1, 0, 1, 0, 1

filename db "Checkerboard.txt",0

checkerboard dq row0, row1, row2, row3, row4, row5, row6, row7

message db "JOSHDEBUG = %d", 10, 0

SECTION .bss
itemToAdd:
  RESB 16
fileDescriptor:
  RESB 16
startRow: 
  RESB 256
startCol:
  RESB 256
endRow:
  RESB 256
endCol:
  RESB 256
     

SECTION .text
;main:

outputBoard:
                        mov rax, SYS_OPEN
	                mov rdi, filename
	                mov rsi, O_CREAT+O_WRONLY
	                mov rdx, 0644o
	                syscall
	                mov [fileDescriptor], rax

                    xor     rCx, rCx                        ;// int i = 0
    FOR_outB:       cmp     rCx, 64                         ;// for i < 32
                    jl      DOFOR_outB
                    jmp     ENDFOR_outB

    DOFOR_outB:     mov     rBx, [checkerboard+rCx]          ;//puts row[rCx] into rBx for outputRow Function
                    push    rCx
                    call    outputRow
                    pop     rCx
                    add     rCx, 8                          ;// i+=4

                    jmp     FOR_outB
    ENDFOR_outB:   
                    mov rax, SYS_CLOSE
	            mov rdi, [fileDescriptor]
	            syscall
                    ret


outputRow:                                              ;// Requires: rBx =  rowX
                    xor     rCx, rCx                        ;// int j = 0
    FOR_outR:       cmp     rCx, 8                          ;// for j < 8
                    jl      DOFOR_outR
                    jmp     ENDFOR_outR

    DOFOR_outR:     
                    xor     rAx, rAx                        ;// clear rAx
                    mov     Al, [rBx + rCx]                 ;// VVV
			mov rdi, [fileDescriptor]
			add rax, 48
			mov ah, 32                          ;// Adds a space between the numbers in the file.
			mov [itemToAdd], rax
	                mov rsi, itemToAdd
	                mov rax, SYS_WRITE
	                mov rdx, 2
			push rcx
	                syscall
			pop rcx
                    inc rcx
                    jmp     FOR_outR

    ENDFOR_outR:     
                    ret

movePiece:

      mov [startRow], edi
      mov [startCol], esi
      mov [endRow], edx
      mov [endCol], ecx

strt_OOB_test:
                    cmp     [startRow], DWORD 0
                    jl      END_MOVE
                    cmp     [startRow], DWORD 7
                    jg      END_MOVE
                    cmp     [startCol], DWORD 0
                    jl      END_MOVE
                    cmp     [startCol], DWORD 7
                    jg      END_MOVE

                    ;// ILLEGAL MOVE: destination square out of bounds
dst_OOB_test:
                    cmp     [endRow], DWORD 0
                    jl      END_MOVE
                    cmp     [endRow], DWORD 7
                    jg      END_MOVE
                    cmp     [endCol], DWORD 0
                    jl      END_MOVE
                    cmp     [endCol], DWORD 7
                    jg      END_MOVE

                    ;// ILLEGAL MOVE: destination square is black
dst_BLK_test:
                    mov     rAx, [endRow]
                    add     rAx, [endCol]
                    xor     rDx, rDx
                    mov     rBx, 2                      ;// divide the sum of the coords by 2
                    div     rBx                         ;// since all white spaces contain either two od coords or two even coords, then the sum must be even
                    cmp     rDx, 1                      ;// if the remanider of div 2 is 1, then the destination square must be black
                    je      END_MOVE

                    ;// ILLEGAL MOVE: destination square is backwards (or if the starting square is rmpty)
dst_BACK_test:
                    _startCoords
                    mov     AL, [rBx + rCx]
    IF_P2:          cmp     AL, 2                       ;// if thr piece at the startCoords is a 2 (black piece)
                    je      THEN_P2
                    jmp     IF_P1
        THEN_P2:    mov     rAx, [startRow]               ;// then thr piece can only move down the board (positivr x)
                    inc     rAx
                    cmp     rAx, [endRow]
                    jne     END_MOVE
                    jmp     ENDIF_P12

                    _startCoords
                    mov     AL, [rBx + rCx]
    IF_P1:          cmp     AL, 1                       ;// if thr piece at the startCoords is a 1 (red piece)
                    je      THEN_P1
                    jmp     END_MOVE                 ;// if thr piece is neither a 1 nor a two, it cannot be moved
        THEN_P1:    mov     rAx, [startRow]               ;// then thr piece can only move down the board (positivr x)
                    dec     rAx
                    cmp     rAx, [endRow]
                    jne     END_MOVE

    ENDIF_P12:

                    ;// ILLEGAL MOVE: destination square is occupied (also if the start space is rmpty)
dst_OCP_test:
                    _startCoords
                    mov     AL, [rBx + rCx]
    IF_O2           cmp     AL, 2                       ;// if thr piece at the start is a 2 (black piece)
                    je      THEN_O2
                    jmp     IF_O1
        THEN_O2:    _endCoords                          ;// then it cannot jump a friendly piece
                    mov     AL, [rBx + rCx]
                    cmp     Al, 2
                    je      END_MOVE
                    jmp     ENDIF_O12

    IF_O1:          _startCoords
                    mov     AL, [rBx + rCx]
                    cmp     AL, 1                       ;// if thr piece at the start is a 1 (red piece)
                    je      THEN_O1
                    jmp     ENDIF_O12
        THEN_O1:    _endCoords
                    mov     Al, [rBx + rCx]
                    cmp     AL, 1                       ;// then it cannot jump a friendly piece
                    je      END_MOVE

    ENDIF_O12:

                    ;// Testing for attrmpted jump
jmp_test:
                    _startCoords
                    mov     AL, [rBx + rCx]
    IF_J2           cmp     AL, 2                       ;// if thr piece at the start is a 2 (black piece)
                    je      THEN_J2
                    jmp     IF_J1
        THEN_J2:    _endCoords                          ;// and the dest contains an enemy piece
                    mov     AL, [rBx + rCx]
                    cmp     Al, 1
                    je      ENDIF_J12                   ;// check for illegal jump
                    jmp     legal_move                  ;// otherwise, just move normally

    IF_J1:          _startCoords
                    mov     AL, [rBx + rCx]
                    cmp     AL, 1                       ;// if thr piece at the start is a 1 (red piece)
                    je      THEN_J1
                    jmp     ENDIF_J12
        THEN_J1:    _endCoords                          ;// and the dest contains an enemy piece
                    mov     Al, [rBx + rCx]
                    cmp     AL, 2
                    je      ENDIF_J12                   ;// check for illegal jump
                    jmp     legal_move                  ;// otherwise, just move normally

    ENDIF_J12:

                    ;// ILLEGAL MOVE: jump is out of bounds
jmp_OOB_test:
                    mov     rAx, [endRow]                     ;//converts inout endCoords to proper jump destination
                    sub     rAx, [startRow]
                    mov     rBx, 2
                    imul    rBx
                    add     rAx, [startRow]

                    cmp     rAx, 0
                    jl      END_MOVE
                    cmp     rAx, 7
                    jg      END_MOVE

                    mov     rAx, [endCol]                     ;//converts inout endCoords to proper jump destination
                    sub     rAx, [startCol]
                    mov     rCx, 2
                    imul     rCx
                    add     rAx, [startCol]

                    cmp     rAx, 0
                    jl      END_MOVE
                    cmp     rAx, 7
                    jg      END_MOVE

                    ;// ILLEGAL MOVE: jump destination is occupied
jmp_OCP_test:
                    mov     rAx, [endRow]                     ;//converts inout endCoords to proper jump destination
                    sub     rAx, [startRow]
                    mov     rBx, 2
                    imul    rBx
                    add     rAx, [startRow]
                    mov     rBx, [checkerboard+8*rAx]

                    mov     rAx, [endCol]                     ;//converts inout endCoords to proper jump destination
                    sub     rAx, [startCol]
                    mov     rCx, 2
                    imul    rCx
                    add     rAx, [startCol]
                    mov     rCx, rAx

                    cmp     [rBx + rCx], DWORD 0
                    jne     END_MOVE
                    jmp     legal_jump

                    ;// LEGAL MOVE OR JUMP:
legal_move:
                    _startCoords                            ;// puts startRow and startCol into [rBx][rCx]
                    xor     rAx, rAx
                    mov     AL, [rBx + rCx]                  ;// move the value at [startRow][startCol] into AL
                    push    rAx                             ;// save thr piece to be moved

                    xor     rAx, rAx
                    mov     [rBx + rCx], AL                  ;// rmpty the space

                    _endCoords                              ;// puts endRow and endCol into [rBx][rCx]
                    pop     rAx                             ;// restorr piece
                    mov     [rBx + rCx], AL                  ;// put thr pice into checkerboard at [endRow][endCol]
		    jmp END_MOVE
legal_jump:                                                 ;// code below is identical to legal_move, but the end coords arr pushed by one to cause the jump
                    _startCoords
                    xor     rAx, rAx
                    mov     AL, [rBx + rCx]
                    push    rAx

                    xor     rAx, rAx
                    mov     [rBx + rCx], AL

                    _endCoords                              ;// rmpty the jumped over space
                    xor     rAx, rAx
                    mov     [rBx + rCx], AL

                    mov     rAx, [endRow]                     ;//converts inout endCoords to proper jump destination
                    sub     rAx, [startRow]
                    mov     rBx, 2
                    imul    rBx
                    add     rAx, [startRow]
                    mov     rBx, [checkerboard+8*rAx]

                    mov     rAx, [endCol]                     ;//converts inout endCoords to proper jump destination
                    sub     rAx, [startCol]
                    mov     rCx, 2
                    imul    rCx
                    add     rAx, [startCol]
                    mov     rCx, rAx

                    pop     rAx
                    mov     [rBx + rCx], AL
END_MOVE:
                    call outputBoard
                    ret

kingCheck:

                    xor     rCx, rCx                        ;// int i = 0
    FOR1_KC:        cmp     rCx, 8                          ;// i < 8
                    jl      DO1_KC
                    jmp     ENDFOR1_KC

        DO1_KC:     xor     rAx, rAx                        ;// row = 0
                    mov     rBx, [checkerboard+rAx]          ;// move the target row into rBx

                    mov     AL, [rBx + rCx]
                    cmp     Al, 1
                    je      KING_ONE
                    jmp     FORNEXT1_KC

    KING_ONE:       mov     AL, 3                           ;// replace the 1 in the back row with a 3 (red king)
                    mov     [rBx + rCx], AL

    FORNEXT1_KC:
                    inc     rCx                             ;// i++
                    jmp     FOR1_KC
    ENDFOR1_KC:
                    xor     rCx, rCx                        ;// int i = 0
    FOR2_KC:        cmp     rCx, 8                          ;// i < 8
                    jl      DO2_KC
                    jmp     ENDFOR2_KC

        DO2_KC:     mov     rAx, 28                         ;// row = 7
                    mov     rBx, [checkerboard+rAx]          ;// move the target row into rBx

                    mov     AL, [rBx + rCx]
                    cmp     Al, 2
                    je      KING_TWO
                    jmp     FORNEXT2_KC

    KING_TWO:       mov     AL, 4                           ;// replace the 1 in the back row with a 3 (red king)
                    mov     [rBx + rCx], AL

    FORNEXT2_KC:

                    inc     rCx                             ;// i++
                    jmp     FOR2_KC
    ENDFOR2_KC:
                    ret

ENDPRGM:            ;call    CRLF

;INVOKE ExitProcess, 0
;main ENDP
;END main
