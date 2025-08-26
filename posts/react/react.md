---
title: react
date: 2025-08-22
category: react
tags:
  - react
---

## 声明模式

- 路由
  - NavLink
- url
- 导航

## 数据模式 推荐

- 路由
- 路由对象
- 操作
- 导航
  - Link
    - to (path) // 跳转路径
    - replace (path) // 替换当前历史记录
    - state (any) // 传递数据
    - relative (string) // 相对路径跳转
    - preventScrollReset (boolean) // 阻止滚动重置
    - viewTransition (boolean) // 是否使用视图过渡动画
  - NavLink
    - 同上
    - 多了一些类名属性
  - useNavigation
  - redirect
- 待处理用户界面
- 自定义框架

## 路由模式

- createBrowserRouter
- createHashRouter
- createMemoRouter
- createStaticRouter

## 路由

- 嵌套路由
- 布局路由
  - 省略 path
- 索引路由
  - index: true
- 前缀路由
  - 省略 Component
- 动态路由

## 传参数

- query
  - 搜索和分页
- params
  - 推荐使用
- state
  - 复杂数据类型
  - 缺点不能分享

## 懒加载

- lazy
  - 使用 navigation
    - state
      - idle 空闲状态
      - submitting 提交状态
      - loading 加载状态

## 操作

- loader
- action

## 边界处理

- ErrorBoundary

## store

- zustand
- immer
- useShallow
- 中间件
- 订阅

## 新增页面

- router
- pages
- menu

- store
- git add

## 编辑器

- pnpm dev
- yazi
- lazygit
- oco
