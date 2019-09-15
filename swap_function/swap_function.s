#Program: This program perform swapping of two numbers at assembly level
#
#Variables: Following registers will be used for the swapping function
#
# %eax: This will hold the system_call
# %ebs: This will return the swaped numbers

.section .data
data_items:
	.long 23, 45, 99
swap_items:
	.long 0, 0, 99
.equ LINUX_EXIT_CALL, 0x80

.section .text

.globl _start
_start:
	movl $0, %edi
	movl data_items(,%edi,4), %eax

	incl %edi
	movl %eax, swap_items(,%edi,4)

	movl data_items(,%edi,4), %eax
	decl %edi
	movl %eax, swap_items(,%edi,4)

	movl $1, %eax
	int $LINUX_EXIT_CALL
