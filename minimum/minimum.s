#Program: This program finds the minimum number from the list of numbers

#Variables: Following registers will be used to store the variables
#
# %edi: This register will point to the index of current number
# %eax: This register will hold the current number
# %ebx: This register will hold the minimum number
#
# data_items: This variable will hold the data. A 99 will indicate end of list

.section .data
data_items:
	.long 3,45,12,1,76,56,83,90,9,21,99

.section .text

.globl _start
_start:
	movl $0, %edi
	movl data_items(,%edi,4), %eax
	movl %eax, %ebx

start_loop:
	cmpl $99, %eax
	je loop_exit
	incl %edi
	movl data_items(,%edi,4), %eax
	cmpl %ebx, %eax
	jge start_loop
	mov %eax, %ebx
	jmp start_loop

loop_exit:
	movl $1, %eax
	int $0x80
