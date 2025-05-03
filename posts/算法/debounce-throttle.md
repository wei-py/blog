---
title: 手写防抖和节流
date: 2025-04-27
category: 算法
tags:
  - frontEnd
	- interview
  - js
  - 防抖
  - 节流
description: 防抖和节流的实现
---

# 手写防抖和节流

## 防抖

```js
function debounce(func, delay, immediate = false) {
	if (typeof func !== "function") {
		throw new TypeError("Expected a function");
	}

	if (typeof delay !== "number" || delay < 0) {
		throw new TypeError("Expected delay to be a positive number");
	}

	let timer = null;

	const debounced = function (...args) {
		const context = this;
		clearTimeout(timer);

		if (immediate) {
			const callNow = !timer;
			timer = setTimeout(() => {
				timer = null;
			}, delay);

			if (callNow) {
				func.apply(context, args);
			}
		} else {
			timer = setTimeout(() => {
				func.apply(context, args);
			}, delay);
		}
	};

	// 添加取消方法
	debounced.cancel = function () {
		clearTimeout(timer);
		timer = null;
	};

	return debounced;
}
```

## 节流

```js
function throttle(func, delay, options = {}) {
	if (typeof func !== "function") {
		throw new TypeError("Expected a function");
	}

	if (typeof delay !== "number" || delay < 0) {
		throw new TypeError("Expected delay to be a positive number");
	}

	let timer = null;
	let previous = 0; // 上次执行的时间点

	// 解构配置项，leading表示是否立即执行，trailing表示是否在结束后执行
	const { leading = true, trailing = true } = options;

	const throttled = function (...args) {
		const now = Date.now();
		const context = this;

		// 如果是第一次调用且leading为false，则将上次执行时间设为当前时间
		if (!previous && leading === false) {
			previous = now;
		}

		const remaining = delay - (now - previous);

		if (remaining <= 0 || remaining > delay) {
			if (timer) {
				clearTimeout(timer);
				timer = null;
			}
			previous = now;
			func.apply(context, args);
		} else if (!timer && trailing) {
			timer = setTimeout(() => {
				previous = leading ? Date.now() : 0;
				timer = null;
				func.apply(context, args);
			}, remaining);
		}
	};

	// 添加取消方法
	throttled.cancel = function () {
		clearTimeout(timer);
		timer = null;
		previous = 0;
	};

	return throttled;
}
```
