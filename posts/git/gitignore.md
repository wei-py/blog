---
title: gitignore
date: 2025-05-03
categories:
  - git
tags:
  - git
description: gitignore 配置
---

# gitignore

## 配置

在根目录下创建 .gitignore 文件，然后添加需要忽略的文件或文件夹

### 应该忽略哪些文件

- 系统或者软件自动生成的文件
- 编译产生的中间文件和结果文件
- 运行时生成日志文件、缓存文件、临时文件
- 涉及身份、密码、口令、秘钥等敏感信息文件

## 配置规则

使用正则匹配
从上到下逐行匹配，每一行表示一个忽略模式

### gitignore.文件的匹配规则

空行或者以#开头的行会被Gt忽略。一般空行用于可读性的分隔，#一般用作注释

### 使用标准的Glob模式匹配，例如：

- 星号\*通配任意个字符
- 问号？匹配单个字符
- 中括号[]表示匹配列表中的单个字符，比如：[abc]表示ab/c
- 两个星号\*\*表示匹配任意的中间目录
- 中括号可以使用短中线连接，比如：
- [0-9] 表示任意一位数字，[a-z] 表示任意一位小写字母 感叹号！表示取反

### 使用正则表达式匹配

- #忽略所有的.a文件 \*.a

- #但跟踪所有的lib.a,即便你在前面忽略了.a文件 ！lib.a

- #只忽略当前目录下的 TODO 文件，而不忽略 subdir/T0D0 /T0D0

- #忽略任何目录下名为 build的文件夹 build/

- #忽略 doc/notes.txt, 但不忽略 doc/server/arch.txt doc/\*.txt

- #忽略 doc/目录及其所有子目录下的.pdf文件 doc/\*\*/\*.pdf

## 使用模版

> https://github.com/github/gitignore

### 前端使用模版

> https://raw.githubusercontent.com/github/gitignore/refs/heads/main/Node.gitignore
