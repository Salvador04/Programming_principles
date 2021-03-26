# Licenciatura en ciencias genomicas
# Principios de Programacion 2020 - Proyecto final
# Salvador Gonzalez Juarez

# Ejercicio 2:
# Este algoritmo le pide al usuario que ingrese los valores de dos conjuntos e imprime la union, la interseccion, y las diferencias simetrica y
# asimetricas que se obtienen al comparar los valores de ambos conjuntos entre si.

#!c:/strawberry/perl/bin/perl.exe

# Comienza el programa principal.
use strict;

# Se declaran las variables tipo int que seran utilizadas.
my $LongitudA;
my $LongitudB;
my $i;
my $Temporal;
my $BitsA;
my $BitsB;
my $Recorrimiento;
my $Mascara;

# Imprime un mensaje para el usuario.
print "Escribe la longitud del primer conjunto (debe estar en el rango de 1 a 100): \n";

# La siguiente parte va a pedir al usuario que ingrese la longitud del primer conjunto. El valor sera guardado en la variable LongitudA. El
# rango permitido para este numero va del 1 al 100, por lo que si estos limites no son respetados por el valor ingresado, podriamos causar
#	errores en el programa. La estructura DO...WHILE nos ayuda a volver a pedir el valor del numero al usuario, en el caso de no respetar el
#	rango establecido en un principio. Si el valor del numero ingresado cumple con los parametros, no habra cambios en la variable LongitudA.
do {
  $LongitudA = <STDIN>;
  if (($LongitudA < 1) || ($LongitudA > 100)) {
	  printf "Solo puedes poner numeros del 1 al 100. Intentalo de nuevo.\n";
  }
} while(($LongitudA < 1) || ($LongitudA > 100));

# Se declara el arreglo ConjuntoA tipo int para representar el primer conjunto. Su longitud dependera del valor de LongitudA.
my @ConjuntoA = ($LongitudA);

# Imprime un mensaje para el usuario.
print "Escibe la longitud del segundo conjunto (debe estar en el rango de 1 a 100): \n";

# La siguiente parte va a pedir al usuario que ingrese la longitud del segundo conjunto. El valor sera guardado en la variable LongitudB. El
# rango permitido para este numero va del 1 al 100, por lo que si estos limites no son respetados por el valor ingresado, podriamos causar
# errores en el programa. La estructura DO...WHILE nos ayuda a volver a pedir el valor del numero al usuario, en el caso de no respetar el
# rango establecido en un principio. Si el valor del numero ingresado cumple con los parametros, no habra cambios en la variable LongitudB.
do {
	$LongitudB = <STDIN>;
	if (($LongitudB < 1) || ($LongitudB > 100)) {
	  printf ("Solo puedes poner numeros del 1 al 100. Intentalo de nuevo.\n");
	}
} while(($LongitudB < 1) || ($LongitudB > 100));

# Se declara el arreglo ConjuntoB tipo int para representar el segundo conjunto. Su longitud dependera del valor de LongitudB.
my @ConjuntoB = ($LongitudB);

# Imprime un mensaje para el usuario.
print "Escibe los elementos del primer conjunto y da enter entre cada uno (deben ser numeros del 0 al 15): \n";

# A continuacion, se va a recorrer el arreglo ConjuntoA (con ayuda de un FOR) y se va depositar en cada indice un valor ingresado por el
# usuario. Dentro hay una estructura Do...While, que solamente se va a terminar cuando el usuario ingrese un valor que este dentro del rango
# entre 0 y 15. En caso de ser un valor diferente, se pedira al usario que vualva a ingresar otro valor. En caso de que el valor ingresado
# cumpla con ese requisito, entonces ese valor se guardara en el indice correspondiente del arreglo ConjuntoA.
for ($i = 0; $i < $LongitudA; $i++) {
  do {
    $Temporal = <STDIN>;
	  if (($Temporal >= 0) && ($Temporal <= 15)) {
      $ConjuntoA [$i] = $Temporal;
	  } else {
		  print "Solo puedes poner numeros del 0 al 15. Intentalo de nuevo.\n";
	  }
	} while(($Temporal < 0) || ($Temporal > 15));
}

# Imprime un mensaje para el usuario.
print "Escibe los elementos del segundo conjunto y da enter entre cada uno (deben ser numeros del 0 al 15): \n";

# Ahora, se va a recorrer el arreglo ConjuntoB (con ayuda de un FOR) y se va depositar en cada indice un valor ingresado por el usuario. Dentro
# hay una estructura Do...While, que solamente se va a terminar cuando el usuario ingrese un valor que este dentro del rango entre 0 y 15. En
# caso de ser un valor diferente, se pedira al usario que vualva a ingresar otro valor. En caso de que el valor ingresado cumpla con ese
# requisito, entonces ese valor se guardara en el indice correspondiente del arreglo ConjuntoB.
for ($i = 0; $i < $LongitudB; $i++) {
  do {
    $Temporal = <STDIN>;
	  if (($Temporal >= 0) && ($Temporal <= 15)) {
      $ConjuntoB [$i] = $Temporal;
	  } else {
		print "Solo puedes poner numeros del 0 al 15. Intentalo de nuevo.\n";
	  }
	} while(($Temporal < 0) || ($Temporal > 15));
}

# Se le asigna valor de 0 a la variable BitsA.
$BitsA = 0;

# El sigiente FOR va a recorrer el arreglo ConjuntoA y se le asignara a la variable Recorrimiento el valor que posee el indice del arreglo
# señalado por cada ciclo del FOR. A continuacion, Recorrimiento sera utilizado para transformar el valor del indice del arreglo a una posicion
# especifica a nivel de bits y sera guardada en la variable BitsA. Asi, todos los valores del arreglo seran guardados como bits encendidos en
# una sola variable.
for ($i = 0; $i < $LongitudA; $i++) {
  $Recorrimiento = $ConjuntoA [$i];
  $BitsA = ((1<<$Recorrimiento) | $BitsA);
}

# Se le asigna valor de 0 a la variable BitsB.
$BitsB = 0;

# El sigiente FOR va a recorrer el arreglo ConjuntoB y se le asignara a la variable Recorrimiento el valor que posee el indice del arreglo
#	señalado por cada ciclo del FOR. A continuacion, Recorrimiento sera utilizado para transformar el valor del indice del arreglo a una posicion
# especifica a nivel de bits y sera guardada en la variable BitsB. Asi, todos los valores del arreglo seran guardados como bits encendidos en
# una sola variable.

for ($i = 0; $i < $LongitudB; $i++) {
  $Recorrimiento = $ConjuntoB [$i];
  $BitsB = ((1<<$Recorrimiento) | $BitsB);
  }

print "\n";
# El siguiente algoritmo es una estructura SELECCION anidada a un FOR que modifica los valores de la variable Mascara y mensajes que son
# impresos en la pantalla. Mascara es una variable que utiliza las variables BitsA y BitsB para encontrar la interseccion, la union, y las
# diferencias simetrica y asimetricas usando operadores sobre bits. Por lo tanto, el FOR va a modificar que operadores son utilizados para
# generar el valor de Mascara. Dentro del FOR, se encuentra este algoritmo que se trata de un FOR anidado, el cual va a imprimir el
# recorrimiento que, al aplicarlo a la variable Mascara y al ser comparada esta con 1 (bit encendido), el resultado continua siendo un bit
# encendido. Esto significa que aquel recorrimeinto realizado es en realidad un elemento del arreglo que supero las pruebas discriminantes que
# hicieron los operadores sobre bits al comparar ambos arreglos. Asi podemos imprimir el subconjunto de elementos (representados por la variable
# Recorrimiento) que forman la union, la interseccion y las diferencias simetrica y asimetricas.
for ($i = 0; $i < 3; $i++) {
  $Mascara = (($i == 0)? ($BitsA & $BitsB) : ($i == 1)? ($BitsA | $BitsB) : ($BitsA ^ $BitsB));
  print (($i == 0)? ("Interseccion: \n") : ($i == 1)? ("Union: \n") : ("Diferencia simetrica: \n"));
  for ($Recorrimiento = 0; $Recorrimiento < 16; $Recorrimiento++) {
    if (($Mascara>>$Recorrimiento) & 1) {
      print $Recorrimiento;
		  print " ";
    }
  }
	print("\n");
}
for ($i = 0; $i < 2; $i++) {
  $Mascara = (($i == 0)? ($BitsA & ~$BitsB) : ($BitsB & ~$BitsA));
  print (($i == 0)? ("Primer conjunto menos el segundo: \n") : ("Segundo conjunto menos el primero: \n"));
  for ($Recorrimiento = 0; $Recorrimiento < 16; $Recorrimiento++) {
    if (($Mascara>>$Recorrimiento) & 1) {
      print $Recorrimiento;
		  print " ";
    }
  }
	print("\n");
}

# Diccionario de variables:

# - LongitudA: Variable que va a guardar el valor de la longitud del primer conjunto y una vez que cumpla con los parametros establecidos (valor
#		           de 1 a 100) se convertira en una constante para el resto del programa. Es utilizada en el momento de nombrar el arreglo ConjuntoA
#		           para definir la longitud de ese arreglo. Ademas es utilizada para delimitar los ciclos de algunos FOR en los siguientes pasos del
#	             programa.

# - LongitudB: Variable que va a guardar el valor de la longitud del segundo conjunto y una vez que cumpla con los parametros establecidos (valor
#		           de 1 a 100) se convertira en una constante para el resto del programa. Es utilizada en el momento de nombrar el arreglo ConjuntoB
#		           para definir la longitud de ese arreglo. Ademas es utilizada para delimitar los ciclos de algunos FOR en los siguientes pasos del
#		           programa.

# - i: Variable de tipo contador. Es utilizada en el programa para controlar los ciclos dentro de las estructuras FOR. Ademas, representa los
#      indices al manejar los arreglos ConjuntoA y ConjuntoB y es esencial para que se modifiquen los valores de la variable Mascara y mensajes
#      que son impresos en la pantalla, en la estructura SELECCION de la parte final del programa.

# - Temporal: Variable de tipo temporal donde seran guardados los valores de los elementos de ambos conjuntos. Es utilizada para saber si el valor
#             ingresado por el usuario cumple con los parametros establecidos (valor de 0 a 15) y para guardar los valores que hayan cumplido con
#			        ese parametro en un indice especifico en el arreglo correspondiente: ConjuntoA para elementos del primer conjunto y ConjuntoB para
#			        elementos del segundo conjunto.

# - BitsA: Variable de trabajo donde se guardara el valor del cada indice del arreglo ConjuntoA en forma de bits encendidos en la variable, donde
#		       cada posición de bits corresponde a un valor numerico. BitsA interactua a partir de operadores sobre bits con la variable BitsB para
#			     generar diferentes valores que son asignados a Mascara.

# - BitsB: Variable de trabajo donde se guardara el valor del cada indice del arreglo ConjuntoA en forma de bits encendidos en la variable, donde
#    		   cada posición de bits corresponde a un valor numerico. BitsA interactua a partir de operadores sobre bits con la variable BitsB para
#   			 generar diferentes valores que son asignados a Mascara.

# - Recorrimiento: Variable de trabajo a la cual le sera asignada el valor que posee cada indice de los arreglos ConjuntoA y ConjuntoB, uno
#					         a la vez. Esta variable sera utilizada para transformar el valor del indice del arreglo a una posicion especifica a nivel de
#				           bits y guardarla en la variable BitsA o BitsB, dependiendo del arreglo. Esta variable es reciclada en la parte final del
#					         programa como contandor del FOR anidado. Ademas controla el recorrimiento aplicado a la variable Mascara y su valor en este
#					         paso es impreso en pantalla en caso de que la operacion sobre bits entre Mascara y 1 tenga un valor de 1.

# - Mascara: Variable de trabajo que utiliza las variables BitsA y BitsB para encontrar la interseccion, la union, y las diferencias simetrica y
#			       asimetricas usando operadores sobre bits. Su valor depende directamente de la estructura SELECCION del programa. Se le aplicara
#			       además, un recorrimiento en la parte final del programa para poder conocer aquellos recorrimientos que correspondan a bits encendidos
#			       dentro de Mascara.

# - ConjuntoA: Arreglo de una dimencion de tipo int, el cual alacenara el valor de cada elemento del primer conjunto en cada uno de sus indices. Su
#				       longitud depende del valor de la variable LongitudA y es utilizada tambien para generar la variable BitsA.

#   - ConjuntoB: Arreglo de una dimencion de tipo int, el cual alacenara el valor de cada elemento del segundo conjunto en cada uno de sus indices.
#				         Su longitud depende del valor de la variable LongitudB y es utilizada tambien para generar la variable BitsB.
