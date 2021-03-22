; Name: "fill.asm"
;
; Description: This module first asks for some user-entered floating
;              point numbers. Once the user finishes (by pressing Ctrl+D),
;              this module will return the number of numbers that were
;              placed into the array.
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
extern scanf
extern printf
extern atof

; Constants
section .data
  dialog_1 db "Please enter floating point numbers seperated by white space or carriage returns.", 0xA, "When you have finished, press enter followed by Ctrl+D.", 0xA, 0x0
  float_format db "%lf", 0x0

; Exports
section .text
  global fill

; Fill Module
fill:

  ; 15 Pushes
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

  ; Set up some useful registers.
  mov r12, rsi; maximum_size_of_array
  mov r14, rdi; pointer_to_array
  mov r15, 0x0; current_index

  ; Prepare for input loop by aligning the stack with a dummy push.
  push qword 0x0

  ; Print the message. "Please enter floating point numbers..."
  mov rax, 0x0
  mov rdi, dialog_1
  call printf

  ; Jump into the loop.
  jmp start_loop

; Input Loop
start_loop:

  ; Scan for keyboard input.
  mov rax, 0x0
  mov rdi, float_format
  mov rsi, rsp
  call scanf

  ; Check if Ctrl+D is selected.
  cdqe
  cmp rax, -1

  ; If so, break out of this input loop.
  je end_loop

  ; Store keyboard input into xmm15.
  movsd xmm15, [rsp]

  ; Place the double into the array.
  movsd [r14 + 8 * r15], xmm15

  ; Increment the current_index.
  inc r15

  ; Check if the maximum_size_of_array has been reached.
  cmp r15, r12

  ; If so, break out of this input loop.
  je end_fill

  ; Otherwise, return to the top of the input loop.
  jmp start_loop

end_loop:
end_fill:

  ; Return the number of elements in the array.
  mov rax, r15

  ; Pop dummy push from earlier.
  pop r8

  ; 15 Pops.
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