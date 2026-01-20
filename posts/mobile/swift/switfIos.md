---
title: SwiftUI 与 Web 开发的全面对比：从 HTML、Tailwind 到原生能力
date: 2025-12-02
category: swift
tags:
  - SwiftUI
  - iOS
  - Web开发迁移
  - TailwindCSS
  - 原生API
---

# 标签学习

## 类似 html 全部类比一下，给出全部的例子

在 SwiftUI 中，并没有直接等同于 HTML 的“标签”概念，因为 SwiftUI 是一个**声明式 UI 框架**，基于 **Swift 语言**构建原生 iOS/macOS 等平台的用户界面，而 HTML 是用于构建**网页结构**的标记语言。但我们可以将常见的 HTML 元素与 SwiftUI 中功能或语义相近的视图（View）进行类比，帮助你从 Web 开发迁移到 SwiftUI。

下面是一个 **HTML 元素 vs SwiftUI 视图** 的全面对照表，并附上简单示例：


### 🧱 基础结构类

| HTML 元素  | SwiftUI 类比                                              | 说明                         |
| ---------- | --------------------------------------------------------- | ---------------------------- |
| `<div>`    | `VStack` / `HStack` / `ZStack` / `Group`                  | 容器布局（垂直、水平、层叠） |
| `<span>`   | `Text`（内联文本）或 `Text` + `.inline`（无直接内联容器） | 行内文本或小片段             |
| `<body>`   | `App` 或 `Scene`（如 `WindowGroup`）                      | 应用入口                     |
| `<header>` | `NavigationView` + `Toolbar` 或 `VStack`                  | 顶部导航栏/标题栏            |
| `<footer>` | `VStack` 放在底部或 `Toolbar(.bottom)`                    | 底部区域                     |
| `<main>`   | 主 `VStack` 或 `ScrollView`                               | 主内容区                     |



### 📝 文本与排版

| HTML 元素          | SwiftUI 类比                       | 示例                             |
| ------------------ | ---------------------------------- | -------------------------------- |
| `<h1> - <h6>`      | `Text("...").font(.largeTitle)` 等 | `Text("Title").font(.title)`     |
| `<p>`              | `Text("...")`                      | `Text("Paragraph text")`         |
| `<strong>` / `<b>` | `Text("...").fontWeight(.bold)`    | `Text("Bold").fontWeight(.bold)` |
| `<em>` / `<i>`     | `Text("...").italic()`             | `Text("Italic").italic()`        |
| `<u>`              | `.underline()` 修饰符              | `Text("Underline").underline()`  |
| `<br>`             | `\n` 或多个 `Text`                 | `Text("Line1\nLine2")`           |
| `<hr>`             | `Divider()`                        | `Divider()`                      |



### 🔗 链接与交互

| HTML 元素               | SwiftUI 类比                                 | 示例                                           |
| ----------------------- | -------------------------------------------- | ---------------------------------------------- |
| `<a href="...">`        | `Link("Text", destination: URL)` 或 `Button` | `Link("Go", destination: URL(string: "...")!)` |
| `<button>`              | `Button { } label: { Text("Click") }`        | 标准按钮                                       |
| `<input type="button">` | 同上 `Button`                                | —                                              |

---

### 📥 表单控件

| HTML 元素                 | SwiftUI 类比                                 | 示例                                                       |
| ------------------------- | -------------------------------------------- | ---------------------------------------------------------- |
| `<input type="text">`     | `TextField("Placeholder", text: $text)`      | `@State var name = ""`<br>`TextField("Name", text: $name)` |
| `<input type="password">` | `SecureField("Password", text: $pwd)`        | —                                                          |
| `<input type="number">`   | `TextField(...).keyboardType(.numberPad)`    | 配合 `Int`/`Double` 绑定                                   |
| `<input type="email">`    | `TextField(...).keyboardType(.emailAddress)` | —                                                          |
| `<textarea>`              | `TextEditor(text: $text)`                    | 多行文本编辑                                               |
| `<select>`                | `Picker`（需配合 `ForEach`）                 | `Picker("Choose", selection: $selection) { ... }`          |
| `<input type="checkbox">` | `Toggle(isOn: $flag) { Text("...") }`        | 布尔开关                                                   |
| `<input type="radio">`    | 多个 `Picker` 或自定义 `Button` 切换         | 通常用 `Picker` 模拟                                       |
| `<label>`                 | 直接写在控件旁边或用 `Text`                  | SwiftUI 中 label 常内联在控件中                            |



