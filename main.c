/**
 * Name: "main.c"
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
// #include <stdint.h>

double control(); // control.cpp

int main() {
  double result = -999;
	printf("Welcome to High Speed Array Summation by Ethan Davidson.\n");
	printf("Software licensed by GNU GPL 3.0.\n");
	printf("Version 1.0 released March 21st.\n\n");
	result = manager(); // calls manager.asm and returns sum of array
	printf("Main has recieved %ld and will keep it.\n", result);
  printf("Thank you for using High Speed Array Software.\n");
  printf("For system support, contact Ethan Davidson at ethandavidson@csu.fullerton.edu.\n");
  printf("A zero will be returned to the operating system.");
	return 0;
}

// Copyright (C) 2021 Ethan Davidson