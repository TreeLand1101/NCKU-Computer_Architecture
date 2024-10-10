.data
nums0:      
    .word 3, 0, 1  

nums1:      
    .word 0, 1 

nums2:      
    .word 9, 6, 4, 2, 3, 5, 7, 0, 1 

len_nums0:  
    .word 3

len_nums1:  
    .word 2 

len_nums2:  
    .word 9  

newline:    
    .asciz "\n"

.text
.globl main

main:
    # missing number of num0
    la a0, nums0
    lw a1, len_nums0
    jal ra, missing_number
    li a7, 1                        # System call code for print integer
    ecall

    la a0, newline
    li a7, 4                        # System call code for print string
    ecall

    # missing number of num1
    la a0, nums1
    lw a1, len_nums1 
    jal ra, missing_number 
    li a7, 1 
    ecall

    la a0, newline  
    li a7, 4  
    ecall

    # missing number of num2
    la a0, nums2 
    lw a1, len_nums2
    jal ra, missing_number
    li a7, 1 
    ecall

    la a0, newline
    li a7, 4
    ecall

end_main:
    li a7, 10                       # System call code for exit
    ecall

missing_number:
    li t0, 0                        # mask = 0
    li t1, 0                        # i = 0

loop_missing_number:
    beq t1, a1, end_missing_number  # if (i == n), exit loop
    lw t2, 0(a0)                    # Load nums[i]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums[i]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
    j loop_missing_number

end_missing_number:
    xor a0, t0, t1                  # mask ^ n
    ret
