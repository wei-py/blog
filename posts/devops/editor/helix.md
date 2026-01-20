---
title: helix 设置
date: 2025-12-06
category: editor
tags:
  - helix
---

## config.toml

```toml
theme = "ayu_evolve"

[editor]

line-number = "relative"
mouse = false
scrolloff = 50

[editor.cursor-shape]

insert = "bar"
normal = "block"
select = "underline"

[editor.file-picker]

[editor.whitespace.characters]

space = "·"
nbsp = "⍽"
tab = "→"
newline = "⏎"
tabpad = "·" # Tabs will look like "→···" (depending on tab width)

[editor.indent-guides]

render = true
character = "⸽" # Some characters that work well: "▏", "┆", "┊", "╎"

[keys.normal]
x = "delete_selection"
X = "extend_line_below"
v = "select_mode"
H = "goto_line_start"
L = "goto_line_end"
G = "goto_file_end"

[keys.insert]

j = { k = "normal_mode" }
up = "no_op"
down = "no_op"
left = "no_op"
right = "no_op"
pageup = "no_op"
pagedown = "no_op"
home = "no_op"
end = "no_op"
```

## languages.toml

```toml
# TypeScript/JavaScript Language Server
[language-server.typescript-language-server]
command = "typescript-language-server"
args = ["--stdio"]
config.hostInfo = "helix"

[[language]]
name = "typescript"
language-servers = ["typescript-language-server"]
formatter = { command = "prettier", args = ["--parser", "typescript"] }
auto-format = false

[[language]]
name = "javascript"
language-servers = ["typescript-language-server"]
formatter = { command = "prettier", args = ["--parser", "javascript"] }
auto-format = false

[[language]]
name = "tsx"
language-servers = ["typescript-language-server"]
formatter = { command = "prettier", args = ["--parser", "typescript"] }
auto-format = false

[[language]]
name = "jsx"
language-servers = ["typescript-language-server"]
formatter = { command = "prettier", args = ["--parser", "javascript"] }
auto-format = false

# HTML Language Server
[language-server.vscode-html-language-server]
command = "vscode-html-language-server"
args = ["--stdio"]

[[language]]
name = "html"
language-servers = ["vscode-html-language-server"]
formatter = { command = "prettier", args = ["--parser", "html"] }
auto-format = false

# CSS Language Server
[language-server.vscode-css-language-server]
command = "vscode-css-language-server"
args = ["--stdio"]

[[language]]
name = "css"
language-servers = ["vscode-css-language-server"]
formatter = { command = "prettier", args = ["--parser", "css"] }
auto-format = false

[[language]]
name = "scss"
language-servers = ["vscode-css-language-server"]
formatter = { command = "prettier", args = ["--parser", "scss"] }
auto-format = false

# Swift Language Server
[language-server.sourcekit-lsp]
command = "sourcekit-lsp"

[[language]]
name = "swift"
language-servers = ["sourcekit-lsp"]
auto-format = false

# Markdown Language Server
[language-server.marksman]
command = "marksman"
args = ["server"]

[[language]]
name = "markdown"
language-servers = ["marksman"]
```

