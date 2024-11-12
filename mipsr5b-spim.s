.set noreorder
.data
    prompt: .asciiz "Input an integer x:\n"
    result: .asciiz "Hanoi function(x) = "
.text
     # instructions follow this line   
     .globl main
	 
main:
	li $sp, 0x7fffeff0
	li        $v0, 4
	la        $a0, prompt
	syscall
	# read x
	li        $v0, 5
	syscall
	
	# function call
	move     $a0, $v0
	
	li       $t0, 1
	
	jal      hanoi       # jump to Hanoi and save position to $ra
	# move     $t0, $v0
	# show prompt
	li        $v0, 4
	la        $a0, result
	syscall
	# print the result
	li        $v0, 1        # system call #1 - print int
	move      $a0, $t0      # $a0 = $t0
	syscall                 # execute
	# return 0
	li        $v0, 10       # $v0 = 10
	syscall
	
.text
hanoi:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	beq $a0, 1, one
	addi $a0, $a0, -1
	sll $t0, $t0, 1
	addi $t0, $t0, 1
	jal hanoi
	
one:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra