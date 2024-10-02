#include <stdio.h>
#include <stdint.h>

static inline int my_clz(uint32_t x) {
    int count = 0;
    for (int i = 31; i >= 0; --i) {
        if (x & (1U << i))
            break;
        count++;
    }
    return count;
}

int main() {
    
    int test_case[] = {0, 1, 1024};

    // Test case 1: Input 0, binary: 00000000 00000000 00000000 00000000, Expected: 32
    // Test case 2: Input 1, binary: 00000000 00000000 00000000 00000001, Expected: 31
    // Test case 3: Input 1024, binary: 00000000 00000000 00000100 00000000, Expected: 21

    for (int i = 0; i < 3; ++i) {
        printf("%d\n", my_clz(test_case[i]));
    }

    return 0;
}

