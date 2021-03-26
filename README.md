**Author: Salvador Gonzalez Juarez**

# Programming principles

This repository contains the programs that I designed for the Programming principles course, at Genomic sciences program. The requirements of each program were the following:

Each algorithm was implemented in both Perl and C. They use variables with meaningful names, and include comments (internal documentation) that explain the logic used by the program. They also include a short data dictionary describing how each variable is used and what it means. Both documentation and output are in spanish.

1. It consists of two parts:
a) In an arrangement of 16 elements each element of the array can contain either a zero (0) or a one (1). Each element of this arrangement must be read from the keyboard. This array represents a binary number. The algorithm converts this binary number, represented by the array, into its decimal equivalent and prints it out. This code was subject to the restriction that for the calculation of each power of 2 it is not possible to use any arithmetic operator (+, -, *, /,%), nor of increment or decrement (++, -), nor operators or functions to raise to some exponent or to take root, nor logarithmic or trigonometric mathematical functions (that is, use shifts).
b. This algorithm reads a decimal number from the keyboard and converts it to its equivalent in binary, storing it in the way described in the previous section. The algorithm then goes through the array to print the binary number on the screen.

2. This algorithm reads two sets of elements (A and B) from the keyboard (the size of each set can be different), and prints the union, the intersection and the symmetric and asymmetric differences of both sets. This program uses the binary encoding technique seen in class, with the encoding and decoding functions, and the operators on bits. 

3. This algorithm reads a set of N (N <= 10,000) whole numbers (where each number is in the range -20,000 to 20,000) from the keyboard, orders them in ascending order, and prints them to the screen. (Sorting by Bubble Method)

4. This algorithm that reads a number N (positive, integer, maximum six digits) and prints that number in words. For example, if you give the number 645376, the program prints "six hundred and forty-five thousand three hundred and seventy-six."

5. This algorithm reads a number N (in the range of -20,000 to 20,000) and then reads a set of M (M <= 10,000) whole numbers (in the range of -20,000 to 20,000) from the keyboard. Thus, the algorithm is able to locate in which position (from 0 to M-1) it is in number N and print said position on the screen. If the number N does not exist in the set of M numbers then the user will be informed of this with the corresponding message. The algorithm is efficient, such that it will never have to go through the entire array to find the number sought. (Binary search)

6. This program performs the binary search according to the conditions of the previous problem, but in a recursive way.

7. This algorithm reads from the keyboard a list of connections between nodes of an undirected network and generates a matrix representing said network. Subsequently, the algorithm calculate and print the node, its degree and its clustering coefficient for each node in the network.
