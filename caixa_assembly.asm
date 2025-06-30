#Desenvolvimento de Sistema Simplificado para Caixa Eletr�nico

.data

valor_sacado: .word 0

#Mensagens de input
msg_v: .asciiz "Insira o valor da c�dula (Ou zero para encerrar): "
msg_q: .asciiz "Insira a quantidade de c�dulas: "
msg_v2: .asciiz "Insira o valor da segunda c�dula (Ou zero para encerrar): "
msg_q2: .asciiz "Insira a quantidade de c�dulas: "
msg_s: .asciiz "Insira o valor que deseja sacar (Ou zero para encerrar): "

#Mensagens de situa��o
msg_f: .asciiz "Valor indisponivel para saque. "
msg_f2: .asciiz "Configura��o encerrada. "
msg_f3: .asciiz "Saque conclu�do. "
msg_f4: .asciiz "Modo configura��o. "
msg_f5: .asciiz "Modo saque."
msg_f6: .asciiz "Saque encerrado."

#Mensagens de output
msg_re: .asciiz "Valor sacado: "
msg_re2: .asciiz "Quantidade de c�dulas: "
msg_re3: .asciiz "C�dula usada: "

.text

.globl main

main:
# Exibir_msg _f4
li $v0, 4
la $a0, msg_f4
syscall
 
# Exibir msg_v
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4
la $a0, msg_v
syscall
# Ler msg_v
li $v0, 5
syscall
move $t1, $v0
beqz $t1, fim2

# Exibir msg_q
li $v0, 4
la $a0, msg_q
syscall
# Ler msg_q
li $v0, 5
syscall
move $t2, $v0

# Exibir msg_v2
li $v0, 4
la $a0, msg_v2
syscall
# Ler msg_v2
li $v0, 5
syscall
move $t3, $v0
beqz $t2, fim2

# Exibir msg_q2
li $v0, 4
la $a0, msg_q2
syscall
# Ler msg_q2
li $v0, 5
syscall
move $t4, $v0


#Modo saque
# Exibir_msg _f5
li $v0, 4
la $a0, msg_f5
syscall

loop:
# Exibir_msg _s
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4
la $a0, msg_s
syscall

# Ler msg_s
li $v0, 5
syscall
move $t0, $v0
beqz $t0, fim3

la $t9, valor_sacado   # $t9 aponta pro endere�o
sw $t0, 0($t9)

cedula1:
blt $t0, $t1, cedula2 #verica se o valor solicitado � maior que o disponivel 
div $t0, $t1 #divide o valor do saque pelo valor disponivel em c�dula
mflo $t5 #move o quociente da divis�o para um registrador tempo
bgt $t5, $t2, cedula2 #se o quociente for maior que a quantidade disponivel ele pula pro fim
mul $t7, $t5, $t1
sub $t0, $t0, $t7 #valor restante
sub $t2, $t2, $t5
beqz $t0, ce1
j cedula2.1

cedula2:
blt $t0, $t3, fim #verica se o valor solicitado � maior que o disponivel 
div $t0, $t3 #divide o valor do saque pelo valor disponivel em c�dula
mflo $t6 #move o quociente da divis�o para um registrador tempo
bgt $t6, $t4, fim #se o quociente for maior que a quantidade disponivel ele pula pro fim
mul $t8, $t6, $t3
sub $t0, $t0, $t8
sub $t4, $t4, $t6
beqz $t0, ce2
j cedula2

cedula2.1:
blt $t0, $t3, fim #verica se o valor solicitado � maior que o disponivel 
div $t0, $t3 #divide o valor do saque pelo valor disponivel em c�dula
mflo $t6 #move o quociente da divis�o para um registrador tempo
bgt $t6, $t4, fim #se o quociente for maior que a quantidade disponivel ele pula pro fim
mul $t8, $t6, $t3
sub $t0, $t0, $t8
sub $t4, $t4, $t6
beq $t0, $zero, ce3
j fim

ce1:
# Exibir_msg _f3
li $v0, 4
la $a0, msg_f3
syscall

# exibe valor sacado
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re
syscall	
lw $a0, 0($t9)
li $v0, 1
syscall

# exibe nota usada
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re3
syscall	
move $a0, $t1
li $v0, 1
syscall

# exibe total de notas
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re2
syscall	
li $v0, 1
move $a0, $t5
syscall

j loop

ce2:
# Exibir_msg _f3
li $v0, 4
la $a0, msg_f3
syscall

# exibe valor sacado
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re
syscall	
lw $a0, 0($t9)
li $v0, 1
syscall

# exibe nota usada
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re3
syscall	
move $a0, $t3
li $v0, 1
syscall

# exibe total de notas
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re2
syscall	
li $v0, 1
move $a0, $t6
syscall

j loop

ce3:
# Exibir_msg _f3
li $v0, 4
la $a0, msg_f3
syscall

# exibe valor sacado
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re
syscall	
lw $a0, 0($t9)
li $v0, 1
syscall

# exibe nota usada
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re3
syscall	
move $a0, $t1
li $v0, 1
syscall

# exibe total de notas
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re2
syscall	
li $v0, 1
move $a0, $t5
syscall

# exibe nota usada
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re3
syscall	
move $a0, $t3
li $v0, 1
syscall

# exibe total de notas
li $v0, 11 #\n
li $a0, 10
syscall
li $v0, 4 
la $a0, msg_re2
syscall	
li $v0, 1
move $a0, $t6
syscall

j loop

fim:
# Exibir_msg _f
li $v0, 4
la $a0, msg_f
syscall
li $v0, 10
syscall

fim2:
# Exibir_msg _f
li $v0, 4
la $a0, msg_f2
syscall
li $v0, 10
syscall

fim3:
# Exibir_msg _f
li $v0, 4
la $a0, msg_f6
syscall
li $v0, 10
syscall