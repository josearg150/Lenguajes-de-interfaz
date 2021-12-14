;Programa lee 'N' números y termina cuando la suma de los mismos 
;es mayor a 9

.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion 	DB  'Programa que lee una serie de numeros y termina cuando '
					DB	'la suma de los mismos es mayor a 9',10,13,'$'
	cIngresar		DB  10,'Ingrese un numero: $'
	cFinProg		DB  10,10,'Fin del programa$'
	cMensaje		DB  10,'La suma de los numeros es de $'
	vSumaTotal		DB  00h
	vSumaCasiTotal	DB  00h
	
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax					; mov ds, @Data
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h

		eCiclo:
			mov ah, 09h
			mov dx, offset cIngresar
			int 21h
			
			mov ah, 01h
			int 21h
			sub al, 30h
			add vSumaTotal, al
			
			cmp vSumaTotal, 09h
			jbe eCiclo
			
			mov bl, al				;en BL queda el último número ingresado
			mov cl, vSumaTotal		;en CL queda la sumaTotal, que al restarle
			sub cl, bl				;bl, queda en CL el valor de la sumaTotal
									;antes del último número ingresado
									;por lo tanto en BL y en CL quedan 
									;el último número ingresado y el valor 
									;de la sumaTotal antes del último número
	
		eSalida:	
			mov ah, 09h
			mov dx, offset cMensaje
			int 21h
			
			mov ah, 00				;se coloca en AH un 00h para "limpiarlo" 
			mov al, bl				;se coloca en AL el último número ingresado
			add al, cl				;se suman AL y CL (que son el último número
			aaa						;ingresado y el valor de la suma antes del 
			mov bx, ax				;último número ingresado.  Luego se hace el 
									;ajuste de la suma y finalmente se coloca en 
									;BX la suma ajustada BH decena de la suma 
									;y BL unidad de la suma
			
			mov ah, 02h				;Se muestra la decena de la suma acumulada
			mov dl, bh
			add dl, 30h
			int 21h
			
			mov ah, 02h				;Se muestra la unidad de la suma acumulada
			mov dl, bl
			add dl, 30h
			int 21h
			

			
		eFinProg:
			mov ah, 09h
			mov dx, offset cFinProg
			int 21h
	
		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio