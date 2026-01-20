---
title: JSONP
date: 2025-05-16
category: javascript
tags:
  - jsonp
  - 八股文
---

JSONP（JSON with Padding）是一种**跨域数据请求技术**，用于解决浏览器的 **同源策略（Same-Origin Policy）** 所导致的跨域限制问题。虽然现在已经被 CORS（跨域资源共享）广泛取代，但在一些老旧系统或不支持 CORS 的浏览器中仍有使用价值。

---

## 一、JSONP 是什么？

JSONP 全称是 JSON with Padding，它不是一种正式的数据格式，而是一种“技巧”或“协议”。它的核心思想是：

> 利用 `<script>` 标签不受同源策略限制的特点，动态加载一个外部脚本，并通过指定函数名回调的方式，把服务器返回的 JSON 数据包装在函数调用中执行。

---

## 二、为什么使用 JSONP？

### 原因：跨域请求

浏览器出于安全考虑，默认不允许网页从不同域名、端口或协议请求资源（即“跨域”）。比如：

- 当前页面是：`http://a.com`
- 请求接口是：`http://b.com/api`

这时候如果使用 AJAX（XMLHttpRequest），就会被浏览器阻止，除非服务端开启 CORS 支持。

但如果服务端不支持 CORS，可以使用 JSONP 来绕过这个限制。

---

## 三、JSONP 的工作原理

1. 客户端定义一个回调函数（callback function）。
2. 动态创建 `<script>` 标签，src 指向目标 URL，并带上 callback 参数。
3. 服务端收到请求后，返回一段 JavaScript 函数调用代码，参数就是 JSON 数据。
4. 浏览器加载脚本并执行回调函数，完成数据传递。

---

## 四、前端使用 JSONP 示例

```js
function jsonp(url, params, cbName) {
  return new Promise((resolve, reject) => {
    const script = document.createElement("script");
    window[cbName] = (data) => {
      resolve(data);
      document.body.removeChild(script);
    };
    params = { ...params, callback: cbName };
    const arr = Object.keys(params).map(key => `${key}=${params[key]}`);
    script.src = `${url}?${arr.join("&")}`;
    document.body.appendChild(script);
  });
}

const url = "https://api.flickr.com/services/feeds/photos_public.gne";

const param = {
  tags: "cat",
  tagmode: "any",
  format: "json"
};

jsonp(url, param, "jsonFlickrFeed").then((data) => {
  console.log(data, "返回数据");
});
```

---

## 五、JSONP 的缺点和局限性

| 缺点             | 说明                                                |
| ---------------- | --------------------------------------------------- |
| 只支持 GET 请求  | JSONP 本质是 `<script>` 标签加载，只能发送 GET 请求 |
| 安全隐患         | 如果服务端不可信，可能会注入恶意脚本                |
| 不易调试         | 错误处理不如 AJAX 直观                              |
| 不推荐新项目使用 | 现代项目应优先使用 CORS                             |

---

## 六、与 CORS 的区别

| 特性               | JSONP                | CORS                    |
| ------------------ | -------------------- | ----------------------- |
| 是否需要服务端配合 | ✅ 是                | ✅ 是                   |
| 支持请求方法       | ❌ 仅 GET            | ✅ 多种（GET、POST 等） |
| 浏览器兼容性       | ✅ 非常好（包括 IE） | ✅ 现代浏览器支持良好   |
| 安全性             | ❌ 较差              | ✅ 更安全               |
| 推荐程度           | ⚠️ 已逐渐淘汰        | ✅ 推荐使用             |

---

## 七、总结

- **JSONP 是一种跨域通信技术**，适用于不支持 CORS 的场景。
- 它利用了 `<script>` 标签可以跨域加载的特性。
- 使用时需要前后端配合，约定好回调函数名。
- 存在安全隐患，且只支持 GET 请求，因此不建议在新项目中使用。
- **现代开发推荐使用 CORS 实现跨域请求。**

---

如需了解如何使用 `fetch` 或 `axios` 实现跨域请求，请告诉我，我可以继续为你介绍 CORS 的使用方式。
