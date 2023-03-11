Algoritmo MatricesEjemplo2
	Definir matriz,inicio Como entero;
	Definir f,c Como Entero;
	Definir gano Como Logico;	
	Definir i,j Como Entero;
	Dimension matriz[4,4];	
	gano=Falso;	
	Repetir//es un menu para iniciar el programa
	Escribir "===============================================================";
	Escribir "=Desea iniciar el programa? digite (1) para si, (2) para salir=";
	Escribir "===============================================================";
	Leer inicio;
	si inicio=1
		Borrar Pantalla;
		Escribir "===========================================";
		Escribir "========= Rompe Cabezas Numerico ==========";
		Escribir "===========================================";
		Escribir "";
		Escribir "    ==================================";
		Escribir "    = Presione [enter] para continuar=";
		Escribir "    ==================================";		
		Esperar Tecla;
		Borrar Pantalla;
		Escribir "========================================================";
		Escribir "= El objetivo del juego es ordenar los numeros de una, =";		
		Escribir "= manera predeterminada haciendo uso del espacio vacio =";
		Escribir "========================================================";
		Escribir "        ========================================";
		Escribir "        = Este sera el orden para poder ganar! =";
		Escribir "        ========================================";
		Escribir "                    =================";
		Escribir "                    = | 1| 2| 3| 4| =";
		Escribir "                    = | 5| 6| 7| 8| =";
		Escribir "                    = | 9|10|11|12| =";
		Escribir "                    = |13|14|15| 0| =";
		Escribir "                    =================";
		Escribir "            ==================================";
		Escribir "            = Presione [enter] para continuar=";
		Escribir "            ==================================";		
		Esperar Tecla;
		Borrar Pantalla;
		//aqui comienzan los procesos
		RellenarMatriz(matriz);		
		MostrarMatriz(matriz);
		posicioninicial(matriz,f,c);
		EjecutarSimulacion(matriz,gano,f,c);
		
	SiNo
		si inicio=2//esto se muestra al salir del programa
			Limpiar Pantalla;				
			Escribir "===============================================================";
			Escribir "=Hecho por Jose Campos Chaves para Curso Programacion INA 2022=";
			Escribir "===============================================================";
			Escribir "          ==================================";
			Escribir "          = Presione [enter] para continuar=";
			Escribir "          ==================================";
			Esperar Tecla;
			Borrar Pantalla;
			Escribir "    ============================";
			Escribir "    =Gracias,Que tenga buen dia=";
			Escribir "    ============================";
		SiNo
			Limpiar Pantalla;//para evitar errores
			Escribir "    ======================================";
			Escribir "    =Opcion incorrecta intentelo de nuevo=";
			Escribir "    ======================================";
		FinSi			
	FinSi	
Hasta Que inicio=2    
FinAlgoritmo
//////////////////////////////////////////////////////////////////////
SubProceso RellenarMatriz(matriz) //llena la matriz con numeros Aleatorios sin repetir
	Definir vector,i,j,num Como Entero;
	Definir bandera Como Logico;
	Dimension vector[16];//aqui se guarda y verifica cual numero es repetido
	Para i=0 hasta 3
		para j=0 Hasta 3
			Repetir
				num=azar(16);//numero azar en 16 para que me incluya el 0 
				bandera=Verdadero;
				si vector[num]=0//si verifica si en el vector hay un 0 en esa posicion , si es asi se guardara el numero
					matriz[j,i]=num;//guardo el numero					
					vector[num]=1;//si el numero se uso entonces se cambia el 0 por un 1,en el siguiente ciclo se verifica y si hay un 1 entonces cambia a falso y se repite hasta que salga un numero no repetido
				SiNo
					bandera=Falso;					
				FinSi				
			Hasta Que bandera=Verdadero 
		FinPara
	FinPara	
FinSubProceso
///////////////////////////////////////////////////////////////////////
SubProceso MostrarMatriz(matriz) // muestra la matriz visualmente	
	definir i,j Como Entero;
	Para i=0 Hasta 4-1 Hacer		
		para j=0 Hasta 4-1 Hacer			
			si matriz[i,j] < 10 Entonces
				Escribir Sin Saltar "| ", matriz[i,j]; //alt+124
			SiNo
				Escribir Sin Saltar "|", matriz[i,j];				
			FinSi			
		FinPara
		Escribir "|";		
	FinPara	
