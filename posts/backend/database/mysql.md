---
title: 创建 mysql
description: 创建 mysql
date: 2025-10-13
tags:
  - mysql
category: database
---

brew install mysql@8.0

> **`A mysqld process already exists`**

这表示：**MySQL 服务进程（mysqld）已经在运行，不能再启动一个新的实例。**

---

### 🔍 错误原因

你在终端中执行了类似这样的命令：

```bash
mysqld_safe --skip-grant-tables --skip-networking &
```

这个命令的目的是在**跳过权限验证和网络连接**的情况下启动 MySQL，常用于重置 root 密码或紧急修复。

但系统提示：

> `A mysqld process already exists`

说明当前系统中**已经有一个 MySQL 服务正在运行**，所以 `mysqld_safe` 拒绝再启动一个实例，避免冲突。

---

### ✅ 解决方案

#### ✅ 方法一：先停止现有 MySQL 服务，再启动

1. **停止当前运行的 MySQL 服务：**

   ```bash
   # 如果你是用 Homebrew 安装的 MySQL：
   brew services stop mysql

   # 或者直接 kill 进程（不推荐除非你知道自己在做什么）：
   sudo pkill mysqld
   ```

2. **然后再启动你的命令：**

   ```bash
   mysqld_safe --skip-grant-tables --skip-networking &
   ```

---

#### ✅ 方法二：如果你只是想“重置密码”，可以改用更安全的方式

> ⚠️ 注意：`--skip-grant-tables` 会绕过所有权限检查，**仅用于紧急恢复**，请勿在生产环境使用！

更好的做法是：

1. 停止 MySQL：

   ```bash
   brew services stop mysql
   ```

2. 启动 MySQL 并跳过权限：

   ```bash
   sudo mysqld_safe --skip-grant-tables --skip-networking &
   ```

3. 连接 MySQL：

   ```bash
   mysql -u root
   ```

4. 重置密码（MySQL 5.7+ 语法）：

   ```sql
   FLUSH PRIVILEGES;
   ALTER USER 'root'@'localhost' IDENTIFIED BY 'admin';
   EXIT;
   ```

5. 杀掉临时进程并重启正常服务：

   ```bash
   sudo pkill mysqld
   brew services start mysql
   brew services start mysql@8.0
   ```

---

### 📝 补充说明

- 日志路径 `/opt/homebrew/var/mysql/ws-Mac-mini.local.err` 是 Homebrew 安装的 MySQL 默认日志位置。
- 你看到的 `[2] + exit 1` 表示该后台任务（`mysqld_safe ... &`）因错误退出，返回码为 1。

---

### ✅ 总结

你遇到的问题是因为**MySQL 已经在运行**，而你尝试再次启动它。解决方法很简单：

> ✅ 先停止现有 MySQL → 再执行你的 `mysqld_safe` 命令 → 完成后记得重启正常服务。

---

如需进一步帮助（比如不知道怎么停服务、或者不知道 MySQL 是怎么启动的），可以贴出：

```bash
ps aux | grep mysqld
brew services list | grep mysql
```

lazysql
mysql://root:admin@localhost:3306

我可以帮你精准定位问题 😊
