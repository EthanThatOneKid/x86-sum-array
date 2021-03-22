/**
 * Name: "display.cpp"
 *
 * Description: The function exported by this file prints the contents
 *              of an array to the standard output.
 * 
 * Author: Ethan Davidson
 *         EthanDavidson@csu.fullerton.edu
 *         https://github.com/EthanThatOneKid
 * 
 *                     GNU GENERAL PUBLIC LICENSE
 *                       Version 3, 29 June 2007
 * 
 * Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 * Everyone is permitted to copy and distribute verbatim copies
 * of this license document, but changing it is not allowed.
 */

#include <stdio.h>

extern "C" void display(double*, long);

void display(double* array, long size) {
  printf("Your numbers were ");
  for (long i = 0; i < size; i++) {
    printf("%.8f, ", *(array + i));
  }
  printf("and that's all.\n");
}

// Copyright © 2021 Ethan Davidson