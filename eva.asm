;Evaluacion 1 jose angel rocha garcia 18131273

.MODEL SMALL
.STACK 20h
.DATA
;Seccion para mensajes y variables usadas 
	cDescripcion 	DB  10,13,'Programa que recibe una cadena y cuenta las palabras, jose angel rocha garcia 18131273$'
	cIngresar		DB  10,'Ingresa texto, enter para terminar: $'
	cFinProg		DB  10,10,'Fin del programa$'
	cContador	    DB  10,'Numero de palabras: $'
	vTotal 		    DB  02h ;se inicializa en dos debido a las direcciones del programa , 
							;de lo contrario muestra dos palabras menos 
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax					; mov ds, @Data
		
		;Se muestran los mensajes de bienvenida al programa 
		mov dx, offset cDescripcion
		mov ah, 09h
		int 21h

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h
		eCiclo:             ;Ciclo donde se leeran la cadena ingresada
			mov ah, 01h     ;Instruccion para leer los caracteres 
			int 21h                  
                                    
			cmp al, ' '		;Se compara si el caracter es un espacio ya que 
   			je eContador	;cada espacio significa una palabra nueva, y se envia el ciclo a donde se incrementa

			cmp al, 0Dh  ;Se compara si es enter para terminar la lectura de caracteres
			je eSalida
			jmp eCiclo

		eContador:
			inc vTotal ;se aumenta la variable que lleva el conteo de palabras y vuelve al ciclo
			jmp eCiclo
			
		eSalida:
			;Se muestran los mensajes de salida
			mov ah, 09h
			mov dx, offset cContador
			int 21h
			;Se muestra la variable y se realiza su ajuste para leerla de forma correcta 
			mov ah, 02h
			mov dl, vTotal
			add dl, 30h
			sub dl, 01h
			int 21h
					
		;Bloque para mostrar el mensaje de fin de programa 
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
	
			mov ah, 08h				
			int 21h		

			;mov ax, 4c00h
			;int 21h
	END inicio