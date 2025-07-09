---
title: 选择器
date: 2025-07-09
category: css
tags:
  - 选择器
  - css
---

- 视频

  > https://www.bilibili.com/video/BV1124y1P7HP

- 基础
  tag #id .class \*

- 层次

  \> \- \~ [space]

- 集合
  并集 交集

- 条件
  > lang dir has is not where scope any-link local-link

1. **语言与方向**：

   - `:lang` —— 指定语言，国际化
   - `:dir()` —— 书写方向，左或右

2. **包含与排除**：

   - `:has` —— 包含子元素，找父辈
   - `:is` —— 满足条件，直接选
   - `:not` —— 不满足条件，反向选
   - `:where` —— 满足条件，优化版

3. **范围与链接**：
   - `:scope` —— 限定范围，作参考
   - `:any-link` —— 所有链接，href存在
   - `:local-link` —— 本地链接，绝对地址

- 行为

  active hover selection

- 状态
  > target link visited focus required \
  >  valid invalid in-range out-of-range checked \
  >  optional enabled disabled read-only read-write \
  >  target-within focus-within focus-visiable blank user-invalid \
  >  indeterminate placeholder-shown current past future \
  >  playing paused

1. **链接与状态**：

   - `:target` —— 当前目标，被激活
   - `:link` —— 未访问链接，新面孔
   - `:visited` —— 已访问链接，老朋友
   - `:focus` —— 焦点所在，输入框

2. **表单验证**：

   - `:required` —— 必填项，不能为空
   - `:valid` —— 合法输入，无错误
   - `:invalid` —— 非法输入，有错误
   - `:in-range` —— 范围之内，合理值
   - `:out-of-range` —— 范围之外，不合理
   - `:checked` —— 选中状态，打勾勾
   - `:optional` —— 可选项，非必填
   - `:enabled` —— 启用状态，可操作
   - `:disabled` —— 禁用状态，不可用
   - `:read-only` —— 只读模式，不可改
   - `:read-write` —— 可读可写，能修改

3. **复合状态**：

   - `:target-within` —— 内部目标，被激活
   - `:focus-within` —— 内部焦点，被聚焦
   - `:focus-visible` —— 可见焦点，高亮显示
   - `:blank` —— 空值输入，无内容
   - `:user-invalid` —— 用户非法，手动输错
   - `:indeterminate` —— 不确定状态，待定中
   - `:placeholder-shown` —— 占位符显示，无输入

4. **时间与播放**：
   - `:current()` —— 当前浏览，正在看
   - `:past()` —— 已过时间，已看过
   - `:future()` —— 未来时间，未到达
   - `:playing` —— 正在播放，动起来
   - `:paused` —— 暂停播放，停一停

- 结构

1. **根与空**：

   - `:root` —— 文档之根，唯一存在
   - `:empty` —— 无子元素，空荡荡

2. **首字母与首行**：

   - `:first-letter` —— 首字突出，风格独特
   - `:first-line` —— 首行加粗，醒目又清晰

3. **顺序与逆序**：

   - `:nth-child(n)` —— 第几孩子，顺序找
   - `:nth-last-child(n)` —— 倒数第几，从后算
   - `:nth-of-type(n)` —— 同类型，第几个
   - `:nth-last-of-type(n)` —— 同类型，倒数第几

4. **首尾与唯一**：
   - `:first-child` —— 第一个孩子，顺位第一
   - `:last-child` —— 最后一个，顺位末尾
   - `:only-child` —— 独生子，独一无二
   - `:first-of-type` —— 同类首个，顺位第一
   - `:last-of-type` —— 同类最后一个，顺位末尾
   - `:only-of-type` —— 同类唯一，独一份

---

- 属性
- 伪元
