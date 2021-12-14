;Prog50.asm
;Programa que dibuja un cuadrito en pantalla y se desplaza
;Funciona de manera simpilar al 55 solo que ahora sin la
;necesidad de presionar una tecla

Datos MACRO
	mov ax, @Data
	mov ds, ax
ENDM

Mensaje MACRO cadena
	mov ah, 09h
	mov dx, offset cadena
	int 21h
ENDM

ReadKey MACRO
	mov ah, 08h				
	int 21h		
ENDM

Control MACRO
	mov ax, 4c00h
	int 21h
ENDM

Delay MACRO
	mov ax, 0000h
	eTiempo2:
		mov bx, 00h
		eTiempo:
			inc bx
			cmp bx, 0FFFFh
			jb eTiempo
		inc ax
		cmp ax, 09FFFh
		jb eTiempo2
	;mov bl, 00h
ENDM

Pinta MACRO Color, IniPinta, FinPinta
		mov ah, 06h
		mov al, 00h
		mov bh, Color		;mov bh, 17h
		mov cx, IniPinta	;mov cx, 0000h
		mov dx, FinPinta	;mov dx, 1813h
		int 10h
ENDM
		
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion 	DB 'Programa que dibuja una serie de rectangulos interiores$'
	cDespedida	    DB 0Ah, 0Dh, 'Adios$'
	
.CODE
	inicio: 
		Datos	
		Mensaje cDescripcion
		ReadKey
		
		Pinta 07h, 0000h, 184Fh ;NEGRO
		
		mov bh, 77h
		mov cx, 0000h
		mov dx, 184Fh
		
		Pinta bh, cx, dx ;BLANCO
		
		ePinta: 
			sub bh, 10h
			
			add ch, 01h
			add cl, 04h
			
			sub dh, 01h
			sub dl, 04h

			ReadKey
			Pinta bh, cx, dx
			cmp bh, 07h
			jg ePinta
		
		;LIMPIAR PANTALLA
		;Pinta 07h, 0000h, 184Fh ;NEGRO
		;Pinta 77h, 0000h, 184Fh ;BLANCO
		;Pinta 67h, 0104h, 174Bh ;MARRON
		;Pinta 57h, 0208h, 1647h ;ROSA
		;Pinta 47h, 030Ch, 1543h ;ROJO
		;Pinta 37h, 0410h, 143Fh ;CYAN
		;Pinta 27h, 0514h, 133Bh ;VERDE
		;Pinta 17h, 0618h, 1237h ;AZUL
		;Pinta 07h, 071Ch, 1133h ;NEGRO
		
		ReadKey
		Control
		
	END inicio