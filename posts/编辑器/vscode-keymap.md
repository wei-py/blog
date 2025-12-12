---
date: 2025-12-12
title: vscode keymap
category: 配置
tags:
  - vscode
  - setting
  - keymap
description: vscode 配置
---

```json
// 将键绑定放在此文件中以覆盖默认值auto[]
[
  {
    "key": "alt+cmd+=",
    "command": "python.execInTerminal"
  },
  {
    "key": "alt+cmd+[Backslash]",
    "command": "code-runner.run"
  },
  {
    "key": "ctrl+alt+n",
    "command": "-code-runner.run"
  },
  {
    "key": "alt+cmd+-",
    "command": "code-runner.stop"
  },
  {
    "key": "ctrl+alt+m",
    "command": "-code-runner.stop"
  },
  {
    "key": "cmd+m",
    "command": "editor.action.changeAll",
    "when": "editorTextFocus && editorTextFocus && !editorReadonly"
  },
  {
    "key": "cmd+f2",
    "command": "-editor.action.changeAll",
    "when": "editorTextFocus && editorTextFocus && !editorReadonly"
  },
  {
    "key": "cmd+k",
    "command": "-workbench.action.terminal.clear",
    "when": "terminalFocus && terminalProcessSupported"
  },
  {
    "key": "cmd+k left",
    "command": "-views.moveViewLeft",
    "when": "focusedView != ''"
  },
  {
    "key": "cmd+k down",
    "command": "-views.moveViewDown",
    "when": "focusedView != ''"
  },
  {
    "key": "cmd+l",
    "command": "-expandLineSelection",
    "when": "textInputFocus"
  },
  {
    "key": "cmd+k right",
    "command": "-views.moveViewRight",
    "when": "focusedView != ''"
  },
  {
    "key": "cmd+k up",
    "command": "-views.moveViewUp",
    "when": "focusedView != ''"
  },
  // {
  //   "key": "cmd+j",
  //   "command": "extension.vim_cmd+left",
  //   "when": "editorTextFocus && vim.active && vim.use<D-left> && !inDebugRepl && vim.mode != 'Insert'"
  // },
  // {
  //   "key": "cmd+left",
  //   "command": "-extension.vim_cmd+left",
  //   "when": "editorTextFocus && vim.active && vim.use<D-left> && !inDebugRepl && vim.mode != 'Insert'"
  // },
  // {
  //   "key": "cmd+l",
  //   "command": "extension.vim_cmd+right",
  //   "when": "editorTextFocus && vim.active && vim.use<D-right> && !inDebugRepl && vim.mode != 'Insert'"
  // },
  // {
  //   "key": "cmd+right",
  //   "command": "-extension.vim_cmd+right",
  //   "when": "editorTextFocus && vim.active && vim.use<D-right> && !inDebugRepl && vim.mode != 'Insert'"
  // },
  // {
  //   "key": "cmd+k",
  //   "command": "extension.vim_ctrl+down",
  //   "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  // },
  // {
  //   "key": "ctrl+down",
  //   "command": "-extension.vim_ctrl+down",
  //   "when": "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'"
  // },
  {
    "key": "shift+alt+x",
    "command": "workbench.files.action.collapseExplorerFolders"
  },
  {
    "key": "cmd+k up",
    "command": "-workbench.action.moveActiveEditorGroupUp"
  },
  {
    "key": "cmd+k down",
    "command": "-workbench.action.moveActiveEditorGroupDown"
  },
  {
    "key": "cmd+k right",
    "command": "-workbench.action.moveActiveEditorGroupRight"
  },
  {
    "key": "cmd+k left",
    "command": "-workbench.action.moveActiveEditorGroupLeft"
  },
  {
    "key": "cmd+k",
    "command": "workbench.action.terminal.clear",
    "when": "terminalFocus && terminalHasBeenCreated || terminalFocus && terminalProcessSupported"
  },
  {
    "key": "cmd+k",
    "command": "-workbench.action.terminal.clear",
    "when": "terminalFocus && terminalHasBeenCreated || terminalFocus && terminalProcessSupported"
  },
  {
    "key": "cmd+[",
    "command": "-editor.action.outdentLines",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "cmd+]",
    "command": "-editor.action.indentLines",
    "when": "editorTextFocus && !editorReadonly"
  },
  {
    "key": "ctrl+tab",
    "command": "workbench.action.nextEditor"
  },
  {
    "key": "alt+cmd+right",
    "command": "-workbench.action.nextEditor"
  },
  {
    "key": "ctrl+shift+tab",
    "command": "workbench.action.previousEditor"
  },
  {
    "key": "alt+cmd+left",
    "command": "-workbench.action.previousEditor"
  },
  {
    "key": "cmd+y cmd+t",
    "command": "volar.action.splitEditors"
  },
  {
    "key": "cmd+[ cmd+]",
    "command": "workbench.action.toggleActivityBarVisibility"
  },
  {
    "key": "ctrl+cmd+enter",
    "command": "leetcode.submitSolution"
  },
  {
    "key": "cmd+u",
    "command": "selectPrevSuggestion",
    "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus || suggestWidgetVisible && textInputFocus && !suggestWidgetHasFocusedSuggestion"
  },
  {
    "key": "ctrl+p",
    "command": "-selectPrevSuggestion",
    "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus || suggestWidgetVisible && textInputFocus && !suggestWidgetHasFocusedSuggestion"
  },
  {
    "key": "cmd+n",
    "command": "selectNextSuggestion",
    "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus || suggestWidgetVisible && textInputFocus && !suggestWidgetHasFocusedSuggestion"
  },
  {
    "key": "ctrl+n",
    "command": "-selectNextSuggestion",
    "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus || suggestWidgetVisible && textInputFocus && !suggestWidgetHasFocusedSuggestion"
  },
  {
    "key": "cmd+n",
    "command": "-workbench.action.files.newUntitledFile"
  },
  {
    "key": "down",
    "command": "selectNextCodeAction",
    "when": "codeActionMenuVisible"
  },
  {
    "key": "cmd+down",
    "command": "-selectNextCodeAction",
    "when": "codeActionMenuVisible"
  },
  {
    "key": "ctrl+n",
    "command": "-selectNextCodeAction",
    "when": "codeActionMenuVisible"
  },
  {
    "key": "down",
    "command": "-selectNextCodeAction",
    "when": "codeActionMenuVisible"
  },
  {
    "key": "cmd+down",
    "command": "-selectNextSuggestion",
    "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus || suggestWidgetVisible && textInputFocus && !suggestWidgetHasFocusedSuggestion"
  },
  {
    "key": "cmd+up",
    "command": "-selectPrevSuggestion",
    "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus || suggestWidgetVisible && textInputFocus && !suggestWidgetHasFocusedSuggestion"
  },
  {
    "key": "shift+alt+l",
    "command": "turboConsoleLog.commentAllLogMessages"
  },
  {
    "key": "shift+alt+c",
    "command": "-turboConsoleLog.commentAllLogMessages"
  },
  {
    "key": "shift+cmd+c",
    "command": "-workbench.action.terminal.openNativeConsole",
    "when": "!terminalFocus"
  },
  {
    "key": "cmd+e",
    "command": "workbench.action.focusSideBar",
    "when": "editorFocus"
  },
  {
    "key": "cmd+e",
    "command": "workbench.action.focusActiveEditorGroup",
    "when": "sideBarFocus"
  },
  {
    "key": "cmd+e",
    "command": "-workbench.action.quickOpen"
  },
  {
    "key": "alt+e",
    "command": "workbench.action.focusSideBar",
    "when": "editorFocus"
  },
  {
    "key": "alt+e",
    "command": "workbench.action.focusActiveEditorGroup",
    "when": "sideBarFocus"
  },
  {
    "key": "n",
    "command": "explorer.newFile",
    "when": "explorerViewletVisible && filesExplorerFocus && !inputFocus"
  },
  {
    "key": "a",
    "command": "explorer.newFolder",
    "when": "explorerViewletVisible && filesExplorerFocus && !inputFocus"
  },
  {
    "key": "shift+r",
    "command": "renameFile",
    "when": "explorerViewletVisible && filesExplorerFocus && !inputFocus"
  },
  {
    "key": "d",
    "command": "deleteFile",
    "when": "explorerViewletVisible && filesExplorerFocus && !inputFocus"
  },
  {
    "key": "x",
    "command": "revealFileInOS",
    "when": "explorerViewletVisible && filesExplorerFocus && !inputFocus"
  }
]
```