### 🖼️ 媒体

| HTML 元素         | SwiftUI 类比                                     | 示例                                      |
| ----------------- | ------------------------------------------------ | ----------------------------------------- |
| `<img src="...">` | `Image("name")` 或 `AsyncImage(url:)`（iOS 15+） | `Image("logo")`<br>`AsyncImage(url: url)` |
| `<video>`         | 需用 `AVKit` 的 `VideoPlayer`（非纯 SwiftUI）    | 需导入 `AVKit`                            |



### 📋 列表与表格

| HTML 元素       | SwiftUI 类比                              | 示例                                   |
| --------------- | ----------------------------------------- | -------------------------------------- |
| `<ul>` / `<ol>` | `List { ForEach(items) { Text($0) } }`    | `List(items, id: \.self) { Text($0) }` |
| `<li>`          | `ForEach` 中的每个 `View`                 | —                                      |
| `<table>`       | 自定义 `HStack` + `VStack` 或 `LazyVGrid` | SwiftUI 无原生表格，需布局组合         |



### 🧩 其他常用

| HTML 元素                   | SwiftUI 类比                         | 说明                       |
| --------------------------- | ------------------------------------ | -------------------------- |
| `<form>`                    | 无直接对应，用 `VStack` 包裹表单控件 | 表单逻辑靠状态管理         |
| `<nav>`                     | `TabView` 或 `NavigationStack`       | 导航结构                   |
| `<section>`                 | `Group` 或 `VStack` 加 `Section`     | `Section("Title") { ... }` |
| `<article>`                 | 自定义 `View` 组件                   | 封装为可复用 View          |
| `<figure>` / `<figcaption>` | `VStack { Image; Text }`             | 图文组合                   |



### ✨ 布局与样式（类比 CSS）

SwiftUI 不使用 CSS，而是通过 **修饰符（Modifiers）** 实现样式：

| CSS 功能             | SwiftUI 修饰符                                             |
| -------------------- | ---------------------------------------------------------- |
| `width`, `height`    | `.frame(width: , height:)`                                 |
| `padding`            | `.padding()`                                               |
| `margin`             | 无直接 margin，用 `padding` 或 `Spacer()`                  |
| `background`         | `.background(Color.blue)`                                  |
| `color`              | `.foregroundStyle(.red)`（iOS 15+）或 `.foregroundColor()` |
| `text-align`         | `.multilineTextAlignment(.center)`                         |
| `display: flex`      | `HStack` / `VStack`                                        |
| `position: absolute` | `ZStack` + `.offset()` 或 `.position()`                    |
| `border`             | `.border(Color.gray)`                                      |
| `border-radius`      | `.clipShape(RoundedRectangle(cornerRadius: 8))`            |



### 🔁 状态与响应式（类比 JS + DOM）

- SwiftUI 使用 `@State`, `@Binding`, `@ObservedObject` 等属性包装器实现响应式更新。
- 类似 Vue 的 `ref` / `reactive` 或 React 的 `useState`。

```swift
@State private var name = ""
var body: some View {
    TextField("Enter name", text: $name) // $name 是 Binding
}
```



### ✅ 总结

| 领域      | Web (HTML/CSS/JS) | SwiftUI                      |
| --------- | ----------------- | ---------------------------- |
| 结构      | HTML 标签         | View 结构（VStack, Text 等） |
| 样式      | CSS               | 修饰符（.padding, .font 等） |
| 交互/逻辑 | JavaScript        | Swift + 属性包装器           |
| 响应式    | DOM 更新 / 框架   | 声明式 + 状态驱动            |

> ⚠️ 注意：SwiftUI 是**原生 UI 框架**，不是 Web 技术，因此不能“一一对应”，但上述类比有助于 Web 开发者快速理解 SwiftUI 的构建方式。

# 属性学习

## 我之前经常使用 tailwindcss, 给出全部例子来学习一下

