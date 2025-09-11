---
title: next 渲染机制
date: 2025-09-11
category: next
tags:
  - next
  - render
---

# Next.js 渲染策略

## 预渲染 (Pre-rendering)

### 两种形式

- **静态生成 (Static Generation)**
  - HTML 在 **构建时 (build time)** 生成
  - 生成的文件在每次请求时被重用
  - 可被 CDN 缓存，性能最佳
  - **推荐** 作为首选方案
- **服务器端渲染 (Server-side Rendering, SSR)**
  - HTML 在 **每次请求时 (request time)** 生成
  - 无法被 CDN 缓存，TTFB 较慢

### 混合渲染

- Next.js 允许为每个页面单独选择渲染方式
- 可以创建混合渲染的应用：大部分页面用静态生成，少数用服务器端渲染

## 静态生成 (Static Generation)

### 不带数据

- 默认行为
- 示例: 简单的 About 页面

### 带数据

- 使用 `getStaticProps`
  - 在构建时获取数据
  - 将数据作为 props 传递给页面组件
- 动态路由页面需配合 `getStaticPaths`
  - 指定需要预渲染的动态路径
  - `fallback` 选项: `false`, `true`, `'blocking'`

### 增量静态再生 (ISR)

- 通过 `revalidate` 属性启用
- 在不重建整个网站的情况下，按需重新生成静态页面
- 兼具静态网站的性能和动态内容的灵活性

## 服务器端渲染 (SSR)

- 使用 `getServerSideProps`
  - 在每次请求时获取数据
  - 适用于数据频繁更新或高度个性化的页面
- 性能考量: 仅在绝对必要时使用

## 客户端渲染 (Client-side Rendering)

- 与预渲染互补
- 适用于用户仪表盘等私有、频繁更新的页面
- 推荐使用 **SWR** 这个 React Hook 进行数据获取
  - 自动处理缓存、重新验证、轮询等
