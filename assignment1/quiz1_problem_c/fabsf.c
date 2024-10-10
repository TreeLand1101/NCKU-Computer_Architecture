#include <stdio.h>
#include <stdint.h>

static inline float fabsf(float x) {
    uint32_t i = *(uint32_t *)&x;
    i &= 0x7FFFFFFF;
    x = *(float *)&i;
    return x;
}

int main() {
    float float_nums[] = {3.14f, -3.14f, 0.0f, -0.0f, 1.0f, -1.0f, 123.99f, -123.99f};
    int n = sizeof(float_nums) / sizeof(float_nums[0]);
    for (int i = 0; i < n; i++) {
        printf("%f\n", fabsf(float_nums[i]));
    }
    return 0;
}
