---
title: next 渲染机制
date: 2025-09-11
category: next
tags:
  - next
  - render
---

以下是基于Next.js官方文档（页面路由与数据获取）及搜索结果整理的渲染机制脑图框架，结合核心概念、技术实现和适用场景进行结构化梳理：

Next.js渲染模式脑图
中心主题：Next.js多模式渲染体系
一、核心渲染策略

静态生成（SSG）

机制：getStaticProps在构建时预生成HTML，直接托管至CDN
特点：

TTFB <50ms，SEO友好
数据静态，需重新构建更新（可通过ISR优化）

适用场景：博客、文档等低频更新内容

服务端渲染（SSR）

机制：getServerSideProps每次请求时动态生成HTML
特点：

实时数据（100-500ms TTFB）
高服务器负载，需缓存优化（如Redis）

适用场景：电商详情页、用户个性化页面

增量静态再生（ISR）

机制：getStaticProps + revalidate定期后台更新静态页面
特点：

首次访问快，后台异步更新
平衡性能与数据新鲜度（如新闻列表）

客户端渲染（CSR）

机制：useEffect/SWR动态获取数据，无预渲染
特点：

低TTFB（10-50ms），无SEO支持
适合后台系统、交互密集型页面

二、关键技术支撑

数据获取方法

getStaticProps（SSG/ISR）
getServerSideProps（SSR）
getStaticPaths（动态路由预定义）
客户端useSWR（CSR）

架构特性

同构渲染：服务端生成HTML + 客户端水合
流式渲染：分块传输优先返回首屏（Suspense）
边缘计算：Vercel边缘节点降低延迟

优化手段

代码分割（按路由自动拆分）
图片优化（next/image懒加载）
部分水合（仅激活交互组件）

三、渲染流程对比

模式TTFBSEO支持数据实时性优化手段SSG<50ms✅❌（静态）CDN预分发SSR100-500ms✅✅（实时）边缘计算 + 缓存ISR<50ms✅⚠️（准实时）按需再生CSR10-50ms❌✅（动态）预加载 + 懒加载
四、混合渲染策略

场景示例：

首页用SSG（高性能） + 详情页用SSR（实时性） + 列表页用ISR（平衡）

优先级规则：getServerSideProps存在时自动禁用SSG/ISR

脑图延伸方向

底层原理：React协调机制、水合过程（hydrateRoot）
动态路由：getStaticPaths预定义路径与fallback策略
性能监控：TTFB、FCP指标与优化工具链

可通过工具（如XMind/Miro）将上述结构可视化，突出核心分支与关联性。如需更详细的实现流程（如SSR水合步骤），可参考具体技术文档。
