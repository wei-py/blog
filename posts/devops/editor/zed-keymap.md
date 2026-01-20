---
date: 2025-12-12
title: zed keymap
category: editor
tags:
  - zed
  - setting
  - keymap
description: zed 配置
---

```json
// Zed keymap
//
// For information on binding keys, see the Zed
// documentation: https://zed.dev/docs/key-bindings
//
// To see the default key bindings run `zed: open default keymap`
// from the command palette.
[
  {
    "context": "Workspace",
    "bindings": {
      // "shift shift": "file_finder::Toggle"
    }
  },
  {
    "bindings": {
      "ctrl-tab": "pane::ActivateNextItem",
      "ctrl-shift-tab": "pane::ActivatePreviousItem"
    }
  },
  {
    "context": "Editor",
    "bindings": {
      // "j k": ["workspace::SendKeystrokes", "escape"]
    }
  },
  {
    "context": "VimControl && !menu",
    "bindings": {
      "H": "vim::FirstNonWhitespace",
      "L": "vim::EndOfLine"
    }
  },
  {
    "context": "Editor && vim_mode == insert",
    "bindings": {
      // "j k": ["workspace::SendKeystrokes", "escape"]
      "j k": "vim::SwitchToNormalMode"
      // "j k": "vim::NormalBefore"
    }
  },
  {
    "context": "Editor && vim_mode == visual",
    "bindings": {
      // "j k": ["workspace::SendKeystrokes", "escape"]
      "j k": "vim::SwitchToNormalMode"
    }
  },
  {
    "context": "!ContextEditor > (Editor && mode == full)",
    "bindings": {
      "cmd-shift-enter": "assistant::InlineAssist"
    }
  },
  {
    "context": "Editor",
    "bindings": {
      "cmd-e": null
    }
  },
  {
    "bindings": {
      "cmd-e": "project_panel::ToggleFocus"
    }
  },
  {
    "bindings": {
      "alt-e": "project_panel::ToggleFocus"
    }
  },
  {
    "context": "ProjectPanel && !editing",
    "bindings": {
      "n": "project_panel::NewFile",
      "a": "project_panel::NewDirectory",
      "shift-r": "project_panel::Rename",
      "d": "project_panel::Delete"
    }
  }
]
```
