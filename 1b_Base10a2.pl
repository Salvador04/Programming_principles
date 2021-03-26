# Licenciatura en ciencias genomicas
# Principios de Programacion 2020 - Proyecto final
# Salvador Gonzalez Juarez

# Ejercicio 1b:
# Este algoritmo convierte un numero decimal a su equivalente en binario y lo imprime.

#!c:/strawberry/perl/bin/perl.exe

# Comienza el programa principal.
use strict;

# Se declara el arreglo tipo int que sera utilizado en el programa.
my  @Binario = (16);

# Se declaran las variables tipo int que seran utilizadas.
my $i;
my $Decimal;

# Imprime un mensaje para el usuario.
print "Escribe un numero entero decimal positivo. El rango permitido es de 0 a 65535:\n";

# La siguiente parte va a pedir al usuario que ingrese el valor del numero decimal que se desea convertir en numero binario. El rango permitido
# para este numero va del 0 al 65535, por lo que si estos limites no son respetados por el valor ingresado el resultado seria erroneo. Para
# evitar mostrar en pantalla un resultado falso, la estructura DO...WHILE nos ayuda a volver a pedir el valor del numero al usuario, en el caso
# de no respetar el rango establecido en un principio. Si el valor del numero ingresado cumple con los parametros sera guardado en la variable
# Decimal.
do {
  $Decimal = <STDIN>;
  if (($Decimal > 65535) || ($Decimal < 0)) {
    printf ("Numero fuera del rango establecido. Intentalo de nuevo.\n");
	}
} while(($Decimal < 0) || ($Decimal > 65535));

# La siguiente parte consiste en un algoritmo el cual va a comparar el valor de cada bit contra 1 (bit encendido). Para comparar cada bit se
# utiliza un FOR, el cual va a ir recorriendo el valor de todos los bits hasta el bit menos significativo, uno a la vez. Esto nos indicara
# cuales son los bits prendidos y cuales estan apagados. Esta informacion sera guardada en el arreglo Binario, donde cada indice corresponde
# a un bit de la variable Decimal.
for ($i = 15; $i >= 0; $i--) {
  $Binario [15-$i] = ($Decimal>>$i)&1;
}

# Finalmente, la estructura FOR va a recorrer el arreglo Binario, imprimiendo el valor de cada indice. Al juntarlos todos, obtenemos en
# pantalla el conjunto de ceros y unos en el orden al que corresponde el numero binario del numero ingresado en Decimal.
print "\n";
print "El numero en binario es:\n";
for ($i = 0; $i < 16; $i++) {
  print $Binario [$i];
}
print "\n";

# Diccionario de variables:

# - i: Variable de tipo contador. Es utilizada en el programa para controlar los ciclos dentro de las estructuras FOR. Ademas, representa los
# 		 indices al manejar el arreglo Binario y es esencial para saber la longitud del recorrimiento que va a tener la variable Decimal para ser
#	 	   comparado contra 1 (bit encendido).

# - Decimal: Variable de trabajo. Se trata de una variable que almacena el numero en decimal que ingresa el usuario. Forzosamente debe tener un
#			       valor en el rango entre 0 y 65535, de lo contrario, el programa pedira al usuario que vuelva a ingresar el numero. Decimal es
#			       utilizado para formar una mascara que permita conocer el valor de cada bit de la variable Decimal en numero binario (interpretado
#			       por la computadora).

# - Binario: Arreglo generado con una longitud predeterminada de 16, debido a que es el numero de bits posibles dentro de un int. Este arreglo
#			       de una dimension va guardando los digitos del numero binario (un indice para cada digito) que la computadora interpreta cuando se
#			       escribe un numero decimal. Solamente guarda en sus indices valores iguales a 0 o 1.
