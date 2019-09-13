#Purpose: This program finds the maximum number from the list of numbers

#Variables: The registers have following function
#
# %eax: current data item
# %ebx: largest data found
# %edi: holds the index of current data value to be examined

#Memory Locations
#
# data_items: contains the data item. A 0 number is used to terminate the program
#

.section .data
data_items:
	.long 3,67,45,6,23,64,78,59,12,19,0

.section .text

.globl _start
_start:
	movl $0,%edi
	movl data_items(,%edi,4), %eax
	movl %eax, %ebx

start_loop:
	cmpl $0, %eax
	je loop_exit
	incl %edi
	movl data_items(,%edi,4), %eax
	cmpl %ebx, %eax
	jle start_loop
	movl %eax, %ebx
	jmp start_loop

loop_exit:
	movl $1, %eax
	int $0x80
