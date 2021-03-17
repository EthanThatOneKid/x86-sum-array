#!/bin/bash
#
# Name: "run.sh"
#
# Description: This file compiles, links, and runs the program.
#
# Author: Ethan Davidson
#         EthanDavidson@csu.fullerton.edu
#         https://github.com/EthanThatOneKid
#
#                     GNU GENERAL PUBLIC LICENSE
#                        Version 3, 29 June 2007
#
#  Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
#  Everyone is permitted to copy and distribute verbatim copies
#  of this license document, but changing it is not allowed.

echo "Compile `main.c`"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

echo "Compile `control.asm`"
nasm -f elf64 -l control.lis -o control.o control.asm

echo "Compile `fill.asm`"
nasm -f elf64 -l fill.lis -o fill.o fill.asm

echo "Compile `sum.asm`"
nasm -f elf64 -l sum.lis -o sum.o sum.asm

echo "Compile `display.cpp`"
gcc -c -Wall -m64 -no-pie -o display.o display.cpp -std=c++17

echo "Link each object file"
gcc -m64 -no-pie -o a.out -std=c++17 main.o control.o fill.o sum.o display.o

echo "Run the program"
./a.out

echo "Delete temporary files"
rm *.o
rm *.lis
rm *.out

echo "Terminating script file"
