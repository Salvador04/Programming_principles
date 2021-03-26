# Licenciatura en ciencias genomicas
# Principios de Programacion 2020 - Proyecto final
# Salvador Gonzalez Juarez

# Ejercicio 7:
# Este algoritmo lee una lista de conexiones entre nodos de una red no dirigida y con esa informacion genera una matriz que representa dicha red.
# Posteriormente se imprimeno el grado y el coeficiente de clustering para cada nodo de la red.

#!c:/strawberry/perl/bin/perl.exe

# Comienza el programa principal.
use strict;

# Se declaran las variables tipo int que seran utilizadas.
my $Nodos;
my $i;
my $j;
my $Enlace;
my $Grado;
my $NodoV;
my $Aristas;
my $AristasTotales;
my $CoeficienteC;

# Imprime un mensaje para el usuario.
print "Escribe el numero de nodos de la red (la capacidad minima es de 2 nodos y la maxima es 10 nodos):\n";

# La siguiente parte va a pedir al usuario que ingrese el numero total de nodos de la red. El valor sera guardado en la variable Nodos. El rango
# permitido para este numero va del 2 al 10, por lo que si estos limites no son respetados por el valor ingresado, podriamos causar errores en el
# programa. La estructura DO...WHILE nos ayuda a volver a pedir el valor del numero al usuario, en el caso de no respetar el rango establecido en
# un principio. Si el valor del numero ingresado cumple con los parametros, no habra cambios en la variable Nodos.
do {
  $Nodos = <STDIN>;
  if (($Nodos > 10) || ($Nodos < 2)) {
    print "El numero de nodos esta fuera del rango permitido, intentalo de nuevo.\n";
  }
} while(($Nodos > 10) || ($Nodos < 2));

# Se declara el arreglo bidimensional Matriz de tipo int para representar las conexiones de dicha red. Su tamaño predeterminado es de 10x10.
my @Matriz = ([10], [10]);

# Imprime un mensaje para el usuario.
print "Ahora debes contestar las siguientes preguntas para conocer los enlaces de la red. Contesta con 1 si es afirmativo, o con 0 si es negativo:\n";

# A continuacion, se le pide al usuario que contesta las preguntas generadas para conocer los enlaces actuales entre los nodos de la red. El
# usuario debe contestar con 1 si es afirmatio y con 0 si es negativo. Eso con el objetivo de guardar ese valor en el triangulo superior del
# arreglo bidimensional Matriz. El algoritmo esta diseñado de tal forma que pregunta una sola vez la existencia de enlace entre dosnodos
# distintos.
for ($i = 0; $i < $Nodos - 1; $i++) {
  for ($j = $i + 1; $j < $Nodos; $j++) {
    print "Hay conxion entre: " . $i . " y " . $j . "\n";
    # Si el valor de Enlace no fuese 0 o 1, se le vuelve a pedir al usuario con esta estructura DO..WHILE.
	  do {
        $Enlace = <STDIN>;
  	    if (($Enlace > 1) || ($Enlace < 0)) {
  	       print "Solamente se puede contestar con 1 si es firmativo, o con 0 si es negativo. Intentalo de nuevo para la ultima pregunta.\n";
  	    }
    } while(($Enlace > 1) || ($Enlace < 0));
	  # El valor de enlace se va a guardar en un indice mixto especifico del arreglo Matriz.
    $Matriz [$i][$j] = $Enlace;
	  # Al tratarse de una red no dirigida, el triangulo inferior del arreglo bidimencional Matriz es rellenado como un espejo del triangulo
		# superior, ya que solo puede haber como maximo un enlace entre un par de nodos distintos.
    $Matriz [$j][$i] = $Matriz [$i][$j];
  }
}

# Con este FOR se rellena con 0 la diagonal mayor del arreglo bidimensional Matriz, porque el programa no toma en cuenta nodos que se enlacen a si
# mismos.
for ($i = 0; $i < $Nodos; $i++) {
  $Matriz [$i][$i] = 0;
}

