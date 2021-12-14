;Prog 14
;Programa en ensamblador el cual lee un caracter y nos indica si es o no una letra 
;mayuscula o minuscula u otro tipo de caracter 
;Uso de la instruccion cmp
;se realiza una condicional doble 
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion  DB 'Programa que realiza una suma ...',10,13,'$'
	cIngresar     DB 'Ingrese un numero: $'
	cSuma 	      DB 10,10,13, 'El resultado es una suma$'
	cFinPrograma  DB  10,10,13,'***Fin del programa***$'
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

		mov ah, 01h
		int 21h
		sub al, 30h
		
		add bl,al
	
		cmp bl, 09h
		ja eAjuste
		jmp eSalida

		eAjuste:
		  mov bh, 01h
	          sub bl, 0Ah
		  	
		eSalida:
		  mov ah, 09h
		  mov dx, offset cSuma
		  int 21h
		
		  mov ah, 02h
		  mov dl, bh
		  add dl, 30h
		  int 21h
		
		mov ah,02h
		mov dl, bl
		add dl,30h
		int 21h

		eFinProg:
		   mov ah, 09h
	       	   mov dx, offset cFinPrograma
		   int 21h

		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio