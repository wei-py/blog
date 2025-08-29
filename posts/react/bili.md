---
title: react hooks
date: 2025-08-25
category: react
tags:
  - react
  - hooks
---

## react

## vidoe

- <https://www.bilibili.com/video/BV1vqoVY5ELc>

## 概念

- compoenents
- tsx
- props
- children
- key
- virtual dom
  - update dom
  - diffs
  - reconciliation
- events
- state
  - useState
    - controlled components
  - useReducer
  - useContext
  - useRef
  - useEffect
  - useMemo
  - useCallback
  - useLayoutEffect
- purity
- strict mode
- portals
- suspense
- ErrorBoundary

## 钩子

- state management

  - useState // 状态
  - useReducer // 用户交互频繁
  - useSyncExternalStore // 状态管理库

- Effect hooks

  - useEffect // 绘制 ui 后进行 异步
  - useLayoutEffect // 绘制 ui 前进行 同步 ps: 获取 dom 高度等
  - useInsertionEffect // css js

- ref hook

  - useRef
  - useImperativeHandle

- Performance hooks

  - useMemo // 只有在依赖性变化时重新渲染 缓存值 ps: 计算数字的总和
  - useCallback // 缓存函数

- context hook

  - useContext // 读取上下文值

- Transition hooks

  - useTransition // ps: 过滤列表
  - useDeferredValue

- random hooks

  - useDebugValue
  - useId

- 19 hooks

  - useFormStatus
  - useFormState
  - useOptimistic
  - use
