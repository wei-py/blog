---
date: 2025-10-18
title: uni utils
category: resources
tags:
  - uni
  - utils
description: uni 开发中使用的工具
---

## useHeight - 获取安全区域高度

获取不同平台下的状态栏、胶囊按钮、屏幕等高度信息，用于适配不同设备的安全区域。

### 功能说明

- **status**: 状态栏高度
- **menu**: 小程序胶囊按钮高度
- **screen**: 屏幕总高度
- **bottom**: 底部安全区域高度

### 平台适配

- **APP**: 自动隐藏 TabBar，获取状态栏高度
- **微信小程序**: 获取胶囊按钮信息，计算安全区域
- **APP-PLUS**: 设置默认状态栏高度为 45px

### 代码实现

```js
/**
 * status 状态栏 | menu 小程序胶囊 | screen 屏幕
 * @returns {{
 *  status: number,
 *  menu: number,
 *  screen: number,
 *  bottom: number
 * }} - safeHeight
 */
export function useHeight() {
  const safeHeight = {};

  safeHeight.status = uni.getSystemInfoSync().statusBarHeight || 0;
  // #ifdef APP
  uni.hideTabBar();
  // #endif

  // #ifdef MP-WEIXIN
  const menuButton = uni.getMenuButtonBoundingClientRect();
  // menuHeight.value = menuButton.height;
  safeHeight.menu = menuButton.height;
  safeHeight.status = menuButton.top;
  // #endif

  // #ifdef APP-PlUS
  safeHeight.status = uni.getSystemInfoSync().statusBarHeight || 45;
  // #endif

  const info = uni.getWindowInfo();
  safeHeight.screen = info.screenHeight;
  safeHeight.bottom = info.screenHeight - info.safeArea.bottom;
  safeHeight.menu = safeHeight.menu || 0;

  return safeHeight;
}
```

### 使用示例

```js
// 在页面中使用
const { status, menu, screen, bottom } = useHeight();

// 设置自定义导航栏高度
const navHeight = status + menu;

// 设置内容区域样式
const contentStyle = {
  paddingTop: `${navHeight}px`,
  paddingBottom: `${bottom}px`,
  minHeight: `${screen - navHeight - bottom}px`
};
```

## getHeight - 获取元素高度

通过选择器获取指定元素的高度，返回 Promise 对象。

### 功能说明

异步获取页面中指定元素的实际渲染高度，常用于动态计算布局。

### 参数说明

- **idOrClass**: `string` - 元素的 ID 或 class 选择器（如 `#myId` 或 `.myClass`）

### 返回值

- `Promise<number>` - 元素的高度值（单位：px）

### 代码实现

```js
/**
 * 通过类或者id 获取元素高度
 * @param {string} idOrClass
 * @returns {Promise<number>} 元素高度
 */
export function getHeight(idOrClass) {
  return new Promise((resolve) => {
    const query = uni.createSelectorQuery();
    query.select(idOrClass).boundingClientRect((data) => {
      if ("height" in data) {
        resolve(data.height);
      }
    }).exec();
  });
}
```

### 使用示例

```js
// 获取头部导航高度
const headerHeight = await getHeight('#header');
console.log('头部高度:', headerHeight);

// 获取列表容器高度
getHeight('.list-container').then(height => {
  console.log('列表容器高度:', height);
});

// 在组件中使用
onMounted(async () => {
  const contentHeight = await getHeight('.content');
  // 根据内容高度调整其他元素
});
```

## gotoBack - 智能返回导航

智能判断页面栈情况，执行返回上一页或跳转到首页的操作。

### 功能说明

- 当页面栈长度 > 1 时：执行返回上一页操作
- 当页面栈长度 ≤ 1 时：跳转到首页（防止用户无法返回）

### 使用场景

- 自定义导航栏的返回按钮
- 页面中的返回操作
- 防止用户在首页时点击返回导致应用退出

### 代码实现

```js
/**
 * 返回上一页或首页
 */
export function gotoBack() {
  // uni.navigateBack();
  // 获取当前页面栈信息
  const pages = getCurrentPages();

  // 页面栈长度为1时，说明当前是首页或无法返回，直接跳转到首页
  if (pages.length <= 1) {
    uni.switchTab({
      url: "/pages/home/home", // 替换为你的首页路径
    });
  }
  else {
    // 页面栈长度大于1时，执行返回操作
    uni.navigateBack({
      delta: 1, // 返回的页面数
    });
  }
}
```

### 使用示例

```vue
<template>
  <!-- 自定义导航栏返回按钮 -->
  <view class="nav-bar">
    <view class="back-btn" @click="gotoBack">
      <text class="iconfont icon-back"></text>
    </view>
    <text class="title">页面标题</text>
  </view>
  
  <!-- 页面内返回按钮 -->
  <button @click="gotoBack">返回</button>
</template>

<script>
export default {
  methods: {
    gotoBack() {
      // 调用工具函数
      gotoBack();
    }
  }
}
</script>
```

### 注意事项

- 需要根据实际项目修改首页路径 `/pages/home/home`
- 确保首页在 `pages.json` 中配置为 tabBar 页面

## validates - 表单校验器

通用的表单校验工具，支持多个校验规则，自动显示错误提示。

### 功能说明

- 支持单个或多个校验函数
- 自动显示 toast 错误提示
- 可配置返回布尔值或错误信息字符串
- 支持自定义 toast 样式

### 参数说明

- **validators**: `Function | Function[]` - 校验函数或校验函数数组
- **toastConfig**: `object` - toast 配置选项
  - `title`: `string` - toast 标题
  - `icon`: `string` - toast 图标，默认 "none"
  - `returnBoolean`: `boolean` - 是否返回布尔值，默认 true

### 返回值

- `boolean | string` - 根据 `returnBoolean` 配置返回校验结果

### 代码实现

```js
/**
 * toast配置
 * @typedef {object} toastConfig
 * @property {string} title - toast标题
 * @property {string} icon - toast图标，默认none
 * @property {boolean} returnBoolean - 是否返回字符串，默认返回布尔值
 */

/**
 * 校验器
 * @example
 * const validators = [
 *   () => !email && "请输入邮箱", // && if true: return msge
 * ];
 * validates(validators);
 * @param {Array<Function>|Function} validators 校验函数数组，每个函数返回校验错误信息或空字符串
 * @param {toastConfig} toastConfig 校验失败时的toast配置
 * @returns {string|boolean} 校验错误信息或空字符串
 */
export function validates(validators, toastConfig = { icon: "none", returnBoolean: true }) {
  for (const validator of [validators].flat()) {
    const msg = validator();
    if (msg) {
      uni.showToast({ title: msg, ...toastConfig });
      return toastConfig.returnBoolean ? false : msg;
    }
  }
  return toastConfig.returnBoolean ? true : "";
}
```

### 使用示例

```js
// 基础用法 - 单个校验
const isValid = validates(() => !email && "请输入邮箱");

// 多个校验规则
const validators = [
  () => !email && "请输入邮箱",
  () => !/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/.test(email) && "邮箱格式不正确",
  () => !password && "请输入密码",
  () => password.length < 6 && "密码长度不能少于6位",
  () => password !== confirmPassword && "两次密码输入不一致"
];

const isValid = validates(validators);

// 返回错误信息而不是布尔值
const errorMsg = validates(validators, { 
  icon: "none", 
  returnBoolean: false 
});

// 自定义 toast 样式
const isValid = validates(validators, {
  icon: "error",
  duration: 2000,
  returnBoolean: true
});

// 在表单提交中使用
const handleSubmit = () => {
  const validators = [
    () => !formData.name && "请输入姓名",
    () => !formData.phone && "请输入手机号",
    () => !/^1[3-9]\d{9}$/.test(formData.phone) && "手机号格式不正确"
  ];
  
  if (!validates(validators)) {
    return; // 校验失败，不执行后续操作
  }
  
  // 校验通过，执行提交逻辑
  submitForm();
};
```

### 高级用法

```js
// 异步校验（需要配合 async/await）
const asyncValidators = [
  () => !username && "请输入用户名",
  async () => {
    const exists = await checkUsernameExists(username);
    return exists && "用户名已存在";
  }
];

// 条件校验
const conditionalValidators = [
  () => !email && "请输入邮箱",
  () => isVip && !inviteCode && "VIP用户请输入邀请码"
];

// 复杂校验逻辑
const complexValidators = [
  () => {
    if (!age) return "请输入年龄";
    if (age < 18) return "年龄不能小于18岁";
    if (age > 100) return "请输入有效年龄";
    return ""; // 校验通过返回空字符串
  }
];
```
