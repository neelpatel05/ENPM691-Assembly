#Program: This program checks the number is prime or not. This program checks number 23

.section .data
.equ LINUX_EXIT_CALL, 0x80
.equ NUMBER, 23

.section .text

.globl _start
_start:
	movl $2, %ebx

prime_loop:
	cmpl $NUMBER, %ebx
	je prime_exit

	movl $NUMBER, %eax

	movl $0, %edx
	movl %ebx, %ecx
	divl %ecx

	cmpl $0, %edx
	je not_prime_exit

	incl %ebx
	jmp prime_loop

prime_exit:
	movl $1, %ebx
	movl $1, %eax
	int $LINUX_EXIT_CALL

not_prime_exit:
	movl $0, %ebx
	movl $1, %eax
	int $LINUX_EXIT_CALL

