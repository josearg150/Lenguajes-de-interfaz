;Primer programa en ensamblador, el cual muestra una cadena
;de caracteres en pantalla...
.MODEL SMALL
.STACK 20h
.DATA
	cSaludo    DB 'Hola chavos!$',10,13,'$'
	cDespedida DB 'Adios$'
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax
		
		mov ah, 09h
		mov dx, offset cSaludo
		int 21h

		mov ah, 09h
		mov dx, offset cDespedida
		int 21h

		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio