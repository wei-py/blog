---
date: 2025-12-12
title: zed setting
category: 配置
tags:
  - zed
  - setting
  - keymap
description: zed 配置
---

```json
// Zed settings
//
// For information on how to configure Zed, see the Zed
// documentation: https://zed.dev/docs/configuring-zed
//
// To see all of Zed's default settings without changing your
// custom settings, run `zed: open default settings` from the
// command palette (cmd-shift-p / ctrl-shift-p)
{
  "code_actions_on_format": {
    "source.fixAll.eslint": true
  },
  "formatter": [],
  "icon_theme": "Material Icon Theme",
  "context_servers": {
    "mcp-server-context7": {
      "source": "extension",
      "enabled": true,
      "settings": {
        "default_minimum_tokens": "10000"
      }
    },
    "postgres-context-server": {
      "source": "extension",
      "enabled": false,
      "settings": {
        "database_url": "postgresql://myuser:mypassword@localhost:5432/mydatabase"
      }
    }
  },
  // "icon_theme": "Colored Zed Icons Theme Dark",
  "ui_font_family": "Arial",
  "buffer_font_family": "FiraCode Nerd Font Mono",
  "buffer_font_fallbacks": ["霞鹜文楷 GB"],
  "ui_font_fallbacks": ["霞鹜文楷 GB"],
  "ui_font_size": 16,
  "buffer_font_size": 18,
  "buffer_line_height": {
    "custom": 1.5
  },
  "inlay_hints": {
    "enabled": false,
    "show_value_hints": true,
    "show_type_hints": true,
    "show_parameter_hints": true,
    "show_other_hints": true,
    "show_background": false,
    "edit_debounce_ms": 700,
    "scroll_debounce_ms": 50,
    "toggle_on_modifiers_press": {
      "control": false,
      "alt": false,
      "shift": false,
      "platform": false,
      "function": false
    }
  },
  "vim_mode": true,
  "theme": "Gruvbox Light Soft",
  "minimap": {
    "show": "always",
    "display_in": "all_editors",
    "thumb_border": "left_only",
    "thumb": "always"
  },
  "agent": {
    "use_modifier_to_send": true,
    "play_sound_when_agent_done": true,
    "always_allow_tool_actions": true,
    "default_model": {
      "provider": "ollama",
      "model": "gemma3:4b"
    }
  },
  "base_keymap": "VSCode",
  "relative_line_numbers": "enabled",
  "bottom_dock_layout": "full",
  "project_panel": {
    "default_width": 480,
    "indent_size": 20,
    "hide_root": true,
    "auto_fold_dirs": false,
    "dock": "left",
    "entry_spacing": "standard"
  },
  "gutter": {
    "line_numbers": true,
    "folds": false
  },
  "vertical_scroll_margin": 20,
  "diagnostics": {
    "button": true,
    "include_warnings": true,
    "lsp_pull_diagnostics": {
      "enabled": true,
      "debounce_ms": 50
    },
    "inline": {
      "enabled": true,
      "update_debounce_ms": 150,
      "padding": 4,
      "min_column": 0,
      "max_severity": null
    }
  },
  "disable_ai": true,
  "format_on_save": "on",
  "file_types": {
    "Vue.js": ["**/*.uvue"],
    "TypeScript": ["**/*.uts"]
  },
  "indent_guides": {
    "line_width": 1,
    "active_line_width": 2
    // "coloring": "fixed",
    // "background_coloring": "indent_aware"
  },
  "terminal": {
    "default_height": 600
  }
}

```
