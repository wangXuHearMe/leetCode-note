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
/*
 1470. 重新排列数组
 给你一个数组 nums ，数组中有 2n 个元素，按 [x1,x2,...,xn,y1,y2,...,yn] 的格式排列。

 请你将数组按 [x1,y1,x2,y2,...,xn,yn] 格式重新排列，返回重排后的数组。
*/
int* shuffle(int* nums, int numsSize, int n, int* returnSize){
    int *ans = malloc(sizeof (int) * (numsSize));
/*
    做法1
 */
//    int k1 = 0, k2 = 1;
//    for (int i = 0; i < n; i++) {
//        ans[k1] = nums[i];
//        k1 = k1 + 2;
//    }
//    for (int i = n; i < numsSize; i++) {
//        ans[k2] = nums[i];
//        k2 = k2 + 2;
//    }
//    *returnSize = numsSize;
//    return ans;
/*
    做法2  这两个是一样的 一样的原理 只不过第二个做法代码比较简洁一点。
 */
    int temp = 0, i;
    for (i = 0; i < n; i++) {
        ans[temp++] = nums[i];
        ans[temp++] = nums[i + n];
    }
    *returnSize = numsSize;
    return ans;
}
/*
 1512. 好数对的数目
 给你一个整数数组 nums 。

 如果一组数字 (i,j) 满足 nums[i] == nums[j] 且 i < j ，就可以认为这是一组 好数对 。

 返回好数对的数目。
 输入：nums = [1,2,3,1,1,3]
 输出：4
 解释：有 4 组好数对，分别是 (0,3), (0,4), (3,4), (2,5) ，下标从 0 开始

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/number-of-good-pairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
int numIdenticalPairs(int* nums, int numsSize){
    int count = 0;
    for (int i = 0; i < numsSize - 1; i++) {
        for (int j = i + 1; j < numsSize; j++) {
            if (nums[i] == nums[j])
                count++;
        }
    }
    return count;
}
/*
 面试题 02.03. 删除中间节点
 实现一种算法，删除单向链表中间的某个节点（即不是第一个或最后一个节点），假定你只能访问该节点。

 输入：单向链表a->b->c->d->e->f中的节点c
 结果：不返回任何数据，但该链表变为a->b->d->e->f
 */
//void deleteNode(struct ListNode* node) {
//    struct ListNode *p = node->next;
//    node->val = node->next->val;
//    node->next = node->next->next;
//    free(p);
//}
        //一直出红error太烦了
/*
 剑指 Offer 10- II. 青蛙跳台阶问题
 
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
 */
int numWays(int n){
    if (n < 2) {
        return 1;
    }
    int a = 1, b = 1;
    for (int i = 2; i <= n; i++) {
        int temp = (a + b) % 1000000007;
        a = b;
        b = temp;
    }
    return b;
}
/*
 70. 爬楼梯
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。
 */
int climbStairs(int n){
    int arr[1000];
    arr[0] = 1;
    arr[1] = 1;
    for (int i = 2; i <= n; i++) {
        arr[i] = arr[i - 1] + arr[i - 2];
    }
    return arr[n];
}
/*
 LCP 17. 速算机器人
 小扣在秋日市集发现了一款速算机器人。店家对机器人说出两个数字（记作 x 和 y），请小扣说出计算指令：

 "A" 运算：使 x = 2 * x + y；
 "B" 运算：使 y = 2 * y + x。
 在本次游戏中，店家说出的数字为 x = 1 和 y = 0，小扣说出的计算指令记作仅由大写字母 A、B 组成的字符串 s，字符串中字符的顺序表示计算顺序，请返回最终 x 与 y 的和为多少。
 */
int calculate(char* s){
    int x = 1, y = 0;
    for (int i = 0; i < strlen(s); i++) {
        if (s[i] == 'A') {
            x = 2 * x + y;
        } else if (s[i] == 'B') {
            y = 2 * y + x;
        }
    }
    return x + y;
}
/*
 剑指 Offer 42. 连续子数组的最大和
 
 输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。

 要求时间复杂度为O(n)。
 */
int maxSubArray(int* nums, int numsSize){
    int answer = nums[0], number = nums[0];
    for (int i = 1; i < numsSize; i++) {
        if (number + nums[i] < nums[i]) {
            number = nums[i];
        } else {
            number = nums[i] + number;
        }
        if (answer < number) {
            answer = number;
        }
    }
    return answer;
}
/*
 27. 移除元素
 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。

 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。

 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素
 */
