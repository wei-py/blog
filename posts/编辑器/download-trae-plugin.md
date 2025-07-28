---
date: 2025-04-25
title: 安装 trae 插件
category: 插件
tags:
  - trae
  - vscode
description: trae 安装 vscode 插件
---

## 官方教程

https://docs.trae.ai/ide/manage-extensions

## 插件地址

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${itemName.fieldA}/vsextensions/${itemName.fieldB}/${version}/vspackage

```js
const url = "https://marketplace.visualstudio.com/items?itemName=BrandonKirbyson.vscode-animations";
const version = "2.0.7";

// 从 URL 中提取 itemName
const itemName = new URL(url).searchParams.get("itemName");
console.log(itemName); // BrandonKirbyson.vscode-animations

// 将 itemName 分解为 publisher 和 extension name
const [fieldA, fieldB] = itemName.split(".");
console.log(fieldA); // BrandonKirbyson
console.log(fieldB); // vscode-animations

// 构造 API URL
const apiUrl = `https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${fieldA}/vsextensions/${fieldB}/${version}/vspackage`;
console.log(apiUrl);
```

## github 主题插件

https://marketplace.visualstudio.com/items?itemName=Hyzeta.vscode-theme-github-light
作者: Hyzeta
插件名: vscode-theme-github-light
版本号: 7.14.2

## github 主题插件地址

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/Hyzeta/vsextensions/vscode-theme-github-light/7.14.2/vspackage

## 安装

下载后 直接拖入 trae 插件位置

## vscode plugin api

https://marketplace.visualstudio.com
