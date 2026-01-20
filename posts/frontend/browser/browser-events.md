---
title: 浏览器
date: 2025-07-09
category: browser
tags:
  - 浏览器
  - 浏览器事件
---

当然可以！下面是一个**完整、全面的浏览器事件监听列表（包括 DOM 事件、表单事件、窗口事件、触摸事件、媒体事件等）**，适用于现代浏览器（如 Chrome、Firefox、Edge、Safari 等），基于 **WHATWG DOM 标准** 和 **MDN 文档**。

---

## 🧠 说明

- 这些事件可以通过 `addEventListener()` 监听。
- 所有事件都可绑定在 DOM 元素或 `window` 上，具体取决于事件类型。
- 每个事件都有其适用场景和触发条件。

---

# 📚 完整浏览器事件监听列表（分类整理）

---

## 🧱 一、DOM 元素相关事件（基础交互）

| 事件名        | 描述                             |
| ------------- | -------------------------------- |
| `click`       | 单击元素时触发（鼠标左键或触控） |
| `contextmenu` | 右键菜单弹出前触发               |
| `dblclick`    | 双击触发                         |
| `mousedown`   | 鼠标按键按下                     |
| `mouseup`     | 鼠标按键释放                     |
| `mousemove`   | 鼠标移动                         |
| `mouseover`   | 鼠标移入元素（冒泡）             |
| `mouseout`    | 鼠标移出元素（冒泡）             |
| `mouseenter`  | 鼠标进入元素（不冒泡）           |
| `mouseleave`  | 鼠标离开元素（不冒泡）           |
| `wheel`       | 鼠标滚轮滚动                     |
| `dragstart`   | 拖拽开始                         |
| `drag`        | 拖拽中                           |
| `dragend`     | 拖拽结束                         |
| `dragenter`   | 拖拽对象进入目标区域             |
| `dragover`    | 拖拽对象在目标区域内移动         |
| `dragleave`   | 拖拽对象离开目标区域             |
| `drop`        | 在目标区域释放拖拽对象           |

---

## 📝 二、表单与输入事件

| 事件名              | 描述                                       |
| ------------------- | ------------------------------------------ |
| `input`             | `<input>`、`<textarea>` 内容变化时实时触发 |
| `change`            | 表单元素值改变并失去焦点后触发             |
| `focus`             | 元素获得焦点                               |
| `blur`              | 元素失去焦点                               |
| `submit`            | 表单提交（绑定在 `<form>` 上）             |
| `reset`             | 表单重置                                   |
| `select`            | 用户选中文本框中的文本时触发               |
| `invalid`           | 表单验证失败时触发                         |
| `beforeinput`       | 在 `input` 事件之前触发（更底层）          |
| `compositionstart`  | 输入法组合开始（如中文输入）               |
| `compositionupdate` | 输入法组合更新                             |
| `compositionend`    | 输入法组合结束                             |

---

## 🖥️ 三、窗口与文档事件

| 事件名                  | 描述                                                   |
| ----------------------- | ------------------------------------------------------ |
| `load`                  | 页面完全加载完成后触发（绑定在 `window` 或某些资源上） |
| `DOMContentLoaded`      | HTML 文档加载完成但未加载外部资源时触发                |
| `readystatechange`      | 文档加载状态变化（document.readyState）                |
| `beforeunload`          | 页面即将卸载（可用于提示用户是否离开）                 |
| `unload`                | 页面正在卸载（用于清理操作）                           |
| `resize`                | 浏览器窗口大小变化                                     |
| `scroll`                | 页面或元素滚动                                         |
| `hashchange`            | URL 的 hash（`#` 后面部分）发生变化                    |
| `popstate`              | 浏览器历史记录条目更改（如点击返回按钮）               |
| `pageshow` / `pagehide` | 页面显示/隐藏（移动端缓存页面时使用）                  |
| `storage`               | 同源窗口中 localStorage 被修改时触发                   |

---

## 📱 四、触摸与手势事件（移动端）

| 事件名          | 描述                     |
| --------------- | ------------------------ |
| `touchstart`    | 触摸开始                 |
| `touchmove`     | 触摸移动                 |
| `touchend`      | 触摸结束                 |
| `touchcancel`   | 触摸被取消（如系统中断） |
| `gesturestart`  | 手势开始（如双指缩放）   |
| `gesturechange` | 手势变化                 |
| `gestureend`    | 手势结束                 |

---

## 🎧 五、音频与视频事件（HTML5 媒体）

| 事件名           | 描述                             |
| ---------------- | -------------------------------- |
| `play`           | 开始播放                         |
| `playing`        | 已开始播放（缓冲完成）           |
| `pause`          | 暂停播放                         |
| `ended`          | 播放结束                         |
| `seeking`        | 用户开始跳转时间点               |
| `seeked`         | 时间点跳转完成                   |
| `timeupdate`     | 当前播放时间更新                 |
| `volumechange`   | 音量变化                         |
| `ratechange`     | 播放速度变化                     |
| `durationchange` | 媒体总时长变化                   |
| `loadedmetadata` | 媒体元数据加载完成               |
| `loadeddata`     | 媒体当前帧数据加载完成           |
| `canplay`        | 媒体可以开始播放（可能需要缓冲） |
| `canplaythrough` | 媒体可以流畅播放完全部内容       |
| `error`          | 媒体加载或播放发生错误           |
| `waiting`        | 需要缓冲下一帧而暂停播放         |
| `stalled`        | 媒体数据无法获取                 |

---

## 🔋 六、设备与传感器事件

| 事件名               | 描述                                |
| -------------------- | ----------------------------------- |
| `deviceorientation`  | 设备方向变化（陀螺仪）              |
| `devicemotion`       | 设备运动（加速度计）                |
| `orientationchange`  | 屏幕方向变化（横屏/竖屏）           |
| `online` / `offline` | 网络连接状态变化（绑定在 `window`） |

---

## 📡 七、Web Worker 相关事件

| 事件名         | 描述                     |
| -------------- | ------------------------ |
| `message`      | 接收到 worker 发送的消息 |
| `messageerror` | 接收消息出错             |
| `error`        | worker 出现错误          |
| `close`        | worker 被关闭            |

---

## 🧩 八、自定义与高级事件

| 事件名                                                                     | 描述                                        |
| -------------------------------------------------------------------------- | ------------------------------------------- |
| `CustomEvent`                                                              | 自定义事件（通过 `new CustomEvent()` 创建） |
| `animationstart` / `animationend` / `animationiteration`                   | CSS 动画事件                                |
| `transitionstart` / `transitionrun` / `transitionend` / `transitioncancel` | CSS 过渡事件                                |
| `pointerdown` / `pointerup` / `pointermove` / `pointercancel`              | 统一指针事件（兼容鼠标、触摸、笔）          |
| `gotpointercapture` / `lostpointercapture`                                 | 捕获指针事件                                |
| `visibilitychange`                                                         | 页面可见性变化（绑定在 `document`）         |
| `fullscreenchange` / `fullscreenerror`                                     | 全屏模式切换事件                            |
| `copy` / `cut` / `paste`                                                   | 剪贴板操作事件                              |
| `abort`                                                                    | 资源加载中止                                |
| `error`                                                                    | 加载失败通用事件（如图片、脚本）            |
| `selectstart` / `selectionchange`                                          | 文本选择事件                                |
| `securitypolicyviolation`                                                  | CSP 违规事件                                |
| `toggle`                                                                   | `<details>` 元素展开/折叠事件               |

---

## 🌐 九、Service Worker 事件（PWA）

| 事件名              | 描述                               |
| ------------------- | ---------------------------------- |
| `install`           | Service Worker 安装时触发          |
| `activate`          | Service Worker 激活时触发          |
| `fetch`             | 网络请求拦截                       |
| `message`           | 来自主线程的消息                   |
| `push`              | 接收到推送通知                     |
| `notificationclick` | 用户点击通知                       |
| `sync`              | 后台同步触发（需注册 SyncManager） |

---

## 📦 十、Web Storage 事件

| 事件名    | 描述                                                       |
| --------- | ---------------------------------------------------------- |
| `storage` | 同源窗口中 `localStorage` 或 `sessionStorage` 被修改时触发 |

---

## 🧪 十一、实验性 / 特定平台事件（仅供参考）

| 事件名                                     | 描述                                       |
| ------------------------------------------ | ------------------------------------------ |
| `gamepadconnected` / `gamepaddisconnected` | 游戏手柄连接/断开                          |
| `beforeprint` / `afterprint`               | 打印前/后触发（已被弃用）                  |
| `search`                                   | `<input type="search">` 中点击“搜索”按钮   |
| `beforematch`                              | `<style media>` 匹配前触发（用于性能优化） |

---

## 🧾 总结：你可以这样记忆

| 类型         | 关键词                               |
| ------------ | ------------------------------------ |
| 基础交互     | click, mouse, drag                   |
| 表单输入     | input, change, focus                 |
| 页面生命周期 | load, DOMContentLoaded, beforeunload |
| 移动端       | touch, gesture, orientation          |
| 媒体         | play, pause, ended, timeupdate       |
| Web API      | message, storage, online/offline     |
| 动画过渡     | animation, transition                |
| 自定义       | CustomEvent                          |
| PWA          | fetch, push, sync                    |

---

如果你希望我帮你整理成 **Markdown 表格**、**JSON 文件** 或 **事件分类卡片模板**，我可以为你生成 😊

你也可以告诉我你的项目需求，我会推荐最常用的一组事件 👍