非常好！你有 **Tailwind CSS** 的使用经验，这对你学习 **SwiftUI 的修饰符（Modifiers）** 非常有帮助——因为 **SwiftUI 的修饰符 ≈ Tailwind 的工具类（utility classes）**，都是通过链式、声明式的方式快速设置样式和布局。

下面我将 **以 Tailwind CSS 常用类为参照**，逐一对应到 **SwiftUI 的等效写法**，并给出完整可运行的代码示例，帮助你快速迁移思维。



## 🧩 基本原则：Tailwind → SwiftUI

| Tailwind CSS                  | SwiftUI 等效写法                            | 说明               |
| ----------------------------- | ------------------------------------------- | ------------------ |
| 工具类（如 `p-4`）            | 修饰符（如 `.padding(16)`）                 | 链式调用，顺序敏感 |
| 响应式/状态类（如 `hover:`）  | SwiftUI 有限支持（如 `.onHover`）或需自定义 | 原生交互逻辑不同   |
| 自定义主题（`theme.spacing`） | 使用 `@Environment` 或自定义常量            | 可封装复用         |



## 📏 1. 间距（Spacing） —— `p-*`, `m-*`

| Tailwind | SwiftUI                                              | 示例                                            |
| -------- | ---------------------------------------------------- | ----------------------------------------------- |
| `p-2`    | `.padding(8)`                                        | `Text("Hello").padding(8)`                      |
| `px-4`   | `.padding(.horizontal, 16)`                          | `.padding(.leading, 16).padding(.trailing, 16)` |
| `py-3`   | `.padding(.vertical, 12)`                            | —                                               |
| `pt-6`   | `.padding(.top, 24)`                                 | —                                               |
| `mb-4`   | **无 margin** → 用 `Spacer()` 或相邻视图的 `padding` | SwiftUI 没有 margin 概念                        |

✅ **技巧**：SwiftUI 布局基于“**挤压与填充**”，用 `Spacer()` 推开元素，用 `padding` 控制内边距。

```swift
HStack {
    Text("Left")
    Spacer() // ← 相当于右侧 margin auto
    Text("Right")
}
.padding(.horizontal, 16) // ← 相当于 px-4
```



## 🎨 2. 颜色（Color） —— `bg-*`, `text-*`

| Tailwind          | SwiftUI                                                         |
| ----------------- | --------------------------------------------------------------- |
| `bg-blue-500`     | `.background(Color.blue)`                                       |
| `text-red-600`    | `.foregroundStyle(.red)` （iOS 15+）或 `.foregroundColor(.red)` |
| `text-white`      | `.foregroundStyle(.white)`                                      |
| `border-gray-300` | `.border(Color.gray.opacity(0.5))`                              |

> ⚠️ 注意：SwiftUI 的 `Color` 是语义化的（如 `.primary`, `.secondary`），也支持自定义：

```swift
Text("Custom")
  .foregroundStyle(Color(hex: 0x3B82F6)) // 需扩展 Color 支持 hex
```

扩展 `Color` 支持 hex（可复用）：

```swift
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}
```



## 📐 3. 尺寸（Sizing） —— `w-*`, `h-*`, `max-w-*`

| Tailwind           | SwiftUI                              |
| ------------------ | ------------------------------------ |
| `w-32`             | `.frame(width: 128)`                 |
| `h-16`             | `.frame(height: 64)`                 |
| `w-full`           | `.frame(maxWidth: .infinity)`        |
| `h-screen`         | `.frame(maxHeight: .infinity)`       |
| `max-w-md` (768px) | `.frame(maxWidth: 768)`              |
| `aspect-square`    | `.aspectRatio(1, contentMode: .fit)` |

```swift
Rectangle()
  .fill(Color.blue)
  .frame(width: 128, height: 64) // w-32 h-16
```

---

## 🔲 4. 圆角与边框（Rounding & Border） —— `rounded-*`, `border`

| Tailwind       | SwiftUI                                             |
| -------------- | --------------------------------------------------- |
| `rounded`      | `.clipShape(RoundedRectangle(cornerRadius: 4))`     |
| `rounded-lg`   | `cornerRadius: 8`                                   |
| `rounded-full` | `.clipShape(Circle())` 或 `cornerRadius: .infinity` |
| `border`       | `.border(Color.gray, width: 1)`                     |
| `border-2`     | `.border(Color.gray, width: 2)`                     |

