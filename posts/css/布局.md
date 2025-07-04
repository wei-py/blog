---
title: 布局
date: 2025-07-03
category: css
tags:
  - 布局
  - css
---

## 水平居中的选择流程图（图文逻辑）

- 行内靠文本，块级靠外边，其他靠 Flex 或定位

```
是否是块级元素？
├─ 是 → 是否宽度固定？
│     ├─ 是 → margin: 0 auto;
│     └─ 否 → width: fit-content; + margin: 0 auto;
└─ 否 → 是否是行内元素？
      ├─ 是 → 父容器 text-align: center;
      └─ 否 → display:inline-block/inline-flex + 父容器 text-align
      或者直接使用 flex 布局：父容器 display:flex; justify-content:center;
      或者绝对定位 left:50% + transform: translateX(-50%);
```

## 垂直居中的选择流程图（图文逻辑）

- 行高控高度，表格全能王，Flex 最常用，定位要算值

```
是否是行内元素？
├─ 是 → 设置 line-height = 容器高度
└─ 否 → 是否需要兼容性好？
      ├─ 是 → 使用 display: table-cell + vertical-align: middle;
      └─ 否 → 使用 flex 布局：display:flex; align-items:center;
           或者绝对定位 top:50% + transform: translateY(-50%);

```