FinSubProceso
////////////////////////////////////////////////////////////////////
SubProceso EjecutarSimulacion(matriz,gano,f Por Referencia,c Por Referencia)//aqui se inicia el juego con el menu	
	Definir numAux, posAuxf,posAuxc,opcionMovimiento,cont Como Entero;
	cont=0;//con este contador controlo las veces que se hizo un movimiento para mostrarlo cuando gane
	matriz[f,c]=0;
	//MostrarMatriz(matriz);	
	Repetir
		Escribir "=============================================================";
		Escribir "= Digite un movimiento:                                     =";
		Escribir "= (4) para moverse hacia la izquierda y (6) para la derecha =";
		Escribir "= (2) para moverse hacia abajo y (8) para arriba            =";
		Escribir "= (10). Para reiniciar, (99), Para salir                    =";
		Escribir "=============================================================";
		Leer opcionMovimiento;//esta variable controla los movimientos	
		Escribir "Presione enter para continuar";
		Escribir "F: ",f,"|"," C: ",c;		
		//Esperar Tecla;
		Limpiar Pantalla;		
		//MostrarMatriz(matriz);		
		Segun opcionMovimiento Hacer
			4://izquierda
				izquierda(f,c,matriz,posAuxf,posAuxc,numAux,cont);				
			6://derecha
				derecha(f,c,matriz,posAuxf,posAuxc,numAux,cont);				
			8://arriba	
				arriba(f,c,matriz,posAuxf,posAuxc,numAux,cont);				
			2://abajo
				abajo(f,c,matriz,posAuxf,posAuxc,numAux,cont);
			10://reiniciar
				Limpiar Pantalla;
				cont=0;
				RellenarMatriz(matriz);		
				MostrarMatriz(matriz);
				posicioninicial(matriz,f,c);				
			99://salir		
				
			De Otro Modo:// si digita un numero erroneo
				Escribir "opcion invalida";
				Escribir "Presione enter para continuar";
				Esperar Tecla;
				Limpiar Pantalla;
				MostrarMatriz(matriz);
		Fin Segun
		//condicion de gane tiene que ser en el orden especifico 
		si matriz[0,0]=1 y matriz[0,1]=2 y matriz[0,2]=3 y matriz[0,3]=4 y matriz[1,0]=5 y matriz[1,1]=6 y matriz[1,2]=7 y matriz[1,3]=8 y matriz[2,0]=9 y matriz[2,1]=10 y matriz[2,2]=11 y matriz[2,3]=12 y matriz[3,0]=13 y matriz[3,1]=14 y matriz[3,2]=15
			Escribir "!!!Gano!!!";
			gano=Verdadero;			
			Escribir "Movimientos totales: ",cont;// se muestra el total de movimientos
		FinSi		
		Esperar Tecla;
	Hasta Que opcionMovimiento=99//sale del proceso
FinSubProceso
////////////////////////////////////////////////////////////
SubProceso posicioninicial(matriz,f Por Referencia,c Por Referencia)//este proceso esta pensando para buscar la posicion del 0 y devolver el valor de las filas y columnas dnd se encuentra, y servir de indice para comenzar a jugar 
	Definir i,j Como Entero;
	Para i=0 Hasta 3
		Para j=0 Hasta 3
			si 0=matriz[j,i]//aqui encuentro el 0 y tomo sus valores de posicion para guiarme
				c=i;
				f=j;
				Escribir "F: ",f,"|"," C: ",c;//los muestro para llevar control
			FinSi
		FinPara
	FinPara	
	//matriz[c,f]=0;
FinSubProceso
///////////////////////////////////////////////////////////////////////
SubProceso izquierda(f Por Referencia,c Por Referencia,matriz,posAuxf,posAuxc,numAux,cont Por Referencia)// es el movimiento del 4 
	Escribir "F: ",f,"|"," C: ",c;		
	//Esperar Tecla;
	si c<>0 y f<>0 o c<>0 y f<>1 o c<>0 y f<>2 o c<>0 y f<>3 o c<>0 //condiciones para que no se salga de la matriz
		si  f<=3 y f>=0 y c<=3 y c>=0 //condiciones para que no se salga de la matriz
			posAuxf=f;//aqui se guarda la posicion anterior del 0
			posAuxc=c;						
			//matriz[f,c]=1;
			f=f;
			c=c-1;//da la direccion hacia dnd se movera
			numAux=matriz[f,c];//aqui guardo el valor de la posicion dnd se va a mover el 0
			matriz[f,c]=0;//muevo el 0
			matriz[posAuxf,posAuxc]=numAux;//agrego el valor a la posicion anterior
			MostrarMatriz(matriz);
			Escribir "Presione enter para continuar";
			cont=cont+1; //guardo la cantidad de movimientos 
			Escribir "Numero de movimientos: ",cont;//muestro
			//Esperar Tecla;													
		FinSi
	SiNo
		Escribir "movimiento invalido";
		Escribir "Presione enter para continuar";
		//Esperar Tecla;
		Limpiar Pantalla;
		MostrarMatriz(matriz);
	FinSi
	// los procesos de las direciones funcionan igual a este con la misma logica solo cambia el valor de la direccion
FinSubProceso
////////////////////////////////////////////////////////////////////////////
SubProceso derecha(f Por Referencia,c Por Referencia,matriz,posAuxf,posAuxc,numAux,cont Por Referencia)//si digita numero 6
	Escribir "F: ",f,"|"," C: ",c;		
	//Esperar Tecla;
	si c<>3 y f<>0 o c<>3 y f<>1 o c<>3 y f<>2 o c<>3 y f<>3 
		si  f<=3 y f>=0 y c<=3 y c>=0
			posAuxf=f;
			posAuxc=c;
			//matriz[f,c]=1;
			f=f;
			c=c+1;
			numAux=matriz[f,c];
			matriz[f,c]=0;
			matriz[posAuxf,posAuxc]=numAux;
			MostrarMatriz(matriz);
			Escribir "Presione enter para continuar";
			cont=cont+1;
			Escribir "Numero de movimientos: ",cont;
			//Esperar Tecla;													
		FinSi
	SiNo
		Escribir "movimiento invalido";
		Escribir "Presione enter para continuar";
		//Esperar Tecla;
		Limpiar Pantalla;
		MostrarMatriz(matriz);
	FinSi	
FinSubProceso
///////////////////////////////////////////////////////////////////	
SubProceso arriba(f Por Referencia,c Por Referencia,matriz,posAuxf,posAuxc,numAux,cont Por Referencia)//si digita numero 8
	Escribir "F: ",f,"|"," C: ",c;		
	//Esperar Tecla;
	si c<>0 y f<>0 o c<>1 y f<>0 o c<>2 y f<>0 o c<>3 y f<>0
		si  f<=3 y f>=0 y c<=3 y c>=0
			posAuxf=f;
			posAuxc=c;
			//matriz[f,c]=1;
			f=f-1;
			c=c;
			numAux=matriz[f,c];
			matriz[f,c]=0;
			matriz[posAuxf,posAuxc]=numAux;
			MostrarMatriz(matriz);
			Escribir "Presione enter para continuar";
			cont=cont+1;
			Escribir "Numero de movimientos: ",cont;
			//Esperar Tecla;														
		FinSi
	SiNo
		Escribir "movimiento invalido";
		Escribir "Presione enter para continuar";
		//Esperar Tecla;
		Limpiar Pantalla;
		MostrarMatriz(matriz);						
	FinSi	
FinSubProceso
/////////////////////////////////////////////////////////////////////
SubProceso abajo(f Por Referencia,c Por Referencia,matriz,posAuxf,posAuxc,numAux,cont Por Referencia)//si digita numero 2
	Escribir "F: ",f,"|"," C: ",c;		
	//Esperar Tecla;
	si c<>0 y f<>3 o c<>1 y f<>3 o c<>2 y f<>3 o c<>3 y f<>3					
		si  f<=3 y f>=0 y c<=3 y c>=0
			posAuxf=f;
			posAuxc=c;
			//matriz[f,c]=1;
			f=f+1;
			c=c;
			numAux=matriz[f,c];
			matriz[f,c]=0;
			matriz[posAuxf,posAuxc]=numAux;
			MostrarMatriz(matriz);
			Escribir "Presione enter para continuar";
			cont=cont+1;
			Escribir "Numero de movimientos: ",cont;
			//Esperar Tecla;
		SiNo
			Escribir "movimiento invalido";
			Escribir "Presione enter para continuar";
			//Esperar Tecla;
			Limpiar Pantalla;
			MostrarMatriz(matriz);
		FinSi									
	FinSi	
FinSubProceso
////////////////////////////////////////////////////////////////////////////////////
	