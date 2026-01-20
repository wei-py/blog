---
title: DOMContentLoaded 和 load 事件的区别
date: 2025-05-05
category: javascript
  - 浏览器事件对比
tags:
  - 对比
  - 前端
---

`DOMContentLoaded` 和 `load` 是网页加载过程中两个关键的事件，它们的主要区别在于 **触发时机** 和 **适用场景**：

---

### **1. 触发时机**

| 事件               | 触发条件                                                                          |
| ------------------ | --------------------------------------------------------------------------------- |
| `DOMContentLoaded` | 当 HTML 文档被完全解析并构建完 DOM 树（无需等待样式表、图片、子框架加载）时触发。 |
| `load`             | 当整个页面的所有资源（包括 HTML、CSS、图片、子框架等）全部加载完成后触发。        |

---

### **2. 使用场景**

| 事件               | 适用场景                                                                                     |
| ------------------ | -------------------------------------------------------------------------------------------- |
| `DOMContentLoaded` | 需要尽早操作 DOM 元素（无需等待资源加载），例如绑定事件、初始化界面布局。                    |
| `load`             | 需要确保所有资源（如图片尺寸、字体、视频）加载完成后再执行操作，例如计算图片尺寸、启动动画。 |

---

### **3. 示例对比**

```javascript
// DOMContentLoaded：DOM 可用时立即执行
document.addEventListener("DOMContentLoaded", () => {
  console.log("DOM 已解析，但图片可能未加载");
  // 此时可以安全操作 DOM
  const element = document.getElementById("myElement");
});

// load：所有资源加载完成后执行
window.addEventListener("load", () => {
  console.log("所有资源（包括图片）已加载完成");
  // 此时可以安全访问图片尺寸等
  const image = document.getElementById("myImage");
  console.log("图片宽度:", image.width);
});
```

---

### **4. 文档加载状态（`document.readyState`）**

- **`loading`**：文档正在加载。
- **`interactive`**：文档解析完成（触发 `DOMContentLoaded`）。
- **`complete`**：所有资源加载完成（触发 `load`）。

---

### **5. 关键区别总结**

| 特性             | `DOMContentLoaded`                    | `load`                       |
| ---------------- | ------------------------------------- | ---------------------------- |
| 触发时间         | DOM 解析完成，不依赖外部资源          | 所有资源（含图片等）加载完成 |
| 是否等待外部资源 | ❌ 不等待（样式表、图片等可能未加载） | ✅ 等待所有资源加载完成      |
| 适用场景         | 早期 DOM 操作、提升性能               | 依赖完整资源的场景（如绘图） |
| 事件目标         | `document`                            | `window`                     |

---

### **6. 实际应用建议**

- 如果需要尽快操作 DOM（例如绑定点击事件或修改结构），使用 `DOMContentLoaded`。
- 如果需要依赖图片或外部资源（例如计算布局、绘制 Canvas），使用 `load`。
- 对于异步加载的脚本（如 `async` 或 `defer`），`DOMContentLoaded` 可能会早于脚本执行，需注意依赖关系。

通过合理选择这两个事件，可以优化网页性能并避免资源未加载导致的错误。
