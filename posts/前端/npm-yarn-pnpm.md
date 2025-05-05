---
title: npm、yarn、pnpm
date: 2025-05-05
category: 前端
tags:
  - module
  - frondEnd
  - js
  - 模块化
description: npm、yarn、pnpm 的区别
---

`npm`、`Yarn` 和 `pnpm` 是前端生态中最主流的三大包管理工具，它们在安装行为、性能、功能设计上有显著差异。以下是它们的核心区别及安装行为参数的对比：

---

### **一、核心区别对比**

| 特性                   | **npm**                           | **Yarn**                             | **pnpm**                        |
| ---------------------- | --------------------------------- | ------------------------------------ | ------------------------------- |
| **依赖存储方式**       | 扁平化结构（`node_modules` 嵌套） | 扁平化结构（`node_modules` 嵌套）    | **硬链接 + 内容寻址存储**       |
| **安装速度**           | 较慢（依赖嵌套安装）              | 较快（缓存优化）                     | **极快（复用依赖文件）**        |
| **磁盘空间占用**       | 较大（重复依赖）                  | 较大（重复依赖）                     | **极小（依赖共享存储）**        |
| **依赖解析算法**       | `node_modules` 树状结构           | `Plug'n'Play`（无需 `node_modules`） | `content-addressable-store`     |
| **插件生态**           | 官方默认，生态最全                | 插件丰富（如 `Yarn Plugn'Play`）     | 插件较少但逐步完善              |
| **工作区（Monorepo）** | 支持（`npm workspaces`）          | **强支持（`Yarn Workspaces`）**      | **强支持（`pnpm workspaces`）** |
| **安全性**             | 一般（依赖嵌套可能冲突）          | 较高（依赖隔离）                     | **极高（依赖严格隔离）**        |

---

### **二、安装行为参数对比**

#### 1. **基础安装命令**

| 操作         | npm                        | Yarn                        | pnpm                    |
| ------------ | -------------------------- | --------------------------- | ----------------------- |
| 安装所有依赖 | `npm install`              | `yarn install`              | `pnpm install`          |
| 安装单个包   | `npm install <pkg>`        | `yarn add <pkg>`            | `pnpm add <pkg>`        |
| 安装开发依赖 | `npm install <pkg> -D`     | `yarn add <pkg> -D`         | `pnpm add <pkg> -D`     |
| 全局安装     | `npm install <pkg> -g`     | `yarn global add <pkg>`     | `pnpm install <pkg> -g` |
| 精确版本安装 | `npm install <pkg> -E`     | `yarn add <pkg> -E`         | `pnpm add <pkg> -E`     |
| 生产环境安装 | `npm install --production` | `yarn install --production` | `pnpm install --prod`   |

#### 2. **特性化安装参数**

| 特性                   | npm                      | Yarn                   | pnpm                       |
| ---------------------- | ------------------------ | ---------------------- | -------------------------- |
| **并行下载依赖**       | ✅（npm 7+）             | ✅（默认）             | ✅（默认）                 |
| **缓存依赖**           | ✅（`~/.npm/_cacache`）  | ✅（`~/.yarn/cache`）  | ✅（`~/.pnpm-store`）      |
| **依赖共享存储**       | ❌                       | ❌                     | ✅（硬链接复用文件）       |
| **Plug'n'Play（PnP）** | ❌                       | ✅（Yarn 2+）          | ❌                         |
| **Workspaces 支持**    | ✅（npm 7+）             | ✅（Yarn 1+）          | ✅（pnpm 6+）              |
| **依赖树扁平化**       | ✅（通过 `npm ls` 查看） | ✅（通过 `yarn list`） | ❌（依赖硬链接而非扁平化） |

---

### **三、关键差异详解**

#### 1. **依赖存储机制**

- **npm**：

  - 使用 `node_modules` 嵌套结构（扁平化但可能存在重复依赖）。
  - 例如：`react` 被多个包依赖时，每个子依赖都会复制一份。

- **Yarn**：

  - 使用 `yarn cache` 缓存依赖，安装时从缓存提取。
  - 支持 `Plug'n'Play`（PnP）模式：**不生成 `node_modules`**，通过 `.pnp.js` 文件直接解析依赖路径（大幅提升安装速度）。

- **pnpm**：
  - **内容寻址存储**（Content-Addressable Store）：所有依赖统一存储在 `~/.pnpm-store`。
  - 通过 **硬链接**（Hard Links）复用依赖文件，磁盘空间占用仅为 npm/Yarn 的 **1/20~1/50**。

