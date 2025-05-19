.data

msg_input: .asciiz "Digite um n�mero inteiro: " # Mensagem para solicitar entrada

msg_output: .asciiz "Primeiro Valor: " # Mensagem para exibir o valor lido
nova_linha: .asciiz "\n"
msg2_output: .asciiz "Segundo Valor: " # Mensagem para exibir o valor lido

.text

.globl main

main:

# Exibir mensagem de entrada
li $v0, 4 # C�digo do servi�o para imprimir string (syscall 4)

la $a0, msg_input # Endere�o da string a ser impressa

syscall # Chamada do sistema para exibir mensagem

#msg2
li $v0, 4 # C�digo do servi�o para imprimir string (syscall 4)

la $a1, msg_input # Endere�o da string a ser impressa

syscall # Chamada do sistema para exibir mensagem

#msg1
# Ler n�mero inteiro do usu�rio
li $v0, 5 # C�digo do servi�o para ler inteiro (syscall 5)

syscall # Chamada do sistema para ler valor

move $t0, $v0 # Armazenar o valor lido em $t0

#msg2
# Ler n�mero inteiro do usu�rio
li $v0, 5 # C�digo do servi�o para ler inteiro (syscall 5)

syscall # Chamada do sistema para ler valor

move $t1, $v0 # Armazenar o valor lido em $t0


# Exibir mensagem de sa�da

li $v0, 4 # C�digo do servi�o para imprimir string (syscall 4)

la $a0, msg_output # Endere�o da string de sa�da

syscall # Chamada do sistema para imprimir mensagem

#exibir msg2
li $v0, 4 # C�digo do servi�o para imprimir string (syscall 4)

la $a1, msg2_output # Endere�o da string de sa�da

syscall # Chamada do sistema para imprimir mensagem

#msg1
# Exibir o valor digitado
li $v0, 1 # C�digo do servi�o para imprimir inteiro (syscall 1)

move $a0, $t0 # Mover o valor armazenado para o registrador de argumento

syscall # Chamada do sistema para exibir valor



# Finalizar programa

li $v0, 10 # C�digo do servi�o para encerrar o programa (syscall 10)

syscall # Chamada do sistema para finalizar

