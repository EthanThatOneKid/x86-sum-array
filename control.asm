; Name: "control.asm"
;
; Description: _
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
  dialog_1 db "This program will sum your array of integers", 0xA, 0x0
  dialog_2 db "The sum will now be returned to the main function.", 0xA, 0xA, 0x0
  debug_dialog_1 db "There are %d elements in the array.", 0xA, 0x0
  maximum_array_size equ 100

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
  push qword -999

  ; Print Welcome Message
  mov rdi, dialog_1
  mov rax, 0x0
  call printf

  ; Fill Array
  mov rdi, array
  mov rsi, maximum_array_size
  call fill
  mov r15, rax

  ; Print Debug Message
  mov rax, 0x0
  mov rdi, debug_dialog_1
  mov rsi, r15
  call printf

  ; Display Array
  ; mov rax, 0x0
  ; mov rdi, array
  ; mov rsi, r15
  ; call display
  pop rax ; Pop the dummy value that the aligned stack.

  ; Sum Array
  ; mov rdi, array
  ; mov rsi, r15
  ; mov rax, 0x0
  ; call sum
  ; mov r15, rax; Places sum into r15.

  ; Print Goodbye Message
  mov rdi, dialog_2
  call printf

  ; mov rax, r15

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

; Copyright (C) 2021 Ethan Davidson