#### 2. **性能对比**

| 场景                  | npm                 | Yarn                | pnpm                      |
| --------------------- | ------------------- | ------------------- | ------------------------- |
| 初始安装速度          | ⏱️ 慢（依赖嵌套）   | ⏱️ 较快（缓存优化） | ⏱️ **极快（复用文件）**   |
| 重复安装速度          | ⏱️ 一般（依赖检查） | ⏱️ 快（缓存命中）   | ⏱️ **极速（硬链接复用）** |
| 磁盘占用（100个依赖） | 💾 500MB~1GB        | 💾 500MB~1GB        | 💾 **20MB~50MB**          |

#### 3. **Monorepo 支持**

- **npm Workspaces**：

  - 配置简单（`package.json` 中声明 `workspaces` 字段），但功能有限。
  - 示例：
    ```json
    {
      "workspaces": ["packages/*"]
    }
    ```

- **Yarn Workspaces**：

  - 支持 **跨包依赖**（`workspace:*`），无需发布私有包。
  - 示例：
    ```json
    {
      "workspaces": {
        "packages": ["packages/*"]
      }
    }
    ```

- **pnpm Workspaces**：
  - 通过 `workspace:` 协议实现 **零拷贝的本地依赖**。
  - 示例：
    ```json
    {
      "dependencies": {
        "my-utils": "workspace:packages/utils"
      }
    }
    ```

#### 4. **安全性**

- **npm**：依赖嵌套可能导致 **依赖冲突** 或 **恶意代码注入**。
- **Yarn**：PnP 模式强制依赖隔离，避免未声明依赖被意外使用。
- **pnpm**：依赖严格隔离（每个包只能访问显式声明的依赖），**安全性最高**。

---

### **四、安装行为参数差异**

#### 1. **依赖版本解析**

- **npm/Yarn**：

  - 使用 `^` 和 `~` 控制版本范围（如 `react: ^18.2.0`）。
  - 通过 `package-lock.json` 或 `yarn.lock` 固定依赖树。

- **pnpm**：
  - 依赖版本由 `pnpm-lock.yaml` 固定，支持 **严格版本控制**（`--strict-peer-dependencies`）。

#### 2. **全局安装路径**

- **npm**：

  - 默认路径：`/usr/local/lib/node_modules`（Unix）或 `%APPDATA%\npm\node_modules`（Windows）。

- **Yarn**：

  - 全局安装路径：`~/.yarn/global/node_modules`。

- **pnpm**：
  - 全局安装路径：`~/.pnpm-global/node_modules`。

#### 3. **自定义安装目录**

- **npm**：

  - 通过 `--prefix` 指定安装路径：
    ```bash
    npm install <pkg> --prefix ./custom-dir
    ```

- **Yarn**：

  - 支持 `-W` 参数在 Monorepo 中跨包安装：
    ```bash
    yarn add <pkg> -W
    ```

- **pnpm**：
  - 支持 `--filter` 过滤特定包安装：
    ```bash
    pnpm add <pkg> --filter workspace:my-package
    ```

---

### **五、如何选择？**

#### **选择 npm 的理由**：

- 官方默认工具，生态兼容性最好。
- 对简单项目或小型团队足够使用。
- 不需要优化磁盘空间或安装速度。

#### **选择 Yarn 的理由**：

- 需要 **Plug'n'Play** 的极速安装体验。
- 大型 Monorepo 项目需要跨包依赖管理。
- 社区插件丰富（如 `Yarn Berry` 的 PnP 功能）。

#### **选择 pnpm 的理由**：

- **节省磁盘空间**（适合 CI/CD 或容器化部署）。
- **依赖严格隔离**（避免未声明依赖导致的隐式引用）。
- 支持 **零拷贝的本地依赖**（Monorepo 开发更高效）。

---

### **六、迁移建议**

- **从 npm 迁移到 pnpm**：

  ```bash
  npm install -g pnpm
  pnpm import  # 自动导入 `package-lock.json` 中的依赖
  ```

- **从 Yarn 迁移到 pnpm**：
  ```bash
  pnpm import  # 自动导入 `yarn.lock` 中的依赖
  ```

---

### **总结**

- **npm**：官方默认，简单可靠，适合大多数项目。
- **Yarn**：适合需要极速安装和 Monorepo 的复杂项目。
- **pnpm**：**磁盘空间敏感** 和 **依赖安全要求高** 的首选工具。

根据团队规模、项目复杂度和部署环境选择合适的工具，可以显著提升开发效率和构建性能。
