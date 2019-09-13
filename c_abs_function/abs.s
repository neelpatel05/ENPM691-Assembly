#Program: This program implements the absolute-abs()-function at machine level
#

.section .data
.equ LINUX_EXIT_CALL, 0x80
.equ NUMBER, -20

.section .text

.globl _start
_start:
	movl $NUMBER, %eax
	movl %eax, %ebx

	cmpl $-1, %ebx
	jle neg_number

	movl $1, %eax
	int $LINUX_EXIT_CALL

neg_number:
	neg %ebx
	movl $1, %eax
	int $LINUX_EXIT_CALL
