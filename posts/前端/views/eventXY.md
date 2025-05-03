---
title: 事件坐标
date: 2025-05-03
category: 前端
tags: 
  - reviews
  - frontEnd
---

## 事件坐标属性

||border|滚动条|描述|
|--|--|--|--|
|clientXY|不包含|不包含|相对于浏览器可视区域的坐标，不包括边框和滚动条|
|offsetXY|包含|不包含|相对于目标元素的坐标，包括边框|
|pageXY|包含|包含|相对于整个文档的坐标，包括滚动部分|
|screenXY|包含|包含|相对于屏幕的坐标|

## 元素尺寸属性

### 尺寸关系
- 如果一个元素没有滚动条，那么它的 `scrollWidth` 和 `clientWidth` 应该是相等的，`scrollHeight` 和 `clientHeight` 也相等
- `offsetWidth` 和 `clientWidth` 相比，`offsetWidth` 还包含了 `border`
- `offsetHeight` 和 `clientHeight` 相比，`offsetHeight` 也包含了 `border`

### 尺寸属性对比

||content|padding|border|滚动条|
|--|--|--|--|--|
|clientWidth/Height|包含|包含|不包含|不包含|
|offsetWidth/Height|包含|包含|包含|不包含|
|scrollWidth/Height|包含|包含|不包含|包含内容溢出部分|

## 参考
> https://github.com/niexia/niexia.github.io/issues/41