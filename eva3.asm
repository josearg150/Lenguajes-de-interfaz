;Prog59.asm
;Programa que dibuja un cuadrito en pantalla y se desplaza hacia arriba 
;abajo, izquierda y derecha dependiendo de la tecla presionada...


Datos MACRO
	mov ax, @Data
	mov ds, ax
ENDM
;Macro para mostrar mensajes 
Mensaje MACRO cadena
	mov ah, 09h
	mov dx, offset cadena
	int 21h
ENDM
;Macro para leer teclas
ReadKey MACRO
	mov ah, 01h				
	int 21h	
ENDM	

;Macro para regresar control a linea de comandos
Control MACRO
	mov ax, 4c00h
	int 21h
ENDM
;Macro para pintar el rectangulo
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
    ;Espacio para mensajes y variables 
	cDescripcion 	DB 'Programa que pide datos para un rectangulo y lo dibuja '
					DB 10,13,'jose angel rocha garcia 18131273 $'
    cColores        DB 10,13,'Colores disponibles: '
                    DB 10,13,'1)Rojo'
                    DB 10,13,'2)Verde'
                    DB 10,13,'3)Azul'
                    DB 10,13,'4)Cyan'
                    DB 10,13,'Elija un color: $'
    eCoordX1        DB 10,13,'Elija el renglon X inicial (0-9): $'
    eCoordY1        DB 10,13,'Elija la columna Y inicial (0-9): $'
    eCoordX2        DB 10,13,'Elija el renglon X final (0-9): $'
    eCoordY2        DB 10,13,'Elija la columna Y final (0-9): $'
	cDespedida		DB 0Ah, 0Dh, 'Adios$'
    vColor          DB 00h
	vCoordX1        DB 00h
    vCoordY1        DB 00h
    vCoordX2        DB 00h
    vCoordY2        DB 00h

.CODE
	inicio: 
		Datos;Mostrar mensajes de bienvenida
		Mensaje cDescripcion
        Mensaje cColores
	 
        eCiclo:;Se compara el caracter ingresado para elegir el color
            ReadKey;Leer el color   
            cmp al, '1'
            je eRojo

            cmp al, '2'
            je eVerde

            cmp al, '3'
            je eAzul

            cmp al, '4'
            je eCyan

            jmp eCoordenadas
        ;Renglon minimo 0000h, renglon maximo 1804h
        eRojo:;Se mueve el valor del color elegido
            mov vColor, 47h
            jmp eCiclo
        eVerde:
            mov vColor, 27h
            jmp eCiclo
        eAzul:
            mov vColor, 17h
            jmp eCiclo    

        eCyan:
            mov vColor, 37h
            jmp eCiclo  
        eCoordenadas:;Se introducen las coordenadas
            Mensaje eCoordX1
			ReadKey
			mov vCoordX1, al

            Mensaje eCoordY1	
			ReadKey
			mov vCoordY1, al
		
			Mensaje eCoordX2
		    ReadKey
		    mov vCoordX2, al
			
            Mensaje eCoordY2
			ReadKey
			mov vCoordY2, al
		
            ;Mover el color deseado y  tambien las coordenadas elegidas para realizar ajuste  y mostrar    
            Pinta 07h, 0000h, 184Fh
			mov bh, vColor
			mov ch, vCoordX1
			mov cl, vCoordY1
			
			mov dh, vCoordX2
			mov dl, vCoordY2
			sub ch, 30h
			sub cl, 30h
			sub dh, 30h
			sub dl, 30h
			
			Pinta bh, cx, dx
			jmp eFinProg


		ReadKey
		eFinProg:
			
			Mensaje cDespedida
			ReadKey
			Control
		
	END inicio