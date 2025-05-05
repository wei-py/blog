---
title: vue 生命周期
date: 2025-05-05
category:
  - 前端
tags:
  - life
  - vue
  - frontEnd
---

# Vue 生命周期详解：Vue2 与 Vue3 对比

## 一、生命周期基础概念

生命周期是指 Vue 实例从创建到销毁的完整过程，分为初始化、挂载、更新、销毁四个阶段。Vue2 和 Vue3 在生命周期设计上有以下差异：

| 阶段       | Vue2 选项式    | Vue3 选项式    | Vue3 组合式 API    |
| ---------- | -------------- | -------------- | ------------------ |
| 创建前     | beforeCreate   | beforeCreate   | setup()            |
| 创建后     | created        | created        | setup()            |
| 挂载前     | beforeMount    | beforeMount    | onBeforeMount()    |
| 挂载后     | mounted        | mounted        | onMounted()        |
| 更新前     | beforeUpdate   | beforeUpdate   | onBeforeUpdate()   |
| 更新后     | updated        | updated        | onUpdated()        |
| 销毁前     | beforeDestroy  | beforeUnmount  | onBeforeUnmount()  |
| 销毁后     | destroyed      | unmounted      | onUnmounted()      |
| 错误捕获   | errorCaptured  | errorCaptured  | onErrorCaptured()  |
| 服务端渲染 | serverPrefetch | serverPrefetch | onServerPrefetch() |

## 二、父子组件生命周期执行顺序

### 加载渲染过程

```text
父beforeCreate → 父created →
父beforeMount → 子beforeCreate → 子created →
子beforeMount → 子mounted →
父mounted
```

### 更新过程

```text
父beforeUpdate →
子beforeUpdate → 子updated →
父updated
```

### 销毁过程

```text
父beforeUnmount →
子beforeUnmount → 子unmounted →
父unmounted
```

## 三、缓存组件生命周期（keep-alive）

```html
<keep-alive>
	<component :is="currentComponent" />
</keep-alive>
```

| 钩子        | 触发时机       | Vue2/Vue3 |
| ----------- | -------------- | --------- |
| activated   | 缓存组件激活时 | ✅        |
| deactivated | 缓存组件失活时 | ✅        |

> 注意：首次加载时 mounted 会先于 activated 触发

## 四、核心属性初始化时序

```js
export default {
	data() {
		return { msg: "Hello" };
	}, // 响应式数据初始化
	computed: {
		upper() {
			return this.msg.toUpperCase();
		}
	}, // 在 created 后可用
	watch: {
		msg(newVal) {
			/* 在 created 后生效 */
		}
	},
	methods: {
		greet() {
			console.log(this.msg);
		}
	} // created 后可用
};
```

## 五、异步操作的影响

### 在生命周期中使用异步操作：

```js
// Vue2 示例
mounted() {
  fetchData().then(res => {
    this.data = res
    this.$nextTick(() => {
      // 处理 DOM 更新
    })
  })
}

// Vue3 组合式 API
onMounted(async () => {
  const res = await fetchData()
  data.value = res
  nextTick(() => {
    // 处理 DOM 更新
  })
})
```

### 清理异步任务：

```js
// Vue2
beforeUnmount() {
  if (this.request) this.request.cancel()
}

// Vue3
onBeforeUnmount(() => {
  controller.abort()
})
```

## 六、生命周期执行顺序实验

```html
<!-- 父组件模板 -->
<template>
	<div>
		<Child v-if="showChild" />
	</div>
</template>

<script>
	// Vue3 组合式 API 示例
	export default {
		components: { Child },
		setup() {
			const showChild = ref(true);

			onBeforeMount(() => console.log("父组件 beforeMount"));
			onMounted(() => console.log("父组件 mounted"));
			onBeforeUpdate(() => console.log("父组件 beforeUpdate"));
			onUpdated(() => console.log("父组件 updated"));

			return { showChild };
		}
	};
</script>
```

## 七、Vue3 Composition API 特性

1. setup() 函数替代 beforeCreate/created
2. 新增 useSlots() 和 useAttrs() API
3. watchEffect() 自动追踪响应依赖
4. 生命周期钩子需要显式导入：

```js
import {
	onBeforeMount,
	onMounted
	// ...其他钩子
} from "vue";
```

## 八、常见问题解决方案

1. **数据加载时机**：推荐在 mounted（Vue2）或 onMounted（Vue3）中发起异步请求
2. **DOM 操作**：必须在 mounted/onMounted 中进行
3. **响应式数据监听**：使用 watch/onWatch 实现深度监听
4. **性能优化**：在 activated/deactivated 中控制定时器启停

## 九、Vue3 生命周期新特性

1. **Suspense 组件**：异步依赖加载状态管理

```html
<Suspense>
	<template #default>
		<AsyncComponent />
	</template>
	<template #fallback>Loading...</template>
</Suspense>
```

2. **组合式 API 执行上下文**：

- setup() 中无法访问 this
- 生命周期钩子必须显式导入
- 更好的 TypeScript 类型推导支持

## 十、总结对比表

| 特性             | Vue2                  | Vue3                  |
| ---------------- | --------------------- | --------------------- |
| 组合式 API       | ❌                    | ✅（推荐）            |
| setup() 函数     | ❌                    | ✅                    |
| 生命周期钩子数量 | 8 个                  | 8 个（名称变更）      |
| 缓存组件钩子     | activated/deactivated | activated/deactivated |
| 异步组件支持     | 需要回调              | 原生支持 Suspense     |
| TypeScript 支持  | 有限                  | 完全支持              |

通过合理利用生命周期钩子，可以有效管理组件的创建、更新和销毁过程。在实际开发中，建议优先使用 Vue3 的组合式 API 来获得更灵活的逻辑复用能力和更好的类型支持。对于需要性能优化的场景，合理使用 keep-alive 缓存和异步加载策略可以显著提升应用性能。
