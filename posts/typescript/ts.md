---
title: 学习 typescript
date: 2025-07-18
category: typescript
tags:
  - typescript
---

## 1. 模式匹配做提取

### first

```ts
type getFirst<Arr extends unknow[]> = Arr extends [infer First, ...unknow[]]
  ? First
  : unknow;
```

### replace

```ts
type Replace<
  Str extends string,
  From extends string,
  To extends string
> = Str extends `${infer Prefix}${From}${infer Suffix}`
  ? `${Prefix}${To}${Suffix}`
  : Str;
```

### getParameters

```ts
type GetParameters<Func extends Function> = Func extends (
  ...args: infer Args
) => unknow
  ? Args
  : never;
```

### getConstructorParameters

```ts
type GetConstructorParameters<
  ConstructorType extends new (...args: any) => any
> = ConstructorType extends new (...args: infer ParametersType) => any
  ? ParametersType
  : never;
```

## 2. 重新构造做变换

### Zip

```ts
type Zip<One extends unknow[], Other extends unknow[]> = One extends [
  infer OneFirst,
  ...infer OneRest
]
  ? Other extends [infer OtherFirst, ...infer OtherRest]
    ? [[OneFirst, OtherFirst], ...Zip<OneRest, OtherRest>]
    : []
  : [];
```

### dropSubStr

```ts
type DropSubStr<
  Str extends string,
  SubStr extends string
> = Str extends `${infer Pre}${SubStr}${Suf}`
  ? DropSubStr<`${Pre}${Suf}`, SubStr>
  : Str;
```

### appendArgument

```ts
type AppendArgument<Func extends Function, Arg> = Func extends (
  ...args: infer Args
) => infer ReturnType
  ? (...args: [...Args, Arg]) => ReturnType
  : never;
```

### filterByValueType

```ts
type FilterByValueType<Obj extends Record<string, any>, ValueType> = {
  [Key in keyof Obj as Obj[Key] extends ValueType ? Key : never]: Obj[Key];
};
```

## 3. 递归复用做循环

### deepPromiseValueType

```ts
type DeepPromiseValueType<P extends Promise<T>> = T extends Promise<unknown>
  ? DeepPromiseValueType<T>
  : T;
```

### buildArray

```ts
type BuildArray<
  Length extends number,
  Ele = unknow,
  Arr extends unknow[]
> = Arr["Length"] extends Length ? Arr : BuildArray<Length, Ele, [...Arr, Ele]>;
```

### replaceAll

```ts
type ReplaceAll<
  Str extends string,
  From extends string,
  To extends string
> = Str extends `${infer Left}${From}${infer Right}`
  ? `${Left}${To}${ReplaceAll<Right, From, To>}`
  : Str;

type StringToUnion<Str extends string> =
  Str extends `${infer First}${infer Rest}`
    ? First | StringToUnion<Rest>
    : never;
```

### deepReadonly

```ts
type DeepReadonly<T> = {
  readonly [K in keyof T]: T[K] extends (...args: any[]) => any
    ? T[K]
    : T[K] extends object
    ? DeepReadonly<T[K]>
    : T[K];
};
```

## 4. 数组长度做计数

```ts
type Add<Num1 extends number, Num2 extends number> = [
  ...BuildArray<Num1>,
  ...BuildArray<Num2>
]["length"];

type Subtract<
  Num1 extends number,
  Num2 extends number
> = BuildArray<Num1> extends [...arr1: BuildArray<Num2>, ...arr2: infer Rest]
  ? Rest["length"]
  : never;

type Mutiply<
  Num1 extends number,
  Num2 extends number,
  ResultArr extends unknown[] = []
> = Num2 extends 0
  ? ResultArr["length"]
  : Mutiply<Num1, Subtract<Num2, 1>, [...BuildArray<Num1>, ...ResultArr]>;

type Divide<
  Num1 extends number,
  Num2 extends number,
  CountArr extends unknown[] = []
> = Num1 extends 0
  ? CountArr["length"]
  : Divide<Subtract<Num1, Num2>, Num2, [unknown, ...CountArr]>;
```

### GreaterThan

```ts
type GreaterThan<
  Num1 extends number,
  Num2 extends number,
  CountArr extends unknown[] = []
> = Num1 extends Num2
  ? false
  : CountArr["length"] extends Num2
  ? true
  : CountArr["length"] extends Num1
  ? false
  : GreaterThan<Substruct<Num1, Num2>, Num2, [...CountArr, unknown]>;
```

### Fibonacci

```ts
type FibonacciLoop<
  PrevArr extends unknown[],
  CurrentArr extends unknown[],
  IndexArr extends unknown[] = [],
  Num extends number = 1
> = IndexArr["length"] extends Num
  ? CurrentArr["length"]
  : FibonacciLoop<
      CurrentArr,
      [...PrevArr, ...CurrentArr],
      [...IndexArr, unknown],
      Num
    >;

type Fibonacci<Num extends number> = FibonacciLoop<[1], [], [], Num>;
```

## 5. 联合分散可简化

### IsUnion

```ts
type IsUnion<A, B = A> = A extends A ? ([B] extends [A] ? false : true) : never;

// [string | number] extends [string | number] ? false : truekk
// [string | number] 会被当作 [string] | [number]
```

### AllCombinations

```ts
type Combination<A extends string, B extends string> =
  | A
  | B
  | `${A}${B}`
  | `${B}${A}`;

type AllCombinations<A extends string, B extends string = A> = A extends A
  ? Combination<A, AllCombinations<Exclude<B, A>>>
  : never;
```

- **never**代表不可达，比如函数抛异常的时候，返回值就是 never。
- **void**代表空，可以是 undefined 或 never。
- **any**是任意类型，任何类型都可以赋值给它，它也可以赋值给任何类型（除了 never）。
- **unknown**是未知类型，任何类型都可以赋值给它，但是它不可以赋值给别的类型。
