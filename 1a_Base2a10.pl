# Licenciatura en ciencias genomicas
# Principios de Programacion 2020 - Proyecto final
# Salvador Gonzalez Juarez

# Ejercicio 1a:
# Este algoritmo convierte un numero binario, representado por un arreglo, en su equivalente en decimal y lo imprime.

#!c:/strawberry/perl/bin/perl.exe

# Comienza el programa principal.
use strict;

# Se declaran las variables tipo int que seran utilizadas en el programa.
my $i;
my $Digito;
my $Decimal;

# Se declara el arreglo que sera utilizado en el programa.
my @Binario = (16);

# Imprime un mensaje para el usuario.
print "Escribe un numero binario de 16 cifras, dando enter entre cada digito (en caso de tener menos cifras, rellena con ceros a la izquierda):\n";

# La siguiente parte va a recorrer el arreglo Binario, y va depositar en cada indice un valor ingresado por el usuario. Se trata de un
# Do...While que solamente se va a terminar cuando el usuario ingrese un valor igual a 0 o 1. En caso de ser un valor diferente, se pedira al
# usario que vualva a ingresar otro valor. En caso de que el valor ingresado sea 0 o 1, entonces ese valor se guardara en el indice
# correspondiente del arreglo Binario.

for ($i = 0; $i < 16; $i++) {
	do {
  $Digito = <STDIN>;
  if (($Digito == 0) || ($Digito == 1)) {
 	    $Binario [$i] = $Digito;
  } else {
	print "Escribe solo digitos en binario (1 o 0). Vuelve a intentarlo, desde el ultimo digito que escribiste.\n";
  }
  } while(($Digito < 0) || ($Digito > 1));
}

# Imprime un mensaje para facilitar la visualizacion del resultado.
print "\n";
print "El numero en decimal es:\n";

# Se le asigna el valor 0 a la variable Decimal, para que pueda cambiar sus bits sin generar valores no desaeados en el algoritmo de abajo.
$Decimal = 0;

# La siguiente parte va a recorrer el arreglo, indice por indice. En caso de encontrar un indice con un valor dentro de el igual a 1, se va a
# recorrer el valor del indice maximo (15) menos el valor del indice actual, hacia la izquierda a 1 (bit encendido). Debe ser de esta forma,
# porque los primeros indices revisados, corresponden a los bits mas significativos de la variable, que son los que estan mas a la izquierda.
# Posteriormete, se compara a nivel de bits este numero recien generada con la mascara Decimal. Se utiliza un OR porque Decimal debe almacenar
# la posicion del bit encendido, para cada recorrimiento hecho. El resultado debe ser igualado al mismo Decimal para que los recorrimientos que
# generan unos sean almacenaados en una misma variable.
for ($i = 0; $i < 16; $i++) {
  if ($Binario [$i] == 1) {
    $Decimal = (1<<15-$i)|$Decimal;
  }
}

# Se imprime a pantalla Decimal, el cual ahora es un int con unos en cada bite que corresponde a los indices con valor de uno en el arreglo
# binario. La computadora va a imprimir Decimal en sistema decimal porque esa configuracion de unos dentro de un int es interpretado como un
# numero en base 10.
print  $Decimal . "\n";

# Diccionario de variables:

#- i: Variable de tipo contador. Es utilizada en el programa para controlar los ciclos dentro de las estructuras FOR. Ademas, representa los
#		  indices al manejar el arreglo Binario y es esencial para saber la longitud del recorrimiento que va a tener 1 para ser comparado con la
#     mascara Decimal.

# - Digito: Variable de tipo temporal. Guarda el valor ingresado por el usuario y lo guarda en el indice correspondiente del arreglo Binario.
#			      Es de tipo temporal porque el valor que guardara sera remplazado constantemente por otro valor ingresado por el usuario, hasta que
#			      se den los 16 valores que representan los digitos en un numero binario de 16 cifras. Ademas, esta variable es utilizada para saber
#			      si el usuario ingreso un valor diferente de 0 y 1 a la hora de ingresar los digitos del numero en binario, y asi pedir que el usuario
#			      ingrese de nuevo ese digito erroneo.

# - Decimal: Variable de trabajo. Se trata de una variable que va almacenando en sus bits los indices del arreglo que tienen valor igual a 1. El
#			       numero del indice es igual a la posicion del bit, empezando desde el mas significativo al menos significativo. Decimal se imprime al
#			       final como el resultado del programa, el cual es una serie de bits apagados o prendidos que son interpretados como un numero en
#            decimal al momento de ser impreso en la pantalla.

# - Binario: Arreglo generado con una longitud predeterminada de 16, debido a que es el numero de bits posibles dentro de un int. Este arreglo de
#			       una dimension va guardando los digitos del numero binario (un indice para cada digito). Solamente guarda en sus indices valores
#			       iguales a 0 o 1.
