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
const isCloudflare = process.env.isFlare === "true";
export default defineConfig({
  base: isCloudflare ? "/" : "/blog/"
});
```

## package.json

```json
"scripts": {
  "cloudflare": "cross-env isFlare=true vitepress build",
}
```

## 设置

构建输出: blog
