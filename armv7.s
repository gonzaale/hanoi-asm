.text

hanoi:
	@ Result is stored in r1
	
	push {lr}
	
	cmp r0, #1
	beq one
	add r0, r0, #-1
	lsl r1, r1, #1
	add r1, r1, #1
	bl hanoi
	
one:
	pop {lr}
	bx lr

.global _start
_start:
	ldr	sp, =stack_loc
	mov	r0, #4
	mov r1, #1
	bl	hanoi
	
STOP: B STOP

.data
	.EQU	stack_loc, 0x20001000
.end