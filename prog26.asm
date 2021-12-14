;PROGRAMA QUE MUESTRA UNA SERIE DE NUMEROS EN UNA SECUENCIA ASCENDENTE
; utilizando ciclos SIN la instruccion LOOP 
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
		
		mov bl, 00h ;INICIO DEL Contador 
	eCiclo:
		mov ah, 02h 
		mov dl, bl
		add dl, 30h 
		int 21h 
		add bl, 01h ; incremento del contador  
		
		mov ah, 02h
		mov dl, 0Ah ; hasta el 10 
		int 21h 
		
		cmp bl, 0Ah ;condicion del ciclo
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