.data

msg_alunos: .asciiz "Insira quantidade de alunos: "

msg_faltas: .asciiz "Insira quantidade de faltas do aluno: "
msg_media: .asciiz "Insira a média do aluno: "

msg_output_faltas: .asciiz "Alunos reprovados por falta: "
msg_output_media: .asciiz "Alunos reprovados por media baixa: "
msg_output_aprovados: .asciiz "Alunos aprovados: "

.text

li $t0, 0

.globl main

main:

# Exibir msg_alunos
li $v0, 4
la $a0, msg_alunos
syscall

# Ler msg_alunos
li $v0, 5
syscall
move $t1, $v0

loop:

beq $t0, $t1, fim

# Exibir_msg _faltas
li $v0, 4
la $a0, msg_faltas
syscall

# Ler msg_falta
li $v0, 5
syscall
move $t2, $v0

# Exibir msg_media
li $v0, 4
la $a0, msg_media
syscall

# Ler msg_media
li $v0, 5
syscall
move $t3, $v0

	bgt $t2, 74, falta #faltas
	slti $t3, $t3, 6 #medias
	beq $t3, 1, media #medias
	j aprovados
	
	
falta:
addi $t4, $t4, 1
	addi $t0, $t0, 1
j loop

media:
addi $t5, $t5, 1
	addi $t0, $t0, 1
j loop 

aprovados:
addi $t6, $t6, 1
	addi $t0, $t0, 1
j loop 

fim:

# exibie valor de alunos faltas
li $v0, 4 
la $a0, msg_output_faltas
syscall	
li $v0, 1
move $a0, $t4
syscall

 
# exibie valor de alunos medias
li $v0, 11 #\n
  li $a0, 10
syscall
 
li $v0, 4 
la $a0, msg_output_media
syscall
li $v0, 1
move $a0, $t5
syscall

# exibie valor de alunos aprovados
li $v0, 11 #\n
  li $a0, 10
syscall

li $v0, 4 
la $a0, msg_output_aprovados
syscall
li $v0, 1
move $a0, $t6
syscall
	
li $v0, 10
