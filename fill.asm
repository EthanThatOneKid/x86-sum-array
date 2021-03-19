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
string_format db "%s", 0x0

; Exports
section .text
global fill

; Fill Module
fill:

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

mov r12, rsi ; size of array
mov r14, rdi ; pointer to array
mov r15, 0x0 ; incrementing value to keep track of index

; dummy push to align stack
push qword -999

; give enough space to top of stack to store double
sub rsp, 0x400; 1024

jmp start_loop

start_loop:

mov rdi, string_format
push qword 0x0
mov rsi, rsp
mov rax, 0x0
call scanf

cdqe
cmp rax, -1
je end_loop

mov rax, 0x1
mov rdi, rsp
call atof
movsd xmm0
pop r8

movsd [r15 * 8 * r13], xmm12
inc r13

cmp r13, r14
je end_fill

jmp start_loop

end_loop:

pop r8

end_fill:

mov rax, r13
pop r8

; Copyright (C) 2021 Ethan Davidson