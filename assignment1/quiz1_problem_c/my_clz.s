.data
num_test_cases: 
    .word 3

test_case_array: 
    .word 0, 1, 1024
    
newline:
    .asciz "\n" 

.text
.globl main

main:
    la t0, num_test_cases 
    lw t1, 0(t0)
    la t0, test_case_array
    li t2, 0  

loop_main:
    beq t1, t2, end_main    # if (i == number) of test cases, exit loop
    lw a0, 0(t0)            # test_case[i]

    jal ra, my_clz

    li a7, 1                # System call code for print integer
    ecall

    la a0, newline  
    li a7, 4                # System call code for print string
    ecall

    addi t0, t0, 4          # Next test_case
    addi t2, t2, 1          # i++
    j loop_main

end_main:
    li a7, 10               # System call code for exit
    ecall

my_clz:
    li t3, 31               # i = 31
    li t4, 0                # count = 0

loop_my_clz:
    li t5, 1                # t5 = 1
    sll t5, t5, t3          # t5 = 1 << i
    and t5, a0, t5          # t5 = x & (1 << i)
    bnez t5, end_my_clz     # if ((x & (1 << i)) != 0), exit loop
    addi t4, t4, 1          # count++
    addi t3, t3, -1         # i--
    bltz t3, end_my_clz     # if (i < 0), exit loop
    j loop_my_clz 

end_my_clz:
    mv a0, t4               # return count
    ret 
