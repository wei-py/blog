---
date: 2025-06-22
title: 项目搭建
category: project
tags:
  - project
  - vue vite
---

## utils

```shell
pnpm i lodash-es dayjs vant
```

## css

> https://tailwindcss.com/docs/installation/using-vite

```shell
pnpm install tailwindcss @tailwindcss/vite
```

## auto

> https://github.com/unplugin/unplugin-auto-import

```shell
pnpm i -D unplugin-auto-import
```

```js
{
  AutoImport({
    eslintrc: {
      enabled: true, // Default `false`
      filepath: "./types/.eslintrc-auto-import.json", // Default `./.eslintrc-auto-import.json`
      globalsPropValue: true,
    },
  });
}
```

vscode 有时候识别不出来, 添加 jsconfig.json

```json
{
  "compilerOptions": {
    "target": "esnext",
    "module": "esnext",
    "moduleResolution": "node",
    "strict": true,
    "jsx": "preserve",
    "esModuleInterop": true,
    "skipLibCheck": true,
    "outDir": "./dist",
    "types": ["vite/client", "vue"]
  },
  "include": [
    "auto-imports.d.ts",
    "**/*.js",
    "**/*.ts",
    "**/*.d.ts",
    "**/*.tsx",
    "**/*.vue"
  ],
  "exclude": ["node_modules"]
}
```

## eslint

> https://github.com/antfu/eslint-config

```shell
pnpm i -D eslint @antfu/eslint-config
pnpm dlx @antfu/eslint-config@latest
npx @eslint/config-inspector
```

### eslint.config.js

```js
import { createRequire } from "node:module";
import antfu from "@antfu/eslint-config";

const require = createRequire(import.meta.url);
const autoImportJson = require("./types/.eslintrc-auto-import.json");

export default antfu({
  // pnpm: true,
  stylistic: {
    quotes: "double",
    semi: true,
  },
  languageOptions: {
    ...autoImportJson,
  },
});
```

## jsx

> https://www.npmjs.com/package/@vitejs/plugin-vue-jsx

```shell
pnpm i -D @vitejs/plugin-vue-jsx
## pnpm i -D eslint-plugin-format
## pnpm i -D @eslint-react/eslint-plugin eslint-plugin-react-hooks eslint-plugin-react-refresh
```

## vite.config.js

```js
import tailwindcss from "@tailwindcss/vite";
import vue from "@vitejs/plugin-vue";
import vueJsx from "@vitejs/plugin-vue-jsx";
import AutoImport from "unplugin-auto-import/vite";
import { defineConfig } from "vite";

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    vueJsx(),
    AutoImport({
      include: [
        /\.[tj]sx?$/, // .ts, .tsx, .js, .jsx
        /\.vue$/,
        /\.vue\?vue/, // .vue
        /\.md$/, // .md
      ],

      // global imports to register
      imports: [
      // presets
        "vue",
        // {
        //   vue: [
        //     'defineComponent',
        //   ],
        // },
        // 'vue-router',
        // custom
        // {
        //   '@vueuse/core': [
        //   // named imports
        //     'useMouse', // import { useMouse } from '@vueuse/core',
        //     // alias
        //     ['useFetch', 'useMyFetch'], // import { useFetch as useMyFetch } from '@vueuse/core',
        //   ],
        //   'axios': [
        //   // default imports
        //     ['default', 'axios'], // import { default as axios } from 'axios',
        //   ],
        // },
      // example type import
      // {
      //   from: 'vue-router',
      //   imports: ['RouteLocationRaw'],
      //   type: true,
      // },
      ],

      // Auto import for module exports under directories
      // by default it only scan one level of modules under the directory
      dirs: [
      // './hooks',
      // './composables' // only root modules
      // './composables/**', // all nested modules
      // ...
      ],

      // Filepath to generate corresponding .d.ts file.
      // Defaults to './auto-imports.d.ts' when `typescript` is installed locally.
      // Set `false` to disable.
      dts: "./types/auto-imports.d.ts",

      // Auto import inside Vue template
      // see https://github.com/unjs/unimport/pull/15 and https://github.com/unjs/unimport/pull/72
      vueTemplate: true,

      // Custom resolvers, compatible with `unplugin-vue-components`
      // see https://github.com/antfu/unplugin-auto-import/pull/23/
      resolvers: [],

      // Inject the imports at the end of other imports
      injectAtEnd: true,

      // Generate corresponding .eslintrc-auto-import.json file.
      // eslint globals Docs - https://eslint.org/docs/user-guide/configuring/language-options#specifying-globals
      eslintrc: {
        enabled: true, // Default `false`
        filepath: "./types/.eslintrc-auto-import.json", // Default `./.eslintrc-auto-import.json`
        globalsPropValue: true, // Default `true`, (true | false | 'readonly' | 'readable' | 'writable' | 'writeable')
      },
    }),
    tailwindcss(),
  ],
});
```

## loading vue
