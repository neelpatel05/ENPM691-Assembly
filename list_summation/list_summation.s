#Program: This program will calculate the summation of the list
#
#Variables: Following registers will be used to execute the program
#
# %edi: This register will hold the index of current number
# %eax: This register will hold the current number
# %ebx: This register will hold the total summation
#
# data_items: This will hold the list. A 0 in last will terminate the program

.section .data
data_items:
	.long 1,2,3,4,5,6,7,8,9,10,0

.section .text

.globl _start
_start:
	movl $0, %edi
	movl $0, %ebx
	movl data_items(,%edi,4), %eax

start_loop:
	cmpl $0, %eax
	je exit_loop
	addl %eax, %ebx
	incl %edi
	movl data_items(,%edi,4), %eax
	jmp start_loop

exit_loop:
	movl $1, %eax
	int $0x80
