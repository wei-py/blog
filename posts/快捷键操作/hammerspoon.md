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

bindKeyStroke(",", { "cmd" }, "u");
bindKeyStroke(".", { "cmd" }, "j");
bindKeyStroke(";", { "cmd" }, "l");


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
-- hs.hotkey.bind(hyper, ";", function()
--     -- if allWindowsFilter:isWindowAllowed(hs.window.focusedWindow()) then
--     local win = hs.window.focusedWindow()
--     local f = win:frame()
--     local screen = win:screen()
--     local max = screen:frame()
--     f.x = max.x
--     f.y = max.y
--     f.w = max.w / 2
--     f.h = max.h
--     win:setFrame(f)
--     -- end
-- end)

-- 右半屏幕
-- hs.hotkey.bind(hyper, "'", function()
--     -- if allWindowsFilter:isWindowAllowed(hs.window.focusedWindow()) then
--     local win = hs.window.focusedWindow()
--     local f = win:frame()
--     local screen = win:screen()
--     local max = screen:frame()
--     f.x = max.x + (max.w / 2)
--     f.y = max.y
--     f.w = max.w / 2
--     f.h = max.h
--     win:setFrame(f)
--     -- end
-- end)

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
launchApp("b", "WeChat")
-- launchApp("e", "Finder")
launchApp("n", "Warp")
```

## 最新配置 
```lua
---@diagnostic disable: undefined-global
hs.alert.show("Config loaded")


-- 输入法枚举
InputMethodEnum = {
    -- mac自带的，无法删除的输入法，以键盘布局存在
    english = {
        id = "com.apple.keylayout.ABC",
        name = "ABC"
    },
    pinyin = {
        id = "com.apple.inputmethod.SCIM.ITABC",
        name = "拼音"
    },
    shuangpin = {
        id = "com.apple.inputmethod.SCIM.Shuangpin",
        name = "双拼"
    },
    sougou = {
        id = "com.sogou.inputmethod.sogou.pinyin",
        name = "搜狗"
    },
    wubi = {
        id = "com.apple.inputmethod.SCIM.WBX",
        name = "五笔"
    },
    fantipinyin = {
        id = "com.apple.inputmethod.TCIM.Pinyin",
        name = "繁体拼音"
    },
}


--------------------------------------------------------------------------------
-- 功能实现
--------------------------------------------------------------------------------

-- 触发指定的键
local function sendKey(modifier, key)
    hs.eventtap.keyStroke(modifier, key, 0)
end


------------------ capslock ⬇️ ------------------
-- 创建 F13 模态环境
F13Modal = hs.hotkey.modal.new()
-- F13 热键绑定
F13HotkeyBinding = nil
-- 将 CapsLock 映射到 F13
local function remapCapsLockToF13()
    -- 将 CapsLock (0x700000039) 重映射到 F13 (0x700000068)
    local command =
    "hidutil property --set '{\"UserKeyMapping\":[{\"HIDKeyboardModifierMappingSrc\": 0x700000039, \"HIDKeyboardModifierMappingDst\": 0x700000068}]}'"
    local success = os.execute(command)

    if success then
        hs.alert.show("CapsLock 映射为 F13")
    else
        hs.alert.show("CapsLock 映射为 F13 失败")
        return
    end

    F13HotkeyBinding = hs.hotkey.bind({}, 'f13', function()
        F13Modal:enter()
    end, function()
        F13Modal:exit()
    end)
end


-- 撤销 CapsLock 映射到 F13
local function removeCapsLockToF13()
    -- 设置空的映射数组来清除所有映射
    local command = "hidutil property --set '{\"UserKeyMapping\":[]}'"
    local success = os.execute(command)

    if success then
        hs.alert.show("撤销 CapsLock 映射为 F13")
    else
        hs.alert.show("撤销 CapsLock 映射为 F13 失败")
    end

    -- 清除 F13 热键绑定（是否必要存疑，为了逻辑完整性）
    if F13HotkeyBinding then
        F13HotkeyBinding:delete()
        F13HotkeyBinding = nil
    end

    -- 退出模态
    F13Modal:exit()
end

-- 绑定 F13 按键，支持按键重复
local function bindF13Key(key, fn, shouldRepeat)
    shouldRepeat = shouldRepeat or false
    if shouldRepeat then
        F13Modal:bind({}, key,
            -- pressedfn (按下时触发)
            function() fn() end,
            -- releasedfn (松开时触发)
            function() end,
            -- repeatfn (重复时触发)
            function() fn() end
        )
    else
        F13Modal:bind({}, key,
            -- pressedfn (按下时触发)
            function() fn() end,
            -- releasedfn (松开时触发)
            function() end,
            -- repeatfn (重复时触发)
            function() end
        )
    end
end

------------------ capslock ⬆️ ------------------


-- 定义切换到当前应用其他窗口的功能
bindF13Key("r", function()
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


------------------ cmd ⬇️ ------------------
local function bindCMDKey(key, fn)
    hs.hotkey.bind({ "cmd" }, key, function()
        fn()
    end)
end
------------------ cmd ⬆️ ------------------



------------------ 改变窗口布局 ⬇️ ------------------
local function changeWindowLayout(mode)
    local win = hs.window.focusedWindow()
    if win == nil then
        return
    end

    local id = win:id()
    if id == nil then
        return
    end

    if win:isFullScreen() and mode ~= "fullScreen" then
        win:setFullScreen(false)
    end

    if mode == "fullScreen" then
        win:setFullScreen(true)
    elseif mode == "maximize" then
        win:maximize()
    elseif mode == "left" then
        win:moveToUnit({ 0, 0, 0.5, 1 })
    elseif mode == "right" then
        win:moveToUnit({ 0.5, 0, 0.5, 1 })
    end
end
------------------ 改变窗口布局 ⬆️ ------------------



------------------ 启动App ⬇️ ------------------
local function launchApp(app)
    hs.application.launchOrFocus(app)
end
------------------ 启动App ⬆️ ------------------


------------------ 标签页相关 ⬇️ ------------------
-- 上一个标签页
local function prevTab()
    sendKey({ "ctrl", "shift" }, "tab")
end

-- 下一个标签页
local function nextTab()
    sendKey({ "ctrl" }, "tab")
end
------------------ 标签页相关 ⬆️ ------------------


------------------ 音量控制 ⬇️ -----------------
local function setVolumn(isAdd)
    if isAdd == nil then
        isAdd = true
    end
    if isAdd then
        hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.defaultOutputDevice():volume() + 5)
    else
        hs.audiodevice.defaultOutputDevice():setVolume(hs.audiodevice.defaultOutputDevice():volume() - 5)
    end
