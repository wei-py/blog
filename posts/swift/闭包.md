---
title: swift 闭包
date: 2025-12-12
category: swift
tags:
  - SwiftUI
  - iOS
  - 闭包
---

# 闭包表达式语法
```swift
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
```

# 根据上下文推断类型
```swift
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
```

# 单表达式闭包的隐式返回
```swift
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
```

# 参数名称缩写
```swift
reversedNames = names.sorted(by: { $0 > $1 } )
```

# 运算符方法

```swift
reversedNames = names.sorted(by: >)
```

# 尾随闭包

```swift
reversedNames = names.sorted() { $0 > $1 }
reversedNames = names.sorted { $0 > $1 }
```