```swift
Text("Button")
  .padding(.horizontal, 16)
  .padding(.vertical, 8)
  .background(Color.gray.opacity(0.2))
  .clipShape(RoundedRectangle(cornerRadius: 8)) // rounded-lg
```



## 📰 5. 文本样式（Typography） —— `text-*`, `font-*`

| Tailwind        | SwiftUI                            |
| --------------- | ---------------------------------- |
| `text-sm`       | `.font(.system(size: 14))`         |
| `text-lg`       | `.font(.system(size: 18))`         |
| `font-bold`     | `.fontWeight(.bold)`               |
| `italic`        | `.italic()`                        |
| `underline`     | `.underline()`                     |
| `text-center`   | `.multilineTextAlignment(.center)` |
| `truncate`      | `.lineLimit(1)`                    |
| `text-ellipsis` | 同上（需配合 `lineLimit`）         |

```swift
Text("Bold Title")
  .font(.title2)
  .fontWeight(.bold)
  .multilineTextAlignment(.center)
```

> ✅ 建议优先使用语义化字体：`.font(.headline)`, `.font(.subheadline)`, `.font(.caption)` 等。



## 🧱 6. 布局（Layout） —— `flex`, `flex-col`, `items-center`, `justify-between`

SwiftUI **原生基于栈（Stack）布局**，比 Flexbox 更直观：

| Tailwind          | SwiftUI                                                                      |
| ----------------- | ---------------------------------------------------------------------------- |
| `flex`            | `HStack` / `VStack`                                                          |
| `flex-col`        | `VStack`                                                                     |
| `items-center`    | `VStack(alignment: .center)`                                                 |
| `justify-center`  | `VStack { ... }.frame(maxWidth: .infinity, maxHeight: .infinity)` + 内容居中 |
| `justify-between` | `VStack(spacing: 0) { item1; Spacer(); item2 }`                              |
| `gap-4`           | `VStack(spacing: 16) { ... }`                                                |

```swift
// Tailwind: flex flex-col items-center justify-between gap-4 p-4
VStack(alignment: .center, spacing: 16) {
    Text("Top")
    Text("Middle")
    Text("Bottom")
}
.padding(16)
.frame(maxHeight: .infinity) // 需放在有高度的容器中
```



## 🖼️ 7. 背景与遮罩 —— `bg-cover`, `bg-center`

SwiftUI 图片填充：

| Tailwind        | SwiftUI                                                   |
| --------------- | --------------------------------------------------------- |
| `bg-cover`      | `Image("bg").resizable().aspectRatio(contentMode: .fill)` |
| `object-center` | 默认行为，或用 `.clipped()` 控制裁剪区域                  |

```swift
Image("background")
  .resizable()
  .aspectRatio(contentMode: .fill) // ← bg-cover
  .frame(maxWidth: .infinity, maxHeight: .infinity)
  .clipped() // 裁剪超出部分
```



## 🖱️ 8. 交互状态（有限支持） —— `hover:`, `focus:`

SwiftUI **不直接支持 hover（移动端无 hover）**，但 macOS 支持：

```swift
@State private var isHovered = false

Text("Hover me")
  .padding()
  .background(isHovered ? Color.blue : Color.gray)
  .onHover { hovering in
      isHovered = hovering
  }
```

- `.onTapGesture` ≈ `@click`
- `.onChange` / `.onAppear` ≈ 生命周期



## 🧪 9. 可视性与条件渲染 —— `hidden`, `invisible`

| Tailwind    | SwiftUI                   |
| ----------- | ------------------------- |
| `hidden`    | **不渲染** → 用 `if` 条件 |
| `invisible` | 渲染但隐藏 → `.hidden()`  |

```swift
// hidden（不占用空间）
if showText {
    Text("Visible")
}

// invisible（占空间但不可见）
Text("Invisible")
  .hidden()
```



## 🎯 10. 响应式（Responsive）

SwiftUI 使用 **@Environment(\.horizontalSizeClass)** 或 **GeometryReader** 实现响应式：

```swift
@Environment(\.horizontalSizeClass) var horizontalSize

var body: some View {
    VStack {
        Text("Screen type: \(horizontalSize == .regular ? "iPad" : "iPhone")")
    }
    .padding(horizontalSize == .regular ? 64 : 16)
}
```

