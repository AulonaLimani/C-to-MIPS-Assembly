.text 
.globl main

largestProcedure:
addi $t0, $t0, 1			#i						
lw $t3, 0($a2)				#max arr[0]

forLoop:
lw $t4, 4($a2)				#arr[i]

slt $s0, $t0, $a1			
beq $s0, $zero, loopExit  	#if i < n jump to loopExit
slt $s1, $t3, $t4 
beq $s1, $zero, increment 	#if arr[i] < max jump to increment 

add $t3 ,$t4, $zero

increment:
addi $t0, $t0, 1			#i = i + 1
addi $a2, $a2, 4			
j forLoop

loopExit: 

add $v1, $t3, $zero
jr $ra

main:
addi $t1, $t1, 5			#n
la $t2, arr					#address of array ( address of first number in array)
add $a1, $t1, $zero			#n as parameter for function
add $a2, $t2, $zero			#address of array as parameter

jal largestProcedure

li $v0,4
la $a0,text 
syscall						#print text

li $v0, 1
move $a0, $v1
syscall						#print max value of array

.data 
arr: .word 10, 324, 45, 90, 9808
text: .asciiz "Largest in given array is "
