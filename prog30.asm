;PROGRAMA QUE MUESTRA LA TABLA DEL 4
 
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que muestra la tabla de multiplicar',10,13,13,'$'
	cPor         DB ' X $'
	cIngresar    DB 10,13,13,'Ingresa un numero: $'
	cLimite      DB 10,13,13,'Ingresa el limite: $'
	cSaltoLinea  DB 10,13,13,'$'
	cIgual       DB ' = $'
	cFinProg     DB '***FIN DEL PROGRAMA******$'
	vCont        DB 00h
	vNumero      DB 0h
	vLimite      DB 0h
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		
		mov ah, 09h
		mov dx, offset cIngresar
		int 21h
		;lectura del numero 
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vNumero,al
		;salto de linea
		mov ah, 09h
		mov dx, offset cSaltoLinea
		int 21h
		;Ingresar limite
		mov ah, 09h
		mov dx, offset cLimite
		int 21h

	    mov ah, 01h
		int 21h
		sub al, 30h
		mov vLimite,al
		;////
		;Dar un salto de linea
		mov ah, 09h
		mov dx, offset cSaltoLinea
		int 21h

		mov vCont, 01h ;INICIO DEL Contador 
		mov bx, 0000h
	
	eCiclo:
		;Mostrar numero que se eligio
		mov ah,02h
		mov dl, vNumero
		add dl, 30h
		int 21h
		;mostrar simbolo X
		mov ah, 09h 
		mov dx, offset cPor
		int 21h
        ;Mostrar contador 
        mov ah, 02h 
        mov dl, vCont
        add dl, 30h
        int 21h 
		;mostrar igual
        mov ah, 09h 
        mov dx, offset cIgual
        int 21h 
		
		mov ax, bx 
		add al, vNumero  ; aqui se van sumando de 4 en 4 
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
		;Movemos el limite a al	
		mov al, vLimite
		;comparamos el contador contra el limite
		cmp vCont, al  ;condicion del ciclo 
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