或者用 `GeometryReader` 获取尺寸：

```swift
GeometryReader { geometry in
    Text("Width: \(geometry.size.width)")
}
```



## ✅ 总结：Tailwind → SwiftUI 思维转换表

| 功能       | Tailwind CSS                           | SwiftUI                                         |
| ---------- | -------------------------------------- | ----------------------------------------------- |
| 内边距     | `p-4`, `px-2`                          | `.padding(16)`, `.padding(.horizontal, 8)`      |
| 外边距     | `m-4`, `mx-auto`                       | **无** → 用 `Spacer()` 或父容器 padding         |
| 颜色       | `text-blue-500`                        | `.foregroundStyle(.blue)`                       |
| 背景       | `bg-gray-100`                          | `.background(Color.gray.opacity(0.2))`          |
| 尺寸       | `w-full`, `h-32`                       | `.frame(maxWidth: .infinity, height: 128)`      |
| 圆角       | `rounded-lg`                           | `.clipShape(RoundedRectangle(cornerRadius: 8))` |
| 文本样式   | `text-lg font-bold`                    | `.font(.system(size: 18)).fontWeight(.bold)`    |
| 弹性布局   | `flex items-center`                    | `HStack(alignment: .center)`                    |
| 条件渲染   | `class="{{ hidden ? 'hidden' : '' }}"` | `if visible { Text(...) }`                      |
| 自定义主题 | `tailwind.config.js`                   | 自定义 `Color`、`Font` 扩展或常量               |



## 💡 建议

1. **不要试图 1:1 映射**，SwiftUI 是原生布局系统，更“声明式”。
2. **多用语义化修饰符**：如 `.font(.title)` 比 `.font(.system(size: 20))` 更好。
3. **封装可复用组件**：比如 `PrimaryButton`、`CardView`，就像你在 Tailwind 中用 `@apply`。



# 组件 目录 路由

非常好的问题！你已经掌握了 **SwiftUI 的基础视图与修饰符**（类比 HTML + Tailwind），现在我们来系统梳理 **SwiftUI 的完整开发生态**，包括：

- ✅ **组件（Components）**
- ✅ **导航与路由（Navigation / Routing）**
- ✅ **典型目录结构（Project Structure）**
- ✅ **状态管理（State Management）**
- ✅ **与 Web（如 Vue/SwiftUI）的思维对比**



## 一、组件（Components）— 类比 Vue/React 组件

SwiftUI **一切皆 View**，每个 `View` 都是一个可复用组件。

### ✅ 1. 定义组件（类似 Vue 的单文件组件）

```swift
// 文件：PrimaryButton.swift
struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
```

### ✅ 2. 使用组件（类似 `<PrimaryButton />`）

```swift
// 在 ContentView 中使用
var body: some View {
    VStack {
        PrimaryButton(title: "Submit") {
            print("Clicked!")
        }
    }
}
```

> 💡 **特点**：
>
> - 无 `props` / `emit`，而是通过 **初始化参数（init）** 和 **闭包（closure）** 传入数据和回调。
> - 无 `template`，`body` 就是 UI 声明。
> - 支持 `@State`, `@Binding`, `@ObservedObject` 等响应式状态。



## 二、导航与“路由”（Navigation / Routing）

SwiftUI **没有“路由”概念**（因为不是 Web），而是通过 **导航栈（Navigation Stack）** 或 **标签页（TabView）** 实现页面切换。

### ✅ 1. 栈式导航（类似 Vue Router 的 `push`）

```swift
// App 入口（iOS 16+ 推荐）
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
    }
}

// ContentView.swift
struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Go to Detail") {
                    DetailView(name: "John")
                }
            }
            .navigationTitle("Home")
        }
    }
}

// DetailView.swift
struct DetailView: View {
    let name: String
    var body: some View {
        Text("Hello, \(name)!")
            .navigationTitle("Detail")
    }
}
```

> 🔁 **相当于**：`router.push({ name: 'Detail', params: { name: 'John' } })`

### ✅ 2. 标签页导航（TabBar，类似 App Bottom Nav）

```swift
struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Me")
                }
        }
    }
}
```

### ✅ 3. 程序化导航（类似 `router.push()`）

