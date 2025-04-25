---
date: 2025-04-24
title: vscode 配置
category: 配置 
tags:
  - vscode
  - setting
description: vscode 配置
---

```json
{
  "workbench.colorTheme": "Github Light Theme - Gray",
  "editor.fontFamily": "FiraCode Nerd Font",
  "editor.fontSize": 17,
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "terminal.integrated.fontFamily": "FiraCode Nerd Font",
  "editor.tabSize": 2,
  "editor.cursorSmoothCaretAnimation": "on",
  "editor.cursorSurroundingLines": 50,
  "editor.fontLigatures": true,
  "javascript.updateImportsOnFileMove.enabled": "always",
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
  "[vue]": {
    "editor.defaultFormatter": "Vue.volar"
  },
  "editor.lineNumbers": "relative",
  "editor.accessibilitySupport": "on",
  "extensions.allowed": "*",
  "window.menuBarVisibility": "compact",
  "workbench.layoutControl.enabled": false,
  "AI.chatLanguage": "简体中文",
  "workbench.iconTheme": "atom-font-icons",
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
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[html]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "hediet.vscode-drawio.resizeImages": null,
  "security.workspace.trust.untrustedFiles": "open",
  "[lua]": {
    "editor.defaultFormatter": "sumneko.lua"
  }
}
```