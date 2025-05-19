---
title: 图片的懒加载
date: 2025-05-04
category: 前端
tags:
  - frontEnd
  - lazyLoad
  - img
  - optimize
description: 网站开发中, 实现图片的懒加载
---

图片懒加载（Lazy Load）是前端优化性能的重要手段，其核心思想是 **延迟加载非关键区域的图片，直到用户滚动到对应位置**。从最早的实现方式到现代浏览器原生支持，懒加载方案经历了多个阶段的演进。以下是按时间顺序和技术演进分类的常见方案：

---

## **1. 最早期：手动监听 `scroll` 事件（兼容性最好）**

### **原理**

通过监听窗口的 `scroll` 事件，计算图片位置与视口的关系，动态设置 `<img>` 的 `src` 属性。

### **代码示例**

```javascript
function lazyLoad() {
  const images = document.querySelectorAll('img[data-src]')
  images.forEach((img) => {
    if (img.getBoundingClientRect().top < window.innerHeight) {
      img.src = img.dataset.src
    }
  })
}

window.addEventListener('scroll', lazyLoad)
window.addEventListener('DOMContentLoaded', lazyLoad) // 初始加载
```

### **优点**

- **兼容性极佳**（支持所有浏览器，包括 IE）。
- **无需依赖第三方库**。

### **缺点**

- **性能问题**：频繁触发 `scroll` 事件可能导致页面卡顿（需防抖/节流优化）。
- **计算复杂**：需手动处理图片位置判断逻辑。

---

## **2. 中期：使用 `Intersection Observer API`（现代主流方案）**

### **原理**

通过浏览器原生的 `Intersection Observer` API 监听元素与视口的交集变化，异步高效地判断图片是否进入可视区域。

### **代码示例**

```javascript
const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        const img = entry.target
        img.src = img.dataset.src
        observer.unobserve(img) // 加载后停止监听
      }
    })
  },
  { rootMargin: '0px 0px 200px 0px' }
) // 提前加载（可选）

document.querySelectorAll('img[data-src]').forEach(img => observer.observe(img))
```

### **优点**

- **性能优秀**：异步执行，不会阻塞主线程。
- **简洁高效**：无需手动计算位置，API 设计友好。
- **支持提前加载**：通过 `rootMargin` 设置预加载区域。

### **缺点**

- **兼容性问题**：IE 不支持，需引入 [polyfill](https://github.com/w3c/IntersectionObserver/tree/main/polyfill)（约 10KB）。
- **Safari 旧版本兼容性**：部分旧版本 Safari 需启用实验性功能。

---

## **3. 原生 HTML `loading="lazy"`（最新原生支持）**

### **原理**

直接在 `<img>` 或 `<iframe>` 标签上使用 `loading="lazy"` 属性，由浏览器原生实现懒加载。

### **代码示例**

```html
<img src="placeholder.jpg" data-src="real-image.jpg" loading="lazy" alt="示例" />
<iframe src="video.html" loading="lazy"></iframe>

```

### **优点**

- **零代码实现**：无需 JavaScript，直接通过 HTML 属性控制。
- **性能最优**：由浏览器底层优化，效率高于 JavaScript 实现。
- **自动管理**：浏览器自动处理加载时机（如网络状况、设备性能）。

### **缺点**

- **兼容性限制**：
  - 支持的浏览器：Chrome 76+、Edge 18+、Firefox 65+、Safari 15.4+。
  - 不支持 IE 和部分旧版移动端浏览器。
- **可控性低**：无法自定义加载逻辑（如占位符、错误处理）。

---

## **4. 第三方库封装（如 `lazysizes`、`lozad.js`）**

### **原理**

基于 `Intersection Observer` 或 `scroll` 事件封装的成熟库，提供更丰富的功能（如响应式图片、背景图懒加载）。

### **常用库**

- **[lazysizes](https://github.com/aFarkas/lazysizes)**：功能全面，支持 `<img>`、`<picture>`、`<iframe>`、CSS 背景图等。
- **[lozad.js](https://github.com/ApoorvSaxena/lozad.js)**：轻量级，基于 `Intersection Observer`。

### **代码示例（lazysizes）**

```html
<img data-src="image.jpg" class="lazyload" alt="示例" />
<script src="lazysizes.min.js" async></script>

```

### **优点**

- **功能丰富**：支持响应式图片（`srcset`）、背景图、视频等。
- **兼容性好**：多数库自带 polyfill。
- **开箱即用**：少量代码即可实现复杂功能。

### **缺点**

- **依赖第三方库**：增加项目体积。
- **配置复杂度**：需学习库的特定语法。

---

## **5. Vue/React 等框架专用方案**

### **原理**

在框架中封装懒加载逻辑，结合生命周期钩子或自定义指令实现。

### **Vue 示例（自定义指令）**

```javascript
// Vue3 组合式 API
app.directive('lazy', {
  mounted(el) {
    const observer = new IntersectionObserver(([entry]) => {
      if (entry.isIntersecting) {
        el.src = el.dataset.src
        observer.disconnect()
      }
    })
    observer.observe(el)
  }
})
```

```html
<img v-lazy="{ src: 'image.jpg' }" />
```

### **优点**

- **与框架深度集成**：利用响应式系统管理状态。
- **可扩展性强**：支持自定义占位符、加载动画等。

### **缺点**

- **仅适用于特定框架**。
- **需手动维护逻辑**（除非使用成熟插件）。

---

## **6. CSS 背景图 + `Intersection Observer`**

### **原理**

将图片作为 CSS 背景图，通过 JavaScript 动态修改样式加载。

### **代码示例**

```html
<div class="lazy-bg" data-bg="image.jpg"></div>
```

```javascript
observer.observe(document.querySelector('.lazy-bg'))
// 在 Intersection Observer 回调中：
element.style.backgroundImage = `url(${element.dataset.bg})`
```

### **优点**

- **灵活控制样式**：可配合 CSS 实现渐变加载效果。
- **适用于复杂布局**。

### **缺点**

- **语义化差**：不利于 SEO 和无障碍访问。
- **实现复杂度较高**。

---

## **方案对比与选择建议**

| 方案                         | 兼容性            | 性能   | 可控性 | 推荐使用场景                     |
| ---------------------------- | ----------------- | ------ | ------ | -------------------------------- |
| **scroll 事件监听**          | ✅✅✅            | ❌     | ✅     | 需兼容 IE 的旧项目               |
| **Intersection Observer**    | ✅（需 polyfill） | ✅✅✅ | ✅✅   | 现代项目首选                     |
| **loading="lazy"**           | ❌                | ✅✅✅ | ❌     | 简单场景，且无需兼容旧浏览器     |
| **第三方库（如 lazysizes）** | ✅✅              | ✅✅   | ✅✅✅ | 需要响应式图片、背景图等复杂功能 |
| **框架专用方案**             | ❌                | ✅✅   | ✅✅✅ | Vue/React 等现代框架项目         |
| **CSS 背景图方案**           | ✅✅              | ✅✅   | ❌     | 特殊视觉效果需求（如视差滚动）   |

---

## **最佳实践**

1. **现代项目**：优先使用 `loading="lazy"` + `Intersection Observer`（作为降级方案）。
2. **兼容性要求高**：使用 `lazysizes` 或带 polyfill 的 `Intersection Observer`。
3. **框架项目**：结合框架特性封装自定义指令或组件。
4. **响应式图片**：搭配 `srcset` 和 `sizes` 属性实现多分辨率适配。

通过合理选择方案，可以在性能、兼容性和开发效率之间找到平衡点。