int removeElement(int* nums, int numsSize, int val){
    for (int i = 0; i < numsSize - 1; i++) {
        for (int j = 0; j < numsSize - i - 1; j++) {
            if (nums[j] > nums[j + 1]) {
                int temp = nums[j + 1];
                nums[j + 1] = nums[j];
                nums[j] = temp;
            }
        }
    }
    int count = 0, intex = 0;
    for (int i = 0; i < numsSize; i++) {
        if (nums[i] == val) {
            intex = i;
            break;
        }
    }
    for (int i = 0; i < numsSize; i++) {
        if (nums[i] == val) {
            count++;
        }
    }
    int numerCount = 1;
    for (int i = numsSize - 1; numerCount <= count; i--) {
            int temp = nums[i];
            nums[i] = nums[intex];
            nums[intex] = temp;
            intex++;
            numerCount++;
    }
    return numsSize - count;
}
/*
 771. 宝石与石头
  给定字符串J 代表石头中宝石的类型，和字符串 S代表你拥有的石头。 S 中每个字符代表了一种你拥有的石头的类型，你想知道你拥有的石头中有多少是宝石。

 J 中的字母不重复，J 和 S中的所有字符都是字母。字母区分大小写，因此"a"和"A"是不同类型的石头。
 */
int numJewelsInStones(char * J, char * S){
    int count = 0;
    for (int i = 0; i < strlen(J); i++) {
        for (int j = 0; j < strlen(S); j++) {
            if (J[i] == S[j])
                count++;
        }
    }
    return count;
}
/*
 剑指 Offer 55 - I. 二叉树的深度
 输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。
 */
//int maxDepth(struct TreeNode* root){
//    if (root == NULL)
//        return 0;
//    int lenLeft = maxDepth(root->left) + 1;
//    int lenRight = maxDepth(root->right) + 1;
//    return lenLeft > lenRight ? lenLeft : lenRight;
//}
/*
 121. 买卖股票的最佳时机
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

 如果你最多只允许完成一笔交易（即买入和卖出一支股票一次），设计一个算法来计算你所能获取的最大利润。

 注意：你不能在买入股票前卖出股票。
 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 */
int maxProfit(int* prices, int pricesSize){
    int min = 10086;
    int max = 0;
    for (int i = 0; i < pricesSize; i++) {
        if (prices[i] < min) {
            min = prices[i];
        } else {
            max = (prices[i] - min) > max ? (prices[i] - min) : max;
        }
    }
    return max;
}
/*
 1662. 检查两个字符串数组是否相等
 给你两个字符串数组 word1 和 word2 。如果两个数组表示的字符串相同，返回 true ；否则，返回 false 。

 数组表示的字符串 是由数组中的所有元素 按顺序 连接形成的字符串。
 */
//bool arrayStringsAreEqual(char ** word1, int word1Size, char ** word2, int word2Size){
//    if (word1 == NULL || word2 == NULL) {
//        return false;
//    }
//    char wordOne[1000], wordTwo[1000];
//    strcpy(wordOne, word1[0]);
//    strcpy(wordTwo, word2[0]);
//    for (int i = 1; i < word1Size; i++) {
//        strcat (wordOne, word1[i]);
//    }
//    for (int i = 1; i < word2Size; i++) {
//        strcat (wordTwo, word2[i]);
//    }
//    if (strcmp (wordOne, wordTwo) == 0)
//        return true;
//    else
//        return false;
//}
/*
 34. 在排序数组中查找元素的第一个和最后一个位置
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 如果数组中不存在目标值 target，返回 [-1, -1]。
 */
