---
date: 2025-05-14
title: window 配置
category: 工具
tags:
  - window
  - win11
  - setting
description:
---

## 关闭右键菜单

### 关闭

reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

### 打开

reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /va /f

## 关闭动画

win + i 搜索动画
