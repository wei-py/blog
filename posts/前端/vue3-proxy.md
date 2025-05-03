---
title: vue3 使用 proxy
date: 2025-05-03
category: 前端
tags:
  - frontEnd
  - review
  - vue3
  - proxy
description: 在 Vue 3.0 中，**使用 `Proxy` 是为了实现更强大、更高效的响应式系统（Reactivity System）**。相比 Vue 2.x 中使用的 `Object.defineProperty`，Vue 3 使用 `Proxy` 带来了许多关键性的改进。
---


## 🧠 一、Vue 3 为什么选择 Proxy？

### 1. 更全面的拦截能力

`Proxy` 是 ES6 提供的一种元编程特性，允许你对对象进行细粒度的操作拦截（如读取、写入、枚举、函数调用等）。  
而 `Object.defineProperty` 只能拦截对象属性的 **get 和 set 操作**，功能非常有限。

> ✅ `Proxy` 能监听更多操作：

- 属性新增/删除
- 数组索引修改
- 数组长度变化
- 对象方法调用
- in、delete 等操作符

---

### 2. 支持数组的响应式更新

在 Vue 2.x 中，由于 `Object.defineProperty` 无法直接监听数组下标的变化，因此需要通过重写数组的方法（如 `push`, `pop`, `splice` 等）来实现响应式更新。

而在 Vue 3 中，`Proxy` 可以直接监听数组索引和 length 的变化，无需重写数组方法，代码更简洁，逻辑也更清晰。

---

### 3. 更好的性能表现

虽然 `Proxy` 在创建时会有一些开销，但它可以按需追踪依赖，不会像 Vue 2 那样对对象所有属性递归定义 getter/setter。  
Vue 3 利用了 `Proxy` + `Reflect` 的组合，实现了更细粒度的依赖收集和更新触发，整体性能更优。

---

### 4. 更容易处理嵌套对象和动态属性

Vue 2 中如果给对象添加新属性，必须使用 `this.$set` 才能让它变成响应式的。  
而 Vue 3 中使用 `Proxy` 后，**新增或删除属性也能自动变为响应式**，不再需要手动干预。

---

### 5. 支持 Map、Set 等复杂数据结构

Vue 3 的响应式系统可以支持 `Map`、`Set`、`WeakMap`、`WeakSet` 等复杂数据结构，而 `Object.defineProperty` 根本不适用于这些类型。

---

## 🔁 二、对比总结：Vue 2 vs Vue 3

| 特性           | Vue 2 (Object.defineProperty) | Vue 3 (Proxy)                                    |
| -------------- | ----------------------------- | ------------------------------------------------ |
| 拦截能力       | 仅 get / set                  | 支持多种操作（get, set, deleteProperty, has...） |
| 数组响应式     | 需要重写数组方法              | 原生支持数组索引和 length                        |
| 新增属性响应式 | 需要 `$set`                   | 自动响应                                         |
| 删除属性响应式 | 不易处理                      | 支持自动追踪                                     |
| 支持的数据结构 | 仅普通对象和数组              | 支持 Map、Set、类等                              |
| 性能           | 初始化慢，运行快              | 更灵活、更高效                                   |

---

## 📌 三、示例说明

### Vue 2 示例（Object.defineProperty）

```js
let obj = { count: 0 };
Object.defineProperty(obj, "count", {
	get() {
		console.log("访问了 count");
		return val;
	},
	set(newVal) {
		console.log("count 被修改");
		val = newVal;
	}
});
```

缺点：只能监听已有属性，不能监听新增或删除的属性。

---

### Vue 3 示例（Proxy）

```js
let obj = { count: 0 };
let proxy = new Proxy(obj, {
	get(target, key, receiver) {
		console.log(`访问了 ${key.toString()}`);
		return Reflect.get(target, key, receiver);
	},
	set(target, key, value, receiver) {
		console.log(`设置了 ${key.toString()}`);
		return Reflect.set(target, key, value, receiver);
	}
});

proxy.count; // 访问了 count
proxy.count = 10; // 设置了 count
proxy.newKey = 20; // 设置了 newKey（自动响应）
```

优点：支持新增属性、数组、Map 等。

---

## ✅ 四、小结

> Vue 3 使用 `Proxy` 替代 `Object.defineProperty`，是为了构建一个更强大、更灵活、更高效的响应式系统。

主要优势包括：

- 更强大的拦截能力
- 更自然地支持数组和动态属性
- 更好地支持现代 JS 数据结构（Map、Set）
- 减少 API 的侵入性（如不需要 `$set`）
- 更优雅的依赖追踪机制（配合 `effect` 和 `track`/`trigger`）

---

如果你对 Vue 3 的响应式原理感兴趣，也可以进一步了解其底层实现（比如 `reactive`、`ref`、`effect` 等 API），它们都基于 `Proxy` 实现了更加现代化的状态管理机制。