int* searchRange(int* nums, int numsSize, int target, int* returnSize){
    int count = 0, tag = -1, i;
    int* answer = malloc(sizeof(int) * 2);
    if (nums == NULL) {
        *returnSize = 2;
        answer[0] = answer[1] = -1;
        return answer;
    }
    for (i = 0; i < numsSize; i++) {
        if (nums[i] == target) {
            tag = i;
            count++;
        }
    }
    *returnSize = 2;
    if (tag == -1) {
        answer[0] = -1;
        answer[1] = -1;
        return answer;
    } else {
        answer[0] = tag - count + 1;
        answer[1] = tag;
        return answer;
    }
}
/*
35. 搜索插入位置
给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

你可以假设数组中无重复元素
*/
int searchInsert(int* nums, int numsSize, int target){
//    int numsIntex;
//    for (int i = 0; i < numsSize; i++) {
//        if (nums[i] == target) {
//            numsIntex = i;
//            return numsIntex;
//        } else {
//            if (target > nums[i]) {
//                numsIntex = i + 1;
//            } else {
//                numsIntex = i;
//                return numsIntex;
//            }
//        }
//    }
//    return numsIntex;
    int i = 0;
    for (i = 0; i < numsSize && nums[i] < target; i++) {
        if (nums[i] == target)
            return i;
    }
    return i;
}
/*
28. 实现 strStr()
实现 strStr() 函数。

给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。
*/
int strStr(char * haystack, char * needle){
    if (strlen(needle) == 0) {
        return 0;
    }
    int i = 0;
    for (; i < strlen(haystack); i++) {
        if (strlen(haystack) - i < strlen(needle))
            return -1;
        int temp1 = i, temp2 = 0;
        while (haystack[temp1++] == needle[temp2++]) {
            if (temp2 == strlen(needle)) {
                return i;
            }
        }
    }
    return -1;
}
/*
 204. 计数质数

 统计所有小于非负整数 n 的质数的数量。
 */
int count (int k) {
    for (int i = 2; i * i <= k; i++) {
        if (k % i == 0) {
            return 0;
        }
    }
    return 1;
}
int countPrimes(int n){
    int answer = 0;
    for (int i = 2; i < n; i++) {
        answer = answer + count(i);
    }
    return answer;
}
//int countPrimes(int n) {
//if(n == 0 || n == 1)
//    return 0;
//int *isPrime = (int*)malloc(sizeof(int) * n);
//memset(isPrime, 0, sizeof(int) * n);
//int i, j, cnt = 0;
//for(i = 2; i < n; i++){
//    if(isPrime[i] == 0){
//        cnt++;
//        for(j = i + i; j < n; j += i){  //筛去i的倍数
//            isPrime[j] = 1;
//        }
//    }
//}
//return cnt;
//}
/*
 剑指 Offer 21. 调整数组顺序使奇数位于偶数前面

 输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。
 */
int* exchange(int* nums, int numsSize, int* returnSize){
    int *answer = malloc(sizeof(int) * numsSize), index = 0;
    for (int i = 0; i < numsSize; i++) {
        if (nums[i] % 2 != 0) {
            answer[index++] = nums[i];
        }
    }
    for (int i = 0 ; i < numsSize; i++) {
        if (nums[i] % 2 == 0) {
            answer[index++] = nums[i];
        }
    }
    *returnSize = numsSize;
    return answer;
}
/*
 剑指 Offer 50. 第一个只出现一次的字符

 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。
 */
char firstUniqChar(char* s){
    int hash[26] = {0}, len = strlen(s);
    for (int i = 0; i < len; i++) {
        hash[s[i] - 'a']++;
    }
    for (int i = 0; i < len; i++) {
        if (hash[s[i] - 'a'] == 1) {
            return s[i];
        }
    }
    return ' ';
}
/*
 剑指 Offer 10- I. 斐波那契数列
 
 写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项。斐波那契数列的定义如下：

 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
 */
int fib(int n){
    if (n == 0) {
        return 0;
    } if (n == 1) {
        return 1;
    }
    int a = 0, b = 1, answer = 0;
    for (int i = 2; i <= n; i++) {
        answer = (a + b) % 1000000007;
        a = b;
        b = answer;
    }
    return answer;
}
/*
 剑指 Offer 64. 求1+2+…+n

 求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。
 */
int sumNums(int n) {
    n && (n += sumNums(n - 1));
    return n;
}
/*
 剑指 Offer 03. 数组中重复的数字

 找出数组中重复的数字。


 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字
 */
int findRepeatNumber(int* nums, int numsSize){
    int hash[100000] = {0}, i = 0;
    for (; i < numsSize; i++) {
        if (0 == hash[nums[i]]) {
            hash[nums[i]] = 1;
        } else {
            return nums[i];
        }
    }
    return -1;
}
1
