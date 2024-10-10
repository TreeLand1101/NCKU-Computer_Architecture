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

nums0_missing_number:
    la a0, nums0
    li t0, 0                        # mask = 0
    li t1, 0                        # i = 0
    
    lw t2, 0(a0)                    # Load nums0[0]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums0[0]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
    
    lw t2, 0(a0)                    # Load nums0[1]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums0[1]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++

    lw t2, 0(a0)                    # Load nums0[2]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums0[2]
    addi t1, t1, 1                  # i++
    
    xor a0, t0, t1                  # mask ^ n

    li a7, 1                        # System call code for print integer
    ecall

    la a0, newline
    li a7, 4                        # System call code for print string
    ecall

nums1_missing_number:
    la a0, nums1
    li t0, 0                        # mask = 0
    li t1, 0                        # i = 0

    lw t2, 0(a0)                    # Load nums1[0]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums1[0]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
        
    lw t2, 0(a0)                    # Load nums1[1]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums1[1]
    addi t1, t1, 1                  # i++
    
    xor a0, t0, t1                  # mask ^ n

    li a7, 1
    ecall

    la a0, newline  
    li a7, 4  
    ecall

nums2_missing_number:
    la a0, nums2
    li t0, 0                        # mask = 0
    li t1, 0                        # i = 0
    
    lw t2, 0(a0)                    # Load nums2[0]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums2[0]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
        
    lw t2, 0(a0)                    # Load nums2[1]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums2[1]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
        
    lw t2, 0(a0)                    # Load nums2[2]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums2[2]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
        
    lw t2, 0(a0)                    # Load nums2[3]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums2[3]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
        
    lw t2, 0(a0)                    # Load nums2[4]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums2[4]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
        
    lw t2, 0(a0)                    # Load nums2[5]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums2[5]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
        
    lw t2, 0(a0)                    # Load nums2[6]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums2[6]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
        
    lw t2, 0(a0)                    # Load nums2[7]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums2[7]
    addi a0, a0, 4                  # Next element
    addi t1, t1, 1                  # i++
    
    lw t2, 0(a0)                    # Load nums2[8]
    xor t0, t0, t1                  # mask = mask ^ i
    xor t0, t0, t2                  # mask = mask ^ nums2[8]
    addi t1, t1, 1                  # i++
    
    xor a0, t0, t1                  # mask ^ n

    li a7, 1 
    ecall

    la a0, newline
    li a7, 4
    ecall

end_main:
    li a7, 10                       # System call code for exit
    ecall