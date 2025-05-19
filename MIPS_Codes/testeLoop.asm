.data
msg: .asciiz "Valor atual: "   # Mensagem prefixo para cada valor

.text
.globl main

main:
    li $t0, 1          # $t0 = contador = 1 (início do loop)
    li $t1, 10         # $t1 = limite superior = 10

loop:
    bgt $t0, $t1, fim  # Se contador > 10, sai do loop

    # Exibir mensagem "Valor atual: "
    li $v0, 4
    la $a0, msg
    syscall

    # Exibir o valor do contador
    li $v0, 1
    move $a0, $t0
    syscall

    # Pular para próxima linha (imprimir '\n')
    li $v0, 11
    li $a0, 10         # Código ASCII de '\n'
    syscall

    # Incrementar contador
    addi $t0, $t0, 1   # contador++

    # Repetir
    j loop

fim:
    # Finalizar programa
    li $v0, 10
    syscall