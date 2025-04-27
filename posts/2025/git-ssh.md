---
title: Git SSH
date: 2023-06-13 17:11:00
tags:
  - Git
  - SSH
category:
  - 工具
---

## 配置用户名和邮箱

```shell
git config --global user.email "邮箱"
git config --global user.name "用户名"
```

## SSH密钥生成

```shell
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
```

## 单远程多URL配置（懒人必备）

```shell
# 初始化远程仓库
git remote add origin https://github.com/你的用户名/仓库名.git

# 添加Gitee地址
git remote set-url --add origin https://gitee.com/你的用户名/仓库名.git

# 验证配置
git remote -v

origin  https://github.com/your-username/your-repo-name.git (fetch)
origin  https://github.com/your-username/your-repo-name.git (push)
origin  https://gitee.com/your-username/your-repo-name.git (push)  # 如果设置了同步推送
gitee   https://gitee.com/your-username/your-repo-name.git (fetch)
gitee   https://gitee.com/your-username/your-repo-name.git (push)
```

## 参考

- https://blog.csdn.net/weixin_44120543/article/details/147124135
