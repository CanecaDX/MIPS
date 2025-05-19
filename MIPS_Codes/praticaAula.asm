.data

msg_input: .asciiz "Digite um número inteiro: " # Mensagem para solicitar entrada

msg_output: .asciiz "Primeiro Valor: " # Mensagem para exibir o valor lido
nova_linha: .asciiz "\n"
msg2_output: .asciiz "Segundo Valor: " # Mensagem para exibir o valor lido

.text

.globl main

main:

# Exibir mensagem de entrada
li $v0, 4 # Código do serviço para imprimir string (syscall 4)

la $a0, msg_input # Endereço da string a ser impressa

syscall # Chamada do sistema para exibir mensagem

#msg2
li $v0, 4 # Código do serviço para imprimir string (syscall 4)

la $a1, msg_input # Endereço da string a ser impressa

syscall # Chamada do sistema para exibir mensagem

#msg1
# Ler número inteiro do usuário
li $v0, 5 # Código do serviço para ler inteiro (syscall 5)

syscall # Chamada do sistema para ler valor

move $t0, $v0 # Armazenar o valor lido em $t0

#msg2
# Ler número inteiro do usuário
li $v0, 5 # Código do serviço para ler inteiro (syscall 5)

syscall # Chamada do sistema para ler valor

move $t1, $v0 # Armazenar o valor lido em $t0


# Exibir mensagem de saída

li $v0, 4 # Código do serviço para imprimir string (syscall 4)

la $a0, msg_output # Endereço da string de saída

syscall # Chamada do sistema para imprimir mensagem

#exibir msg2
li $v0, 4 # Código do serviço para imprimir string (syscall 4)

la $a1, msg2_output # Endereço da string de saída

syscall # Chamada do sistema para imprimir mensagem

#msg1
# Exibir o valor digitado
li $v0, 1 # Código do serviço para imprimir inteiro (syscall 1)

move $a0, $t0 # Mover o valor armazenado para o registrador de argumento

syscall # Chamada do sistema para exibir valor



# Finalizar programa

li $v0, 10 # Código do serviço para encerrar o programa (syscall 10)

syscall # Chamada do sistema para finalizar

