;prog18.asm 
;programa en ensamblador, el cual lee dos numeros de dos cifras y muestra la suma de estso
;Funciona para todos los numeros de una cifra


.MODEL SMALL
.STACK 20h
.DATA
	;CADENAS
	cDescripcion    DB 'Programa que lee dos numero de dos cifras y al final muestra el resultado de la suma de los mismos' , 10, 13, '$'
	cIngresar 		DB 10, 10, 13, 'Ingrese un numero de dos cifras: $'
	cSuma			DB 10, 10, 13, 'El resultado de la suma de los numeros es:  $'
	cFinPrograma	DB 10, 13, '**** FIN DEL PROGRAMA ****',10,'$'
	;VARIABLES
	vDecNum1		DB 0h
	vUniNum1		DB 0h
	vDecNum2		DB 0h
	vUniNum2		DB 0h
	vDecSuma		DB 0h
	vUniSuma		DB 0h
	vCenSuma        DB 0h
	
.CODE
	inicio: 
		mov ax, @Data 
		mov ds, ax    
		
		mov ah, 09h   
		mov dx, offset cDescripcion
		int 21h
		
		;Cadena para ingresar el primer numero de dos cifras
		mov ah, 09h   
		mov dx, offset cIngresar
		int 21h
		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vDecNum1, al	;se guarda la decena del primer numero
		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vUniNum1, al	;se guarda la unidad del primer numero
		
		;Cadena para ingresar el segundo numero de dos cifras
		mov ah, 09h   
		mov dx, offset cIngresar
		int 21h
		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vDecNum2, al	;se guarda la decena del segundo numero
		
		mov ah, 01h
		int 21h
		sub al, 30h
		mov vUniNum2, al	;se guarda la unidad del segundo numero
		
		;Se realiza la suma de las unidades de los numeros
		mov al, vUniNum1	;Pongo en 'al' la unidad 1
		add al, vUniNum2	;vUniSuma = vUniNum1 + vUniNum2
		mov vUniSuma, al	;Movemos lo de vUniNum1 a vUniSuma
		
		;Se realiza la suma de las decenas de los numeros
		mov al, vDecNum1	;Pongo en 'al' la unidad 1
		add al, vDecNum2	;vUniSuma = vUniNum1 + vUniNum2
		mov vDecSuma, al	;Movemos lo de vUniNum1 a vUniSuma
		
		;Se revisa si las variables de la suma exceden de 9 para realizar
		;el ajuste correspondiente
		
		cmp vUniSuma, 09h
		jbe eComparaDecena

		;En caso de que vUniSuma no sea menor o igual 9, se hace el ajuste 
		sub vUniSuma, 0Ah
		add vDecSuma, 01h

		eComparaDecena:
			cmp vDecSuma, 09h
			ja eAjusteDecena	
					
		jmp eSalida
		eAjusteDecena:
			sub vDecSuma, 0Ah
			add vCenSuma, 01h
			
		eSalida:
			mov ah, 09h
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
		
		eFinProg:
			mov ah, 09h   
			mov dx, offset cFinPrograma
			int 21h
			
			mov ah, 08h			
			int 21h		

			mov ax, 4c00h
			int 21h
	END inicio