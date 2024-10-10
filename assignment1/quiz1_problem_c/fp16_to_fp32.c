#include <stdio.h>
#include <stdint.h>

static inline uint32_t fp16_to_fp32(uint16_t h) {
    const uint32_t w = (uint32_t)h << 16;
    const uint32_t sign = w & UINT32_C(0x80000000);
    const uint32_t nonsign = w & UINT32_C(0x7FFFFFFF);
    uint32_t renorm_shift = __builtin_clz(nonsign);
    renorm_shift = renorm_shift > 5 ? renorm_shift - 5 : 0;
    const int32_t inf_nan_mask = ((int32_t)(nonsign + 0x04000000) >> 8) & INT32_C(0x7F800000);
    const int32_t zero_mask = (int32_t)(nonsign - 1) >> 31;

    return sign | ((((nonsign << renorm_shift >> 3) +
            ((0x70 - renorm_shift) << 23)) | inf_nan_mask) & ~zero_mask);
}

void test_fp16_to_fp32(uint16_t h) {
    uint32_t result = fp16_to_fp32(h);
    printf("fp16: 0x%04X, fp32: 0x%08X\n", h, result);
}

int main() {
    uint16_t test_cases[] = {
        0x3C00,  // 1.0 in half-precision
        0x4000,  // 2.0 in half-precision
        0x4040,  // 3.0 in half-precision
        0x0000,  // +0.0 in half-precision
        0x8000,  // -0.0 in half-precision
        0x7C00,  // +Inf in half-precision
        0xFC00,  // -Inf in half-precision
        0x7E00,  // NaN in half-precision
        0xB800,  // -2.0 in half-precision
        0x0400   // Very small positive number in half-precision
    };

    int num_tests = sizeof(test_cases) / sizeof(test_cases[0]);
    for (int i = 0; i < num_tests; i++) {
        test_fp16_to_fp32(test_cases[i]);
    }

    return 0;
}
