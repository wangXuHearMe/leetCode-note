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