# Con este FOR se rellena con 0 el resto de indices mixtos que no fueron rellenados con un valor determinado, en el arreglo bidimensional Matriz.
for ($i = $Nodos; $i < 10; $i++) {
  for ($j = $i + 1; $j < 10; $j++) {
    $Matriz [$i][$j] = 0;
  }
}

# Se declara el arreglo tipo int Vecinos, con una longitud predeterminada de 10. Sera utilizado mas adelante.
my @Vecinos = (10);
print "\n";

# El siguiente FOR esta encargado de alternar entre los nodos de la red, para asi imprimir los datos de cada nodo. Dentro se haya un algoritmo
# complejo que es capaz de calcular el grado y el coeficiente de clustering de un nodo. Por lo tanto calculara los datos del nodo que le vaya
# indicando el FOR
for ($i = 0; $i < $Nodos; $i++) {
 	print "Nodo " . $i . ":\n";
  # La siguiente parte del algoritmo tiene la funcion de contar el numero de enlaces para el nodo con el que se esta trabajando, e imprimirlo como
 	# el grado de ese nodo. Para ello se suman todos los valores de la fila del arreglo bidimencional Matriz, indicada por el FOR primario. El
	# contador Grado va a sumar todos los valores 1 y el resultado sera impreso y conservado para cada ciclo del FOR primario.
  $Grado = 0;
  for ($j = 0; $j < $Nodos; $j++) {
    if ($Matriz [$i][$j] == 1) {
      $Grado++;
    }
  }
  print "Grado: " . $Grado . "\n";
	# Esta parte del algoritmo esta encargada de guardar los nodos vecinos que tiene el nodo con el que se esta trabajando por ciclo del FOR, en el
 	# arreglo Vecinos. Para ello la variable NodoV va a recorrer el arreglo Vecinos para almcenar en sus indices, aquellos nodos que tengan un
	# enlace con el nodo con el que estamos trabajando.
  $NodoV = 0;
  for ($j = 0; $j < 10; $j++) {
    if ($Matriz [$i][$j] == 1) {
      $Vecinos [$NodoV] = $j;
      $NodoV++;
    }
  }
	# La siguiente parte del algoritmo esta encargada de calcular el coeficiente de clustering para el nodo con el que se esta trabajando. En el
	# algoritmo anterior fue generado arreglo Vecinos, que contiene la informacion de cuales son los nodos vecinos del nodo con el que estamos
	# trabajando. Vecinos ahora sera utilizado para recorrer el arreglo bidimensional Matriz, y asi poder contar cuales son las conexiones
	# existentes entre los nodos vecinos (su valor se guarda en la variable Aristas), y contar cuales son todas las conexiones posibles entre los
	# mismos nodos vecinos (su valor es guardada en la variable AristasTotales.
  $NodoV = 0;
  $Aristas = 0;
  $AristasTotales = 0;
  $CoeficienteC = 0;
	for ($j = 0; $j < $Grado; $j++) {
	  $NodoV = $j + 1;
	  while($NodoV < $Grado) {
      if ($Matriz [$Vecinos [$j]][$Vecinos [$NodoV]] == 1) {
        $Aristas++;
      }
      $AristasTotales++;
		  $NodoV++;
    }
  }
  # El coeficiente de clustering se calcula como el cociente del valor de la variable Aristas, entre el valor de la variable AristasTotales. El
	# resultado se guarda en la variable CoeficienteC, y se imprime para cada nodo de la red.
  if (($Aristas == 0) && ($AristasTotales == 0)) {
    $CoeficienteC = 0;
  } else {
	  $CoeficienteC = $Aristas / $AristasTotales;
  }
	print "Coeficiente de clustering: " . $CoeficienteC . "\n";
  # La ultima parte del algoritmo se trata de un FOR que recorre el arreglo Vecinos y asigna a todos sus indices el valor 0, esto con el objetivo
	# de "vaciar" el arreglo y poder reutilizarlo para guardar los nodos vecinos del sigueinte nodo.
	for ($j = 0; $j < 10; $j++) {
	  $Vecinos [$j] = 0;
  }
}

# Diccionario de variables:

