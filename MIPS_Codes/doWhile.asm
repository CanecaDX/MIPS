# 	...
#	a = 0;
#	while (a < 10) {
#	a = a + 1
#	}

.text 
	li $t0, 0

loop: 
	beq $t0, 10, fimLoop
	addi $t0, $t0, 1
	j loop

fimLoop: