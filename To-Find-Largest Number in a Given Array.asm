ASSUME                      CS:CODE, DS:DATA
DATA SEGMENT                LIST DB 52H, 23H, 56H, 45H
                            COUNT EQU OF
                            LARGEST DB 01H DUP(?)
DATA ENDS
CODE SEGMENT                
START:                      MOV AX, DATA
                            MOV DS, AX
                            MOV SI, OFFSET LIST
                            MOV CL, COUNT
                            MOV AL, [SI]
                            