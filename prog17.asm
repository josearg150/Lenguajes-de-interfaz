;Prog 14
;Programa en ensamblador el cual lee dos numeros de dos cifras y al final muestra el
;resultado de la suma
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion  DB 'Programa que realiza una suma con dos numeros de dos cifras y al final muestra el resultado de la suma de los mismos ...',10,13,'$'
	cIngresar     DB 10,10,13,'Ingrese un numero de dos cifras: $'
	cSuma 	      DB 10,10,13, 'El resultado de la suma de los numeros es: $'
	cFinPrograma  DB  10,10,13,'***Fin del programa***$'
	vDecNum1      DB 0h
	vUniNum1      DB 0h
	vDecNum2      DB 0h
	vUniNum2      DB 0h
	vDecSuma      DB 0h
	vUniSuma      DB 0h
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
		sub al, 30h
		mov vDecNum1,al
		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vUniNum1,al

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h	
     		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vDecNum2,al
		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vUniNum2,al
	;Sumar las unidades de los dos numeros
		mov al, vUniNum1
		mov al, vUniNum2
		mov vUniSuma, al

	;Sumar las decenas de los dos numeros
		mov al, vDecNum1
		mov al, vDecNum2
		mov vDecSuma, al
	;SE revisa el carreo si es mayor de  9

		cmp vUniSuma, 09h
		ja eAjusteUnidad
		jmp eSalida

		eAjusteUnidad:
			sub vUniSuma, 0Ah
			add vDecSuma, 01h 

	    eSalida:
			mov ah,09h
			mov dx, offset cSuma
			int 21h
 
			mov ah, 02h
			mov dl, vDecSuma
			add dl, 30h
			int 21h

			mov ah, 02h
			mov dl, vUniSuma
			add dl, 30h 
			int 21h

		cmp bl, 09h
		ja eAjuste
		jmp eSalida

		eAjuste:
		  mov bh, 01h
	          sub bl, 0Ah
		  	
		;eSalida:
		  mov ah, 09h
		  mov dx, offset cSuma
		  int 21h
		
		  mov ah, 02h
		  mov dl, bh
		  add dl, 30h
		  int 21h
		
		mov ah,02h
		mov dl, bl
		add dl,30h
		int 21h

		eFinProg:
		   mov ah, 09h
	       	   mov dx, offset cFinPrograma
		   int 21h

		mov ah, 08h				
		int 21h		

		mov ax, 4c00h
		int 21h
	END inicio