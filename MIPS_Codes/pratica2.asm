.data
 a: .word 2
 b: .word 3
 c: .word 1
str1:  .asciiz "Valor de a = "
str2:  .asciiz "Valor de b = "
str3:  .asciiz "Valor de c = "
.text

#sa�da
li $v0,4 #Sa�da (String)
la $a0,str1
syscall

#entrada de dados
li $v0,5 #Entrada (Int)
syscall
sw $v0,a

#sa�da
li $v0,4 #Sa�da (String)
la $a0,str2
syscall

#entrada de dados
li $v0,5 #Entrada (Int)
syscall
sw $v0,b

#transfer�ncia de dados
lw $t0,a
lw $t1,b

#processamento
add $t2,$t0,$t1 #c=a+b

#transfer�ncia de dados
sw $t2,c

#sa�da
li $v0,4 #Sa�da (String)
la $a0,str3
syscall

#sa�da
li $v0,1 #Sa�da (Int)
addi $a0,$t2,0
syscall