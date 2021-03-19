; Name: "control.asm"

; Description: _

; Author: Ethan Davidson
;         EthanDavidson@csu.fullerton.edu
;         https://github.com/EthanThatOneKid

;                     GNU GENERAL PUBLIC LICENSE
;                        Version 3, 29 June 2007

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
string_format db "%s", 0x0

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

mov r12, rsi ; size of array
mov r14, rdi ; pointer to array
mov r15, 0x0 ; incrementing value to keep track of index

; dummy push to align stack
push qword -999

; Copyright (C) 2021 Ethan Davidson