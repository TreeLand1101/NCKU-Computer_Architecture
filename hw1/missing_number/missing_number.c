#include <stdio.h>

int missingNumber(int* nums, int n) {
    int mask = 0, i = 0;
    for (i = 0; i < n; i++) {
        mask = mask ^ i ^ nums[i];
    }
    return mask ^ i;
}

void printArray(int* nums, int n) {
    printf("Array: [");
    for (int i = 0; i < n; i++) {
        printf("%d", nums[i]);
        if (i < n - 1) {
            printf(", ");
        }
    }
    printf("]\n");
}

void test_case(int* nums, int n, int expected) {
    printArray(nums, n);
    int result = missingNumber(nums, n);
    printf("Missing number: %d, Expected: %d\n\n", result, expected);
}

int main() {
    int nums1[] = {3, 0, 1};
    int nums2[] = {0, 1};
    int nums3[] = {9, 6, 4, 2, 3, 5, 7, 0, 1};
    int nums4[] = {0};
    
    test_case(nums1, 3, 2);  // Expected missing number is 2
    test_case(nums2, 2, 2);  // Expected missing number is 2
    test_case(nums3, 9, 8);  // Expected missing number is 8
    test_case(nums4, 1, 1);  // Expected missing number is 1

    return 0;
}

