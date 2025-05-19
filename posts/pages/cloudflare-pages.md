---
title: Cloudflare Github Pages
date: 2025-01-01
category: pages
tags:
  - github
  - cloudflare
  - pages
  - blog
---

## deploy.yml

```yaml
name: deploy
on:
  push:
    branches:
      - master

permissions:
  contents: write
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: checkout
        uses: actions/checkout@v4.2.2

      - name: setup node
        uses: actions/setup-node@v3.9.1
        with:
          node-version: 18

      - name: Setup pnpm
        uses: pnpm/action-setup@v4.1.0
        with:
          version: 10.6.5

      - name: build
        run: |
          pnpm install
          pnpm build

      - name: deploy
        uses: peaceiris/actions-gh-pages@v4.0.0
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./.vitepress/dist
```

## vitepress config

```js
const isCloudflare = process.env.isFlare === 'true'
export default defineConfig({
  base: isCloudflare ? '/' : '/blog/'
})
```

## css

custom.css

```css
* {
  scrollbar-width: thin;
}

#app {
  background-size: 15px 15px !important;
  background-image:
    linear-gradient(to right, var(--uno-colors-shadow) 1px, transparent 1px),
    linear-gradient(to bottom, var(--uno-colors-shadow) 1px, transparent 1px) !important;
}

.VPSidebarItem h2 {
  border-bottom: transparent !important;
}

.divider {
  padding-left: 0 !important;
}

.title {
  border-bottom-color: transparent !important;
}

.VPSidebar {
  background-color: transparent !important;
  padding: 0 !important;
  top: 64px !important;
  display: flex;
  justify-content: center;
  width: 18vw !important;
}

.curtain {
  display: none !important;
}
:root {
  --un-preset-theme-colors-shadow: 0 0 0;
  --un-preset-theme-colors-shadow--alpha: 0.04;
  --un-preset-theme-colors-background: 255 255 255;
  --un-preset-theme-colors-primary: 46 64 91;
  --uno-colors-shadow: rgb(var(--un-preset-theme-colors-shadow) / var(--un-preset-theme-colors-shadow--alpha, 1));
}
.dark {
  --un-preset-theme-colors-shadow: 255 255 255;
}
```

## package.json

```json
{
  "scripts": {
    "cloudflare": "cross-env isFlare=true vitepress build"
  }
}
```

## 设置

构建输出: blog
