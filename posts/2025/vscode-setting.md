---
date: 2025-04-24
title: vscode 配置
category: 配置 
tags:
  - vscode
  - setting
  - keymap
description: vscode 配置
---

```json
{
  // VSCode 外观设置
  // 主题相关
  "workbench.colorTheme": "Github Light Theme - Gray",
  "workbench.iconTheme": "atom-font-icons",
  "workbench.layoutControl.enabled": false,

  // 编辑器外观
  "editor.fontFamily": "FiraCode Nerd Font",
  "editor.fontSize": 17,
  "editor.lineNumbers": "relative",
  "editor.tabSize": 2,
  "editor.cursorSmoothCaretAnimation": "on",
  "editor.cursorSurroundingLines": 50,
  "editor.fontLigatures": true,
  "editor.accessibilitySupport": "on",
  "editor.formatOnSave": true,

  // 终端外观
  "terminal.integrated.fontFamily": "FiraCode Nerd Font",
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "javascript.updateImportsOnFileMove.enabled": "always",
  "security.workspace.trust.untrustedFiles": "open",

  // 代码格式化设置
  // prettier.eslintIntegration 已弃用，请使用 prettier-eslint 扩展或在 .prettierrc 中配置
  "eslint.validate": [
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "html"
  ],
  "[vue]": {
    // "editor.defaultFormatter": "Vue.volar",
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[typescriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[html]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },

  // Vim 设置
  "vim.incsearch": true,
  "vim.useSystemClipboard": true,
  "vim.useCtrlKeys": true,
  "vim.sneak": false,
  "vim.hlsearch": true,
  "vim.easymotion": true,
  "vim.leader": "<space>",
  "vim.surround": true,
  "vim.easymotionJumpToAnywhereRegex": "\\b[A-Za-z0-9]|[A-Za-z0-9]\\b|_.|#.|[a-z][A-Z]",
  "vim.foldfix": true,
  "vim.insertModeKeyBindings": [
    {
      "before": ["j", "k"],
      "after": ["<Esc>"]
    }
  ],
  "vim.normalModeKeyBindings": [
    {
      "before": ["<leader>", "m"],
      "commands": ["bookmarks.toggle"]
    },
    {
      "before": ["<leader>", "b"],
      "commands": ["bookmarks.list"]
    },
    {
      "before": ["leader", "w"],
      "commands": ["workbench.action.files.save"]
    }
  ],
  "vim.normalModeKeyBindingsNonRecursive": [
    {
      "before": ["<C-n>"],
      "commands": [":nohl"]
    },
    {
      "before": ["H"],
      "after": ["^"]
    },
    {
      "before": ["L"],
      "after": ["$"]
    },
    {
      "before": ["f"],
      "after": ["\\"]
    },
    {
      "before": ["s"],
      "after": ["f"]
    }
  ],
  "vim.visualModeKeyBindingsNonRecursive": [
    {
      "before": ["H"],
      "after": ["^"]
    },
    {
      "before": ["L"],
      "after": ["$"]
    },
    {
      "before": ["S"],
      "after": [""]
    },
    {
      "before": ["j", "k"],
      "after": ["<Esc>"]
    }
  ],
  "vim.handleKeys": {
    "<C-a>": false,
    "<C-f>": false,
    "<C-c>": false,
    "<C-v>": false,
    "<C-p>": false,
    "<C-b>": false,
    "<C-k>": false,
    "<C-z>": false,
    "<C-j>": false,
    "<C-d>": false
  },
}
```