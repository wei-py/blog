---
title: 安装行为
date: 2025-05-05
category: 前端
tags:
  - module
  - frondEnd
  - js
  - 模块化
description: npm 安装行为的区别
---

在使用 `npm install` 安装包时，不同的安装模式（如 `--save-dev`、`--save`、`--global` 等）会影响包的存储位置、依赖类型和使用场景。以下是详细的对比和使用指南：

---

### **1. `--save`（默认行为）**

- **作用**：将包安装为 **生产依赖**（`dependencies`），并记录在 `package.json` 中。
- **适用场景**：项目运行时必须依赖的库（如 React、Vue、Express 等）。
- **版本变化**：
  - **npm 5+**：默认行为（无需显式添加 `--save`）。
  - **npm 5 前**：必须手动添加 `--save` 才会写入 `package.json`。
- **示例**：
  ```bash
  npm install react  # 自动写入 dependencies
  npm install react --save  # 效果同上（兼容旧版本）
  ```

---

### **2. `--save-dev`（开发依赖）**

- **作用**：将包安装为 **开发依赖**（`devDependencies`），仅用于开发或构建阶段。
- **适用场景**：开发工具、测试框架、代码规范工具（如 Webpack、Jest、ESLint、Babel 等）。
- **特点**：
  - 生产环境部署时，通过 `npm install --production` 不会安装这些依赖。
  - 减少生产环境依赖体积。
- **示例**：
  ```bash
  npm install eslint --save-dev
  # 简写：-D
  npm install eslint -D
  ```

---

### **3. `--save-optional`（可选依赖）**

- **作用**：将包安装为 **可选依赖**（`optionalDependencies`）。
- **适用场景**：某些功能在没有该依赖时仍能正常运行（如 `fsevents` 在非 macOS 系统下可忽略）。
- **特点**：
  - 安装失败时不会中断整个流程。
  - 优先级低于 `dependencies` 和 `devDependencies`。
- **示例**：
  ```bash
  npm install fsevents --save-optional
  # 简写：-O
  npm install fsevents -O
  ```

---

### **4. `--save-peer`（同伴依赖）**

- **作用**：将包安装为 **同伴依赖**（`peerDependencies`）。
- **适用场景**：插件或库需要与主应用共享某个依赖的版本（如 React 插件需要指定兼容的 React 版本）。
- **特点**：
  - 不会自动安装，需开发者手动管理。
  - 避免同一依赖的多个副本（解决版本冲突）。
- **示例**：
  ```bash
  npm install react-redux --save-peer react
  ```

---

### **5. 全局安装 `--global`（或 `-g`）**

- **作用**：将包安装到系统全局路径，而非本地项目目录。
- **适用场景**：命令行工具（CLI）或全局可用的开发工具（如 `eslint`、`webpack`、`create-react-app`）。
- **特点**：
  - 所有项目均可使用。
  - 需要管理员权限（Windows 可能需要 `sudo`）。
- **示例**：
  ```bash
  npm install -g eslint
  ```

---

### **6. 精确版本安装 `--save-exact`（或 `-E`）**

- **作用**：安装时指定精确版本号（不加 `~` 或 `^`）。
- **适用场景**：需要严格控制依赖版本（避免自动升级导致兼容问题）。
- **示例**：
  ```bash
  npm install react --save-exact
  # 简写：-E
  npm install react -E
  ```
  **结果**：
  ```json
  "dependencies": {
    "react": "18.2.0"
  }
  ```

---

### **7. 生产环境安装 `--production`**

- **作用**：安装依赖时跳过 `devDependencies`。
- **适用场景**：部署生产环境时减少依赖体积。
- **示例**：
  ```bash
  npm install --production
  ```

---

### **8. 本地依赖安装 `file:` 协议**

- **作用**：安装本地文件路径的依赖（用于调试私有包）。
- **示例**：
  ```bash
  npm install file:./my-local-package
  ```

---

### **9. Git 仓库安装**

- **作用**：直接从 Git 仓库安装包。
- **示例**：
  ```bash
  npm install git+https://github.com/user/repo.git
  ```

---

### **依赖类型对比表**

| 安装模式          | 依赖类型               | 是否生产环境使用   | 是否默认安装     | 示例工具                     |
| ----------------- | ---------------------- | ------------------ | ---------------- | ---------------------------- |
| `--save`          | `dependencies`         | ✅                 | ✅（npm 5+）     | React、Vue、Express          |
| `--save-dev`      | `devDependencies`      | ❌                 | ✅（需显式）     | Webpack、Jest、ESLint        |
| `--save-optional` | `optionalDependencies` | ⚠️（可选）         | ✅（需显式）     | `fsevents`                   |
| `--save-peer`     | `peerDependencies`     | ⚠️（需主应用提供） | ❌（需手动安装） | React 插件                   |
| `--global`        | 全局安装               | ✅（CLI 工具）     | ❌               | `eslint`、`create-react-app` |

---

### **如何选择安装模式？**

1. **生产依赖**：用 `npm install package-name`（默认写入 `dependencies`）。
2. **开发工具**：用 `npm install package-name -D`（写入 `devDependencies`）。
3. **全局工具**：用 `npm install -g package-name`。
4. **严格版本控制**：用 `npm install package-name -E`。

---

### **常见问题**

1. **为什么 `--save` 在 npm 5+ 是默认行为？**
   为了简化流程，避免忘记保存依赖到 `package.json`。

2. **`devDependencies` 和 `dependencies` 的区别？**
   `devDependencies` 仅用于开发，生产环境通过 `--production` 忽略它们。

3. **如何查看已安装的依赖？**
   检查 `package.json` 中的 `dependencies`、`devDependencies` 等字段。

---

通过合理使用不同的安装模式，可以更好地管理项目的依赖关系，确保开发效率与生产环境的稳定性。