使用 `@State` 控制 `NavigationStack` 的路径：

```swift
@State private var path = NavigationPath()

var body: some View {
    NavigationStack(path: $path) {
        Button("Go to Settings") {
            path.append("settings") // 可 append 任意类型（enum 更佳）
        }
        .navigationDestination(for: String.self) { route in
            if route == "settings" {
                SettingsView()
            }
        }
    }
}
```

> ✅ **建议**：用 `enum` 定义路由类型，更安全：
>
> ```swift
> enum AppRoute: Hashable {
>     case profile(id: String)
>     case settings
> }
> ```



## 三、典型目录结构（Project Structure）

SwiftUI 项目结构比 Web 更“扁平”，但可按功能组织：

```
MyApp/
├── MyApp.swift                 // @main 入口
├── Models/                     // 数据模型（Codable）
│   └── User.swift
├── Views/
│   ├── ContentView.swift       // 主页面
│   ├── Home/
│   │   ├── HomeView.swift
│   │   └── HomeViewModel.swift
│   ├── Profile/
│   │   ├── ProfileView.swift
│   │   └── ProfileViewModel.swift
│   └── Components/             // 通用组件
│       ├── PrimaryButton.swift
│       └── CardView.swift
├── ViewModels/                 // 或与 View 同目录（推荐）
├── Services/                   // 网络、数据库等
│   └── APIService.swift
├── Utils/
│   └── Color+Extension.swift
└── Assets.xcassets             // 图片资源
```

> 💡 **建议**：
>
> - 小项目：`View + ViewModel` 放同一目录
> - 大项目：按功能模块分组（如 `Auth/`, `Dashboard/`）

---

## 四、状态管理（对比 Vue 的 Composition API）

你熟悉 Vue 的 `setup()` + `ref`/`reactive`，SwiftUI 有类似机制：

| Vue (Composition API) | SwiftUI                            |
| --------------------- | ---------------------------------- |
| `ref()`               | `@State`                           |
| `reactive()`          | `@StateObject` / `@ObservedObject` |
| `computed`            | `var computed: String { ... }`     |
| `watch`               | `onChange(of:)` 或 `onReceive`     |

### 示例：表单状态管理

```swift
class FormViewModel: ObservableObject {
    @Published var email = ""
    @Published var isValid: Bool = false

    private var cancellables = Set<AnyCancellable>()

    init() {
        $email
            .map { $0.contains("@") }
            .assign(to: &$isValid)
    }
}

struct FormView: View {
    @StateObject private var vm = FormViewModel()

    var body: some View {
        VStack {
            TextField("Email", text: $vm.email)
            Button("Submit") { }
                .disabled(!vm.isValid)
        }
        .padding()
    }
}
```

> ✅ `@StateObject`：用于 **创建** ViewModel（类似 `provide/inject` 或根级 store）
> ✅ `@ObservedObject`：用于 **接收** 已存在的 ViewModel



## 五、与 Web 开发的思维对比总结

| 概念     | Web (Vue/React)            | SwiftUI                              |
| -------- | -------------------------- | ------------------------------------ |
| 组件     | `.vue` / `.jsx` 文件       | `struct SomeView: View`              |
| Props    | `props: { title: String }` | `let title: String` (init param)     |
| 事件     | `@click="handler"`         | `Button(action: handler)`            |
| 路由     | Vue Router / React Router  | `NavigationStack` + `NavigationLink` |
| 全局状态 | Pinia / Redux              | `@EnvironmentObject`                 |
| 样式     | Tailwind / CSS             | 修饰符链（Modifiers）                |
| 响应式   | `ref`, `reactive`          | `@State`, `@Published`               |
| 生命周期 | `onMounted`, `onUnmounted` | `.onAppear`, `.onDisappear`          |



## ✅ 下一步

1. **尝试构建一个完整 App**：比如 Todo List，包含：

   - 列表页（`List` + `NavigationLink`）
   - 添加页（`TextField` + `@State`）
   - 状态持久化（`@AppStorage` 或 Core Data）

2. **学习 `@EnvironmentObject`**：用于全局状态（如用户登录状态）。

3. **探索 `AsyncImage`（iOS 15+）**：加载网络图片。

4. **了解 `Task { }`**：替代 `onAppear` 中的异步调用（Swift 5.5+）。



