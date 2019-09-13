#Program: This program will search a number in list and returns the index position
#
#
#Variables: Following regsiters will be used to store the values
#
# %edi: This register will contain the index of the number
# %eax: This register will contain the current number from the list
# %ebx: This register will contain the number to be searched
#
# data_items: This will contain the list of numbers
# search_number: This will contain the number to be searched
#
# Note: If no number is found it will return 0

.section .data
data_items:
	.long 34,56,34,45,67,78,89,999,123,456,789,0 
search_number:
	.long 89

.section .text

.globl _start
_start:
	movl $0, %edi
	movl data_items(,%edi,4), %eax
	movl search_number, %ebx

start_loop:
	cmpl $0, %eax
	je not_found
	cmpl %eax, %ebx
	je exit_loop
	incl %edi
	movl data_items(,%edi,4), %eax
	jmp start_loop

exit_loop:
	movl %edi, %ebx
	movl $1, %eax
	int $0x80

not_found:
	movl $0, %ebx
	movl $1, %eax
	int $0x80
