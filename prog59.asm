;Prog59.asm
;Programa que dibuja un cuadrito en pantalla y se desplaza hacia arriba 
;abajo, izquierda y derecha dependiendo de la tecla presionada...


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

Pinta MACRO Color, IniPinta, FinPinta
		mov ah, 06h
		mov al, 00h
		mov bh, Color		
		mov cx, IniPinta	
		mov dx, FinPinta	
		int 10h
ENDM
		
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion 	DB 'Programa que dibuja un cuadrito en pantalla y se desplaza '
					DB 'con diferentes teclas, JOSE ANGEL ROCHA GARCIA 18131273 $'
	cDespedida		DB 0Ah, 0Dh, 'Adios$'
	
.CODE
	inicio: 
		Datos
		Mensaje cDescripcion
		ReadKey
		
		Pinta 07h, 0000h, 184Fh				;cls
		
		mov bh, 27h
		mov cx, 0300h
		mov dx, 0504h
		
		Pinta bh, cx, dx
		
		eTecla:
			ReadKey
			cmp al, 'd'
			je	eDerecha
			cmp al, 'a'
			je 	eIzquierda
			cmp al, 'w'
			je 	eArriba
			cmp al, 's'
			je  eAbajo
		
			jmp eFinProg
	
		eDerecha:
			cmp dl, 4Fh
			je eTecla
			Pinta 07h, cx, dx
			add cl, 05h
			add dl, 05h
			Pinta 27h, cx, dx
			jmp eTecla
			;cmp dl, 4Fh
			;jb	eDesplaza
		
		eIzquierda:
			cmp cl, 00h
			je eTecla
			
			Pinta 07h, cx, dx
			sub cl, 05h
			sub dl, 05h
			Pinta 27h, cx, dx
			jmp eTecla
			;jmp eTecla
		eAbajo:
			cmp dh, 18h
			je eTecla
			Pinta 07h, cx, dx
			add ch, 01h
			add dh, 01h
			Pinta 27h, cx, dx
			jmp eTecla	
		eArriba:
			cmp ch, 00h
			jne eArribaTope
			jmp eTecla
		
		eArribaTope:
			Pinta 07h, cx, dx
			sub ch, 01h
			sub dh, 01h
			Pinta 27h, cx, dx
			jmp eTecla
		
		
		eFinProg:
			
			Mensaje cDespedida
			ReadKey
			Control
		
	END inicio