;Prog 08
;Programa en ensamblador el cual lee un caracter y posteriormente lo muestra en pantalla 
;

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion  DB 'Programa que lee un caracter...',10,13,'$'
	cIngresar     DB 'Ingrese un caracter: $'
	cIngresado    DB  10,13,'El caracter ingresado fue: $'
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

		mov bl, al
	
		mov ah, 09h
		mov dx, offset cIngresado
		int 21h
	
		mov ah, 02h
		mov dl, bl
		int 21h

		mov ah, 09h
		mov dx, offset cFinPrograma
		int 21h

		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio