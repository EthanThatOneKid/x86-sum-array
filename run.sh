#!/bin/bash
#
# Name: "run.sh"
#
# Description: This file compiles, links, and runs the program.
#
# Author: Ethan Davidson
#         ethandavidson@csu.fullerton.edu
#         https://github.com/EthanThatOneKid
#
#                     GNU GENERAL PUBLIC LICENSE
#                        Version 3, 29 June 2007
#
#  Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
#  Everyone is permitted to copy and distribute verbatim copies
#  of this license document, but changing it is not allowed.

echo "Assemble float-input-output.asm"
nasm -f elf64 -l float-input-output.lis -o float-input-output.o float-input-output.asm

echo "Compile manage-floats.c using the gcc compiler standard 2011"
gcc -c -Wall -m64 -no-pie -o manage-floats.o manage-floats.c -std=c11

echo "Link the object files using the gcc linker standard 2011"
gcc -m64 -no-pie -o three-numbers.out manage-floats.o float-input-output.o -std=c11

echo "Run the program Floating IO:"
./three-numbers.out

echo "The script file will terminate"

# Finally, when the program exits, the temporary files shall be removed.
rm *.o
rm *.out