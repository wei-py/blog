---
title: prettierrc eslint 的使用
date: 2025-04-26
category:
  - 工具
tags:
  - eslint
  - prettier
  - 工具
  - 工程化
  - 前端
---

## 安装

```shell
pnpm add
eslint prettier
eslint-plugin-vue vue-eslint-parser @babel/eslint-parser
eslint-config-prettier eslint-plugin-prettier
@eslint/js globals --save-dev
```

## .prettierrc.js

```js
//此处的规则供参考，其中多半其实都是默认值，可以根据个人习惯改写
export default {
	printWidth: 140, // 指定行的最大长度
	tabWidth: 2, // 指定缩进的空格数
	useTabs: true, // 是否使用制表符进行缩进，默认为 false
	singleQuote: false, // 是否使用单引号，默认为 false
	quoteProps: "as-needed", // 对象属性是否使用引号，默认为 "as-needed"
	trailingComma: "none", // 是否使用尾随逗号（末尾的逗号），可以是 "none"、"es5"、"all" 三个选项
	bracketSpacing: true, // 对象字面量中的括号是否有空格，默认为 true
	jsxBracketSameLine: false, // JSX 标签的右括号是否与前一行的末尾对齐，默认为 false
	arrowParens: "always", // 箭头函数参数是否使用圆括号，默认为 "always"
	rangeStart: 0, // 指定格式化的范围的起始位置
	requirePragma: false, // 是否需要在文件顶部添加特殊的注释才能进行格式化，默认为 false
	insertPragma: false, // 是否在格式化后的文件顶部插入特殊的注释，默认为 false
	proseWrap: "preserve", // 是否保留 markdown 文件中的换行符，默认为 "preserve"
	htmlWhitespaceSensitivity: "ignore", // 指定 HTML 文件中空格敏感度的配置选项，可以是 "css"、"strict"、ignore
	vueIndentScriptAndStyle: false, // 是否缩进 Vue 文件中的 <script> 和 <style> 标签，默认为 false
	endOfLine: "auto", // 指定换行符的风格，可以是 "auto"、"lf"、"crlf"、"cr" 四个选项
	semi: true, // 行末是否添加分号，默认为 true
	usePrettierrc: true, // 是否使用项目根目录下的 .prettierrc 文件，默认为 true
	overrides: [
		// 针对特定文件或文件类型的格式化配置
		{
			files: "*.json", // 匹配的文件或文件类型
			options: {
				tabWidth: 2 // 针对该文件类型的配置选项
			}
		},
		{
			files: "*.md",
			options: {
				printWidth: 100
			}
		},
		{
			files: "*.vue", // 添加 Vue 文件的特定配置
			options: {
				singleQuote: false,
				semi: true,
				tabWidth: 2
			}
		}
	]
};
```

## eslint.config.js

```js
// eslint.config.js
import globals from "globals";
import eslintJs from "@eslint/js";
import prettierPlugin from "eslint-plugin-prettier";
import eslintConfigPrettier from "eslint-config-prettier";
import prettierConfig from "./.prettierrc.js";
import vueParser from "vue-eslint-parser";
import vuePlugin from "eslint-plugin-vue";

export default [
	eslintJs.configs.recommended,
	// 解决 console window document process 等变量未定义的问题
	{ languageOptions: { globals: globals.browser } },
	// 解决 Prettier 默认配置和自定义配置冲突的问题
	{
		plugins: {
			prettier: prettierPlugin
		},
		rules: {
			"prettier/prettier": ["error", prettierConfig]
		}
	},
	// {
	// 	files: ["**/*.json"],
	// 	rules: {
	// 		"prettier/prettier": ["error", { tabWidth: 2 }]
	// 	}
	// },
	{
		files: ["*.md"],
		rules: {
			"prettier/prettier": ["error", { ...prettierConfig, printWidth: 100 }]
		}
	},
	{
		// 针对 Vue 文件的专属配置
		files: ["**/*.vue"],
		languageOptions: {
			parser: vueParser,
			parserOptions: {
				parser: "@babel/eslint-parser",
				sourceType: "module",
				requireConfigFile: false,
				ecmaFeatures: {
					jsx: true
				}
			}
		},
		plugins: {
			vue: vuePlugin
		},
		rules: {
			...vuePlugin.configs["vue3-recommended"],
			"vue/multi-word-component-names": "off" // 可选：关闭多单词组件名检测
		}
	},
	// 解决 Prettier 与 ESLint 冲突的问题
	eslintConfigPrettier
];
```

## package.json

```json
{
	"scripts": {
		"lint": "eslint src",
		"lint:fix": "eslint src --fix",
		"format": "prettier --write ."
	}
}
```

## vscode settings.json

```json
{
	"eslint.validate": [
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"html"
	],
	"editor.codeActionsOnSave": {
		"source.fixAll.eslint": true
	},
	"editor.defaultFormatter": "esbenp.prettier-vscode",
	"[javascript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"[typescript]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	},
	"[vue]": {
		"editor.defaultFormatter": "esbenp.prettier-vscode"
	}
}
```
