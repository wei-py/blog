---
date: 2025-08-08
title: 类型安全和型变
category: typescript
tags:
  - typescript
description:
---

## 类型安全和型变

### 协变

```ts
type Animal = { name: string };
type Dog = { name: string; bark(): void };

// 函数返回 Dog，可以赋值给返回 Animal 的函数
type Getter = () => Animal;
const getDog = (): Dog => ({ name: '旺财', bark() {} });

const getter: Getter = getDog; // ✅ 允许！TypeScript 中函数返回值是协变的
```

协变 = 越来越具体 → 能替代更抽象的

### 逆变

```ts
type Animal = { name: string };
type Dog = { name: string; bark(): void };

// 函数接收 Animal
type Handler = (animal: Animal) => void;
const handleDog = (dog: Dog) => {
  dog.bark(); // 只能处理 Dog
};

// ❌ TypeScript 默认不允许！但理论上逆变允许这个赋值
// const handler: Handler = handleDog; // ❌ 错误：不能把只接受 Dog 的函数，当成能处理所有 Animal 的函数
```

### 双向协变

TypeScript 在非严格模式下，对函数参数允许双向协变，这是为了兼容 JavaScript 的灵活性，但不安全

> 🔒 在 --strictFunctionTypes 下，函数参数是逆变的，禁止协变赋值。

### 不变

```ts
type Animal = { name: string };
type Dog = { name: string; bark(): void };

const dogs: Dog[] = [
  { name: '旺财', bark() {} },
  { name: '小黑', bark() {} },
];

// const animals: Animal[] = dogs; // ❌ 不允许！尽管 Dog ≼ Animal
```

因为数组是可变的，如果你把 Dog[] 当作 Animal[]，可能会往里面塞 Cat：
