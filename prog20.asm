;prog20
;Programa que utiliza la directiva aaa


.MODEL SMALL
.STACK 20h
.DATA
	;CADENAS
	cDescripcion    DB 'Programa que utiliza la directiva AAA' , 10, 13, '$'

	
.CODE
	inicio: 
		mov ax, @Data 
		mov ds, ax    
		
		mov ah, 09h   
		mov dx, offset cDescripcion
		int 21h

        mov ax, 030h
        AAA 

;Ejemplo de AA sin acarreo 		
        mov al, 03h
        mov bl, 04h
        add al,bl 
        aaa
;Ejemplo de AAA con acarreo 
        mov al, 08h
        mov bl, 04h
        add al,bl 
        aaa

		mov ah, 08h			
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio