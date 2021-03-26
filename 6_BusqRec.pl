# Licenciatura en ciencias genomicas
# Principios de Programacion 2020 - Proyecto final
# Salvador Gonzalez Juarez

# Ejercicio 6:
# Este algoritmo le pide al usuario que ingrese los valores de un conjunto, los almacena en un arreglo, y los ordena de forma ascendente. Despues, le
# pide al usuario que ingrese un numero que este dentro del conjunto y se imprime el indice del arreglo donde se encuantra dicho numero.

#!c:/strawberry/perl/bin/perl.exe

# Comienza el programa principal.
use strict;

# Se declaran las variables tipo int que seran utilizadas.
my $Numero;
my $Longitud;
my $i;
my $Temporal;
my $Inicio;
my $Final;

# Imprime un mensaje para el usuario.
print "Escribe la longitud del conjunto (debe ser menor o igual a 10000):\n";

# La siguiente parte va a pedir al usuario que ingrese la longitud del conjunto. El valor sera guardado en la variable Longitud. El rango permitido
# para este numero va del 1 al 10000, por lo que si estos limites no son respetados por el valor ingresado, podriamos causar errores en el
#	programa. La estructura DO...WHILE nos ayuda a volver a pedir el valor del numero al usuario, en el caso de no respetar el rango establecido en
#	un principio. Si el valor del numero ingresado cumple con los parametros, no habra cambios en la variable Longitud.
do {
  $Longitud = <STDIN>;
  if (($Longitud > 10000) || ($Longitud < 1)) {
  	print "La longitud debe estar en el rango entre 1 a 10000. Intentalo de nuevo.\n";
  }
} while(($Longitud > 10000) || ($Longitud < 1));

# Se declara el arreglo Conjunto de tipo int para representar al conjunto. Su longitud dependera del valor de Longitud.
my @Conjunto = ($Longitud);

# Imprime un mensaje para el usuario.
print "Escribe cada elemento del conjunto. El valor de cada elemento debe estar en el rango entre -20000 hasta 20000:\n";

# A continuacion, se va a recorrer el arreglo Conjunto (con ayuda de un FOR) y se va depositar en cada indice un valor ingresado por el usuario.
# Dentro hay una estructura Do...While, que solamente se va a terminar cuando el usuario ingrese un valor que este dentro del rango entre -20000
# y 20000. En caso de ser un valor diferente, se pedira al usario que vualva a ingresar otro valor. En caso de que el valor ingresado cumpla con
# ese requisito, entonces ese valor se guardara en el indice correspondiente del arreglo Conjunto.
for ($i = 0; $i < $Longitud; $i++) {
  do {
  	$Temporal = <STDIN>;
  	  if (($Temporal >= -20000) && ($Temporal <= 20000)) {
        $Conjunto [$i] = $Temporal;
  	  } else {
  		  print "El numero no esta dentro del rango de -20000 a 20000. Intentalo de nuevo.\n";
  	  }
  } while(($Temporal < -20000) || ($Temporal > 20000));
}

# Se manda a llamar la funcion burbuja, la cual va a ordenar los valores dentro de cada indice del arreglo Conjunto de forma ascendente. La
# informacion del arreglo Conjunto pasa por referencia a la funion, mientras que la informacion de la variable Longitud pasa por valor a la
# funcion.

@Conjunto = burbuja(\@Conjunto, $Longitud);

# Imprime un mensaje para el usuario.
print "Escribe un numero que este dentro del conjunto. El numero debe estar dentro del rango de -20000 a 20000:\n";

# La siguiente parte va a pedir al usuario que ingrese el valor del numero que desea buscar en el arreglo Conjunto. El valor sera guardado en la
# variable Numero. El rango permitido para este numero va del -20000 al 20000, por lo que si estos limites no son respetados por el valor
# ingresado, podriamos causar errores en el programa. La estructura DO...WHILE nos ayuda a volver a pedir el valor del numero al usuario, en el
# caso de no respetar el rango establecido en un  principio. Si el valor del numero ingresado cumple con los parametros, no habra cambios en la
# variable Numero.
do {
  $Numero = <STDIN>;
  if (($Numero < -20000) || ($Numero > 20000)) {
    print "El numero no esta dentro del rango de -20000 a 20000.Intentalo de nuevo.\n";
  }
} while(($Numero < -20000) || ($Numero > 20000));

# Se manda a llamar la funcion busqueda, la cual va a realizar el algoritmo de la busqueda binaria para encontrar el indice del arreglo Conjunto
# donde se encuentra el valor de la variable Numero. La informacion del arreglo Conjunto pasa por referencia a la funcion, mientras que la
# informacion de las variables Numero, Inicio y Final pasan por valor a la funcion. El resultado regresado por la funcion busqueda se guarda en la
# variable Temporal.
$Inicio = 0;
$Final = $Longitud -1;
$Temporal = busqueda(\@Conjunto, $Numero, $Inicio, $Final);

# El siguiente IF se encarga de evaluar el valor de la variable Temporal: si tiene un valor de -1, se imprime un mensaje especial indicando que el
# valor de la variable Numero no fue hayado en ningun indice del arreglo Conjunto; si tiene un valor diferente de -1, se imprime el indice del
# arreglo donde se haya el valor de la variable Numero.
if ($Temporal == -1) {
  print "El numero escrito no existe dentro del conjunto.\n";
} else {
	print "El indice del conjunto donde se encuentra el numero es: " . int ($Temporal) . "\n";
  }

# Comienza la funcion burbuja:
sub burbuja {
  my ($X_Ref, $Y) = @_;
  my @X = @{$X_Ref};

  # Se declaran las variables propias de la funcion burbuja.
  my $Ordenado;
  my $j;
  my $Temporal2;

  # El siguiente algoritmo se trata de una estructura DO...WHILE con un FOR dentro de ella. El FOR ayuda a recorrer el arreglo Conjunto. Dentro hay
	# un IF el cual compara el valor del indice actual y el siguiente indice. Para ordenar de forma ascendente un conjunto de numeros es necesario
	# que los elementos sean menores al elemento posterior. Por lo tanto si un indice del arreglo posee un valor mayor al valor en el indice
	# inmediatamente posterior, en el orden como los ingreso el usuario, el valor de ambos indices debe ser intercambiado. Para ello se almacena el
	# valor del indice actual en la variable Temporal2, luego se le asigna el valor dentro del indice posterior al indice actual y, finalmente, se le
  # asigna el valor almacenado en la variable Temporal2 al indice posterior. La variable Ordenado funciona como una bandera binaria, que es
	# responsable de detener los ciclos del DO...WHILE una vez que se haya recorrido el arreglo sin haber modificado el valor de los indices (lo que
	# quiere decir que el arreglo esta ordenado de forma ascendente).
  do {
    $Ordenado = 1;
    for ($j = 0; $j < $Y - 1; $j++) {
      if ($X [$j] > $X [$j + 1]) {
        $Temporal2 = $X [$j];
        $X [$j] = $X [$j + 1];
        $X [$j + 1] = $Temporal2;
        $Ordenado = 0;
      }
    }
  } while(!$Ordenado);
  return @X;
}

# Comienza la funcion busqueda:
sub busqueda {
  my ($X_Ref, $Y, $I, $F) = @_;
  my @X = @{$X_Ref};

  # Primero se verifica si el valor de I es mayor que F; si es el caso entonces la funcion regresa el valor de -1. Esto es importante, ya que si en
	# alguno de los ciclos recursivos el valor de I es mayor que F, quiere decir que la busqueda binaria fracaso en hayar el numero Z, y por lo tanto
	# se interpreta que el valor de Z no forma parte del arreglo X.
  if ($I > $F){
	  return -1;
  }

  # Se declara la variable propia de la funcion busqueda.
  my $Mitad;

  # El siguiente algoritmo es responsable de la busqueda del valor de la variable Z (cuyo valor es recibido como paso por valor de la variable
  # Numero) dentro del arreglo X (cuyo valor es recibido como paso por referencia del arreglo Conjunto). Para ello va a utilizar un metodo donde
	# comparara el valor del indice de la mitad del arreglo, con el valor de Z, y a partir de esa informacion decidira si busca el indice con el valor
	# de Z hacia la izquierda o derecha del indice de la mitad del arreglo y repite el procedimiento, ahora con limite en los indice ajyacentes al
	# indice de la mitad; todo esto siempre y cuando el valor del indice de la mitad no sea igual al valor de Z;	si fuese el caso, se imprime el indice
	# de la mitad del arreglo. Lo primero que se debe hacer es calcular la mitad del arreglo, como
	# el cociente de la suma de los valores de las variables I y F, entre 2.
  $Mitad = ($I + $F) / 2;

  # Los siguientes If's compuestos, deciden si mandar a la llamada de la funcion el valor del indice de la mitad del arreglo o continuar con la
	# busqueda binaria. La diferencia principal de este algoritmo con el de la Busqueda Binaria original, es que no usa una estructura WHILE que
	# repita el proceso de acortamiento del arreglo, y en su lugar la funcion se llama asi misma, solo que ahora le da valores modificados de la
	# variable I y F. A este metodo se le conoce como Busqueda Binaria Recursiva.
  if ($Y == $X [$Mitad]) {
	  return $Mitad;
  }
  elsif ($Y < $X [$Mitad]) {
	  $F = $Mitad - 1;
    busqueda(\@X, $Y, $I, $F);
  }
  else {
	  $I = $Mitad + 1;
	  busqueda(\@X, $Y, $I, $F);
  }
}

# Diccionario de variables:

# 1) Variables del programa principal:

# - Longitud: Variable que va a guardar el valor de la longitud del conjunto y una vez que cumpla con los parametros establecidos (valor de 1 a
#			        10000) se convertira en una constante para el resto del programa. Es utilizada en el momento de nombrar el arreglo Conjunto para
#			        definir la longitud de ese arreglo. Ademas es utilizada para delimitar los ciclos de algunos FOR en los siguientes pasos del
#			        programa y su informacion es mandada a la funcion burbuja como paso por valor, lo que quiere decir, que el valor original de Longitud
#			        no se modifica.

# - i: Variable de tipo contador. Es utilizada en el programa para controlar el ciclo dentro de la estructura FOR. Ademas, representa los indices
#		   al manejar el arreglo Conjunto.

# - Temporal: Variable de tipo temporal donde seran guardados los valores de los elementos del conjunto. Es utilizada para saber si el valor
#             ingresado por el usuario cumple con los parametros establecidos (valor de -20000 a 20000) y para guardar los valores que hayan
#			        cumplido con ese parametro en un indice especifico en el arreglo Conjunto. Posteriormente, es reciclada para recibir el resultado que
#			        regresa la funcion busqueda, y es el valor que se imprime como resultado del programa principal.

# - Numero: Variable que va a guardar el valor del numero que se desea buscar dentro del arreglo Conjunto y una vez que cumpla con los parametros
#			      establecidos (valor entre -20000 a 20000) se convertira en una constante para el resto del programa. Su informacion es es recibida por
#			      la funcion busqueda como paso por valor, lo quiere decir, que el valor original de Numero no se modifica.

# - Inicio: Variable de trabajo cuya función es representar el indice inicial del arreglo Conjunto. Se inicializa con 0, porque ese es el indice
#			      minimo del arreglo

# - Final: Variable de trabajo cuya función es representar el indice final del arreglo Conjunto. Se trata del valor de la variable Longitud menos 1,
#			     porque ese es el indice maximo del arreglo.

# - Conjunto: Arreglo de una dimencion de tipo int, el cual almacenara el valor de cada elemento del conjunto en cada uno de sus indices. Su
#			        longitud depende del valor de la variable Longitud. Su informacion es es recibida por la funcion burbuja y la funcion busqueda como
#			        paso por referencia, lo quiere decir que las modificaciones que se le hagan al arreglo en la funcion seran guardadas en la posicion de
#			        la memoria del arreglo original.

# 2) Variables de la funcion burbuja:

# - Y: Variable que va a utilizar el valor de la variable Longitud, del programa principal, como paso por valor, es decir, que no modifica el valor
#		   de la variable original. Es utilizada para delimitar el ciclo del FOR que esta dentro de la funcion.

# - j: Variable de tipo contador. Es utilizada en la funcion burbuja especificamente para controlar los ciclos dentro de la estructura FOR.
#		   Representa los indices al manejar el arreglo X y es esencial para comparar los valores del indice actual y el indice posterior del arreglo.

# - Temporal2: Variable de tipo temporal utilizada dentro de la funcion burbuja, utilizada para almacenar el valor del indice actual y asi poder conservarlo
#		           para despues asignarselo al indice posterior.

# - Ordenado: Variable de tipo bandera (binaria) responsable de detener los ciclos del DO...WHILE una vez que se haya recorrido el arreglo sin haber
#			        modificado el valor de los indices (lo que quiere decir que el arreglo esta ordenado de forma ascendente). Al principio del DO...WHILE
#			        se le asigna a Ordenado el valor de 1, porque siempre esta la posibilidad de que el arreglo ya este ordenado de forma ascendente. Una
#			        vez que intercambiamos el valor entre indices, hemos desordenado el arreglo y no existe la certeza de que ya este ordenado, por lo
#			         tanto, se le asigna el valor de 0 a Ordenado para que vuelva a revisar el arreglo.

# - X: Arreglo que va a utilizar el valor del arreglo Conjunto, del programa principal, como paso por referencia, es decir, que modifica el valor
#		   del arreglo Conjunto porque tiene la direccion en momoria original. Es utilizada para comparar el valor de los indices en el momento de
#		   ordenar de forma ascendente el arreglo.

# 3) Variables de la funcion busqueda:

# - Y: Variable que va a utilizar el valor de la variable Numero, del programa principal, como paso por valor, es decir, que no modifica el valor
#		   de la variable original. Es utilizada en la funcion para comparar su valor contra el valor de el indice de mitad del arreglo X.

# - I: Variable de trabajo cuya función es representar el indice inicial del arreglo o subarrglos en cada llamada de la funcion busqueda. Al
#	     principio utiliza el valor de la variable Inicio, del programa principal, como paso por valor es decir, que no modifica el valor de la
#		   variable original. I es utilizado para calcular el indice de la mitad del arreglo y su valor incrementa en cada llamada de la funcion, cuando
#		   el valor de la variable Z sea mayor que el valor guardado en el indice de la mitad del arreglo. Finalmente, si I incrementa lo suficiente como
#		   para ser mayor que el valor de la variable F, entonces eso significa que el numero ingresado no existe en ningun indice del arreglo.

# - F: Variable de trabajo cuya función es representar el indice final del arreglo o subarrglos en cada llamada de la funcion busqueda. Al
#	     principio utiliza el valor de la variable Final, del programa principal, como paso por valor es decir, que no modifica el valor de la
#		   variable original. F es utilizado para calcular el indice de la mitad del arreglo y su valor incrementa en cada llamada de la funcion cuando
#		   el valor de la variable Z sea menor que el valor guardado en el indice de la mitad del arreglo. Finalmente, si la variable I incrementa lo
#		   suficiente como para ser mayor que el valor de F, entonces eso significa que el numero ingresado no existe en ningun indice del arreglo.

# - Mitad: Variable de trabajo cuya funcion es representar el indice de la mitad del arreglo o los subarreglos en cada ciclo de la busqueda binaria.
#			     Su valor es calculado y asignado al principio y se vuelve a calcular y asignar a cada ciclo del programa. Se calcula mediante el
#			     cociente de la suma de las variables I y F entre 2. Al ser una variable de tipo int, su valor siempre va a ser un entero.

# - X: Arreglo que va a utilizar el valor del arreglo Conjunto, del programa principal, como paso por referencia, es decir, que modifica el valor
#		   del arreglo Conjunto porque tiene la direccion en momoria original. Es utilizada para comparar el valor de los indices en el momento de
#		   ordenar de forma ascendente el arreglo. X es importante para la funcion en la comparacion contra el valor de el indice de la mitad del arreglo
#		   y el valor de la variable Y.
