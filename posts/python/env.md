---
title: Python 环境配置
date: 2025-10-09
category: Python
tags:
  - 环境配置
  - Python
---

在 Python 开发中，**切换环境**通常是指在不同的 Python 环境之间切换，比如：

- 在 **全局环境** 和 **虚拟环境（venv）** 之间切换
- 在多个 **虚拟环境** 之间切换
- 使用 **conda 环境** 时，在不同 conda 环境之间切换

下面我会详细讲解如何切换这些环境。

---

## 🧪 一、使用 `venv` 创建和切换虚拟环境（推荐）

### ✅ 创建虚拟环境

```bash
python -m venv env
```

这会在当前目录创建一个名为 `env` 的虚拟环境文件夹。

---

### ✅ 激活虚拟环境（Windows / macOS / Linux）

#### Windows:

```cmd
env\Scripts\activate
```

激活后命令行会变成这样：

```cmd
(env) C:\path\to\project>
```

#### macOS/Linux:

```bash
source env/bin/activate
```

激活后命令行会变成这样：

```bash
(env) user@machine:~/project$
```

---

### ✅ 退出虚拟环境

无论什么平台，都可以使用：

```bash
deactivate
```

退出后会回到全局 Python 环境。

---

## 🐍 二、使用 `conda` 切换环境（如果你用 Anaconda/Miniconda）

### ✅ 创建 conda 环境

```bash
conda create -n env python=3.9
```

### ✅ 激活 conda 环境

```bash
conda activate env
```

### ✅ 退出 conda 环境

```bash
conda deactivate
```

> 💡 注意：如果你同时安装了 `venv` 和 `conda`，建议优先使用 conda 来管理环境。

---

## 🔁 三、查看当前使用的 Python 环境

你可以随时运行以下命令来确认你当前使用的是哪个 Python 和 pip：

```bash
which python   # Linux/macOS
where python   # Windows
```

或者：

```bash
python --version
pip --version
```

输出示例：

```
Python 3.10.13
pip 24.0 from /home/user/anaconda3/envs/env/lib/python3.10/site-packages/pip (python 3.10)
```

---

## 📦 四、多环境快速切换技巧

### 方法一：使用 `.bashrc` / `.zshrc` / `.bash_profile` 设置别名（Linux/macOS）

```bash
alias work="source ~/work_env/bin/activate"
alias personal="source ~/personal_env/bin/activate"
```

然后执行：

```bash
source ~/.bashrc
```

之后只需输入：

```bash
work
```

即可快速进入工作环境。

---

### 方法二：使用 IDE（如 VS Code、PyCharm）自动识别并切换环境

现代 IDE 都支持自动检测项目中的虚拟环境，并允许你在界面中一键切换解释器。

#### VS Code 示例：

1. 打开命令面板（Ctrl + Shift + P）
2. 输入 `Python: Select Interpreter`
3. 选择你要使用的环境

---

## 🧠 小贴士

| 目标                  | 推荐做法                                             |
| --------------------- | ---------------------------------------------------- |
| 快速隔离项目依赖      | 使用 `venv`                                          |
| 数据科学/机器学习项目 | 使用 `conda`                                         |
| 多个 Python 版本共存  | 使用 `pyenv`（macOS/Linux）或 `py` 启动器（Windows） |

---

## ❓常见问题解答

### Q: 如何知道我当前在哪个环境？

A: 查看终端提示符（如 `(env)`），或者运行：

```bash
which python
```

### Q: 虚拟环境是否可以跨平台复制？

A: 不推荐。不同系统编译的库可能不兼容。应该在目标系统重新创建环境。

---

在 Python 项目中，`requirements.txt` 是一个常用的文件，它列出了项目依赖的包及其版本。你可以通过以下几种方式来下载这些依赖包：

---

## ✅ 一、使用 `pip` 安装 requirements.txt 中的依赖

### 1. **安装依赖（联网状态下）**

如果你有网络连接，可以直接使用如下命令安装：

```bash
pip install -r requirements.txt
```

这会从 [PyPI](https://pypi.org/) 下载并安装所有列出的包。

---

## ✅ 二、离线安装：先下载再安装

如果你需要**在没有网络的环境中安装依赖**，可以先在一个有网的环境中下载好所有依赖包，然后复制到目标机器上进行安装。

### 2.1 在有网络的机器上下载依赖包

```bash
pip download -r requirements.txt -d ./packages
```

- `-d ./packages` 表示将所有依赖包下载到当前目录下的 `packages` 文件夹中。

### 2.2 将 packages 文件夹复制到目标机器

比如用 U 盘、局域网传输等方式。

### 2.3 在无网络的机器上安装本地依赖包

```bash
pip install --no-index --find-links=./packages -r requirements.txt
```

- `--no-index`：禁止从网络查找包。
- `--find-links=./packages`：指定本地包的路径。

---

## ✅ 三、生成 requirements.txt 文件（补充）

如果你是项目的开发者，想要生成自己的 `requirements.txt` 文件，可以使用：

```bash
pip freeze > requirements.txt
```

> ⚠️ 注意：`pip freeze` 会导出当前虚拟环境或全局环境中所有已安装的包，包括你可能不需要的依赖。建议使用虚拟环境（如 `venv`）开发项目。

或者使用更精确的方式（推荐）：

```bash
pip install pipreqs
pipreqs ./ --encoding=utf8 --force
```

这个工具会根据你的代码实际使用的 import 包来生成 requirements。

---

## ✅ 四、常见问题

### Q: requirements.txt 格式是什么样的？

A: 示例内容如下：

```
requests==2.31.0
numpy>=1.24.0
pandas
flask>=2.0.0,<3.0.0
```

每行一个包名，可选指定版本号。

---

## ✅ 总结

| 操作                  | 命令                                                                 |
| --------------------- | -------------------------------------------------------------------- |
| 安装 requirements     | `pip install -r requirements.txt`                                    |
| 仅下载不安装          | `pip download -r requirements.txt -d ./packages`                     |
| 离线安装              | `pip install --no-index --find-links=./packages -r requirements.txt` |
| 生成 requirements.txt | `pip freeze > requirements.txt` 或 `pipreqs .`                       |

---
