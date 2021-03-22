; Name: "control.asm"
;
; Description: This file is responsible for orchestrating the
;              user inputting floats into an array, displaying
;              the array, and calculating the sum of the user-
;              entered numbers.
;
; Author: Ethan Davidson
;         EthanDavidson@csu.fullerton.edu
;         https://github.com/EthanThatOneKid
;
;                     GNU GENERAL PUBLIC LICENSE
;                        Version 3, 29 June 2007
;
;  Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
;  Everyone is permitted to copy and distribute verbatim copies
;  of this license document, but changing it is not allowed.

; Imports
extern printf
extern fill
extern display
extern sum

; Constants
section .data
  dialog_1 db "This program will sum your array of integers.", 0xA, 0x0
  dialog_2 db "The sum will now be returned to the main function.", 0xA, 0x0
  debug_dialog_1 db "There are %d elements in the array.", 0xA, 0x0
  maximum_array_size equ 10

; Statically Allocated Variable(s)
section .bss
  array: resq maximum_array_size

; Exports
section .text
  global control

; Control Module
control:
  push rbp
  mov rbp, rsp
  push rbx
  push rcx
  push rdx
  push rdi
  push rsi
  push r8
  push r9
  push r10
  push r11
  push r12
  push r13
  push r14
  push r15
  pushf

  ; Dummy push to the align stack.
  push qword 0x0

  ; Print the welcome message.
  mov rdi, dialog_1
  mov rax, 0x0
  call printf

  ; Fill the array.
  mov rax, 0x0
  mov rdi, array
  mov rsi, maximum_array_size
  call fill

  ; Place the array_size into r15.
  mov r15, rax

  ; Pop the dummy value to re-align the stack.
  pop rax

  ; Display the array.
  mov rax, 0x0
  mov rdi, array
  mov rsi, r15
  call display

  ; Sum the array.
  mov rax, 0x1
  mov rdi, array
  mov rsi, r15
  call sum

  ; Place the sum into xmm15.
  movsd xmm15, xmm0

  ; Print the goodbye message.
  mov rdi, dialog_2
  call printf

  ; Place the sum into xmm0 to be returned to the caller.
  movsd xmm0, xmm15

  ; 15 pops
	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rsi
	pop rdi
	pop rdx
	pop rcx
	pop rbx
	pop rbp
	ret

; Copyright © 2021 Ethan Davidson