# 原生

非常好的问题！既然你熟悉 Web（Tailwind、Vue）和跨平台开发（如 Tauri、uniapp），那么理解 **SwiftUI 如何调用 iOS/macOS 原生能力（App 功能 + 设备 API）** 是你构建完整原生应用的关键。

下面我将系统地为你介绍 **SwiftUI 应用中常用的原生 API**，包括：

- 📱 设备硬件 API（相机、定位、传感器等）
- 🔐 系统服务（通知、钥匙串、生物认证）
- 📂 本地存储（文件、偏好设置）
- 🌐 网络与后台任务
- 📦 应用生命周期与权限管理



## 一、App 应用基础：入口与生命周期

### 1. App 入口（`@main`）

```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

> 类似 Vue 的 `createApp(App).mount('#app')`，但由系统管理。

### 2. 应用生命周期监听（类似 `onMounted` / `onUnmounted`）

使用 [`UIApplicationDelegateAdaptor`](https://developer.apple.com/documentation/swiftui/uiapplicationdelegateadaptor) 或 `@UIApplicationDelegateAdaptor`（旧）：

```swift
class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("App 进入后台")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("App 回到前台")
    }
}

@main
struct MyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

> ✅ **注意**：iOS 15+ 更推荐用 **[App Intents](https://developer.apple.com/documentation/appintents)** 或 **`ScenePhase`** 监听前台/后台：

```swift
@Environment(\.scenePhase) private var scenePhase

var body: some View {
    ContentView()
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active: print("活跃")
            case .inactive: print("非活跃")
            case .background: print("后台")
            @unknown default: break
            }
        }
}
```

---

## 二、设备硬件与传感器 API

### 1. 📍 **定位（Core Location）**

**权限**：在 `Info.plist` 中添加：

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>需要定位来提供附近服务</string>
```

**代码**：

```swift
import CoreLocation
import CoreLocationUI

struct LocationView: View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let location = locationManager.lastLocation {
                Text("纬度: \(location.coordinate.latitude)")
            }
            // iOS 17+ 新控件
            LocationButton {
                locationManager.requestLocation()
            }
            .frame(width: 200, height: 40)
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.first
    }
}
```



### 2. 📸 **相机与照片库（UIImagePickerController / PhotosUI）**

#### 拍照 or 选图（iOS 14+ 推荐用 `PhotosUI`）

**权限**（`Info.plist`）：

```xml
<key>NSCameraUsageDescription</key>
<string>需要相机拍照</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>需要访问相册</string>
```

**代码（iOS 16+）**：

```swift
import PhotosUI

struct CameraView: View {
    @State private var photoPicker = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            Button("选择照片") {
                photoPicker = true
            }
        }
        .photosPicker(isPresented: $photoPicker, selection: $selectedImage)
    }
}
```

> ✅ 支持拍照、选图、多选、视频等。



### 3. 🔊 **音频播放（AVFoundation）**

```swift
import AVFoundation

class AudioPlayer: ObservableObject {
    private var player: AVAudioPlayer?

    func playSound(named: String) {
        guard let url = Bundle.main.url(forResource: named, withExtension: "mp3") else { return }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}
```

---

### 4. 🧭 **陀螺仪 / 加速度计（Core Motion）**

```swift
import CoreMotion

class MotionManager: ObservableObject {
    private let motion = CMMotionManager()
    @Published var acceleration = CMAcceleration()

    func start() {
        guard motion.isAccelerometerAvailable else { return }
        motion.accelerometerUpdateInterval = 0.1
        motion.startAccelerometerUpdates(to: .main) { [weak self] data, _ in
            if let data = data {
                self?.acceleration = data.acceleration
            }
        }
    }
}
```

---

## 三、系统服务 API

### 1. 🔔 **本地通知（UserNotifications）**

**权限**（首次需申请）：

```swift
import UserNotifications

func requestNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in }
}

