;Evaluacion 4 jose angel rocha garcia 

Datos MACRO
	mov ax, @Data 
	mov ds, ax
ENDM

ReadKey MACRO
	mov ah, 08h				
	int 21h
ENDM

Mensaje MACRO cadena
	mov ah, 09h
	mov dx, offset cadena
	int 21h
ENDM

Control MACRO
	mov ax, 4c00h 
	int 21h
ENDM
Pinta MACRO Color, eIni, eFin
	mov ah, 06h
	mov al, 00h
	mov bh, Color 
	mov cx, eIni
	mov dx, eFin
	int 10h
ENDM

.MODEL SMALL
.STACK 20h
.DATA
   ;Espacio para mensajes y variables que se usaran
	cDescripcion  DB 'Programa que abre una cortina o la cierra '
				  DB 'Jose angel Rocha Garcia 18131273 Presiona enter usa a para cerrar y d para abrir$'
	cDespedida 	  DB 0Ah, 0Dh, 'Adios$'
    vFondo        DB 77h
    vCortina      DB 37h
.CODE
	inicio: 
		Datos;Mostramos los mensajes de bienvenida 
		Mensaje cDescripcion
		ReadKey//Leemos la tecla
		;Se pinta el fondo y la cortina 
		Pinta vFondo, 0000h, 184Fh 
		Pinta vCortina, 0027h, 1827h 
		
		eTecla:;Leemos caracter y comparamos para mover la cortina y tambien enter para terminar 
			ReadKey
			
			cmp al, 'a'
			je  eCerrar
	
			cmp al, 'd'
			je  eAbrir2
			
			cmp al, 0Dh
			je eFinProg  
		eAbrir2:
			Pinta vFondo, cx, dx 
			sub cl, 01h
			add dl, 01h
			;comparamos si esta en el limite para cerrar y regresar a pedir tecla
			cmp dl, 00h
			je eTecla
			Pinta vCortina, cx, dx 
			jmp eTecla

		eCerrar:;Comparamos si la cortina llego al limite para regresar a pedir tecla
			cmp cl, 28h
			je eTecla
			;pintamos el fondo 
			push cx
			push dx
			Pinta vFondo, 0000h, 184Fh 
			pop dx
			pop cx
			;Aumentamos el lado izquierdo y reducimos el derecho	
			add cl, 01h
			sub dl, 01h
			Pinta vCortina, cx, dx
			jmp eTecla 
				eFinProg:
			Mensaje cDespedida
			ReadKey
			Control
			
	END inicio