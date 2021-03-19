; Name: "fill.asm"
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
extern scanf
extern printf
extern atof

; Constants
section .data
  float_format db "%lf", 0x0
  dialog_1 db "Index: %d", 0xA, 0x0

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

  ; Set up registers.
  mov r12, rsi; maximum_size_of_array
  mov r14, rdi; pointer_to_array
  mov r15, 0x0; current_index

  ; Prepare for input loop.
  push qword -999; Align stack with dummy push.
  ; sub rsp, 0x400; Create space on top of stack to recieve a double.
  jmp start_loop

; Input Loop
start_loop:

  ; Print Debug Message
  ; mov rax, 0x0
  ; mov rdi, dialog_1
  ; mov rsi, r15
  ; call printf

  ; Scan for keyboard input.
  ; mov rax, 0x0
  ; mov rdi, float_format
  ; ; push qword 0x0
  ; mov rsi, rsp
  ; call scanf

  ; Check if Ctrl+D is selected.
  ; cdqe
  ; cmp rax, -1

  ; If so, break out of this input loop.
  ; je end_loop

  ; Place the user-inputted double into xmm0.
  ; mov qword rax, 0x1
  ; mov qword rdi, rsp
  ; call atof

  mov r8, 0x1
  cvtsi2sd xmm0, r8

  ; Place the double into the array.
  ; Address = pointer_to_array + (8 * current_index).
  movsd xmm15, xmm0; xmm0 is the result of the most recent atof call.
  movsd [r14 + 8 * r15], xmm0

  ; Increment the current_index.
  inc r15

  ; Check if the maximum_size_of_array has been reached.
  cmp r15, r12

  ; If so, break out of this input loop.
  je end_fill

  ; Return to the top of the input loop.
  jmp start_loop

end_loop:
  ; pop r8

end_fill:

  ; Return the number of elements in the array.
  mov rax, r15

  ; Remove space on top of stack to recieve a double.
  ; add rsp, 0x400

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

; Copyright (C) 2021 Ethan Davidson