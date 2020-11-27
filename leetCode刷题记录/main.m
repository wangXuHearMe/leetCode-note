//
//  main.m
//  leetCode刷题记录
//
//  Created by 王旭 on 2020/11/27.
//
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
/* 1480. 一维数组的动态和
 给你一个数组 nums 。数组「动态和」的计算公式为：runningSum[i] = sum(nums[0]…nums[i]) 。

 请返回 nums 的动态和。
*/
int* runningSum(int* nums, int numsSize, int* returnSize){
    for (int i = 1; i < numsSize; i++) {
        nums[i] = nums[i] + nums[i - 1];
    }
    *returnSize = numsSize;
    return nums;
}
/*1221. 分割平衡字符串
 在一个「平衡字符串」中，'L' 和 'R' 字符的数量是相同的。

 给出一个平衡字符串 s，请你将它分割成尽可能多的平衡字符串。

 返回可以通过分割得到的平衡字符串的最大数量。
*/
int balancedStringSplit(char * s){
/*
    做法1
*/
    // int count = 0, i = 0, sign = 0;
    // while (s[i]) {
    //     // if (s[i] == 'L') {
    //     //     i++;
    //     //     sign++;
    //     // } else {
    //     //     i++;
    //     //     sign--;
    //     // }
    //     sign = s[i] == 'L' ? sign + 1 : sign - 1;
    //     i++;
    //     if (sign == 0) {
    //         count++;
    //     }
    // }
    // return count;
/*
    做法2
*/
    int result = 0, left = 0, right = 0, len = strlen(s);
    for (int i = 0; i < len; i++) {
        if (s[i] == 'L') {
            left++;
        } else {
            right++;
        }
        if (left == right) {
            result++;
        }
    }
    return result;
}
/*
 剑指 Offer 58 - II. 左旋转字符串
 字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。
*/
char* reverseLeftWords(char* s, int n){
    int len = strlen(s), k = 0;
    char* ans = malloc(sizeof (char) * (len + 1));
    for (int i = n; i < len; i++) {
        ans[k++] = s[i];
    }
    for (int i = 0; i < n; i++) {
        ans[k++] = s[i];
    }
    ans[k++] = '\0';
    return ans;
    //最后一个字符是结束符
}
