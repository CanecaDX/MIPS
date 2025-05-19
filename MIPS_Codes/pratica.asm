.data
 a: .word 2
 b: .word 3
 c: .word 1
.text
inicio: lw $s1,a
lw $s2,b
add $s0,$s1,$s2
sw $s0,c
j inicio
