.data

msg_input: .asciiz "insira valor a ser somado: "
msg: .asciiz "Valor atual: "

.text
.globl main

main:
# Exibir mensagem de entrada 
li $v0, 4 
la $a0, msg_input 
syscall # Chamada do sistema para exibir mensagem

# Ler número do usuário
li $v0, 5 # Código do serviço para ler inteiro (syscall 5)
syscall # Chamada do sistema para ler valor
move $t2, $v0 # Armazenar o valor lido em $t2

li $t0, 0 # contador
li $t1,	16 # limite supeior = 10
	
loop:
  bgt $t0, $t1, fim
  
  #exibir mensagem 
  li $v0, 4
  la $a0, msg
  syscall
  
  #exibie valor do contador
  li $v0, 1
  move $a0, $t0
  syscall
  
  #pula pra proxima linha
  li $v0, 11 #\n
  li $a0, 10
  syscall
  
  add $t0, $t0, $t1 #contador++
  
   # Repetir
   j loop

fim:
    # Finalizar programa
    li $v0, 10
    syscall