func scheduleNotification() {
    let content = UNMutableNotificationContent()
    content.title = "提醒"
    content.body = "该喝水了！"
    content.sound = .default

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    let request = UNNotificationRequest(identifier: "water", content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request)
}
```



### 2. 🔑 **安全存储（Keychain） & 偏好设置**

- **简单数据** → `@AppStorage("key")`（类似 `localStorage`）

  ```swift
  @AppStorage("username") var username = ""
  ```

- **敏感数据（密码、token）** → 使用 **Keychain**（推荐封装或用 [SwiftKeychainWrapper](https://github.com/jrendel/SwiftKeychainWrapper)）



### 3. 👆 **生物认证（Face ID / Touch ID）**

```swift
import LocalAuthentication

func authenticate() {
    let context = LAContext()
    var error: NSError?

    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "验证身份") { success, _ in
            DispatchQueue.main.async {
                if success {
                    print("认证成功")
                }
            }
        }
    }
}
```

---

## 四、本地存储

| 类型               | 用途                          | SwiftUI 方式                                             |
| ------------------ | ----------------------------- | -------------------------------------------------------- |
| `@AppStorage`      | 小量偏好（Bool, String, Int） | `@AppStorage("darkMode") var darkMode = false`           |
| `UserDefaults`     | 更灵活的键值存储              | `UserDefaults.standard.set(...)`                         |
| **文件系统**       | 存储图片、文档等              | `FileManager.default.urls(for: .documentDirectory, ...)` |
| **Core Data**      | 本地数据库（关系型）          | Xcode 创建模型 + `@FetchRequest`                         |
| **SQLite / Realm** | 第三方数据库                  | 需引入库                                                 |



## 五、网络与后台任务

### 1. 🌐 网络请求（原生 `URLSession`）

```swift
@MainActor
class APIService: ObservableObject {
    func fetch<T: Decodable>(_ url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

// View 中使用
Task {
    do {
        let user = try await apiService.fetch(User.self, from: url)
    } catch {
        // handle error
    }
}
```

> ✅ 推荐用 `async/await`（Swift 5.5+），无需第三方库。

### 2. 🔄 后台刷新（Background Fetch）

需在 **Capabilities** 中开启 **Background Modes → Background fetch**，并在 `AppDelegate` 中配置：

```swift
func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    // 执行轻量网络请求
    completionHandler(.newData)
}
```

> ⚠️ iOS 对后台限制严格，仅用于必要场景。



## 六、权限管理（Privacy Manifest）

所有敏感 API（相机、定位、麦克风等）**必须**在 `Info.plist` 中声明用途，否则 **App 直接崩溃**！

常见权限键：

| 功能   | Info.plist Key                        |
| ------ | ------------------------------------- |
| 相机   | `NSCameraUsageDescription`            |
| 相册   | `NSPhotoLibraryUsageDescription`      |
| 定位   | `NSLocationWhenInUseUsageDescription` |
| 麦克风 | `NSMicrophoneUsageDescription`        |
| 通讯录 | `NSContactsUsageDescription`          |
| 蓝牙   | `NSBluetoothAlwaysUsageDescription`   |

> 📌 **提交 App Store 时**，若使用了某权限但未声明，会被拒审。

---

## 七、与 Web / 跨端开发的对比

| 能力     | Web (uniapp/Tauri)               | SwiftUI（原生）                        |
| -------- | -------------------------------- | -------------------------------------- |
| 相机     | `uni.chooseImage()`              | `PhotosUI` / `UIImagePickerController` |
| 定位     | `uni.getLocation()`              | `Core Location`                        |
| 通知     | `uni.createPushMessage()`        | `UserNotifications`                    |
| 存储     | `uni.setStorage()`               | `@AppStorage` / `Keychain`             |
| 生物认证 | `uni.startSoterAuthentication()` | `LocalAuthentication`                  |
| 文件系统 | 受限（沙盒）                     | 完整访问（App 沙盒内）                 |

> ✅ **优势**：SwiftUI 调用原生 API **零桥接开销**，性能更好，功能更全。
> ❌ **劣势**：需处理权限、生命周期、平台差异（iOS vs macOS）。



## ✅ 总结：你该怎么做？

1. **先明确需求**：你的 App 需要哪些硬件/系统能力？
2. **查官方文档**：Apple 的 [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/) + [API Reference](https://developer.apple.com/documentation/)
3. **权限先行**：在 `Info.plist` 中提前声明！
4. **封装常用服务**：如 `LocationService`, `AuthService`，便于复用。
5. **测试真机**：模拟器不支持 Face ID、部分传感器。
