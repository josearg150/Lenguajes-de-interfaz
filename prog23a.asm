;Programa que realiza una estructura repetitiva (ciclo) 
; es similar al programa 22.asm solo que ahora se utiliza la introduccion 

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que realiza un ciclo',10,13,13,'$'
	cDia         DB 'Jueves 13 de mayo',10,13,'$'
	cFinProg     DB '***FIN DEL PROGRAMA******$'
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		
		mov cx, 0Ah  ; definimos cuantas veces se va a repetir la cadena 
		
	eCiclo:
		mov ah, 09h 
		mov dx, offset cDia
		int 21h 
		loop eCiclo  ; hace la funcion de un ciclo
		
		; la desventaja es que solo es de manera ascendente 
		
	eFinProg:
		mov ah, 09h 
		mov dx, offset cFinProg
		int 21h 
		
		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio