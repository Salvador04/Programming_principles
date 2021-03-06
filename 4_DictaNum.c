/*
Licenciatura en ciencias genomicas
Principios de Programacion 2020 - Proyecto final
Salvador Gonzalez Juarez

Ejercicio 4:
Este algoritmo le pide al usuario que ingrese los valores de un numero positivo, entero y de maximo seis cifras e imprime dicho numero en palabras.
*/

// Se agrega la cabezera al inicio del programa.
#include<stdio.h>

// Comienza el programa principal.
int main() {

  // Se declaran las variables tipo int que seran utilizadas.
  int Temporal, i;

  // Se declara el arreglo Numero de tipo int para representar los digitos del numero que se va a ingresar. Su longitud predeterminada es de 6.
  int Numero [6];

  /* A continuacion, se va a recorrer el arreglo Numero (con ayuda de un FOR) y se va depositar en cada indice un valor ingresado por el
     usuario. Dentro hay una estructura Do...While, que solamente se va a terminar cuando el usuario ingrese un valor que este dentro del rango
     entre 0 y 9. En caso de ser un valor diferente, se pedira al usario que vualva a ingresar otro valor. En caso de que el valor ingresado
	 cumpla con ese requisito, entonces ese valor se guardara en el indice correspondiente del arreglo Numero.
  */
  for (i = 0; i < 6; i++) {
    printf("Ingrasa el valor de las ");
    printf(i == 0? "centenas de millar" : i == 1? "decenas de millar" : i == 2? "unidades de millar" : i == 3? "centenas" : i == 4? "decenas" : "unidades");
    printf(": \n");
	do {
      scanf("%d", & Temporal);
	  if ((Temporal >= 0) && (Temporal <= 9)) {
        Numero [i] = Temporal;
	  } else {
		printf ("Solo puedes poner numeros del 0 al 9. Intentalo de nuevo.\n");
	  }
	} while((Temporal < 0) || (Temporal > 9));
  }

  /* El siguiente algoritmo es una serie de IF's compuestos (con algunos anidados), los cuales van a analizar el valor de cada indice y, con el
	 numero del indice, interpretaran ese valor como una instruccion para imprimir una palabra especifica.
  */
  printf("El numero se escribe en palabras como:\n");
  /* Este IF es responsable de analizar que todos los indices tengan un valor diferente de cero. En caso contrario, se va a imprimir "cero"
     directamente.
  */
  if ((((((Numero [3]) || (Numero [4])) || (Numero [5])) || (Numero [0])) || (Numero [1])) || (Numero [2])) {
	// Esta serie de If's compuestos determina que palabra imprimir para el indice 0, el cual corresponde a las centenas de millar. 
	if (Numero [0] == 9) {
	  printf("novecientos ");
	} else if (Numero [0] == 8) {
	  printf("ochocientos ");
	} else if (Numero [0] == 7) {
	  printf("setecientos ");
	} else if (Numero [0] == 6) {
	  printf("seiscientos ");
	} else if (Numero [0] == 5) {
	  printf("quinientos ");
	} else if (Numero [0] == 4) {
	  printf("cuatrocientos ");
	} else if (Numero [0] == 3) {
	  printf("trescientos ");
	} else if (Numero [0] == 2) {
	  printf("doscientos ");
	} else if (Numero [0] == 1) {
	  // Este IF anidado sirve para imprimir palabras diferentes para el mismo valor del indice, dependiendo de los valores de los indices 1 y 2.		
	  if ((Numero [1]) || (Numero [2])) {
	    printf("ciento ");
	  } else {
	    printf("cien ");
	  }
	} 
	/* Esta serie de If's compuestos determina que palabra imprimir para el indice 1, el cual corresponde a las decenas de millar. Cada uno posee 
	   dentro un IF anidado, que sirve para imprimir palabras diferentes para el mismo valor del indice, dependiendo del valor del indice 2.
	*/
	if (Numero [1] == 9) {
	  if (Numero [2]) {
	    printf("noventa y ");
	  } else {
	    printf("noventa ");
	  }
	} else if (Numero [1] == 8) {
	  if (Numero [2]) {
	    printf("ochenta y ");
	  } else {
	    printf("ochenta ");
	  }
	} else if (Numero [1] == 7) {
	  if (Numero [2]) {
	    printf("setenta y ");
	  } else {
	    printf("setenta ");
	  }
	} else if (Numero [1] == 6) {
	  if (Numero [2]) {
	    printf("sesenta y ");
	  } else {
	    printf("sesenta ");
	  }
	} else if (Numero [1] == 5) {
	  if (Numero [2]) {
	    printf("cincuenta y ");
	  } else {
	    printf("cincuenta ");
	  }
	} else if (Numero [1] == 4) {
	  if (Numero [2]) {
	    printf("cuarenta y ");
	  } else {
	    printf("cuarenta ");
	  }
	} else if (Numero [1] == 3) {
	  if (Numero [2]) {
	    printf("treinta y ");
	  } else {
	    printf("treinta ");
	  }
	} else if (Numero [1] == 2) {
	  if (Numero [2] == 9) {
	    printf("veintinueve ");
	  } else if (Numero [2] == 8) {
	    printf("veintiocho ");
	  } else if (Numero [2] == 7) {
	    printf("veintisiete ");
	  } else if (Numero [2] == 6) {
	    printf("veintiseis ");
	  } else if (Numero [2] == 5) {
	    printf("veinticinco ");
	  } else if (Numero [2] == 4) {
	    printf("veinticuatro ");
	  } else if (Numero [2] == 3) {
	    printf("veintitres ");
	  } else if (Numero [2] == 2) {
	    printf("veintidos ");
	  } else if (Numero [2] == 1) {
	    printf("veintiuno ");
	  } else {
	    printf("veinte ");
	  }
	} else if (Numero [1] == 1) {
	  if (Numero [2] == 9) {
	    printf("diecinueve ");
	  } else if (Numero [2] == 8) {
	    printf("dieciocho ");
	  } else if (Numero [2] == 7) {
	    printf("diecisiete ");
	  } else if (Numero [2] == 6) {
	    printf("dieciseis ");
	  } else if (Numero [2] == 5) {
	    printf("quince ");
	  } else if (Numero [2] == 4) {
	    printf("catorce ");
	  } else if (Numero [2] == 3) {
	    printf("trece ");
	  } else if (Numero [2] == 2) {
	    printf("doce ");
	  } else if (Numero [2] == 1) {
	    printf("once ");
	  } else {
	    printf("diez ");
	  }
	} 
    /* Este IF analiza el valor del indice 1. En caso de ser 1 o 2, no imprime nada, porque la palabra correspondiente a las unidades de millar ya
	   esta de forma implicita a la palabra impresa para las decenas de millar. Dentro de la parte de ELSE esta una serie de If's compuestos que
	   determina que palabra imprimir para el indice 2, el cual corresponde a las unidades de millar. 
	*/
	if ((Numero [1] == 1) || (Numero [1] == 2)) {
	} else {
	  if (Numero [2] == 9) {
	    printf("nueve ");
	  } else if (Numero [2] == 8) {
	    printf("ocho ");
	  } else if (Numero [2] == 7) {
	    printf("siete ");
	  } else if (Numero [2] == 6) {
	    printf("seis ");
	  } else if (Numero [2] == 5) {
	    printf("cinco ");
	  } else if (Numero [2] == 4) {
	    printf("cuatro ");
	  } else if (Numero [2] == 3) {
	    printf("tres ");
	  } else if (Numero [2] == 2) {
	    printf("dos ");
	  } else if (Numero [2] == 1) {
		// Este IF anidado sirve para imprimir palabras diferentes para el mismo valor del indice, dependiendo de los valores de los indices 1 y 0.
	    if (Numero [1]) {
	      printf("uno ");
	    } else if (Numero [0]) {
		  printf("un ");
		}
	  }
	}
    /* Este IF es responsable de analizar que los indices 0, 1 y 2 tengan un valor diferente de cero. De ser el caso, se va a imprimir "mil", 
	   palabra que limita los digitos de millar y los digitos normales. En caso de que los indices 0, 1 y 2 tengan todos valor de 0, no se imprime
	   la palabra "mil".
    */
	if (((Numero [0]) || (Numero [1])) || (Numero [2])) {
	  printf("mil ");
	}  
    /* Este IF es responsable de analizar que los indices 3, 4 y 5 tengan un valor diferente de cero. En caso contrario, no se va a imprimir nada
       a partir de aqui.
    */
	if (((Numero [3]) || (Numero [4])) || (Numero [5])) {
      // Esta serie de If's compuestos determina que palabra imprimir para el indice 3, el cual corresponde a las centenas. 
	  if (Numero [3] == 9) {
	    printf("novecientos ");
	  } else if (Numero [3] == 8) {
	    printf("ochocientos ");
	  } else if (Numero [3] == 7) {
	    printf("setecientos ");
	  } else if (Numero [3] == 6) {
	    printf("seiscientos ");
	  } else if (Numero [3] == 5) {
	    printf("quinientos ");
	  } else if (Numero [3] == 4) {
	    printf("cuatrocientos ");
	  } else if (Numero [3] == 3) {
	    printf("trescientos ");
	  } else if (Numero [3] == 2) {
	  printf("doscientos ");
	  } else if (Numero [3] == 1) {
	    // Este IF anidado sirve para imprimir palabras diferentes para el mismo valor del indice, dependiendo de los valores de los indices 4 y 5.
	    if ((Numero [4]) || (Numero [5])) {
	      printf("ciento ");
	    } else {
	      printf("cien ");
	    }
	  } 
      /* Esta serie de If's compuestos determina que palabra imprimir para el indice 4, el cual corresponde a las decenas. Cada uno posee dentro un
		 IF anidado, que sirve para imprimir palabras diferentes para el mismo valor del indice, dependiendo del valor del indice 5.
	  */
	  if (Numero [4] == 9) {
	    if (Numero [5]) {
	      printf("noventa y ");
	    } else {
	      printf("noventa ");
	    }
	  } else if (Numero [4] == 8) {
	    if (Numero [5]) {
	      printf("ochenta y ");
	    } else {
	      printf("ochenta ");
	    }
	  } else if (Numero [4] == 7) {
	    if (Numero [5]) {
	      printf("setenta y ");
	    } else {
	      printf("setenta ");
	    }
	  } else if (Numero [4] == 6) {
	    if (Numero [5]) {
	      printf("sesenta y ");
	    } else {
	      printf("sesenta ");
	    }
	  } else if (Numero [4] == 5) {
	    if (Numero [5]) {
	      printf("cincuenta y ");
	    } else {
	      printf("cincuenta ");
	    }
	  } else if (Numero [4] == 4) {
	    if (Numero [5]) {
	      printf("cuarenta y ");
	    } else {
	      printf("cuarenta ");
	    }
	  } else if (Numero [4] == 3) {
	    if (Numero [5]) {
	      printf("treinta y ");
	    } else {
	      printf("treinta ");
	    }
	  } else if (Numero [4] == 2) {
	    if (Numero [5] == 9) {
	      printf("veintinueve ");
	    } else if (Numero [5] == 8) {
	      printf("veintiocho ");
	    } else if (Numero [5] == 7) {
	      printf("veintisiete ");
	    } else if (Numero [5] == 6) {
	      printf("veintiseis ");
	    } else if (Numero [5] == 5) {
	      printf("veinticinco ");
	    } else if (Numero [5] == 4) {
	      printf("veinticuatro ");
	    } else if (Numero [5] == 3) {
	      printf("veintitres ");
	    } else if (Numero [5] == 2) {
	      printf("veintidos ");
	    } else if (Numero [5] == 1) {
	      printf("veintiuno ");
	    } else {
	      printf("veinte ");
	    }
	  } else if (Numero [4] == 1) {
	    if (Numero [5] == 9) {
	      printf("diecinueve ");
	    } else if (Numero [5] == 8) {
	      printf("dieciocho ");
	    } else if (Numero [5] == 7) {
	      printf("diecisiete ");
	    } else if (Numero [5] == 6) {
	      printf("dieciseis ");
	    } else if (Numero [5] == 5) {
	      printf("quince ");
	    } else if (Numero [5] == 4) {
	      printf("catorce ");
	    } else if (Numero [5] == 3) {
	      printf("trece ");
	    } else if (Numero [5] == 2) {
	      printf("doce ");
	    } else if (Numero [5] == 1) {
	      printf("once ");
	    } else {
	      printf("diez ");
	    }
	  } 
      /* Este IF analiza el valor del indice 4. En caso de ser 1 o 2, no imprime nada, porque la palabra correspondiente a las unidades ya esta de
		 forma implicita a la palabra impresa para las decenas. Dentro de la parte de ELSE esta una serie de If's compuestos que determina que
		 palabra imprimir para el indice 5, el cual corresponde a las unidades. 
	  */
	  if ((Numero [4] == 1) || (Numero [4] == 2)) {
	  } else {
	    if (Numero [5] == 9) {
	      printf("nueve ");
	    } else if (Numero [5] == 8) {
	      printf("ocho ");
	    } else if (Numero [5] == 7) {
	      printf("siete ");
	    } else if (Numero [5] == 6) {
	      printf("seis ");
	    } else if (Numero [5] == 5) {
	      printf("cinco ");
	    } else if (Numero [5] == 4) {
	      printf("cuatro ");
	    } else if (Numero [5] == 3) {
	      printf("tres ");
	    } else if (Numero [5] == 2) {
	      printf("dos ");
	    } else if (Numero [5] == 1) {
	      printf("uno ");
	    }
	  }
    }
  } else {
	printf("cero ");
  }
  printf("\n");

  // Se coloca para indicar que termina el programa principal.
  return 0;
}

/* Diccionario de variables:

   - i: Variable de tipo contador. Es utilizada en el programa para controlar los ciclos dentro de la estructura FOR. Ademas, representa los indices
		al manejar el arreglo Numero. 

   - Temporal: Variable de tipo temporal donde seran guardados los valores de los elementos de los digitos del numero que ingresa el usario. Es 
			   utilizada para saber si el valor ingresado por el usuario cumple con los parametros establecidos (valor de 0 a 9) y para guardar los
			   valores que hayan cumplido con ese parametro en un indice especifico en el arreglo Numero.

   - Numero: Arreglo de una dimencion de tipo int, el cual alacenara el valor de cada digito del numero ingresado por el usuario en cada uno de sus
			 indices. Tiene una longitud predeterminada de 6, porque ese es el numero de digitos que debe tener el numero, ingresado por el usuario,
			 requeridos por el programa. Numero tiene la funcion dentro del algoritmo de comparar los valores sus indices con numeros, para que los
			 IF's compuestos puedan determinar que palabras deben imprimir a partir de esa comparacion
*/
