---
date: 2025-05-14
title: h5 转换成 app
category: 工具
tags:
  - h5
  - android
  - ios
description:
---

## 使用：

1. 安装

```shell
pnpm add -D h5pack
```

2. 配置
   项目根目录下新建 h5pack.json 并做如下配置：

```json
{
  "entry": "./dist", // h5项目打包入口
  "name": "newApp", // app包名
  "splash": "./public/vite.svg", // app splash 启动页logo
  "output": "./", // 打包完成后app 输出位置
  "log": false, // 是否开启完整打包日志
  "registry": "github", // github||gitee  资源镜像下载的地址，如因代理问题可以配置为gitee
  "logo": "./src/assets/splash.svg" // app 在桌面显示的logo
}
```

```json
"scripts": {
  "compress": "npx h5pack"
}
```
