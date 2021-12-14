;prog22


.MODEL SMALL
.STACK 20h
.DATA
	;CADENAS
	cDescripcion    DB 'Programa que realiza un ciclo$' , 10, 13, '$'
    cFinProg        DB 10,10,13,'Fin del progama$'
    cDia            DB 10,10,13,'Hoy es jueves 13 de mayo de 2021$'

	
.CODE
	inicio: 
		mov ax, @Data 
		mov ds, ax    
		
		mov ah, 09h   
		mov dx, offset cDescripcion
		int 21h

        mov bl, 0Ah
    eCiclo:
        mov ah, 09h
        mov dx, offset cDia
        int 21h
        sub bl, 01h 
        cmp bl, 00h
        jne eCiclo

    eFinProg:
        mov ah,09h
        mov dx, offset cFinProg
        int 21h


		mov ah, 08h			
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio