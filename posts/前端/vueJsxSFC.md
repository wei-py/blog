---
date: 2025-06-22
title: vue jsx sfc
category: vue
tags:
  - DSL
  - 风格的组件系统
---

## sfc

```js
function sfc(callback) {
  const state = reactive({})
  const curryFn = curry(callback)

  if (isAsyncFunction(callback)) {
    return curryFn(state).then((templateRender) => {
      return defineComponent(
        {
          props: state,
          setup(props, ctx) {
            return () => templateRender(ctx, props)
          },
        },
      )
    })
  }
  else {
    const templateRender = curryFn(state)
    return defineComponent(
      {
        props: state,
        setup(props, ctx) {
          return () => templateRender(ctx, props)
        },
      },
    )
  }
}
```

## asyncSfc

```js
function asyncSfc(element) {
  const asyncComponent = defineAsyncComponent({
    loader: async () => {
      return await element
    },
    loadingComponent: h('div', 'loadingComponent'),
    errorComponent: h('div', 'errorComponent'),
  })
  return h(asyncComponent)
}
```

## isAsyncFunction

```js
function isAsyncFunction(func) {
  return /^async\s/.test(func.toString())
}
```

## App.jsx

```jsx
import sfc from './utils/sfc'

export default defineAsyncComponent(async () => {
  const btn = sfc(
    (state) => {
      try {
        state.count = 1
        return () => {
          return (
            <div>
              <button className="!bg-pink-300 text-white">
                {state.count}
              </button>
            </div>
          )
        }
      }
      catch (error) {
        return () => <div>{error}</div>
      }
    },
  )
  return () => {
    return (
      <div>
        <btn onClick={() => {
          btn.props.count++
        }}
        />
      </div>
    )
  }
})
```

## sfc.js

```js
import { curry } from 'lodash-es'
import isAsyncFunction from './isAsyncFunction'

function sfc(callback) {
  const state = reactive({})
  const curryFn = curry(callback)

  if (isAsyncFunction(callback)) {
    return curryFn(state).then((templateRender) => {
      return defineComponent(
        {
          props: state,
          setup(props, ctx) {
            return () => templateRender(ctx, props)
          },
        },
      )
    })
  }
  else {
    const templateRender = curryFn(state)
    return defineComponent(
      {
        props: state,
        setup(props, ctx) {
          return () => templateRender(ctx, props)
        },
      },
    )
  }
}

function asyncSfc(element) {
  const asyncComponent = defineAsyncComponent({
    loader: async () => {
      return await element
    },
    loadingComponent: h('div', 'loadingComponent'),
    errorComponent: h('div', 'errorComponent'),
  })
  return h(asyncComponent)
}

export { asyncSfc }
export default sfc
```
