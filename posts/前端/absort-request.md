---
date: 2025-05-15
title: 中断请求
category: frontEnd
tags:
  - 算法
  - 八股文
---

在前端开发中，如果你希望在某个请求超过 5 秒还未完成时自动终止（超时控制），可以使用 `Promise.race()` 配合一个定时器来实现。这是一个常见做法。

下面是一个通用的示例，展示如何对一个请求设置 5 秒超时：

---

### ✅ 使用 `fetch` 实现请求 5 秒未完成则终止

```javascript
function fetchWithTimeout(url, options = {}, timeout = 5000) {
  const controller = new AbortController();
  const { signal } = controller;

  const fetchPromise = fetch(url, { ...options, signal });

  const timeoutId = setTimeout(() => {
    controller.abort(); // 终止请求
    console.log("请求超时");
  }, timeout);

  return new Promise((resolve, reject) => {
    fetchPromise
      .then((response) => {
        clearTimeout(timeoutId);
        resolve(response);
      })
      .catch((error) => {
        clearTimeout(timeoutId);
        reject(error);
      });
  });
}
```

---

### ✅ 使用方式：

```javascript
fetchWithTimeout("https://example.com/api/data")
  .then((response) => {
    if (response.ok) {
      return response.json();
    }
    throw new Error("Network response was not ok.");
  })
  .then((data) => {
    console.log("数据:", data);
  })
  .catch((error) => {
    console.error("请求失败或超时:", error);
  });
```

---

### 🔍 补充说明：

- `AbortController` 是现代浏览器提供的用于中断请求的方式。
- `Promise.race()` 也可以用来实现类似逻辑，例如让“请求”和“定时器”进行比赛：

```javascript
const timeoutPromise = new Promise((_, reject) => {
  setTimeout(() => reject(new Error("请求超时")), 5000);
});

Promise.race([fetch(url), timeoutPromise])
  .then(res => res.json())
  .then(data => console.log(data))
  .catch(err => console.error(err));
```

---

### 🧠 面试可能追问点：

1. **为什么使用 `AbortController`？**

   - 因为它可以主动中断正在进行的 `fetch` 请求，而不是等它自然结束。

2. **`Promise.race()` 的作用是什么？**

   - 它可以让多个 Promise 竞赛，谁先完成就用谁的结果。

3. **如果后端接口没有响应，前端会怎样？**

   - 默认情况下，`fetch` 不会自动超时，可能会一直挂起，所以需要手动加超时机制。

4. **除了 `fetch`，还能怎么处理超时？比如 `XMLHttpRequest` 或 `axios`？**
   - `XMLHttpRequest`: 可以设置 `.timeout` 属性，并监听 `ontimeout` 事件。
   - `axios`: 支持直接配置 `timeout: 5000`。

---

### ✅ 总结

要实现“请求 5s 未完成就终止”，可以使用以下方法之一：

| 方法                             | 特点                      |
| -------------------------------- | ------------------------- |
| `fetch + AbortController`        | 原生、现代浏览器支持      |
| `Promise.race([fetch(), timer])` | 更通用的 Promise 控制方式 |
| `axios(timeout: 5000)`           | 第三方库更简洁            |
| `XMLHttpRequest.timeout`         | 兼容性好但较老            |

如需面试回答，建议你掌握第一种方案并能解释其原理。

---

如果你有特定的技术栈（如 Vue/Axios/React Query）也可以告诉我，我可以给出对应的解决方案。
