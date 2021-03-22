; Name: "sum.asm"
; 
; Description: This module sums an array of floats
;              and returns its sum at the end.
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

; Constants
section .data
  dialog_1 db "The sum of these values is %.8lf.", 0xA, 0x0

; Exports
section .text
  global sum

sum:

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

  ; Prepare to Sum
	mov r12, rdi; r12 = pointer_of_array
	mov r13, rsi; r13 = amount_in_array
	mov r14, 0x0; r14 = current_index
	mov r15, 0x0
	cvtsi2sd xmm15, r15; xmm15 = total

loop:

	; Add the current_value to the total.
	addsd xmm15, [r12 + 8 * r14]

	; Increment the current_index.
	inc r14

	; Check if every number has been summed (current_index == amount_in_array).
	cmp r14, r13

	; If so, break out of this loop.
	je end_sum
	
	; Otherwise, continue summing numbers at high speeds.
	jmp loop

end_sum:

	; Display the resulting sum.
	mov rax, 0x1
	mov rdi, dialog_1
	mov rsi, r13
	movsd xmm0, xmm15
	call printf

	; Place the sum into xmm0 to be returned to the caller.
	movsd xmm0, xmm15

	; 15 pops
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rsi
	pop rsi
	pop rdi
	pop rdx
	pop rcx
	pop rbx
	pop rbp
	ret

; Copyright © 2021 Ethan Davidson