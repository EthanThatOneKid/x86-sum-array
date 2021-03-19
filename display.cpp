/**
 * Name: "display.cpp"
 *
 * Description: _
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

extern "C" void display(double array[], long size);

void display(double array[], long size) {
  for (int i = 0; i < size; i++) {
    printf("%.8f\n", array[i]);
  }
}

// Copyright (C) 2021 Ethan Davidson