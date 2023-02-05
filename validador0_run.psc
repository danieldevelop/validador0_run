Algoritmo validador0_run
	definir run como cadena; // Guarda el run del usuario
	definir largoRun como entero; // Guarda la cantidad de caracteres del run ingresado
	definir digito como cadena; // Obtiene y guarda el digito del run que ingresa el usuario
	
	
	definir contador como entero; // Recorre el run como se haria en un arreglo
	definir multiplica como entero; // Guarda el producto de cada digito del run
	definir acumulador como entero; // Acumula el producto de la multiplicación anterior
	definir multiple como entero; // Escala de iteración de 2 en 2
	definir resto como entero; // Guarda el resto de digito calculado de la division por 11
	definir runVerificado como cadena; // Guarda si el ru esta correcto o no
	definir digito2 como cadena; // Guarda el digito verificado que corresponde al run ingresado
	definir characteresRun Como logico;
	
	run <- "";
	largoRun <- 0;
	digito <- "";
	
	
	contador <- (largoRun - 3);
	mutiplica <- 0;
	acumulador <- 0;
	multiple <- 2;
	resto <- 0;
	runVerificado <- "";
	digito2 <- "";
	characteresRun <- verdadero;
	
	Mientras (characteresRun) Hacer
		// Solicitamos el run
		escribir sin saltar ("Ingrese su rut/dni (Ej. 6796098-5) ");
		leer run;
		
		si (Longitud(run) >= 9 y Longitud(run) <= 10) Entonces
			// Le quitamos -3 porque descartamos el digito y el guion
			largoRun = Longitud(run) - 3;
			
			// Obtenemos el digito que ingresa el usuario y los transformamos en mayuscula
			// Subcadena funciona así: SubCadena(cadena,desde,hasta)
			digito = Subcadena(run, largoRun+2, largoRun+2);
			digito = Mayusculas(digito);
			
			// Recorro el run haciendo la multiplicación de guardando la acumulación del producto
			para i<-largoRun hasta 0 con paso -1 Hacer
				multiplica = multiple * ConvertirANumero(Subcadena(run, i, i));
				acumulador = acumulador + multiplica;
				
				multiple = multiple + 1;
				
				si (multiple > 7) entonces
					multiple <- 2;
				FinSi
			FinPara
			
			resto = acumulador mod 11;
			dig = 11 - resto; // Variable auxiliar
			
			si (dig = 11) entonces
				digito2 = "0";
			sino si (dig = 10) entonces
					digito2 = "K";
				SiNo
					digito2 = ConvertirATexto(dig);
				FinSi
			FinSi
			
			// Preguntamos si el run ingresado corresponde al digito2 verificado
			si (digito = digito2) entonces
				escribir("El run ingresado es correcto");
			SiNo
				escribir("err: run ingresado no es correcto");
			FinSi
			
		sino 
			characteresRun <- falso;
			escribir ("err: Formato de RUN/DNI no es valido!!"); 
		FinSi
	FinMientras
	
FinAlgoritmo
