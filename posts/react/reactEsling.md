---
TITLE: REACT 项目 ESLINT 配置完全指南
DATE: 2024-05-18
CATEGORY: REACT
TAGS:
  - ESLINT
  - REACT
  - 代码规范
  - TYPESCRIPT
  - 前端工程化
---

# ESLint 配置说明

## 项目概述

本项目使用 `@antfu/eslint-config` 作为基础 ESLint 配置，并添加了自定义规则和插件。

## 核心配置

### 基础配置

- **配置文件**: `eslint.config.js`
- **基础配置**: 使用 Anthony Fu 的 ESLint 配置 (`@antfu/eslint-config`)
- **React 支持**: 启用 React 相关规则
- **格式化器支持**: CSS、HTML、JSONC 格式化

### 代码风格规则

#### 1. 箭头函数括号

```javascript
// 强制箭头函数使用括号
"style/arrow-parens": ["error", "always"]
```

#### 2. JSX 属性排序

```javascript
"style/jsx-sort-props": [
  "error",
  {
    callbacksLast: true,      // 回调函数属性放在最后
    ignoreCase: true,         // 忽略大小写
    multiline: "ignore",      // 多行属性忽略排序
    reservedFirst: ["key", "ref"],  // 保留属性放在最前
    reservedLast: ["children"],     // children 属性放在最后
  },
]
```

#### 3. JSX 每行最大属性数

```javascript
"style/jsx-max-props-per-line": ["error", { maximum: 3 }]
```

### TypeScript 命名规范

针对 TypeScript 文件 (`**/*.ts`, `**/*.tsx`) 的特殊规则：

```javascript
"ts/naming-convention": [
  "error",
  { format: ["camelCase"], leadingUnderscore: "allow", selector: "default", trailingUnderscore: "allow" },
  { format: ["camelCase", "PascalCase"], selector: "import" },
  { format: ["camelCase", "UPPER_CASE", "PascalCase"], leadingUnderscore: "allow", selector: "variable", trailingUnderscore: "allow" },
  { format: ["camelCase", "PascalCase"], selector: "function" },
  { format: ["camelCase"], leadingUnderscore: "allow", selector: "parameter" },
  { format: ["camelCase"], selector: "property" },
  { format: ["camelCase"], selector: "objectLiteralProperty" },
  { format: ["PascalCase"], selector: "typeLike" },
]
```

### JavaScript 特定规则

针对 JavaScript 文件 (`**/*.js`, `**/*.jsx`)：

```javascript
camelcase: ["error", { ignoreDestructuring: false, ignoreImports: true, properties: "always" }];
```

### JSX 专用规则

#### 1. 属性名禁止使用连字符

```javascript
"no-restricted-syntax": [
  "error",
  {
    message: "JSX 属性名禁止连字符，请使用 camelCase",
    selector: "JSXAttribute > JSXIdentifier[name=/\\-/]:not([name=/^(data|aria)-/])",
  },
]
```

#### 2. className 字母排序

自定义插件强制 className 属性中的类名按字母顺序排列：

```javascript
"classnames/sort-classnames": "error"
```

### 代码格式化

#### 1. 对象属性排序

```javascript
"perfectionist/sort-objects": ["error", { order: "asc", type: "natural" }]
```

#### 2. JSON 键排序

```javascript
"jsonc/sort-keys": ["error", { order: { type: "asc" }, pathPattern: ".*" }]
```

#### 3. 样式配置

```javascript
stylistic: {
  jsx: true,      // 启用 JSX 样式规则
  quotes: "double", // 使用双引号
  semi: true,     // 使用分号
}
```

### JSDoc 规则

```javascript
"jsdoc/multiline-blocks": ["error", { noSingleLineBlocks: true, singleLineTags: [] }]
```

## 忽略文件

以下文件和目录被忽略检查：

- `md.md`
- `.vscode/**/*`
- `.qoder/**/*`

## 自定义插件

项目包含一个自定义插件 `classnamesPlugin`，用于：

- 解析 JSX 中的 className 属性
- 按字母顺序排序类名
- 自动修复不符合规范的类名排序

## 使用建议

1. **保持一致的命名风格**：遵循 camelCase 和 PascalCase 规则
2. **className 排序**：使用工具自动排序类名，提高可读性
3. **JSX 属性组织**：按照规则组织属性顺序
4. **TypeScript 类型命名**：类型和接口使用 PascalCase
5. **避免连字符属性**：除 data-_ 和 aria-_ 外，避免在 JSX 属性中使用连字符
