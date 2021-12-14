;Evaluacion 2 jose angel rocha garcia 
.MODEL SMALL
.STACK 20h
.DATA
	;Espacio para declarar mensajes y variables que se usaran 
	cDescripcion 	DB  'Programa que lee una cadena de texto y al final nos dice cuantas mayus y minus tiene  '
					DB	'Jose angel rocha garcia 18131273',10,13,'$'
	cIngresar		DB  10,'Ingrese una cadena de texto y para finalizar presione <Enter>: $'
	cFinProg		DB  10,10,'Fin del programa$'
	cSalidaIncorrecta DB  10,'La cadena es invalida, solo se aceptan minusculas y mayusculas $'
    cMayus          DB  10,'Mayusculas = $',10
    cMinus          DB  10,'Minusculas = $'
	vDigitos        DB  00h
	vMayus      	DB  00h
    vMinus          DB  00h
	
.CODE
inicio: 
		mov ax, @Data
		mov ds, ax					
		;Se muestra el mensaje de descripcion del programa y el mensaje para ingresar texto
		;asi como la tecla para terminarlo 
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h
		
		;Ciclo para leer caracter por caracter
		eCiclo:
			mov ah, 01h		;Instruccion para leer los caracteres
			int 21h 

			;Si se pone un espacio , se va al ciclo otros es 32 en hexa
			cmp al, 20h
			jb  eOtros
			;si es menor que A significa que no es un simbolo 
			cmp al, 'A'
			jbe eOtros
			
			;ahora entramos en las siguientes comparaciones para saber 
			;si es letra 
			cmp al, 'Z'
			jbe eMayus
			
			cmp al, 'a'
			jb  eOtros
			
			cmp al, 'z'
			jbe eMinus
			;de no serlo volvemos a brincar a otros 
			jmp eOtros
			
			;Incrementamos las variables segun sea el caso y volvemos al ciclo 
			;donde se analizan los caracteres
			eMayus:
				add vMayus, 01h
				jmp eCiclo
				
			eMinus:
				add vMinus, 01h
				jmp eCiclo
				

			;para el caso de los otros caracteres analizaremos si es Enter
			;de serlo se va a la salida	
			eOtros:
				cmp al, 0Dh
				je eSalida
				
				cmp al, 08h
				je eCiclo
				;mostramos el mensaje de error 
				mov ah, 09h
				mov dx, offset cSalidaIncorrecta
				int 21h
				;mostramos el mensaje de ingresar nuevamente
				mov ah, 09h
				mov dx, offset cIngresar
				int 21h
				;Reiniciamos los valores ya que se dio un error 
				mov vMayus, 00h
				mov vMinus, 00h
				;regresamos al ciclo de caracteres
				jmp eCiclo
			;comparacion del enter 	
			cmp al, 0Dh
			jne eCiclo
			
		eSalida:
			;Mostramos el mensaje de salida de la mayuscula
			mov ah, 09h
			mov dx, offset cMayus
			int 21h
			;y su contador 
			mov ah, 02h
			mov dl, vMayus
			add dl, 30h
			int 21h
			;Mostramos el mensaje de salida de la minuscula y su contador 
			mov ah, 09h
			mov dx, offset cMinus
			int 21h
			
			mov ah, 02h
			mov dl, vMinus
			add dl, 30h
			int 21h
					
		;etiqueta para finalizar el programa 
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
	
		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio