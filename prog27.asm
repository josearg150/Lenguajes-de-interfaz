;PROGRAMA QUE MUESTRA UNA SERIE DE NUMEROS EN UNA SECUENCIA ASCENDENTE de numeros (00-99)
; utilizando ciclos SIN la instruccion LOOP 
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion DB 'Programa que muestra una serie de numeros de manera ascendente',10,13,13,'$'
	cFinProg     DB '***FIN DEL PROGRAMA******$'
	vUniSuma     DB 00
	vDecSuma     DB 00
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		
		mov bl, 00 ;INICIO DEL Contador 
	eCiclo:
		
		mov ah, 02h 
		mov dl, vDecSuma
		add dl, 30h 
		int 21h 
		
		mov dl, vUniSuma
        add dl, 30h
        int 21h 		
		
		mov ah, vDecSuma
		mov al, vUniSuma
		add al, 01h       ; se agrega uno para que se haga el acarreo
		aaa
		
		mov vDecSuma, ah    
		mov vUniSuma, al 
		
		mov ah, 02h        ; se manipula como el enter 
		mov dl, 0Ah 
		int 21h 
		
		inc bl 
		
		cmp bl, 100 ;condicion del ciclo
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