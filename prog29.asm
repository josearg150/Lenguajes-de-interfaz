;PROGRAMA QUE MUESTRA LA TABLA DEL 7
 
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que muestra la tabla del 7',10,13,13,'$'
	cSietePor    DB '7 X $'
	cIgual       DB ' = $'
	cFinProg     DB '***FIN DEL PROGRAMA******$'
	vCont        DB 00h
	vSuma        DB 00h
	
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		
		mov vCont, 01h ;INICIO DEL Contador 
		mov bx, 0000h
		
	eCiclo:
		
		mov ah, 09h 
		mov dx, offset cSietePor 
		int 21h
        
        mov ah, 02h 
        mov dl, vCont
        add dl, 30h
        int 21h 

        mov ah, 09h 
        mov dx, offset cIgual
        int 21h 
		
		mov ax, bx 
		add al, 07h
		aaa
		mov bx, ax 
		
		mov ah, 02h 
		mov dl, bh 
	    add dl, 30h 
		int 21h 
		
		mov ah, 02h 
		mov dl, bl 
	    add dl, 30h 
		int 21h
		
		mov ah, 02h ; este es el enter 
		mov dl, 0Ah 
		int 21h 
		
        inc vCont		
         		
		cmp vCont, 10  ;condicion del ciclo 
        jbe eCiclo
        		
		
	eFinProg:
		mov ah, 09h 
		mov dx, offset cFinProg
		int 21h 
		
		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio