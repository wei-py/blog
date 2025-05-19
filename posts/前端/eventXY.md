---
title: 事件坐标
date: 2025-05-03
category: 前端
tags:
  - frontEnd
description: 事件坐标
---

## 事件坐标属性

|          | border | 滚动条 | 描述                                           |
| -------- | ------ | ------ | ---------------------------------------------- |
| clientXY | 不包含 | 不包含 | 相对于浏览器可视区域的坐标，不包括边框和滚动条 |
| offsetXY | 包含   | 不包含 | 相对于目标元素的坐标，包括边框                 |
| pageXY   | 包含   | 包含   | 相对于整个文档的坐标，包括滚动部分             |
| screenXY | 包含   | 包含   | 相对于屏幕的坐标                               |

### 使用场景

- `clientXY`: 适用于需要相对于视口位置的操作，如固定定位元素
- `offsetXY`: 适用于元素内部交互，如拖拽组件
- `pageXY`: 适用于需要考虑页面滚动的情况，如无限滚动加载
- `screenXY`: 适用于需要与屏幕物理坐标交互的场景，如全屏应用

## 元素尺寸属性

### 尺寸关系

- 如果一个元素没有滚动条，那么它的 `scrollWidth` 和 `clientWidth` 应该是相等的，`scrollHeight` 和 `clientHeight` 也相等
- `scrollHeight`: 因为子元素比父元素高，父元素不想被子元素撑的一样高就显示出了滚动条，在滚动的过程中本元素有部分被隐藏了，
- `scrollHeight`代表包括当前不可见部分的元素的高度。而可见部分的高度其实就是`clientHeight`，也就是`scrollHeight`>=`clientHeight`恒成立。在有滚动条时讨论`scrollHeight`才有意义，在没有滚动条时`scrollHeight`==`clientHeight`恒成立。单位px，只读元素。

### 尺寸属性对比

|                    | content | padding | border | 滚动条 | 内容溢出部分 |
| ------------------ | ------- | ------- | ------ | ------ | ------------ |
| clientWidth/Height | 包含    | 包含    | 不包含 | 不包含 | 不包含       |
| offsetWidth/Height | 包含    | 包含    | 包含   | 包含   | 不包含       |
| scrollWidth/Height | 包含    | 包含    | 不包含 | 不包含 | 包含         |

### 计算公式

- `clientWidth = width + padding-left + padding-right`
- `clientHeight = height + padding-top + padding-bottom`
- `offsetWidth = width + padding-left + padding-right + border-left + border-right`
- `offsetHeight = height + padding-top + padding-bottom + border-top + border-bottom`
- `scrollWidth = 实际内容宽度（包括溢出部分）+ padding-left + padding-right`
- `scrollHeight = 实际内容高度（包括溢出部分）+ padding-top + padding-bottom`

### 获取元素位置

- `element.getBoundingClientRect()`: 返回元素相对于视口的位置信息，包括 top、right、bottom、left、width、height 等属性
- `element.offsetLeft/offsetTop`: 返回元素相对于 offsetParent 的左/上偏移量
- `element.scrollLeft/scrollTop`: 元素内容的水平/垂直滚动像素数

## 实际应用示例

```javascript
// 获取元素在页面中的绝对位置
function getElementPosition(el) {
  let left = 0
  let top = 0
  while (el) {
    left += el.offsetLeft
    top += el.offsetTop
    el = el.offsetParent
  }
  return { left, top }
}

// 判断元素是否在视口中可见
function isElementInViewport(el) {
  const rect = el.getBoundingClientRect()
  return (
    rect.top >= 0
    && rect.left >= 0
    && rect.bottom <= (window.innerHeight || document.documentElement.clientHeight)
    && rect.right <= (window.innerWidth || document.documentElement.clientWidth)
  )
}
```

## 参考

> https://github.com/niexia/niexia.github.io/issues/41
