---
date: 2025-04-25
title: karabinner-element 配置
category: 配置
tags:
  - mac
  - keymap
  - setting
description: mac 快捷键 修改光标为 vim 操作
---

# karabinner-element

## 修改文件的所在位置

~/.config/karabiner/karabiner.json 文件

```json
{
  "machine_specific": {
    "krbn-empty-machine-identifier": {
      "enable_multitouch_extension": true
    }
  },
  "profiles": [
    {
      "complex_modifications": {
        "rules": [
          {
            "description": "Caps Lock → Hyper Key (⌃⌥⇧⌘) | Escape if alone | Use fn + caps lock to enable caps lock",
            "manipulators": [
              {
                "from": { "key_code": "caps_lock" },
                "to": [
                  {
                    "key_code": "left_command",
                    "modifiers": ["left_control", "left_option"]
                  }
                ],
                "to_if_alone": [{ "key_code": "escape" }],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "h",
                  "modifiers": {
                    "mandatory": [
                      "left_command",
                      "left_control",
                      "left_option"
                    ],
                    "optional": ["any"]
                  }
                },
                "to": [{ "key_code": "left_arrow" }],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "j",
                  "modifiers": {
                    "mandatory": [
                      "left_command",
                      "left_control",
                      "left_option"
                    ],
                    "optional": ["any"]
                  }
                },
                "to": [{ "key_code": "down_arrow" }],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "k",
                  "modifiers": {
                    "mandatory": [
                      "left_command",
                      "left_control",
                      "left_option"
                    ],
                    "optional": ["any"]
                  }
                },
                "to": [{ "key_code": "up_arrow" }],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "l",
                  "modifiers": {
                    "mandatory": [
                      "left_command",
                      "left_control",
                      "left_option"
                    ],
                    "optional": ["any"]
                  }
                },
                "to": [{ "key_code": "right_arrow" }],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "d",
                  "modifiers": {
                    "mandatory": [
                      "left_command",
                      "left_control",
                      "left_option"
                    ],
                    "optional": ["any"]
                  }
                },
                "to": [{ "key_code": "delete_or_backspace" }],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "1",
                  "modifiers": {
                    "mandatory": ["left_command"]
                  }
                },
                "to": [
                  {
                    "key_code": "tab",
                    "modifiers": ["left_control", "left_shift"]
                  }
                ],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "2",
                  "modifiers": {
                    "mandatory": ["left_command"]
                  }
                },
                "to": [
                  {
                    "key_code": "tab",
                    "modifiers": ["left_control"]
                  }
                ],
                "type": "basic"
              },

              {
                "from": {
                  "key_code": "f",
                  "modifiers": {
                    "mandatory": ["left_command", "left_control", "left_option"]
                  }
                },
                "to": [
                  {
                    "key_code": "f",
                    "modifiers": ["left_command"]
                  }
                ],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "z",
                  "modifiers": {
                    "mandatory": ["left_command", "left_control", "left_option"]
                  }
                },
                "to": [
                  {
                    "key_code": "z",
                    "modifiers": ["left_command"]
                  }
                ],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "p",
                  "modifiers": {
                    "mandatory": ["left_command", "left_control", "left_option"]
                  }
                },
                "to": [
                  {
                    "key_code": "p",
                    "modifiers": ["left_command"]
                  }
                ],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "c",
                  "modifiers": {
                    "mandatory": ["left_command", "left_control", "left_option"]
                  }
                },
                "to": [
                  {
                    "key_code": "c",
                    "modifiers": ["left_command"]
                  }
                ],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "v",
                  "modifiers": {
                    "mandatory": ["left_command", "left_control", "left_option"]
                  }
                },
                "to": [
                  {
                    "key_code": "v",
                    "modifiers": ["left_command"]
                  }
                ],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "t",
                  "modifiers": {
                    "mandatory": ["left_command", "left_control", "left_option"]
                  }
                },
                "to": [
                  {
                    "key_code": "t",
                    "modifiers": ["left_command"]
                  }
                ],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "s",
                  "modifiers": {
                    "mandatory": ["left_command", "left_control", "left_option"]
                  }
                },
                "to": [
                  {
                    "key_code": "s",
                    "modifiers": ["left_command"]
                  }
                ],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "w",
                  "modifiers": {
                    "mandatory": ["left_command", "left_control", "left_option"]
                  }
                },
                "to": [
                  {
                    "key_code": "w",
                    "modifiers": ["left_command"]
                  }
                ],
                "type": "basic"
              },
              {
                "from": {
                  "key_code": "q",
                  "modifiers": {
                    "mandatory": ["left_command", "left_control", "left_option"]
                  }
                },
                "to": [
                  {
                    "key_code": "q",
                    "modifiers": ["left_command"]
                  }
                ],
                "type": "basic"
              }
            ]
          }
        ]
      },
      "devices": [
        {
          "identifiers": {
            "is_keyboard": true,
            "is_pointing_device": true,
            "product_id": 832,
            "vendor_id": 13364
          },
          "ignore": false,
          "manipulate_caps_lock_led": false
        },
        {
          "identifiers": {
            "is_keyboard": true,
            "product_id": 64515,
            "vendor_id": 13652
          },
          "ignore": true
        },
        {
          "identifiers": {
            "is_keyboard": true,
            "product_id": 832,
            "vendor_id": 13364
          },
          "ignore": true
        }
      ],
      "name": "Default profile",
      "selected": true,
      "virtual_hid_keyboard": { "keyboard_type_v2": "ansi" }
    }
  ]
}``
