---
title: git commmit 提交规范
date: 2025-04-27
category:
  - 工具
  - 规范
  - 工程化
tags:
  - git
  - commitlint
  - cz-git
  - commitizen
---

# git commmit 提交规范

## 安装

```shell
pnpm add -D commitizen cz-git @commitlint/cli @commitlint/config-conventional
```

## package.json

```json
{
	"scripts": {
		"commit": "git add . && git-cz"
	},
	"config": {
		"commitizen": {
			"path": "node_modules/cz-git"
		}
	}
}
```

## commitlint.config.js

```js
// 官方预设 + cz-git 适配器
const { czGitCommitlint } = require("cz-git");

module.exports = {
	extends: ["@commitlint/config-conventional"],
	rules: {
		// 自定义规则
		"type-enum": [
			2,
			"always",
			["feat", "fix", "docs", "style", "refactor", "perf", "test", "build", "ci", "chore", "revert"]
		]
	},
	prompt: czGitCommitlint({
		// cz-git 的定制化配置
		scopes: ["global", "component", "utils", "styles"], // 可选范围列表
		allowCustomScopes: true, // 允许自定义范围
		allowEmptyScopes: false, // 禁止空范围
		customScopesAlign: "bottom", // 自定义范围提示位置
    useEmoji: true, // 启用 emoji 图标
    emojiAlign: 'center', // emoji 对齐方式
    themeColorCode: '', // 主题色
    allowTicketNumber: false, // 禁止关联工单号
    confirmColorize: true // 高亮确认信息
		messages: {
			type: "选择提交类型（必选）",
			scope: "选择或输入影响范围（可选）",
			subject: "简短描述变更（必填）",
			body: "详细描述（换行使用 \\n）（可选）",
			breaking: "列出破坏性变更（可选）",
			footer: "关联 ISSUE 或文档（如 Closes #123）（可选）"
		}
	})
};
```

## 配置 Git 钩子（使用 Husky）
```shell
pnpm add husky -D
npx husky init
npx husky add .husky/commit-msg 'npx --no -- commitlint --edit "$1"'
```

## 生成 CHANGELOG
```shell
pnpm add -D standard-version
```
```json
{
	"scripts": {
		"release": "standard-version"
	}
}
```