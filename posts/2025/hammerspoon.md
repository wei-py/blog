---
date: 2025-04-25
title: hammerspoon 配置
category: 配置
tags:
  - mac
  - keymap
  - setting
description: mac 快捷键 快捷激活应用
---

# hammerspoon

## 修改文件的所在位置

~/.hammerspoon 目录下 init.lua 文件

## 配置

```lua
-- 定义超级键 capslock
local hyper = { "alt", "ctrl", "cmd" }

-- 窗口管理相关
hs.window.animationDuration = 0 -- 取消动画

-- 封装按键映射函数
local function bindKeyStroke(key, modifiers, keystroke)
    hs.hotkey.bind(hyper, key, function()
        hs.eventtap.keyStroke(modifiers or {}, keystroke)
    end)
end

-- capslock + 2 ==>  ctrl + tab
bindKeyStroke("2", { "ctrl" }, "tab")

-- capslock + 1 ==>  ctrl + shift + tab
bindKeyStroke("1", { "ctrl", "shift" }, "tab")

-- capslock + tab => commnand + tab
bindKeyStroke("tab", { "cmd" }, "tab");

-- capslock + w ==>  command + w
-- bindKeyStroke("w", { "cmd" }, "w")


-- capslock + c ==>  command + c
-- bindKeyStroke("c", { "cmd" }, "c")

-- capslock + t ==>  command + t
-- bindKeyStroke("t", { "cmd" }, "t")

-- capslock + v ==>  command + v
-- bindKeyStroke("v", { "cmd" }, "v")

-- capslock + f ==>  command + f
-- bindKeyStroke("f", { "cmd" }, "f")

--- 不是很灵敏
-- capslock + z ==>  command + z
-- bindKeyStroke("z", { "cmd" }, "z")

-- capslock + s ==>  command + s
-- bindKeyStroke("s", { "cmd" }, "s")

-- capslock + q ==>  command + q
-- bindKeyStroke("q", { "cmd" }, "q")


-- 调整窗口位置
-- 左半屏幕
hs.hotkey.bind(hyper, ";", function()
    -- if allWindowsFilter:isWindowAllowed(hs.window.focusedWindow()) then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
    -- end
end)

-- 右半屏幕
hs.hotkey.bind(hyper, "'", function()
    -- if allWindowsFilter:isWindowAllowed(hs.window.focusedWindow()) then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
    -- end
end)

-- 全屏
hs.hotkey.bind(hyper, "/", function()
    -- if allWindowsFilter:isWindowAllowed(hs.window.focusedWindow()) then
    local win = hs.window.focusedWindow()
    local max = win:screen():frame()
    win:setFrame(max)
    -- end
end)

-- 控制音量
hs.hotkey.bind(hyper, "=", function()
    -- if allWindowsFilter:isWindowAllowed(hs.window.focusedWindow()) then
    hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.defaultOutputDevice():volume() + 5)
    -- end
end)
hs.hotkey.bind(hyper, "-", function()
    -- if allWindowsFilter:isWindowAllowed(hs.window.focusedWindow()) then
    hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.defaultOutputDevice():volume() - 5)
    -- end
end)

-- 控制音乐播放
hs.hotkey.bind(hyper, "[", function()
    hs.eventtap.keyStroke({ "cmd", "option" }, "left")
end)
hs.hotkey.bind(hyper, "]", function()
    hs.eventtap.keyStroke({ "cmd", "option" }, "right")
end)

-- 应用切换

-- 定义切换到当前应用其他窗口的功能
hs.hotkey.bind(hyper, "r", function()
    -- if allWindowsFilter:isWindowAllowed(hs.window.focusedWindow()) then
    local frontApp = hs.application.frontmostApplication()
    local windows = frontApp:allWindows()
    local currentWindow = hs.window.focusedWindow()
    local currentIndex = nil
    for i, window in ipairs(windows) do
        if window == currentWindow then
            currentIndex = i
            break
        end
    end
    if currentIndex then
        local nextIndex = currentIndex + 1
        if nextIndex > #windows then
            nextIndex = 1
        end
        windows[nextIndex]:focus()
    end
    -- end
end)

-- 快速启动应用
local function launchApp(key, appName)
    hs.hotkey.bind(hyper, key, function()
        -- if allWindowsFilter:isWindowAllowed(hs.window.focusedWindow()) then
        hs.application.launchOrFocus(appName)
        -- end
    end)
end

launchApp("i", "Arc")
launchApp("o", "Trae")
launchApp("u", "ziniaobrowser")
launchApp("y", "Obsidian")
launchApp("m", "NeteaseMusic")
launchApp("p", "WeChat")
launchApp("e", "Finder")
launchApp("n", "Warp")
```
