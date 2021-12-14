;Programa que lee una cadena de texto y al final nos indica la cantidad de digitos 
;letras mayusculas y minusculas de la cadena
;Termina de ejectarse en el momento en el que se presiona la tecla enter
.MODEL SMALL
.STACK 20h
.DATA
	cDescripcion 	DB  'Programa que lee una cadena de texto y al final '
					DB	'nos indica cuantos caraceteres de cada grupo fueron ingresados',10,13,'$'
	cIngresar		DB  10,'Ingrese una cadena de texto y para finalizar presione <Enter>: $'
	cFinProg		DB  10,10,'Fin del programa$'
	cSalida		    DB  10,'La cadena de texto ingresasda se compone de los siguientes caracteres $'
	cDigitos        DB  10,'Digitos = $'
    cMayus          DB  10,'Mayusculas = $'
    cMinus          DB  10,'Minusculas = $'
    cOtros          DB  10,'Otros = $'
    vDigitos		DB  00h
	vMayus      	DB  00h
    vMinus          DB  00h
    vOtros          DB  00h
	
.CODE
	inicio: 
		mov ax, @Data
		mov ds, ax					; mov ds, @Data
		
		mov ah, 09h
		mov dx, offset cDescripcion
		int 21h
  
        mov ah, 09h
        mov dx, offset cIngresar
        int 21h

        eCiclo:
            mov ah, 09h
            mov dx, offset cSalida
            int 21h
            
            mov ah, 01h
            int 21h

            cmp al, '0'
            jb eOtros
            cmp al, '9'
            jbe eDigitos
            cmp al, 'A'
            jb eOtros
            cmp al, 'Z'
            jbe eMayus
            cmp al, 'a'
            jb eOtros
            cmp al, 'z'
            jbe eMinus

            cmp al, 0Dh 
            jne eCiclo

        eDigitos:
            add vDigitos, 01h
        
        eMayus:
            add vMayus, 01h

        eMinus:
            add vMinus, 01h

        eOtros:
            add vOtros, 01h
			
        cmp al, 0Dh
        jne eCiclo
        mov ah, 02h 
        mov dl, vDigitos
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