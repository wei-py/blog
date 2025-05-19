import eslintJs from '@eslint/js'
import eslintConfigPrettier from 'eslint-config-prettier'
// import vueParser from "vue-eslint-parser";
// import vuePlugin from "eslint-plugin-vue";
import markdownPlugin from 'eslint-plugin-markdown'
import prettierPlugin from 'eslint-plugin-prettier'
// eslint.config.js
import globals from 'globals'
import prettierConfig from './.prettierrc.js'

export default [
  eslintJs.configs.recommended,
  // 解决 console window document process 等变量未定义的问题
  { languageOptions: { globals: globals.browser } },
  // 解决 Prettier 默认配置和自定义配置冲突的问题
  {
    plugins: {
      prettier: prettierPlugin,
    },
    rules: {
      'prettier/prettier': ['error', prettierConfig],
    },
  },
  // {
  // 	files: ["**/*.json"],
  // 	rules: {
  // 		"prettier/prettier": ["error", { tabWidth: 2 }]
  // 	}
  // },
  // {
  //   files: ["*.md"],
  //   rules: {
  //     "prettier/prettier": ["error", { ...prettierConfig, printWidth: 100 }]
  //   }
  // },
  {
    files: ['*.md'],
    plugins: { markdown: markdownPlugin },
    // languageOptions:
  },
  // {
  //   // 针对 Vue 文件的专属配置
  //   files: ["**/*.vue"],
  //   languageOptions: {
  //     parser: vueParser,
  //     parserOptions: {
  //       parser: "@babel/eslint-parser",
  //       sourceType: "module",
  //       requireConfigFile: false,
  //       ecmaFeatures: {
  //         jsx: true
  //       }
  //     }
  //   },
  //   plugins: {
  //     vue: vuePlugin
  //   },
  //   rules: {
  //     ...vuePlugin.configs["vue3-recommended"],
  //     "vue/multi-word-component-names": "off" // 可选：关闭多单词组件名检测
  //   }
  // },
  // 解决 Prettier 与 ESLint 冲突的问题
  eslintConfigPrettier,
]
