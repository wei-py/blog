---
date: 2025-04-25
title: mykeymap 配置
category: keymap
tags:
  - window
  - keymap
  - setting
description: window 快捷键 修改光标为 vim 操作
---

# mykeymap 配置

## 下载

> https://xianyukang.com/MyKeymap.html

## 修改任务切换快捷键

/bin/MyKeymap.ahk

```lua
InitKeymap()
{
  taskSwitch := TaskSwitchKeymap("k", "j", "h", "l", "c", "space")
  // 其他配置
}
```

## 我的配置

/data/config.json

```json
{
  "keymaps": [
    {
      "id": 5,
      "name": "CapsLock",
      "enable": true,
      "hotkey": "*CapsLock",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "*,": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:36",
            "actionValueID": 12
          }
        ],
        "*-": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Volume_Down",
            "remapToKey": "Volume_Down"
          }
        ],
        "*.": [
          {
            "windowGroupID": 0,
            "actionTypeID": 3,
            "comment": "label:15",
            "actionValueID": 13
          }
        ],
        "*/": [
          {
            "windowGroupID": 0,
            "actionTypeID": 3,
            "comment": "label:11",
            "actionValueID": 9
          }
        ],
        "*1": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:70",
            "actionValueID": 28
          }
        ],
        "*2": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:68",
            "actionValueID": 26
          }
        ],
        "*=": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Volume_Up",
            "remapToKey": "Volume_Up"
          }
        ],
        "*[": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Media_Prev",
            "remapToKey": "Media_Prev"
          }
        ],
        "*\\": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Media_Play_Pause",
            "remapToKey": "Media_Play_Pause"
          }
        ],
        "*]": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Media_Next",
            "remapToKey": "Media_Next"
          }
        ],
        "*a": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "keysToSend": "^a"
          }
        ],
        "*c": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "keysToSend": "^c"
          }
        ],
        "*d": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Backspace",
            "remapToKey": "Backspace"
          }
        ],
        "*f": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "keysToSend": "^f"
          }
        ],
        "*g": [
          {
            "windowGroupID": 0,
            "actionTypeID": 3,
            "comment": "label:14",
            "actionValueID": 12
          }
        ],
        "*h": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Left",
            "remapToKey": "Left"
          }
        ],
        "*i": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "winTitle": "ahk_exe opera.exe",
            "target": "C:\\Users\\bto\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Opera GX 浏览器.lnk",
            "runAsAdmin": true
          }
        ],
        "*j": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Down",
            "remapToKey": "Down"
          }
        ],
        "*k": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Up",
            "remapToKey": "Up"
          }
        ],
        "*l": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Right",
            "remapToKey": "Right"
          }
        ],
        "*m": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "winTitle": "ahk_exe cloudmusic.exe",
            "target": "shortcuts\\网易云音乐.lnk",
            "runAsAdmin": true
          }
        ],
        "*n": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "winTitle": "ahk_exe WindowsTerminal.exe",
            "target": "shortcuts\\终端.lnk",
            "runAsAdmin": true,
            "runInBackground": true
          }
        ],
        "*o": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "appConfig.js - btp-solar-work-app-web - Trae CN ahk_class Chrome_WidgetWin_1 ahk_exe Trae CN.exe",
            "winTitle": "ahk_exe Trae CN.exe",
            "target": "C:\\Users\\bto\\Desktop\\Trae CN.lnk",
            "runAsAdmin": true
          }
        ],
        "*p": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "winTitle": "ahk_exe DingTalk.exe",
            "target": "C:\\Users\\bto\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\钉钉.lnk",
            "runAsAdmin": true
          }
        ],
        "*q": [
          {
            "windowGroupID": 0,
            "actionTypeID": 3,
            "comment": "label:1",
            "actionValueID": 1
          }
        ],
        "*r": [
          {
            "windowGroupID": 0,
            "actionTypeID": 3,
            "comment": "label:3",
            "actionValueID": 3
          }
        ],
        "*s": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "keysToSend": "^s"
          }
        ],
        "*space": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:64",
            "actionValueID": 22
          }
        ],
        "*t": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "keysToSend": "^t"
          }
        ],
        "*tab": [
          {
            "windowGroupID": 0,
            "actionTypeID": 3,
            "comment": "label:4",
            "actionValueID": 4
          }
        ],
        "*v": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "keysToSend": "^v"
          }
        ],
        "*w": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "keysToSend": "^w"
          }
        ],
        "*x": [
          {
            "windowGroupID": 0,
            "actionTypeID": 3,
            "comment": "label:8",
            "actionValueID": 15
          }
        ],
        "*z": [
          {
            "windowGroupID": 0,
            "actionTypeID": 2,
            "comment": "label:24",
            "actionValueID": 8
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:57",
            "actionValueID": 19
          }
        ]
      }
    },
    {
      "id": 6,
      "name": "CapsLock + F",
      "enable": false,
      "hotkey": "*f",
      "parentID": 5,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "*a": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "Windows Terminal",
            "winTitle": "ahk_exe WindowsTerminal.exe",
            "target": "shortcuts\\终端预览.lnk"
          }
        ],
        "*e": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "File Explorer",
            "winTitle": "ahk_class CabinetWClass ahk_exe Explorer.EXE",
            "target": "D:\\"
          }
        ],
        "*s": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "Visual Studio Code",
            "winTitle": "ahk_exe Code.exe",
            "target": "shortcuts\\Visual Studio Code.lnk"
          }
        ],
        "*w": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "Chrome",
            "winTitle": "ahk_exe chrome.exe",
            "target": "shortcuts\\Google Chrome.lnk"
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入 f 键",
            "keysToSend": "{blind}{f}"
          }
        ]
      }
    },
    {
      "id": 7,
      "name": "CapsLock + Space",
      "enable": false,
      "hotkey": "*Space",
      "parentID": 5,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "*d": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "DataGrip",
            "winTitle": "ahk_exe datagrip64.exe",
            "target": "shortcuts\\DataGrip.lnk"
          }
        ],
        "*w": [
          {
            "windowGroupID": 0,
            "actionTypeID": 8,
            "comment": "如果 WeChat.exe 进程存在则输入 Ctrl+Alt+W 热键激活微信，否则启动微信",
            "ahkCode": "ProcessExistSendKeyOrRun(\"WeChat.exe\", \"^!w\", \"shortcuts\\微信.lnk\")"
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入 space 键",
            "keysToSend": "{blind}{space}"
          }
        ]
      }
    },
    {
      "id": 8,
      "name": "J 模式",
      "enable": false,
      "hotkey": "*j",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "*k": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:62",
            "actionValueID": 20
          }
        ],
        "*space": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:64",
            "actionValueID": 22
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入 j 键",
            "keysToSend": "{blind}{j}"
          }
        ]
      }
    },
    {
      "id": 9,
      "name": "F 模式",
      "enable": false,
      "hotkey": "f",
      "parentID": 0,
      "delay": 50,
      "disableAt": "",
      "hotkeys": {
        "*a": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:42",
            "actionValueID": 5
          }
        ],
        "*b": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:63",
            "actionValueID": 21
          }
        ],
        "*e": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:62",
            "actionValueID": 20
          }
        ],
        "*h": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:40",
            "actionValueID": 3
          }
        ],
        "*i": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:43",
            "actionValueID": 6
          }
        ],
        "*j": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:39",
            "actionValueID": 2
          }
        ],
        "*k": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:38",
            "actionValueID": 1
          }
        ],
        "*l": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:41",
            "actionValueID": 4
          }
        ],
        "*m": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:54",
            "actionValueID": 17
          }
        ],
        "*n": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:66",
            "actionValueID": 24
          }
        ],
        "*space": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:64",
            "actionValueID": 22
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入 f 键",
            "keysToSend": "{blind}{f}"
          }
        ]
      }
    },
    {
      "id": 10,
      "name": "3 模式",
      "enable": false,
      "hotkey": "*3",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "*,": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 2",
            "remapToKey": "2"
          }
        ],
        "*.": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 3",
            "remapToKey": "3"
          }
        ],
        "*/": [
          {
            "windowGroupID": 0,
            "actionTypeID": 9,
            "comment": "label:78",
            "actionValueID": 8
          }
        ],
        "*0": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to F10",
            "remapToKey": "F10"
          }
        ],
        "*2": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to F2",
            "remapToKey": "F2"
          }
        ],
        "*4": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to F4",
            "remapToKey": "F4"
          }
        ],
        "*5": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to F5",
            "remapToKey": "F5"
          }
        ],
        "*9": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to F9",
            "remapToKey": "F9"
          }
        ],
        "*e": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to F11",
            "remapToKey": "F11"
          }
        ],
        "*i": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 8",
            "remapToKey": "8"
          }
        ],
        "*j": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 4",
            "remapToKey": "4"
          }
        ],
        "*k": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 5",
            "remapToKey": "5"
          }
        ],
        "*l": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 6",
            "remapToKey": "6"
          }
        ],
        "*m": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 1",
            "remapToKey": "1"
          }
        ],
        "*n": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 0",
            "remapToKey": "0"
          }
        ],
        "*o": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 9",
            "remapToKey": "9"
          }
        ],
        "*r": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to F12",
            "remapToKey": "F12"
          }
        ],
        "*space": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to F1",
            "remapToKey": "F1"
          }
        ],
        "*t": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to Volume_Up",
            "remapToKey": "Volume_Up"
          }
        ],
        "*u": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 7",
            "remapToKey": "7"
          }
        ],
        "*w": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to Volume_Down",
            "remapToKey": "Volume_Down"
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入 3 键",
            "keysToSend": "{blind}{3}"
          }
        ]
      }
    },
    {
      "id": 11,
      "name": "Tab 模式",
      "enable": false,
      "hotkey": "Tab",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入 tab 键",
            "keysToSend": "{blind}{tab}"
          }
        ]
      }
    },
    {
      "id": 12,
      "name": "空格模式",
      "enable": true,
      "hotkey": "*Space",
      "parentID": 0,
      "delay": 50,
      "disableAt": "",
      "hotkeys": {
        "*-": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Volume_Down",
            "remapToKey": "Volume_Down"
          }
        ],
        "*/": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:37",
            "actionValueID": 13
          }
        ],
        "*0": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:32",
            "actionValueID": 8
          }
        ],
        "*1": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:70",
            "actionValueID": 28
          }
        ],
        "*2": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:68",
            "actionValueID": 26
          }
        ],
        "*7": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:31",
            "actionValueID": 7
          }
        ],
        "*8": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:30",
            "actionValueID": 6
          }
        ],
        "*9": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:29",
            "actionValueID": 5
          }
        ],
        "*=": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Volume_Up",
            "remapToKey": "Volume_Up"
          }
        ],
        "*[": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Media_Prev",
            "remapToKey": "Media_Prev"
          }
        ],
        "*\\": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Media_Play_Pause",
            "remapToKey": "Media_Play_Pause"
          }
        ],
        "*]": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Media_Next",
            "remapToKey": "Media_Next"
          }
        ],
        "*b": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:63",
            "actionValueID": 21
          }
        ],
        "*e": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:62",
            "actionValueID": 20
          }
        ],
        "*h": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Left",
            "remapToKey": "Left"
          }
        ],
        "*i": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:25",
            "actionValueID": 1
          }
        ],
        "*j": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Down",
            "remapToKey": "Down"
          }
        ],
        "*k": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Up",
            "remapToKey": "Up"
          }
        ],
        "*l": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "重映射为 Right",
            "remapToKey": "Right"
          }
        ],
        "*m": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:34",
            "actionValueID": 10
          }
        ],
        "*n": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:33",
            "actionValueID": 9
          }
        ],
        "*o": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:28",
            "actionValueID": 4
          }
        ],
        "*p": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:63",
            "actionValueID": 21
          }
        ],
        "*u": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:26",
            "actionValueID": 2
          }
        ],
        "*y": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:27",
            "actionValueID": 3
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入 space 键",
            "keysToSend": "{blind}{space}"
          }
        ]
      }
    },
    {
      "id": 13,
      "name": "分号模式( ; )",
      "enable": false,
      "hotkey": "*;",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "*a": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 *",
            "keysToSend": "{blind}*"
          }
        ],
        "*b": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 %",
            "keysToSend": "{blind}%"
          }
        ],
        "*c": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 .",
            "keysToSend": "{blind}."
          }
        ],
        "*d": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 =",
            "keysToSend": "{blind}="
          }
        ],
        "*e": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 ^",
            "keysToSend": "{blind}{^}"
          }
        ],
        "*f": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 >",
            "keysToSend": "{blind}>"
          }
        ],
        "*g": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 !",
            "keysToSend": "{blind}{!}"
          }
        ],
        "*h": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 +",
            "keysToSend": "{blind}{+}"
          }
        ],
        "*i": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 :",
            "keysToSend": "{blind}:"
          }
        ],
        "*j": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 ;",
            "keysToSend": "{blind};"
          }
        ],
        "*k": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 `",
            "keysToSend": "{blind}`"
          }
        ],
        "*m": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 -",
            "keysToSend": "{blind}-"
          }
        ],
        "*n": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 /",
            "keysToSend": "{blind}/"
          }
        ],
        "*r": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 &",
            "keysToSend": "{blind}&"
          }
        ],
        "*s": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 <",
            "keysToSend": "{blind}<"
          }
        ],
        "*t": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 ~",
            "keysToSend": "{blind}~"
          }
        ],
        "*u": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 $",
            "keysToSend": "{blind}$"
          }
        ],
        "*v": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 |",
            "keysToSend": "{blind}|"
          }
        ],
        "*w": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 #",
            "keysToSend": "{blind}{#}"
          }
        ],
        "*x": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 _",
            "keysToSend": "{blind}_"
          }
        ],
        "*y": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 @",
            "keysToSend": "{blind}@"
          }
        ],
        "*z": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "符号 \\",
            "keysToSend": "{blind}\\"
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 9,
            "comment": "label:75",
            "actionValueID": 5
          }
        ]
      }
    },
    {
      "id": 14,
      "name": "句号模式( . )",
      "enable": false,
      "hotkey": "*.",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "*,": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:57",
            "actionValueID": 19
          }
        ],
        "*2": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:70",
            "actionValueID": 28
          }
        ],
        "*3": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:68",
            "actionValueID": 26
          }
        ],
        "*a": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:42",
            "actionValueID": 5
          }
        ],
        "*b": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:56",
            "actionValueID": 18
          }
        ],
        "*c": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:63",
            "actionValueID": 21
          }
        ],
        "*d": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:39",
            "actionValueID": 2
          }
        ],
        "*e": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:38",
            "actionValueID": 1
          }
        ],
        "*f": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:41",
            "actionValueID": 4
          }
        ],
        "*g": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:43",
            "actionValueID": 6
          }
        ],
        "*q": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:54",
            "actionValueID": 17
          }
        ],
        "*r": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:67",
            "actionValueID": 25
          }
        ],
        "*s": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:40",
            "actionValueID": 3
          }
        ],
        "*space": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:64",
            "actionValueID": 22
          }
        ],
        "*v": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:45",
            "actionValueID": 8
          }
        ],
        "*w": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:69",
            "actionValueID": 27
          }
        ],
        "*x": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:62",
            "actionValueID": 20
          }
        ],
        "*z": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:44",
            "actionValueID": 7
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入 . 键",
            "keysToSend": "{blind}{.}"
          }
        ]
      }
    },
    {
      "id": 16,
      "name": "鼠标右键",
      "enable": false,
      "hotkey": "RButton",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "*LButton": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "Ctrl + Alt + Tab ( 可用鼠标中键关闭窗口 )",
            "keysToSend": "^!{tab}"
          }
        ],
        "*MButton": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "Win + Tab",
            "keysToSend": "#{tab}"
          }
        ],
        "*WheelDown": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:68",
            "actionValueID": 26
          }
        ],
        "*WheelUp": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:70",
            "actionValueID": 28
          }
        ],
        "*XButton1": [
          {
            "windowGroupID": 0,
            "actionTypeID": 3,
            "comment": "label:6",
            "actionValueID": 6
          }
        ],
        "*XButton2": [
          {
            "windowGroupID": 0,
            "actionTypeID": 3,
            "comment": "label:5",
            "actionValueID": 5
          }
        ],
        "*c": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:63",
            "actionValueID": 21
          }
        ],
        "*d": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:65",
            "actionValueID": 23
          }
        ],
        "*space": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:64",
            "actionValueID": 22
          }
        ],
        "*x": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:62",
            "actionValueID": 20
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 4,
            "comment": "label:34",
            "actionValueID": 10
          }
        ]
      }
    },
    {
      "id": 17,
      "name": "鼠标侧键( Back )",
      "enable": false,
      "hotkey": "XButton1",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "*LButton": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to Media_Play_Pause",
            "remapToKey": "Media_Play_Pause"
          }
        ],
        "*RButton": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to Media_Next",
            "remapToKey": "Media_Next"
          }
        ],
        "*WheelDown": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to Volume_Down",
            "remapToKey": "Volume_Down"
          }
        ],
        "*WheelUp": [
          {
            "windowGroupID": 0,
            "actionTypeID": 5,
            "comment": "Remap to Volume_Up",
            "remapToKey": "Volume_Up"
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入 xbutton1 键",
            "keysToSend": "{blind}{xbutton1}"
          }
        ]
      }
    },
    {
      "id": 18,
      "name": "Alt",
      "enable": true,
      "hotkey": "*<!",
      "parentID": 0,
      "delay": 50,
      "disableAt": "",
      "hotkeys": {
        "*1": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:70",
            "actionValueID": 28
          }
        ],
        "*2": [
          {
            "windowGroupID": 0,
            "actionTypeID": 7,
            "comment": "label:68",
            "actionValueID": 26
          }
        ],
        "*a": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^a",
            "keysToSend": "^a"
          }
        ],
        "*c": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^c",
            "keysToSend": "^c"
          }
        ],
        "*f": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^f",
            "keysToSend": "^f"
          }
        ],
        "*j": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^j",
            "keysToSend": "^j"
          }
        ],
        "*k": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^k",
            "keysToSend": "^k"
          }
        ],
        "*l": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^l",
            "keysToSend": "^l"
          }
        ],
        "*o": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^o",
            "keysToSend": "^o"
          }
        ],
        "*p": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^p",
            "keysToSend": "^p"
          }
        ],
        "*r": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^r",
            "keysToSend": "^r"
          }
        ],
        "*s": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^s",
            "keysToSend": "^s"
          }
        ],
        "*t": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^t",
            "keysToSend": "^t"
          }
        ],
        "*v": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^v",
            "keysToSend": "^v"
          }
        ],
        "*w": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^w",
            "keysToSend": "^w"
          }
        ],
        "*z": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^z",
            "keysToSend": "^z"
          }
        ],
        "singlePress": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入  键",
            "keysToSend": "{blind}{}"
          }
        ]
      }
    },
    {
      "id": 1,
      "name": "Custom Hotkeys",
      "enable": true,
      "hotkey": "customHotkeys",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "!'": [
          {
            "windowGroupID": 0,
            "actionTypeID": 9,
            "comment": "label:72",
            "actionValueID": 2
          }
        ],
        "!+'": [
          {
            "windowGroupID": 0,
            "actionTypeID": 9,
            "comment": "label:71",
            "actionValueID": 1
          }
        ],
        "!+>": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^+>",
            "keysToSend": "^+>"
          }
        ],
        "!+t": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^+t",
            "keysToSend": "^+t"
          }
        ],
        "!,": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^,",
            "keysToSend": "^,"
          }
        ],
        "!/": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^/",
            "keysToSend": "^/"
          }
        ],
        "!CapsLock": [
          {
            "windowGroupID": 0,
            "actionTypeID": 9,
            "comment": "label:77",
            "actionValueID": 7
          }
        ],
        "!Down": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^Down",
            "keysToSend": "^Down"
          }
        ],
        "!Left": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^Left",
            "keysToSend": "^Left"
          }
        ],
        "!Right": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^Right",
            "keysToSend": "^Right"
          }
        ],
        "!Up": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "^Up",
            "keysToSend": "^Up"
          }
        ]
      }
    },
    {
      "id": 2,
      "name": "Command",
      "enable": false,
      "hotkey": "capslockAbbr",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        "bb": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "查询选中的单词 (低配版划词翻译)",
            "winTitle": "Bing 词典",
            "target": "msedge.exe",
            "args": "--app=https://www.bing.com/dict/search?q={selected}"
          }
        ],
        "ca": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "Calculator ( 计算器 )",
            "winTitle": "计算器",
            "target": "calc.exe"
          }
        ],
        "cc": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "用 VS Code 打开选中的文件，在新窗口中打开",
            "target": "shortcuts\\Visual Studio Code.lnk",
            "args": "-n \"{selected}\""
          }
        ],
        "cmd": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "位于 PATH 环境变量中的命令 (比如 cmd.exe) 可以直接启动，无需使用完整路径",
            "winTitle": "ahk_exe cmd.exe",
            "target": "cmd.exe",
            "args": "/k cd /d %userprofile%"
          }
        ],
        "dd": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "打开「 下载 」文件夹",
            "target": "shell:downloads"
          }
        ],
        "dm": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "打开「 MyKeymap 」文件夹",
            "target": "ahk-expression: A_WorkingDir"
          }
        ],
        "ex": [
          {
            "windowGroupID": 0,
            "actionTypeID": 9,
            "comment": "label:73",
            "actionValueID": 3
          }
        ],
        "ga": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "打开桌面的 Game 文件夹",
            "winTitle": "Game ahk_exe explorer.exe",
            "target": "ahk-expression: A_Desktop \"\\Game\""
          }
        ],
        "gj": [
          {
            "windowGroupID": 0,
            "actionTypeID": 2,
            "comment": "label:19",
            "actionValueID": 3
          }
        ],
        "kp": [
          {
            "windowGroupID": 0,
            "actionTypeID": 3,
            "comment": "label:8",
            "actionValueID": 15
          }
        ],
        "ld": [
          {
            "windowGroupID": 0,
            "actionTypeID": 2,
            "comment": "label:22",
            "actionValueID": 6
          }
        ],
        "lj": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "打开「 回收站 」文件夹",
            "target": "shell:RecycleBinFolder"
          }
        ],
        "ly": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "打开蓝牙设置",
            "target": "ms-settings:bluetooth"
          }
        ],
        "mm": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "个人常用项目 - MyKeymap",
            "winTitle": "MyKeymap2 - Visual Studio Code",
            "target": "shortcuts\\Visual Studio Code.lnk",
            "args": "D:\\MyFiles\\MyKeymap2"
          }
        ],
        "ms": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "个人常用项目 - My Site",
            "winTitle": "my_site - Visual Studio Code",
            "target": "shortcuts\\Visual Studio Code.lnk",
            "args": "D:\\project\\my_site"
          }
        ],
        "mu": [
          {
            "windowGroupID": 0,
            "actionTypeID": 2,
            "comment": "label:2401",
            "actionValueID": 9
          }
        ],
        "no": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "记事本",
            "winTitle": "记事本",
            "target": "notepad.exe"
          }
        ],
        "rb": [
          {
            "windowGroupID": 0,
            "actionTypeID": 2,
            "comment": "label:20",
            "actionValueID": 4
          }
        ],
        "rex": [
          {
            "windowGroupID": 0,
            "actionTypeID": 2,
            "comment": "label:23",
            "actionValueID": 7
          }
        ],
        "se": [
          {
            "windowGroupID": 0,
            "actionTypeID": 9,
            "comment": "label:74",
            "actionValueID": 4
          }
        ],
        "sl": [
          {
            "windowGroupID": 0,
            "actionTypeID": 2,
            "comment": "label:18",
            "actionValueID": 2
          }
        ],
        "sp": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "Spotify 网页",
            "winTitle": "Spotify",
            "target": "https://open.spotify.com/"
          }
        ],
        "ss": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "Spotify 应用",
            "winTitle": "ahk_exe Spotify.exe",
            "target": "shortcuts\\Spotify.lnk"
          }
        ],
        "tm": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "Ctrl + Shift + Esc ( Task Manager )",
            "keysToSend": "^+{esc}"
          }
        ],
        "vm": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "Volume Mixer 音量合成器",
            "target": "ms-settings:apps-volume"
          }
        ],
        "we": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "网易云音乐 UWP 版",
            "winTitle": "网易云音乐",
            "target": "shortcuts\\网易云音乐.lnk"
          }
        ],
        "wf": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "查看周围 WiFi",
            "target": "ms-availablenetworks:"
          }
        ],
        "wt": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "用 Windows Terminal 打开选中的文件夹",
            "target": "wt.exe",
            "args": "-d \"{selected}\""
          }
        ]
      }
    },
    {
      "id": 3,
      "name": "Abbreviation",
      "enable": false,
      "hotkey": "semicolonAbbr",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {
        ",": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "因为在输入法中设置了「 中文状态下使用英文标点 」, 所以用这个输入中文逗号",
            "keysToSend": "，"
          }
        ],
        ".": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "因为在输入法中设置了「 中文状态下使用英文标点 」, 所以用这个输入中文句号",
            "keysToSend": "。"
          }
        ],
        "/": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "因为在输入法中设置了「 中文状态下使用英文标点 」, 所以用这个输入中文顿号",
            "keysToSend": "、"
          }
        ],
        "dk": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入一对 {} 并把光标移动中间",
            "keysToSend": "{text}{}\n{left}"
          }
        ],
        "dq": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "对齐代码注释",
            "target": "bin\\AutoHotkey64.exe",
            "args": "bin\\AlignComment.ahk",
            "runInBackground": true
          }
        ],
        "fz": [
          {
            "windowGroupID": 0,
            "actionTypeID": 1,
            "comment": "用剪切板收集文本 (连续复制然后合并粘贴)",
            "target": "bin\\AutoHotkey64.exe",
            "args": "bin\\CollectText.ahk"
          }
        ],
        "gg": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "一键 Git 提交",
            "keysToSend": "{text}git add -A; git commit -a -m \"\"; git push origin (git branch --show-current);\n{left 47}"
          }
        ],
        "gt": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "狗头 🐶",
            "keysToSend": "🐶"
          }
        ],
        "i love nia": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "没错，缩写中可以包含空格，用del i love nia删掉这个示例",
            "keysToSend": "{text}我爱尼娅! \n{text}( 还 有 大 家 )"
          }
        ],
        "jt": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入箭头符号",
            "keysToSend": "{text}➤ "
          }
        ],
        "sj": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入当前时间",
            "keysToSend": "ahk-expression: Format(\"{}年{}月{}日 {}:{}\", A_YYYY, A_MM, A_DD, A_Hour, A_Min)"
          }
        ],
        "sk": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入一对「」并把光标移动中间",
            "keysToSend": "「  」\n{left 2}"
          }
        ],
        "xf": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入小括号和分号",
            "keysToSend": "();{left 2}"
          }
        ],
        "xk": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入一对 () 并把光标移到中间",
            "keysToSend": "(){left}"
          }
        ],
        "zh": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "搜索时加上 site: 选项，能让搜索引擎只搜某网站的内容，另外用 inurl: 过滤掉专栏和视频内容",
            "keysToSend": "{text} site:zhihu.com inurl:question"
          }
        ],
        "zk": [
          {
            "windowGroupID": 0,
            "actionTypeID": 6,
            "comment": "输入一对 [] 并把光标移到中间",
            "keysToSend": "[]{left}"
          }
        ]
      }
    },
    {
      "id": 4,
      "name": "Settings",
      "enable": true,
      "hotkey": "settings",
      "parentID": 0,
      "delay": 0,
      "disableAt": "",
      "hotkeys": {}
    }
  ],
  "options": {
    "mykeymapVersion": "2.0-beta33",
    "windowGroups": [
      {
        "id": -1,
        "name": "🚫 Exclude"
      },
      {
        "id": 0,
        "name": "🌎 Global"
      },
      {
        "id": 1,
        "name": "🌐 Web Browser",
        "value": "ahk_exe chrome.exe\nahk_exe msedge.exe\nahk_exe firefox.exe",
        "conditionType": 1
      },
      {
        "id": 3,
        "name": "📁 File Explorer",
        "value": "ahk_exe explorer.exe",
        "conditionType": 1
      }
    ],
    "mouse": {
      "keepMouseMode": false,
      "showTip": false,
      "tipSymbol": "🐶",
      "delay1": "0.13",
      "delay2": "0.01",
      "fastSingle": "25",
      "fastRepeat": "25",
      "slowSingle": "2",
      "slowRepeat": "2"
    },
    "scroll": {
      "delay1": "0.2",
      "delay2": "0.03",
      "onceLineCount": "1"
    },
    "commandInputSkin": {
      "backgroundColor": "#FFFFFF",
      "backgroundOpacity": "0.9",
      "borderWidth": "3",
      "borderColor": "#FFFFFF",
      "borderOpacity": "1.0",
      "borderRadius": "10",
      "cornerColor": "#000000",
      "cornerOpacity": "0.0",
      "gridlineColor": "#2843AD",
      "gridlineOpacity": "0.04",
      "keyColor": "#000000",
      "keyOpacity": "1.0",
      "hideAnimationDuration": "0.34",
      "windowYPos": "0.25",
      "windowWidth": "700",
      "windowShadowColor": "#000000",
      "windowShadowOpacity": "0.5",
      "windowShadowSize": "3.0"
    },
    "pathVariables": [
      {
        "name": "programs",
        "value": "C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\"
      }
    ],
    "startup": false,
    "language": "zh",
    "keyMapping": "",
    "keyboardLayout": "esc f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12\n` 1 2 3 4 5 6 7 8 9 0 - = backspace\ntab q w e r t y u i o p [ ] \\\ncapslock a s d f g h j k l ; ' enter\nLShift z x c v b n m , . / RShift\nLCtrl LWin LAlt space RAlt RWin RCtrl singlePress"
  }
}
```