end
------------------ 音量控制 ⬆️ -----------------

------------------ 输入法相关 ⬇️ ------------------
-- 获取所有输入法
local function getAllInputSources()
    local sources = {}

    -- 获取所有键盘布局
    local layouts = hs.keycodes.layouts(true)
    for _, sourceID in pairs(layouts) do
        table.insert(sources, sourceID)
    end

    -- 获取所有输入法
    local methods = hs.keycodes.methods(true)
    for _, sourceID in pairs(methods) do
        table.insert(sources, sourceID)
    end

    return sources
end

-- 循环切换输入法
local function switchInputMethod()
    local sources = getAllInputSources()
    if #sources == 0 then
        return
    end

    local currentID = hs.keycodes.currentSourceID()

    -- 获取当前输入法的索引
    local currentIndex = 1
    for i, id in ipairs(sources) do
        if id == currentID then
            currentIndex = i
            break
        end
    end

    -- 获取下一个输入法的索引
    local nextIndex = currentIndex % #sources + 1
    hs.keycodes.currentSourceID(sources[nextIndex])
end

ShiftDownEvent = nil
KeyDownEvent = nil
ShiftDownFlag = false
OtherKeyDownFlag = false
-- shift按键状态纠错机制定时器
ShiftStateCorrectionTimer = nil
-- 单击shift切换输入法
local function clickShiftSwitchInputMethod()
    -- 监听修饰键更改事件
    ShiftDownEvent = hs.eventtap.new({ hs.eventtap.event.types.flagsChanged }, function(event)
        local keyCode = event:getProperty(hs.eventtap.event.properties.keyboardEventKeycode)

        -- keyCode = 56(left shift), 60(right shift)
        if keyCode == 56 or keyCode == 60 then
            if not ShiftDownFlag then
                -- shift按下
                ShiftDownFlag = true
                OtherKeyDownFlag = false
            else
                -- shift松开
                if not OtherKeyDownFlag then
                    switchInputMethod()
                end
                ShiftDownFlag = false
            end
        end

        -- 不阻止默认的事件
        return false
    end)
    ShiftDownEvent:start()

    -- 监听修饰键以外的按键按下事件
    KeyDownEvent = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
        OtherKeyDownFlag = true
        -- 不阻止默认的事件
        return false
    end)
    KeyDownEvent:start()

    -- 启动纠错机制
    -- ShiftStateCorrectionTimer = hs.timer.doEvery(5, function()
    --   local currentFlags = hs.eventtap.checkKeyboardModifiers()
    --   if ShiftDownFlag and not currentFlags.shift then
    --     hs.alert.show("触发 shift 按键状态纠错机制")
    --     -- 如果内部状态显示 shift 按下，但实际上已松开，则重置状态变量
    --     ShiftDownFlag = false
    --     OtherKeyDownFlag = false
    --   end
    -- end)
end
------------------ 输入法相关 ⬆️ ------------------





--------------------------------------------------------------------------------
-- 开启配置
--------------------------------------------------------------------------------

-- 将 CapsLock 键映射为 F13 键
remapCapsLockToF13()

bindF13Key("i", function() launchApp("/Applications/Arc.app") end)
bindF13Key("o", function() launchApp("/Applications/Trae.app") end)
bindF13Key("u", function() launchApp("/Applications/ziniaobrowser.app") end)
bindF13Key("y", function() launchApp("/Applications/Obsidian.app") end)
bindF13Key("m", function() launchApp("/Applications/NeteaseMusic.app") end)
bindF13Key("b", function() launchApp("/Applications/WeChat.app") end)
bindF13Key("n", function() launchApp("/Applications/Warp.app") end)


-- 实现支持重复的 Vim 风格方向键
bindF13Key("h", function() sendKey({}, "left") end, true)
bindF13Key("j", function() sendKey({}, "down") end, true)
bindF13Key("k", function() sendKey({}, "up") end, true)
bindF13Key("l", function() sendKey({}, "right") end, true)

-- 切换标签页
bindF13Key("1", prevTab)
bindF13Key("2", nextTab)
bindCMDKey("1", prevTab)
bindCMDKey("2", nextTab)
-- delete
bindF13Key("d", function() sendKey({}, "delete") end, true)


-- 单击shift切换输入法
clickShiftSwitchInputMethod()

-- 改变窗口布局
bindF13Key("up", function() changeWindowLayout("maximize") end)
bindF13Key("down", function() changeWindowLayout("fullScreen") end)
bindF13Key("left", function() changeWindowLayout("left") end)
bindF13Key("right", function() changeWindowLayout("right") end)

bindF13Key("=", function() setVolumn(true) end, true)
bindF13Key("-", function() setVolumn(false) end, true)


-- 在Hammerspoon退出时执行相关操作
hs.shutdownCallback = function()
    -- 撤销 CapsLock 映射到 F13
    removeCapsLockToF13()
end
```