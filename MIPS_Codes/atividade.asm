.data

valor1: .word 10

valor2: .word 5

.text

main:

lw $t0, valor1 # Carrega valor1 em $t0

lw $t1, valor2 # Carrega valor2 em $t1

add $t2, $t0, $t1 # Soma os dois valores

sw $t2, valor1 # Armazena o resultado em valor1
