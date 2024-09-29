#include <stdio.h>
#include <stdint.h>

static inline float fabsf(float x) {
    uint32_t i = *(uint32_t *)&x;
    i &= 0x7FFFFFFF;
    x = *(float *)&i;
    return x;
}

int main() {
    float values[] = {3.14f, -3.14f, 0.0f, -0.0f, 12345.67f, -98765.43f, 1.0f, -1.0f, 999.99f, -999.99f};
    int n = sizeof(values) / sizeof(values[0]);

    for (int i = 0; i < n; i++) {
        printf("Original: %.2f, Absolute: %.2f\n", values[i], fabsf(values[i]));
    }

    return 0;
}

