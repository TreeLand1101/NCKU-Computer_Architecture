#include <stdio.h>

int missingNumber(int* nums, int n) {
    int mask = 0, i = 0;
    for (i = 0; i < n; i++) {
        mask = mask ^ i ^ nums[i];
    }
    return mask ^ i;
}

int main() {
    int nums1[] = {3, 0, 1};
    int nums2[] = {0, 1};
    int nums3[] = {9, 6, 4, 2, 3, 5, 7, 0, 1};
    
    printf("%d\n", missingNumber(nums1, sizeof(nums1) / sizeof(nums1[0])));  // Expected missing number is 2
    printf("%d\n", missingNumber(nums2, sizeof(nums2) / sizeof(nums2[0])));  // Expected missing number is 2
    printf("%d\n", missingNumber(nums3, sizeof(nums3) / sizeof(nums3[0])));  // Expected missing number is 8

    return 0;
}