# - Nodos: Variable que va a guardar el numero de nodos que componen la red, y una vez que cumpla con los parametros establecidos (valor de 2 a 10)
#			     se convertira en una constante para el resto del programa. Es utilizada para delimitar los ciclos de algunos FOR en los siguientes pasos
#			     del programa.

# - i: Variable de tipo contador. Es utilizada en el programa para controlar los ciclos dentro de la estructura FOR. Ademas, representa los indices
#		   primarios del arreglo bidimensional Matriz.

# - j: Variable de tipo contador. Es utilizada en el programa para controlar los ciclos dentro de la estructura FOR de FOR's anidados. Ademas,
#		   representa los indices secundarios del arreglo bidimensional Matriz, los indices primarios del mismo arreglo en la parte donde se calculan
#		   las variables Aristas y AristasTotales.

# - Enlace: Variable que va a guardar el dato de la existencia o no de un enlace entre dos nodos distintos de la red. Enlace va a modificar su valor
#			      cada que se cuestiona la existencia de un enlace entre un par de nodos nuevos. Es utilizada para guardar en un indice mixto especifico
#			      del arreglo Matriz el valor que contiene.

# - Grado: Variable de tipo contador. Es utilizada para contar el numero de enlaces para cada nodo. Para lograrlo, Grado suma todos los valores de
#			     la fila del arreglo bidimencional Matriz, indicada por un FOR. El contador Grado va a sumar todos los valores 1 y el resultado sera
#		       impreso como el grado del nodo con el que este trabajando y conservado para cada ciclo del FOR primario.

# - NodoV: Variable de tipo contador, la cual va a recorrer el arreglo Vecinos para almcenar en sus indices, aquellos nodos que tengan un enlace con
#			     el nodo con el que estamos trabajando para generar la informacion dentro del arreglo Vecinos. Posteriormente, su funcion es recorrer el
#			     arreglo Vecinos y tomar un valor de sus indices para ser ahora parte del indice mixto que controla el arreglo bidimensional Matriz, con
#			     el objetivo de identificar los enlaces existentes entre los vecinos del nodo con el que se esta trabajando.

# - Aristas: Variable de tipo contador que almacenara el numero de conexiones existentes entre los nodos vecinos del nodo con el que estamos
#			       trabajando. Es fundamental para el calculo del valor de la variable CoeficienteC, que representa el coeficiente de clustering del nodo
#			       con el cual estamos trabajando.

# - AristasTotales: Variable de tipo contador que almacenara el numero de conexiones posibles entre los nodos vecinos del nodo con el que estamos
#			         		  trabajando. Es fundamental para el calculo del valor de la variable CoeficienteC, que representa el coeficiente de clustering
#					          del nodo con el cual estamos trabajando.

# - CoeficienteC: Variable de trabajo que guarda el valor resultante del cociente del valor de la variable Aristas, entre el valor de la variable
#				          AristasTotales, la cual corresponde al coeficiente de clustering del nodo con el que estamos trabajando. Por lo tanto, se imprime
#				          para cada nodo de la red.

# - Matriz: Arreglo bidimensional de tipo int, el cual almacenara los estados para cada enlace entre un par de nodos de la red, en cada uno de sus
#	  		    indices mixtos. Sus dimensiones predeterminadas son de 10x10, por lo que solo puede trabajar con redes de maximo 10 nodos. Es
#			      extreadamente importante, pues sirve como referencia para que las variables contadores del programa puedan calcular los atributos de la
#			      red, que luego seran impresos como los grados y coeficientes de clustering para cada nodo.

# - Vecinos: Arreglo de una dimencion de tipo int, el cual almacenara los nodos vecinos que tiene el nodo con el que se esta trabajando. Su longitud
#			       predeterminada es de 10, pero no siempre se va a ocupar todos sus indices. Es rellenado con ayuda de la variable NodV y su mecanismo, y
#			       es importante remarcar que al final del algoritmo debe ser regresado a su estado original, para que pueda volver a cumplir su funcion
#			       en el siguiente ciclo con un nuevo nodo con el cual va a trabajar, y es importante que sus valores anteriores no afecten en esta tarea
#			       ciclica.
