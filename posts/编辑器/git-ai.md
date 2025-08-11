---
date: 2025-04-24
title: git ai 配置
category: 配置
tags:
  - git
  - ai
description: git 配置
---

## install

```shell
npm i -g opencommit
```

## ~/.opencommit

```shell
OCO_API_URL=http://localhost:11434/api/chat
OCO_MODEL=deepseek-coder:6.7b
OCO_API_KEY=undefined
OCO_API_CUSTOM_HEADERS=undefined
OCO_AI_PROVIDER=ollama
OCO_TOKENS_MAX_INPUT=4096
OCO_TOKENS_MAX_OUTPUT=500
OCO_DESCRIPTION=false
OCO_EMOJI=true
OCO_LANGUAGE=zh_CN
OCO_MESSAGE_TEMPLATE_PLACEHOLDER=$msg
OCO_PROMPT_MODULE=conventional-commit
OCO_ONE_LINE_COMMIT=false
OCO_TEST_MOCK_TYPE=commit-message
OCO_OMIT_SCOPE=false
OCO_GITPUSH=true
OCO_WHY=false
OCO_HOOK_AUTO_UNCOMMENT=false
```
