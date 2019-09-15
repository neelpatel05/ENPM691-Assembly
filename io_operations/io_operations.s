#Program: This program demonstrates the io operations at assembly level in a computer

.section .data

.section .bss
.equ BUFFER_SIZE, 1024
.equ BUFFER, BUFFER_SIZE

.section .text

.globl _start
_start:
	popl %ebx
	popl %ebx
	popl %ebx

	movl $5, %eax
	movl $0, %ecx
	int $0x80

	movl 3, %eax
	movl %eax, %ebx
	movl BUFFER, %ecx
	movl BUFFER_SIZE, %edx
	int $0x80

	movl $4, %eax
	movl $1, %ebx
	movl BUFFER, %ecx
	int  $0x80

	movl $1, %eax
	movl $0, %ebx
	int $0x80
