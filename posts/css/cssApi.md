---
title: css api
date: 2025-07-03
category: css
tags:
  - 布局
  - css
---

# 效果如下


<a href="/css/cssApi">点击查看</a>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8" />
  <title>CSS 所有常用函数示例 + 参数说明</title>
  <style>
    :root {
      --main-color: rgb(100, 150, 200);
    }

    body {
      font-family: sans-serif;
      padding: 40px;
      background-color: #f4f4f4;
    }

    h2 {
      margin-top: 40px;
    }

    .box {
      width: 300px;
      min-height: 120px;
      margin: 20px auto;
      border: 2px solid #333;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      text-align: center;
      transition: all 1s ease-in-out;
      background-color: white;
      padding: 15px;
      box-sizing: border-box;
      position: relative;
    }

    .box-title {
      font-weight: bold;
      margin-bottom: 10px;
    }

    .box-desc {
      font-size: 14px;
      color: #555;
      line-height: 1.4;
      text-align: left;
      white-space: pre-wrap;
    }

    /* 颜色函数 */
    .color-rgb {
      background-color: rgb(255, 99, 71);
    }

    .color-rgba {
      background-color: rgba(255, 99, 71, 0.5);
    }

    .color-hsl {
      background-color: hsl(210, 50%, 50%);
    }

    .color-hsla {
      background-color: hsla(210, 50%, 50%, 0.6);
    }

    .color-color {
      background-color: color(rgb(255, 99, 71) tint 20%);
    }

    /* 属性函数 */
    [data-text]::after {
      content: attr(data-text);
      display: block;
      margin-top: 10px;
      color: red;
    }

    .use-var {
      background-color: var(--main-color);
    }

    /* 数学函数 */
    .math-calc {
      width: calc(100% - 40px);
    }

    .math-minmax {
      width: min(300px, 50%);
      height: max(100px, 20vh);
    }

    .math-clamp {
      font-size: clamp(16px, 2vw, 24px);
    }

    /* 背景函数 */
    .bg-url {
      background-image: url('./bak2.ico');
      background-size: cover;
      color: transparent;
    }

    .bg-gradient {
      background-image: linear-gradient(to right, red, yellow);
    }

    .bg-radial {
      background-image: radial-gradient(circle, blue, white);
    }

    .bg-conic {
      background-image: conic-gradient(from 90deg, red, green, blue);
    }

    .bg-repeating {
      background-image: repeating-linear-gradient(to bottom,
          red,
          red 10px,
          yellow 10px,
          yellow 20px);
    }

    /* 滤镜函数 */
    .filter-example {
      filter: blur(5px) brightness(1.2) contrast(1.1) saturate(1.5);
    }

    /* 图像函数（clip-path）*/
    .clip-circle {
      clip-path: circle(50%);
    }

    .clip-polygon {
      clip-path: polygon(50% 0%, 100% 100%, 0% 100%);
    }

    /* 变换函数 */
    .transform-example {
      transform: rotate(30deg) scale(1.2) translateX(20px);
    }

    /* 缓动函数 */
    .animate {
      animation: moveBox 2s cubic-bezier(0.1, 0.7, 1.0, 0.1) infinite alternate;
    }

    @keyframes moveBox {
      from {
        transform: translateX(0);
      }

      to {
        transform: translateX(100px);
      }
    }

    .step-animation {
      animation: stepAnim 2s steps(4, end) infinite;
    }

    @keyframes stepAnim {
      from {
        background-position: 0;
      }

      to {
        background-position: 400px;
      }
    }
  </style>
</head>

<body>

  <h1>CSS 所有常用函数演示 + 参数说明</h1>

  <!-- 颜色函数 -->
  <h2>🎨 颜色函数</h2>

  <div class="box color-rgb">
    <div class="box-title">rgb(R, G, B)</div>
    <div class="box-desc">
      函数：rgb(R, G, B)
      示例：background-color: rgb(255, 99, 71)
      说明：红绿蓝三色值（0~255）
    </div>
  </div>

  <div class="box color-rgba">
    <div class="box-title">rgba(R, G, B, A)</div>
    <div class="box-desc">
      函数：rgba(R, G, B, A)
      示例：background-color: rgba(255, 99, 71, 0.5)
      说明：带透明度的 RGB 颜色
    </div>
  </div>

  <div class="box color-hsl">
    <div class="box-title">hsl(H, S%, L%)</div>
    <div class="box-desc">
      函数：hsl(H, S%, L%)
      示例：background-color: hsl(210, 50%, 50%)
      说明：基于色相、饱和度、亮度的颜色表示
    </div>
  </div>

  <div class="box color-hsla">
    <div class="box-title">hsla(H, S%, L%, A)</div>
    <div class="box-desc">
      函数：hsla(H, S%, L%, A)
      示例：background-color: hsla(210, 50%, 50%, 0.6)
      说明：带透明度的 HSL 颜色
    </div>
  </div>

  <div class="box color-color">
    <div class="box-title">color()</div>
    <div class="box-desc">
      函数：color(基础色 操作 值)
      示例：background-color: color(rgb(255, 99, 71) tint 20%)
      说明：实验性功能，用于派生新颜色
    </div>
  </div>

  <!-- 属性函数 -->
  <h2>🧮 属性函数</h2>

  <div class="box use-var" data-text="这是 attr() 内容">
    <div class="box-title">var(), attr()</div>
    <div class="box-desc">
      函数：
      - attr(data-text)
      - var(--main-color)
      说明：
      - attr() 获取 HTML 属性值
      - var() 使用自定义 CSS 变量
    </div>
  </div>

  <!-- 数学函数 -->
  <h2>🧮 数学函数</h2>

  <div class="box math-calc">
    <div class="box-title">calc()</div>
    <div class="box-desc">
      函数：calc(表达式)
      示例：width: calc(100% - 40px)
      说明：支持加减乘除运算符两侧需空格
    </div>
  </div>

  <div class="box math-minmax">
    <div class="box-title">min(), max()</div>
    <div class="box-desc">
      函数：
      - min(值1, 值2, ...)
      - max(值1, 值2, ...)
      示例：
      width: min(300px, 50%)
      height: max(100px, 20vh)
      说明：取最小或最大值
    </div>
  </div>

  <p class="math-clamp">
    <strong>clamp()</strong><br>
    函数：clamp(最小值, 默认值, 最大值)<br>
    示例：font-size: clamp(16px, 2vw, 24px)<br>
    说明：字体大小随视口变化
  </p>

  <!-- 背景函数 -->
  <h2>🖼️ 背景函数</h2>

  <div class="box bg-url">
    <div class="box-title">url()</div>
    <div class="box-desc">
      函数：url(路径)
      示例：background-image: url('image.png')
      说明：加载本地或远程图片资源
    </div>
  </div>

  <div class="box bg-gradient">
    <div class="box-title">linear-gradient()</div>
    <div class="box-desc">
      函数：linear-gradient(方向, 颜色停止点...)
      示例：background-image: linear-gradient(to right, red, yellow)
      说明：线性渐变背景
    </div>
  </div>

  <div class="box bg-radial">
    <div class="box-title">radial-gradient()</div>
    <div class="box-desc">
      函数：radial-gradient(类型/位置, 颜色停止点...)
      示例：background-image: radial-gradient(circle, blue, white)
      说明：径向渐变背景
    </div>
  </div>

  <div class="box bg-conic">
    <div class="box-title">conic-gradient()</div>
    <div class="box-desc">
      函数：conic-gradient(起始角, 中心点, 颜色停止点...)
      示例：background-image: conic-gradient(from 90deg, red, green, blue)
      说明：锥形渐变背景
    </div>
  </div>

  <div class="box bg-repeating">
    <div class="box-title">repeating-linear-gradient()</div>
    <div class="box-desc">
      函数：repeating-linear-gradient(...)
      示例：
      background-image: repeating-linear-gradient(to bottom,
      red,
      red 10px,
      yellow 10px,
      yellow 20px)
      说明：重复线性渐变
    </div>
  </div>

  <!-- 滤镜函数 -->
  <h2>🎞️ 滤镜函数</h2>

  <div class="box filter-example">
    <div class="box-title">blur(), brightness(), contrast(), saturate()</div>
    <div class="box-desc">
      函数：
      - blur(半径)
      - brightness(倍数)
      - contrast(倍数)
      - saturate(倍数)
      示例：
      filter: blur(5px) brightness(1.2) contrast(1.1) saturate(1.5)
      说明：多种图像滤镜叠加使用
    </div>
  </div>

  <!-- 图像函数（clip-path） -->
  <h2>📐 图像裁剪函数</h2>

  <div class="box clip-circle">
    <div class="box-title">circle()</div>
    <div class="box-desc">
      函数：circle(半径 at 位置)
      示例：clip-path: circle(50%)
      说明：圆形裁剪
    </div>
  </div>

  <div class="box clip-polygon">
    <div class="box-title">polygon()</div>
    <div class="box-desc">
      函数：polygon(坐标点列表)
      示例：clip-path: polygon(50% 0%, 100% 100%, 0% 100%)
      说明：多边形裁剪
    </div>
  </div>

  <!-- 变换函数 -->
  <h2>🔄 变换函数</h2>

  <div class="box transform-example">
    <div class="box-title">rotate(), scale(), translate()</div>
    <div class="box-desc">
      函数：
      - rotate(角度)
      - scale(比例)
      - translate(X偏移)
      示例：
      transform: rotate(30deg) scale(1.2) translateX(20px)
      说明：组合变换操作
    </div>
  </div>

  <!-- 缓动函数 -->
  <h2>⏱️ 动画缓动函数</h2>

  <div class="box animate">
    <div class="box-title">cubic-bezier()</div>
    <div class="box-desc">
      函数：cubic-bezier(x1, y1, x2, y2)
      示例：animation: moveBox 2s cubic-bezier(0.1, 0.7, 1.0, 0.1)
      说明：自定义动画缓动曲线
    </div>
  </div>

  <div class="box step-animation">
    <div class="box-title">steps()</div>
    <div class="box-desc">
      函数：steps(步数, 步进方式)
      示例：animation: stepAnim 2s steps(4, end)
      说明：逐帧动画
    </div>
  </div>

</body>

</html>