;Programa que realiza una estructura repetitiva (ciclo) 
; es similar al programa 23.asm solo que ahora se utiliza la introduccion
;Programa que muestra una secuencia descendente de numeros... 

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que muestra una serie de numeros de manera descendente',10,13,13,'$'
	cFinProg     DB '***FIN DEL PROGRAMA******$'
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		
		mov cx, 09h  ; definimos cuantas veces se va a repetir la cadena 	
	eCiclo:
		mov ah, 02h 
		mov dl, cx
		add dl, 30h 
		int 21h 
		
		mov ah, 02h
		mov dl, 0Ah 
		int 21h 
		
		loop eCiclo  ; hace la funcion de un ciclo
		
		; la desventaja es que solo es de manera descendente 
		
	eFinProg:
		mov ah, 09h 
		mov dx, offset cFinProg
		int 21h 
		
		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio