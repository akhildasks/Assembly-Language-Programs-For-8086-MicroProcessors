; Write a program to convert the 8 bit binary number FFH into a BCD number. The result is to be stored at memory locations 3000H:200H and 300H:2001H..


MOV AX, 00FFH         ; move the data FFH to AX, with the upper bytes as 00h.
MOV BL, 100           ; store the decimal value 100 (or 64H ) in BL.
DIV BL                ; divide AX by BL to find the number of hundreds in the binary number.

MOV DL, AL            ; move the quotient in AL (number of hundreds) to DL.
MOV AL, AH            ; move the remainder in AH to AL.
MOV AH, 00            ; Clear AH.
MOV BL, 10            ; Store the decimal value 10( or 0AH) in BL.
DIV BL                ; Divide AX by BL to find the number of tens in the binary number AH.
                     
MOV CL, 04            ; Has the remainder, which is the number of ones in the binary number are moved.
ROR AL, CL            ; rotate AL content right four times to make the lower nibble as uuper nibble.

OR AL, AH             ; Perform OR operation on AL and AH to concatenate the number of tens and ones
MOV BX, 3000H         ; Move the value 3000H to BX.
MOV DS, BX            ; Initialize DS with 3000h.
MOV [2001H], DL       ; Move the value of CL to the memory.
MOV [2001H], AL       ; Move the value of AL to the memory.
HLT                   ; stope
