---
date: 2025-07-23
title: 贪心
category: 算法
tags:
  - greed
  - algorithm
---

## 455. 分发饼干

```js
/**
 * @param {number[]} g 小孩
 * @param {number[]} s 饼干
 * @return {number}
 */
var findContentChildren = function (g, s) {
  g = g.sort((a, b) => b - a);
  s = s.sort((a, b) => b - a);
  let sIndex = 0;
  let result = 0;

  for (let i = 0; i < g.length; i++) {
    if (s[sIndex] >= g[i]) {
      result++;
      sIndex++;
    }
  }
  return result;
};

const g = [1, 2];
const s = [1, 2, 3];
```

## 53.最大子序和

```js
var maxSubArray = function(nums) {
    let result = -Infinity
    let count = 0
    for(let i = 0; i < nums.length; i++) {
        count += nums[i]
        if(count > result) {
            result = count
        }
        if(count < 0) {
            count = 0
        }
    }
    return result
};
```

## 376.摆动序列

```js
var wiggleMaxLength = function (nums) {
  if (nums.length <= 1) return nums.length
  let result = 1
  let preDiff = 0
  let curDiff = 0
  for (let i = 0; i < nums.length - 1; i++) {
    curDiff = nums[i + 1] - nums[i]
    if ((curDiff > 0 && preDiff <= 0) || (curDiff < 0 && preDiff >= 0)) {
      result++
      preDiff = curDiff
    }
  }
  return result
};
```

## 122. 买卖股票的最佳时机 II

```js
var maxProfit = function (prices) {
  let result = 0;
  let next = 0;
  let cur = 0;

  while (cur < prices.length - 1) {
    if (prices[cur] < prices[cur + 1]) {
      next = cur + 1;
      while (next < prices.length - 1 && prices[next] < prices[next + 1]) {
        next++;
      }
      result += prices[next] - prices[cur]
      cur = next + 1;
    } else {
      cur++;
    }
  }
  return result;
};
```

## 55. 跳跃游戏

```js
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canJump = function (nums) {
  if (nums.length === 1) return true;
  let cover = 0;
  for (let i = 0; i <= cover; i++) {
    cover = Math.max(cover, i + nums[i]);
    if (cover >= nums.length - 1) {
      return true;
    }
  }
  return false;
};
```


## 45. 跳跃游戏 II

```js
var jump = function (nums) {
  let curIndex = 0
  let nextIndex = 0
  let steps = 0
  for (let i = 0; i < nums.length - 1; i++) {
    nextIndex = Math.max(nums[i] + i, nextIndex)
    if (i === curIndex) {
      curIndex = nextIndex
      steps++
    }
  }

  return steps
};
```