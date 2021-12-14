;Programa que realiza una estructura repetitiva (ciclo) 
; es similar al programa 23.asm solo que ahora se utiliza la introduccion
;Programa que muestra una secuencia ascendente de numeros... 

; es similar al prog24 pero ahora mostrando la secuencia ascendente 

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que muestra una serie de numeros de manera ascendente',10,13,13,'$'
	cFinProg     DB '***FIN DEL PROGRAMA******$'
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		
		mov cx, 09h  ; definimos cuantas veces se va a repetir la cadena 	
		mov bl, 01h 
	eCiclo:
		mov ah, 02h 
		mov dl, bl
		add dl, 30h 
		int 21h 
		add bl, 01h ; utilizamos la funcion loop pero con ayuda de otro registro hacerlo 
		            ; de manera ascendente 
		
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