;Prog 09
;Programa en ensamblador el cual lee un caracter y nos indica si es o no una letra 'a'
;Uso de la instruccion cmp
;se realiza una condicional doble 
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion  DB 'Programa que lee un caracter desde teclado y nos indica si es una letra a minusucla...',10,13,'$'
	cIngresar     DB 'Ingrese un caracter: $'
	cSiEsNumero   DB  10,13,'El caracter SI es un numero $'
	cNoEsNumero   DB  10,13,'El caracter NO es un numero $'
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
	
		cmp al,'a'
		je  eSiEsNumero	
		jmp eNoEsNumero	
		
		eSiEsA:
		  mov ah,09h
		  mov dx, offset cSiEsA
		  int 21h
		  jmp eFinProg
	
		eNoEsA:
		  mov ah, 09h
		  mov dx, offset cNoEsA
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