;Prog15.asm
;Programa en ensamblado, el cual lee dos cifras y al final 
; muestra el resultado de la suma de los mismos.. 
;muestra el resultado de la suma de los mismos...  

;
.MODEL SMALL
.STACK 20h
.DATA ;Donde se crearan las variables a utilizar
	cDescripcion 	DB	'Programa que lee dos numeros y al final muestra '
                    DB   'el resultado de la suma de los mismos$ '
	cIngresar		DB	10,13,'Ingrese un numero de dos cifras: $'
	cSuma           DB  10,13, 'El resultado de la suma de los numeros es $'
	cFinPrograma	DB	10,13,'** FIN DEL PROGRAMA **',10,'$'
	vDecNum1        DB  0h
	vUniNum1        DB  0h
	vDecNum2        DB  0h
	vUniNum2        DB  0h
	vCenSuma        DB  0h
	vDecSuma        DB  0h
	vUniSuma        DB  0h
	
.CODE ; "MAIN" del codigo
	inicio: ;etiqueta de inicio del codigo
		mov ax, @Data ;mov ds, @DATA  = no se puede realizar 
		mov ds, ax ;Poder ubicar en el ds los segmentos de datos que cargue en el ax 
		
		;Mandar mensaje a pantalla
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
		
	;se lee el primer numero de dos cifras 	
		;Mandar mensaje a pantalla
		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		;Ingresamos caracter 
		mov ah, 01h     ;se almacena el segundo numero en el registro AL 
		int 21h
		sub al, 30h  ;  se lee el segundo numero y se resta 30 hexadecimales 
		mov vDecNum1, al ; se guarda la decena del primer numero 
		
		mov ah, 01h   ;se almacena el segundo numero en el registro AL 
		int 21h
		sub al, 30h  ;  se lee el segundo numero y se resta 30 hexadecimales 
		mov vUniNum1, al ; se guarda la unidad del primer numero  
		
	;se lee el segundo numero de dos cifras 	
		
		;Mandar mensaje a pantalla
		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		;Ingresamos caracter 
		mov ah, 01h        ;se almacena el segundo numero en el registro AL 
		int 21h
		sub al, 30h        ;se lee el segundo numero y se resta 30 hexadecimales 
		mov vDecNum2, al   ;se guarda la decena del segundo numero 
		
		mov ah, 01h        ;se almacena el segundo numero en el registro AL 
		int 21h
		sub al, 30h        ;se lee el segundo numero y se resta 30 hexadecimales 
		mov vUniNum2, al   ;se guarda la unidad del segundo numero 
	
    ;se realiza la suma de las unidades de los numeros:
        ;mov al, vUniNum1
		;add al, vUniNum2               ;vUniSuma = vUniNum1 + vUniNum2 : suma en al el 1ero y segundo 
		;mov vUniSuma, al
		
		mov al, vUniNum1
		add al, vUniNum2
		aaa
		
		mov vUniSuma, al 

    ;se realiza la suma de las decenas de los numeros:
        ;mov al, vDecNum1
		;add al, vDecNum2               ;vDecSuma = vUniNum1 + vUniNum2 : suma en al el 1ero y segundo 
		;mov vDecSuma, al
	    
		mov al, vDecNum1
		add al, vDecNum2
		aaa
		
		mov vDecSuma, al
	
	; se revisa si las variables de la suma exceden de 9 para realizar el 
	; ajuste correspondiente 
	
		;cmp vUniSuma, 09h 
		;jbe eComparaDecena
        
		;En caso de que vUniSuma NO SEA MENOR O IGUAL A 9,SE HACE EL AJUSTE
		;sub vUniSuma, 0Ah
		;add vDecSuma, 01h

	;eComparaDecena:
		cmp vDecSuma, 09h 
		ja eAjusteDecena
		jmp eSalida 
    			
	eAjusteDecena:
        ;sub vDecSuma, 0Ah 
        add vCenSuma, 01h
		aaa
        
 		
	eSalida: 
    ;se imprime el resultado:     
        mov ah, 09h 
		mov dx, offset cSuma
		int 21h 
		
		mov ah, 02h 
		mov dl, vCenSuma
		add dl, 30h 
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
	
		;Leer un carcater de teclado
		mov ah, 08h				
		int 21h		

		;Terminar el programa y mandarle el control al D.O.S.
		mov ax, 4c00h
		int 21h
	END inicio ; Etiqueta de fin del codigo