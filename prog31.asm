;PROGRAMA QUE LEE N NUMEROS Y TERMINA CUANDO LA SUMA DE LOS MISMOS
;ES MAYOR O IGUAL A 9
 
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que lee una serie de numeros y termina cuando la suma de los mismos es mayor a 9',10,13,13,'$'
	cIngresar    DB 10,13,13,'Ingresa un numero: $'
	cFinProg     DB 10,13,13,'***FIN DEL PROGRAMA******$'
	cMensaje     DB 10,13,13,'La suma total es: $'
    vSumaTotal   DB 0h
	vSumaCasiTotal DB 0h
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		eCiclo:
		    mov ah, 09h
		    mov dx, offset cIngresar
		    int 21h

            mov ah, 01h
	    	int 21h
		    sub al, 30h
            add vSumaTotal, al

            cmp vSumaTotal, 09h			
		    jbe eCiclo

			mov bl,al
			mov cl, vSumaTotal
			sub cl, bl

		eSalida:
			mov ah, 09h
			mov dx, offset cMensaje
			int 21h 
			
			mov ax, 0000h
			add al, vSumaTotal
			aaa
			mov bx,ax

			mov ah, 02h
			mov dl, bh
			add dl, 30h
			int 21h

			mov ah, 02h
			mov dl, bl
			add dl, 30h
			int 21h
		eFinProg:
			mov ah, 09h 
			mov dx, offset cFinProg
			int 21h 
		
			mov ah, 08h				
			int 21h		

			mov ax, 4c00h
			int 21h
	END inicio