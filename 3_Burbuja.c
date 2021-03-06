/*
Licenciatura en ciencias genomicas
Principios de Programacion 2020 - Proyecto final
Salvador Gonzalez Juarez

Ejercicio 3:
Este algoritmo le pide al usuario que ingrese los valores de un conjunto, ordena de forma ascendente los elementos de ese conjunto, en caso de no
estarlo, e imprime la lista ordenada de esos elementos.
*/

// Se agrega la cabezera al inicio del programa.
#include<stdio.h>

// Comienza el programa principal.
int main() {

  // Se declaran las variables tipo int que seran utilizadas.
  int Longitud, i, Temporal, Ordenado;

  // Imprime un mensaje para el usuario.
  printf("Escribe la longitud del conjunto (debe ser menor o igual a 10000, y mayor que 0):\n");

  /* La siguiente parte va a pedir al usuario que ingrese la longitud del conjunto. El valor sera guardado en la variable Longitud. El rango
	 permitido para este numero va del 1 al 10000, por lo que si estos limites no son respetados por el valor ingresado, podriamos causar errores
	 en el programa. La estructura DO...WHILE nos ayuda a volver a pedir el valor del numero al usuario, en el caso de no respetar el rango 
	 establecido en un principio. Si el valor del numero ingresado cumple con los parametros, no habra cambios en la variable Longitud.
  */
  do {
    scanf("%d", & Longitud);
	if ((Longitud > 10000) || (Longitud < 1)) {
	  printf ("La longitud debe estar en el rango entre 1 y 10000. Intentalo de nuevo.\n");
	}
  } while((Longitud > 10000)|| (Longitud < 1));

  // Se declara el arreglo Conjunto de tipo int para representar al conjunto. Su longitud dependera del valor de Longitud.
  int Conjunto [Longitud];

  // Imprime un mensaje para el usuario.
  printf("Escribe cada elemento del conjunto. El valor de cada elemento debe estar en el rango entre -20000 hasta 20000:\n");

  /* A continuacion, se va a recorrer el arreglo Conjunto (con ayuda de un FOR) y se va depositar en cada indice un valor ingresado por el usuario.
	 Dentro hay una estructura Do...While, que solamente se va a terminar cuando el usuario ingrese un valor que este dentro del rango entre -20000
     y 20000. En caso de ser un valor diferente, se pedira al usario que vualva a ingresar otro valor. En caso de que el valor ingresado cumpla con
	 ese requisito, entonces ese valor se guardara en el indice correspondiente del arreglo Conjunto.
  */
  for (i = 0; i < Longitud; i++) { 
    do {
	  scanf("%d", & Temporal);
	  if ((Temporal >= -20000) && (Temporal <= 20000)) {
      	Conjunto [i] = Temporal;
	  } else {
		printf ("El valor no esta dentro del rango de -20000 a 20000. Intentalo de nuevo.\n");
	  }  
    } while((Temporal < -20000) || (Temporal > 20000));
  }

  /* El siguiente algoritmo se trata de una estructura DO...WHILE con un FOR dentro de ella. El FOR ayuda a recorrer el arreglo Conjunto. Dentro
	 hay un IF el cual compara el valor del indice actual y el siguiente indice. Para ordenar de forma ascendente un conjunto de numeros es 
	 necesario que los elementos sean menores al elemento posterior. Por lo tanto si un indice del arreglo posee un valor mayor al valor en el 
	 indice inmediatamente posterior, en el orden como los ingreso el usuario, el valor de ambos indices debe ser intercambiado. Para ello se
	 almacena el valor del indice actual en la variable Temporal, luego se le asigna el valor dentro del indice posterior al indice actual y, 
	 finalmente, se le asigna el valor almacenado en la variable Temporal al indice posterior. La variable Ordenado funciona como una bandera 
	 binaria, que es responsable de detener los ciclos del DO...WHILE una vez que se haya recorrido el arreglo sin haber modificado el valor de los
	 indices (lo que quiere decir que el arreglo esta ordenado de forma ascendente).
  */
  printf("El orden ascendente del conjunto es:\n");
  do {
    Ordenado = 1;
    for (i = 0; i < Longitud - 1; i++) {
      if (Conjunto [i] > Conjunto [i + 1]) {
        Temporal = Conjunto [i];
        Conjunto [i] = Conjunto [i + 1];
        Conjunto [i + 1] = Temporal;
        Ordenado = 0;
      }
    }
  } while(!Ordenado);

  // Finalmente, se recorre el arreglo y se imprime cada uno de los valores dentro de los indices, que estan ordenados de forma ascendente.
  for (i = 0; i < Longitud; i++) {
  	printf("%d", Conjunto [i]);
	printf(" ");
	}
  printf("\n");

  // Se coloca para indicar que termina el programa principal.
  return 0;
}

/* Diccionario de variables:

   - Longitud: Variable que va a guardar el valor de la longitud del conjunto y una vez que cumpla con los parametros establecidos (valor de 1 a 
			    10000) se convertira en una constante para el resto del programa. Es utilizada en el momento de nombrar el arreglo Conjunto para
				definir la longitud de ese arreglo. Ademas es utilizada para delimitar los ciclos de algunos FOR en los siguientes pasos del 
				programa.

   - i: Variable de tipo contador. Es utilizada en el programa para controlar los ciclos dentro de las estructuras FOR. Ademas, representa los 
 		indices al manejar el arreglo Conjunto y es esencial para comparar los valores del indice actual y el indice posterior del arreglo.

   - Temporal: Variable de tipo temporal donde seran guardados los valores de los elementos del conjunto. Es utilizada para saber si el valor
               ingresado por el usuario cumple con los parametros establecidos (valor de -20000 a 20000) y para guardar los valores que hayan
			   cumplido con ese parametro en un indice especifico en el arreglo Conjunto. Posteriormente, en el algorimo que ordena los valores de
  			   los indices del arreglo Conjunto de forma ascendente, Temporal es utilizado para almacenar el valor del indice actual y asi poder
			   conservarlo para despues asignarselo al indice posterior.
  
   - Ordenado: Variable de tipo bandera (binaria) responsable de detener los ciclos del DO...WHILE una vez que se haya recorrido el arreglo sin
			   haber modificado el valor de los indices (lo que quiere decir que el arreglo esta ordenado de forma ascendente). Al principio del 
			   DO...WHILE se le asigna a Ordenado el valor de 1, porque siempre esta la posibilidad de que el arreglo ya este ordenado de forma 
			   ascendente. Una vez que intercambiamos el valor entre indices, hemos desordenado el arreglo y no existe la certeza de que ya este
			   ordenado, por lo tanto, se le asigna el valor de 0 a Ordenado para que vuelva a revisar el arreglo.

   - Conjunto: Arreglo de una dimencion de tipo int, el cual alacenara el valor de cada elemento del conjunto en cada uno de sus indices. Su 
			   longitud depende del valor de la variable Longitud, y es utilizada tambien para comparar el valor de los indices en el momento de
			   ordenar de forma ascendente el arreglo. 
*/
