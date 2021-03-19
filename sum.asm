; Name: "sum.asm"
; 
; Description: This module sums a list of given floats
;              and returns the sum at the end.
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
  dialog_1 db "The sum of these values is %.8ld.", 0xA, 0x0

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
	mov r14, 0x0; r14 = total
	mov r15, 0x0; r15 = current_index

loop:
	add r14, [r12 + 8 * r15] ; adds current value at index to accumulator
	inc r15									 ; increments current index

	cmp r15, r13 ; tests if the current index is equal to the number of elements
	je end ; if true, end
	jne loop ; else, continue loop

end:
	mov rdi, dialog_1 ; print the number of elements summed and the sum
	mov rsi, r13 ; num elements
	mov rdx, r14 ; sum
	mov rax, 0
	call printf

	mov rax, r14 ; move sum to rax to be returned

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