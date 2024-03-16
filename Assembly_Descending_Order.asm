%include "asm_io.inc"

segment _DATA public align=4 class=DATA use32
text1 db "Welcome to the descending order. Please input 3 number", 0
text2 db "Input number 1: ", 0
text3 db "Input number 2: ", 0
text4 db "Input number 3: ", 0
text5 db "Result Of Descending Order", 0
oversign db ">",0

segment _BSS public align=4 class=BSS use32
a resd 1 ;a
b resd 1 ;b
c resd 1 ;c
temp resd 1 ;temp

group DGROUP _BSS _DATA

segment _TEXT public align=1 class=CODE use32
global  _asm_main

_asm_main:
enter 0,0	;setup routine
pusha
	
mov eax,  text1	;Print Welcome MSG
call print_string	;Call print String
call print_nl	;Print new line
	
mov eax,  text2	;Print text at A input
call print_string	;Call print String
	
call read_int	;Read int
mov	[a], eax	;eax, to a

mov eax,  text3	;Print text at B input
call print_string	;Call print String

call read_int	;Read int
mov	[b], eax	;Read eax, to b

mov eax, text4	;Print text at C input
call print_string

call read_int	;Read C
mov	[c], eax
;-----------------------------------------
sort:
;Descending order number
mov	edx, [a]	;edx = a	
mov	eax, [b]	;eax = b
cmp	edx, eax	;compare edx, eda
jge	change1		;if(a > b) jump to change1

mov	eax, [a]	;eax = a
mov	[temp], eax	;temp = a
mov	eax, [b]	;eax = b
mov	[a], eax	;a = b
mov	eax, [temp]	;eax = temp
mov	[b], eax	;b = temp
chage1:
mov	edx, [b]	;edx = b
mov	eax, [c]	;eax = c
cmp	edx, eax	;compare edx, eda
jge	chage2		;if(b > c) jump to chage2

mov	eax, [b]	;eax = b
mov	[temp], eax	;temp = b
mov	eax, [c]	;eax = c
mov	[b], eax	;b = c
mov	eax, [temp]	;eax = temp
mov	[c], eax	;c = temp
chage2:
mov	edx, [a]	;edx = a
mov	eax, [b]	;eax = b
cmp	edx, eax	;compare edx, eax
jge	printorder		;if(a > b) jump to printorder

mov	eax, [a]	;eax = a
mov	[temp], eax	;temp = a
mov	eax, [b]	;eax = b
mov	[a], eax	;a = b
mov	eax, [temp]	;eax = temp
mov	[b], eax	;b = temp
;-----------------------------------------
printorder:
mov eax, text5	;Call text5
call print_string	;Call print string
call print_nl	;Call print new line

mov	eax, [a]	;a to eax
call print_int	;Call print int
mov	eax, oversign	;, to eax
call print_string	;Call print string
mov	eax, [b]	;b to eax
call print_int	;Call print int
mov	eax, oversign	;, to eax
call print_string	;Call print string
mov	eax, [c]	;c to eax
call print_int	;Call print int

call print_nl	;Print new line