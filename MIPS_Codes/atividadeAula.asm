.data 

msg_input1: .asciiz "Insira valor limite: "
msg_input2: .asciiz "Insira valores: "

msg_output: .asciiz "Atenção: Limite ultrapassado"

.text

li $t3, 0

.globl main

main:

# Exibir mensagem de entrada 1
li $v0, 4 # Código do serviço para imprimir string (syscall 4)
la $a0, msg_input1 # Endereço da string a ser impressa
syscall # Chamada do sistema para exibir mensagem

# Ler número limite do usuário
li $v0, 5 # Código do serviço para ler inteiro (syscall 5)
syscall # Chamada do sistema para ler valor
move $t0, $v0 # Armazenar o valor lido em $t0

loop:
# Insirir valores
li $v0, 4
la $a0, msg_input2
syscall

# Ler valores
li $v0, 5 # Código do serviço para ler inteiro (syscall 5)
syscall # Chamada do sistema para ler valor
move $t1, $v0 # Armazenar o valor lido em $t1
	
	beq $t3, 10, fim
	addi $t3, $t3, 1
	beq $t0, $t1, loop
	
	slt $t4, $t1, $t0
	bne $t4,1 , fimLoop
	j loop
	
fimLoop:

# imprime alerta
li $v0, 4 
la $a0, msg_output
syscall

fim:
# Finalizar programa
li $v0, 10 # Código do serviço para encerrar o programa (syscall 10)
syscall # Chamada do sistema para finalizar


