;Prog 14
;Programa en ensamblador el cual lee un caracter y nos indica si es o no una letra 
;mayuscula o minuscula u otro tipo de caracter 
;Uso de la instruccion cmp
;se realiza una condicional doble 
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion  DB 'Programa que lee un caracter desde teclado y nos indica si es un numero,letra minuscula, letra mayusucula u otro caracter ...',10,13,'$'
	cIngresar     DB 'Ingrese un caracter: $'
	cSiEsNumero  DB 'El caracter ingresado es un numero $'
	cSiEsMayus   DB  10,13,'El caracter es una mayuscula $'
	cSiEsMinus   DB  10,13,'El caracter es una minuscula $'
	cSiEsOtro   DB  10,13,'El caracter es otro tipo de caracter $'
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
	
		cmp al,'0'
		jb  eSiEsOtro	

		cmp al,'9'
		jbe eSiEsNumero

		cmp al, 'A'
		jb  eSiEsOtro

		cmp al, 'Z'
		jbe eSiEsMayus  

		cmp al, 'a'
		jb eSiEsOtro

		cmp al, 'z'
		jbe eSiEsMinus    
		jmp eSiEsOtro

		

	
		eSiEsOtro:
		  mov ah,09h
		  mov dx, offset cSiEsOtro
		  int 21h
		  jmp eFinProg

		eSiEsNumero:
		  mov ah,09h
		  mov dx, offset cSiEsNumero
		  int 21h
		  jmp eFinProg
	
		eSiEsMayus:
		  mov ah, 09h
		  mov dx, offset eSiEsMayus
		  int 21h
		  jmp eFinProg


		eSiEsMinus:
		  mov ah,09h
		  mov dx, offset cSiEsMinus
		  int 21h
		  jmp eFinProg

		eFinProg:
		   mov ah, 09h
	       	   mov dx, offset cFinPrograma
		   int 21h

		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio