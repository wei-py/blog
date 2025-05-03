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

以下是四种实现图片懒加载（Lazy Load）的常见方案，结合知识库内容进行说明并附带代码示例。

---

### ✅ 方案一：位置计算 + 滚动事件 (Scroll) + DataSet API

#### 原理：

通过监听 `scroll` 事件，并使用 `offsetTop`、`scrollTop` 等属性计算图片是否进入视口。使用 `data-src` 存储真实图片地址，避免提前加载 。

#### HTML 示例：

```html
<img data-src="image1.jpg" alt="Lazy Image" class="lazy-img" />
```

#### JavaScript 示例：

```javascript
function lazyLoad() {
	const images = document.querySelectorAll(".lazy-img");
	const scrollTop = window.scrollY || window.pageYOffset;
	const windowHeight = window.innerHeight;

	images.forEach((img) => {
		const offsetTop = img.getBoundingClientRect().top + scrollTop;
		if (offsetTop < scrollTop + windowHeight && !img.src) {
			img.src = img.dataset.src;
		}
	});
}

window.addEventListener("scroll", lazyLoad);
window.addEventListener("load", lazyLoad); // 页面加载时也检查一次
```

---

### ✅ 方案二：getBoundingClientRect API + Scroll with Throttle + DataSet API

#### 原理：

与方案一类似，但使用 `getBoundingClientRect()` 获取元素相对于视口的位置，更精确判断是否进入可视区域，并加入节流函数优化性能 。

#### JavaScript 示例：

```javascript
function throttle(fn, delay) {
	let timer;
	return function () {
		if (!timer) {
			timer = setTimeout(() => {
				fn.apply(this, arguments);
				timer = null;
			}, delay);
		}
	};
}

function lazyLoad() {
	const images = document.querySelectorAll(".lazy-img");

	images.forEach((img) => {
		const rect = img.getBoundingClientRect();
		if (rect.top < window.innerHeight && rect.bottom >= 0 && !img.src) {
			img.src = img.dataset.src;
		}
	});
}

window.addEventListener("scroll", throttle(lazyLoad, 200));
window.addEventListener("load", lazyLoad);
```

---

### ✅ 方案三：IntersectionObserver API + DataSet API

#### 原理：

使用现代浏览器提供的 `IntersectionObserver` API 监听元素是否进入视口，无需手动计算位置，性能更优 。

#### JavaScript 示例：

```javascript
const observer = new IntersectionObserver((entries, observer) => {
	entries.forEach((entry) => {
		if (entry.isIntersecting) {
			const img = entry.target;
			img.src = img.dataset.src;
			observer.unobserve(img); // 加载后停止观察
		}
	});
});

document.querySelectorAll(".lazy-img").forEach((img) => observer.observe(img));
```

---

### ✅ 方案四：HTML 原生 `loading="lazy"` 属性

#### 原理：

利用 `<img>` 和 `<iframe>` 的原生 `loading="lazy"` 属性实现懒加载，无需额外 JS 脚本，最简单的方式 。

#### HTML 示例：

```html
<img src="image4.jpg" alt="Lazy Image" loading="lazy" />
```

⚠️ 注意：此方法兼容性较好但控制力较弱，适用于不需要复杂逻辑的场景。

---

### 📌 总结对比：

| 方案                                                | 兼容性 | 控制力 | 推荐程度 |
| --------------------------------------------------- | ------ | ------ | -------- |
| 位置计算 + scroll + dataset                         | 高     | 中     | ⭐⭐     |
| getBoundingClientRect + scroll + throttle + dataset | 高     | 中高   | ⭐⭐⭐   |
| Intersection Observer + dataset                     | 较高   | 高     | ⭐⭐⭐⭐ |
| `loading="lazy"` 原生属性                           | 最高   | 低     | ⭐⭐⭐   |

> **推荐优先顺序**：  
> 若需精细控制，建议使用 **IntersectionObserver API**；  
> 若项目对兼容性和性能要求不高，可使用 **`loading="lazy"`** 快速实现 。
