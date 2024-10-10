.data
    .align 4
    
float_nums:
    .word 0x4048F5C3  # 3.14f (IEEE 754 representation)
    .word 0xC048F5C3  # -3.14f
    .word 0x00000000  # 0.0f
    .word 0x80000000  # -0.0f
    .word 0x3F800000  # 1.0f
    .word 0xBF800000  # -1.0f
    .word 0x42F7E666  # 123.99f
    .word 0xC2F7E666  # -123.99f

newline:
    .asciz "\n" 

.text
.globl main

main:
    la t0, float_nums 
    li t1, 8                # number of elements in float_nums

loop:
    lw t2, 0(t0)            # float_nums[i]
    li t3, 0x7FFFFFFF       # clear the sign bit
    and t2, t2, t3          # float_nums[i] = float_nums[i] & 0x7FFFFFFF

    jal ra, print_float

    addi t0, t0, 4          # Next element
    addi t1, t1, -1         # t1--
    bnez t1, loop           # If (t1 != 0), continue the loop

    li a0, 0                # Exit status code
    li a7, 93               # System call for exit
    ecall 

print_float:
    li a7, 2    
    mv a0, t2  
    ecall  

    li a7, 4   
    la a0, newline
    ecall

    ret 
