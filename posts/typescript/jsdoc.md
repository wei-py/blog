---
title: 学习 jsdoc
date: 2025-07-18
category: javascript
tags:
  - javascript
---

在 JSDoc 中，有几种方式可以描述函数返回一个对象。以下是常用的几种方法：

## 1. 使用 `@returns` 或 `@return` 标签

### 基本对象返回
```javascript
/**
 * 创建用户对象
 * @returns {Object} 用户对象
 */
function createUser() {
  return { name: 'John', age: 30 };
}
```

### 详细描述对象属性
```javascript
/**
 * 获取用户信息
 * @returns {{name: string, age: number, email: string}} 用户信息对象
 */
function getUserInfo() {
  return {
    name: 'John',
    age: 30,
    email: 'john@example.com'
  };
}
```

### 使用多行描述复杂对象
```javascript
/**
 * 获取完整的用户配置
 * @returns {{
 *   id: number,
 *   profile: {
 *     name: string,
 *     avatar: string
 *   },
 *   settings: {
 *     theme: string,
 *     notifications: boolean
 *   }
 * }} 用户配置对象
 */
function getUserConfig() {
  return {
    id: 1,
    profile: {
      name: 'John',
      avatar: 'avatar.jpg'
    },
    settings: {
      theme: 'dark',
      notifications: true
    }
  };
}
```

## 2. 使用 `@typedef` 定义类型别名

对于复杂的对象结构，建议先定义类型别名：

```javascript
/**
 * @typedef {Object} User
 * @property {string} name - 用户姓名
 * @property {number} age - 用户年龄
 * @property {string} email - 用户邮箱
 * @property {string[]} hobbies - 用户爱好列表
 */

/**
 * 创建用户
 * @param {string} name - 姓名
 * @param {number} age - 年龄
 * @returns {User} 创建的用户对象
 */
function createUser(name, age) {
  return {
    name: name,
    age: age,
    email: `${name}@example.com`,
    hobbies: []
  };
}
```

## 3. 嵌套对象的类型定义

```javascript
/**
 * @typedef {Object} Address
 * @property {string} street - 街道地址
 * @property {string} city - 城市
 * @property {string} country - 国家
 */

/**
 * @typedef {Object} UserProfile
 * @property {string} name - 用户名
 * @property {number} age - 年龄
 * @property {Address} address - 地址信息
 */

/**
 * 获取用户资料
 * @returns {UserProfile} 用户资料对象
 */
function getUserProfile() {
  return {
    name: 'John',
    age: 30,
    address: {
      street: '123 Main St',
      city: 'New York',
      country: 'USA'
    }
  };
}
```

## 4. 可选属性和联合类型

```javascript
/**
 * @typedef {Object} ApiResponse
 * @property {boolean} success - 请求是否成功
 * @property {string} message - 响应消息
 * @property {Object} [data] - 响应数据（可选）
 * @property {number} [errorCode] - 错误代码（可选）
 */

/**
 * 发送 API 请求
 * @returns {ApiResponse} API 响应对象
 */
function makeApiRequest() {
  return {
    success: true,
    message: 'Success',
    data: { id: 1 }
  };
}
```

## 5. 数组对象

```javascript
/**
 * @typedef {Object} Product
 * @property {number} id - 产品ID
 * @property {string} name - 产品名称
 * @property {number} price - 产品价格
 */

/**
 * 获取产品列表
 * @returns {Product[]} 产品数组
 */
function getProducts() {
  return [
    { id: 1, name: 'Laptop', price: 999 },
    { id: 2, name: 'Mouse', price: 25 }
  ];
}
```

## 最佳实践

1. **简单对象**：直接在 `@returns` 中描述属性
2. **复杂对象**：使用 `@typedef` 定义类型别名
3. **可复用类型**：如果同一个对象结构在多个地方使用，一定要用 `@typedef`
4. **添加描述**：为每个属性添加描述信息，提高文档可读性

这样写出来的 JSDoc 不仅能让其他开发者更容易理解你的代码，还能让 IDE 提供更好的代码提示和类型检查。
