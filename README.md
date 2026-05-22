# SSR-Bash-Python

[![Build Status](https://travis-ci.org/Readour/AR-B-P-B.svg?branch=master)](https://travis-ci.org/Readour/AR-B-P-B)

基于 ShadowsocksR 官方 mujson 版本的多用户管理脚本，提供 Shell 交互式面板，方便快捷地管理 SSR 服务端。

> 此版本为原项目（作者已停止维护）的最终稳定版魔改而来，修复了远端仓库失效等问题，仅供研究参考使用。

---

## 目录

- [系统支持](#系统支持)
- [功能特性](#功能特性)
- [快速安装](#快速安装)
- [使用指南](#使用指南)
  - [主菜单](#主菜单)
  - [服务器控制](#服务器控制)
  - [用户管理](#用户管理)
  - [流量管理](#流量管理)
  - [程序管理](#程序管理)
- [卸载](#卸载)
- [命令速查](#命令速查)
- [注意事项](#注意事项)
- [许可证](#许可证)

---

## 系统支持

| 系统 | 版本 |
|------|------|
| Ubuntu | 14 / 16 |
| Debian | 7 / 8 |
| CentOS | 6 / 7 |
| Arch Linux | 最新版 |
| Deepin | 全系 |

---

## 功能特性

### 服务端管理
- 全自动无人值守安装，一键部署 SSR 服务端
- 一键启动 / 停止 / 重启 SSR 服务
- 自动配置 iptables 防火墙规则
- 支持设置服务端开机自启
- 内置 DNS 配置修改

### 用户管理
- 一键添加用户（使用最优配置，傻瓜式操作）
- 手动添加 / 删除 / 修改用户
- 支持设置用户端口、密码、加密方式、协议、混淆等参数
- 支持对每个用户做流量限制和带宽限制
- 支持对每个用户设置连接数限制
- 支持设置用户账号有效期，到期自动删除
- 支持 IP 黑名单功能，可通过端口查询后直接封禁 IP
- 支持用户二维码生成

### 流量与监控
- 自动统计每个端口的流量使用情况
- 支持全局流量限制
- 内置服务器巡检功能，故障自动重启服务
- 可配置的定时任务自动管理

### WEB 面板
- 支持开启用户自助 WEB 面板
- 前端基于 CGI 实现，轻量快速
- 用户可自行查看流量和连接信息

### 其他
- 自动安装 Libsodium 库，支持 Chacha20 等加密方式
- 配置备份与还原，迁移服务器只需还原配置
- 抓取日志工具，方便排查问题
- 支持 BBR / 锐速 / LotServer 一键构建（实验性功能）

---

## 快速安装

### 在线安装（推荐）

使用 root 用户执行以下命令：

```bash
# 安装稳定版
wget -q -N --no-check-certificate https://raw.githubusercontent.com/brucezzyuan/SSR-Bash-Python/master/install.sh && bash install.sh
```

```bash
# 安装/更新到最新开发版（支持新特性）
wget -q -N --no-check-certificate https://raw.githubusercontent.com/brucezzyuan/SSR-Bash-Python/master/install.sh && bash install.sh develop
```

### 离线安装

如果网络环境不佳，可先下载整个项目到服务器：

```bash
git clone https://github.com/brucezzyuan/SSR-Bash-Python.git
cd SSR-Bash-Python
bash install.sh
```

> **注意**：安装过程需要 root 权限。脚本会自动安装依赖（Python、Git、pip 等）、编译安装 Libsodium、配置 SSR 运行环境。安装完成后输入 `ssr` 即可进入管理面板。

### 安装日志收集

```bash
bash install.sh log
```

---

## 使用指南

安装完成后，在终端输入 `ssr` 即可进入管理面板。

### 主菜单

```
================ SSR管理面板 ================
输入数字选择功能：

1. 服务器控制
2. 用户管理
3. 全局流量管理
4. 实验性功能
5. 程序管理
6. 一键添加用户（使用最优配置）
0. 退出程序
```

### 服务器控制

进入服务器控制菜单后，可进行以下操作：

| 选项 | 功能 | 说明 |
|------|------|------|
| 1 | 启动服务 | 启动 ShadowsocksR 服务 |
| 2 | 停止服务 | 停止 ShadowsocksR 服务 |
| 3 | 重启服务 | 重启 ShadowsocksR 服务 |
| 4 | 查看日志 | 实时查看 SSR 运行日志 |
| 5 | 运行状态 | 查看 SSR 进程状态 |
| 6 | 修改 DNS | 修改服务器的 DNS 配置 |
| 7 | 开启用户 WEB 面板 | 启动 CGI Web 面板，用户可自助查询 |
| 8 | 关闭用户 WEB 面板 | 关闭用户 Web 面板 |
| 9 | 开/关服务端开机启动 | 设置 SSR 随系统自动启动 |
| 10 | 检测服务器可用性 | 运行服务器健康巡检 |

#### 开启 WEB 面板

选择选项 `7` 后，输入自定义端口号，系统将启动一个轻量级的 Web 服务。用户可以访问 `http://服务器IP:端口` 查看自己的流量和连接信息。

### 用户管理

进入用户管理菜单后，可进行以下操作：

| 选项 | 功能 | 说明 |
|------|------|------|
| 1 | 一键添加用户 | 自动分配端口和最优配置，一步完成 |
| 2 | 添加用户 | 手动设置端口、密码、加密方式等所有参数 |
| 3 | 删除用户 | 删除指定用户及其端口 |
| 4 | 修改用户 | 修改已有用户的各项配置 |
| 5 | 显示用户流量信息 | 按用户名或端口查询流量详情 |
| 6 | 显示用户名端口信息 | 列出所有用户及其端口 |

#### 添加用户的详细参数

手动添加用户时，可以配置以下参数：

- **端口**：用户连接端口（不可重复）
- **密码**：用户连接密码
- **加密方式**：如 aes-256-cfb、chacha20、chacha20-ietf 等
- **协议**：如 origin、auth_sha1_v4、auth_aes128_md5、auth_chain_a 等
- **混淆**：如 plain、http_simple、tls1.2_ticket_auth 等
- **流量限制**：每个月的总流量上限（GB）
- **带宽限制**：端口最大速度
- **连接数限制**：同时连接数上限
- **有效期**：账号到期日期，到期自动删除

### 流量管理

| 选项 | 功能 |
|------|------|
| 1 | 清除单个用户流量 |
| 2 | 清除全部用户流量 |
| 3 | 设置所有用户流量限制 |
| 4 | 清除所有用户流量限制 |
| 5 | 设置单个用户流量限制 |
| 6 | 查看所有用户流量 |

### 实验性功能

| 功能 | 说明 |
|------|------|
| BBR/锐速加速 | 一键安装 TCP 加速模块 |
| 服务器自检 | 配置自动巡检，故障时重启服务 |
| ss-panel 对接 | 一键构建 ss-panel-V3-mod 前端后端 |

### 程序管理

| 选项 | 功能 |
|------|------|
| 1 | 覆盖安装 SSR-Bash |
| 2 | 修改 SSR 配置文件 |
| 3 | 查看 SSR 配置 |
| 4 | 查看连接信息 |
| 5 | 更新 SSR |
| 6 | 更新 Libsodium |
| 7 | 查看配置信息 |
| 8 | 配置服务器巡检 |

---

## 卸载

```bash
bash install.sh uninstall
```

卸载操作会：
1. 删除所有 iptables 规则
2. 删除 SSR 程序文件（`/usr/local/shadowsocksr`）
3. 删除管理脚本（`/usr/local/bin/ssr` 和 `/usr/local/SSR-Bash-Python`）
4. 清理定时任务和开机启动配置

---

## 命令速查

| 命令 | 说明 |
|------|------|
| `ssr` | 进入管理面板 |
| `bash install.sh` | 安装/更新 SSR-Bash |
| `bash install.sh develop` | 安装/更新开发版 |
| `bash install.sh uninstall` | 卸载 SSR-Bash |
| `bash install.sh log` | 抓取日志 |
| `bash self-check.sh` | 运行自检脚本 |

---

## 注意事项

1. **root 权限**：安装和运行管理面板需要 root 权限。
2. **防火墙**：脚本会自动配置 iptables 规则，确保端口开放。
3. **数据安全**：所有代码完全开源，二维码通过本地生成，不会上传任何信息。
4. **停止维护说明**：原作者已停止对此脚本的维护。此版本为最终稳定版的魔改版本，修复了原仓库域名失效等问题，但不再加入新功能。
5. **仅供研究**：请遵守当地法律法规，合理使用。
6. **谨慎使用**：不喜勿喷，谨慎使用，仅供研究！

### 客户端下载

| 平台 | 下载 |
|------|------|
| Android | [Shadowsocksr-android](https://github.com/shadowsocksrr/shadowsocksr-latest-bin-backup/raw/master/Shadowsocksr-android-3.4.0.5.apk) |
| Windows | [ShadowsocksR-Csharp](https://github.com/Readour/ShadowsocksR-Csharp/releases/download/4.7.0/ShadowsocksR-4.7.0-win.CONCISE.7z) |
| macOS | [ShadowsocksX-NG-R](https://github.com/qinyuhang/ShadowsocksX-NG-R/releases/download/1.4.3-R8/ShadowsocksX-NG-R8.dmg) |
| Linux | [Shadowsocks-Qt5](https://github.com/shadowsocks/shadowsocks-qt5/releases/download/v2.9.0/Shadowsocks-Qt5-x86_64.AppImage) |
| iOS | [Shadowrocket](https://github.com/Readour/breakwa11.github.io/raw/master/download/Shadowrocket%202.1.14.ipa) |
| OpenWrt/LEDE | [openwrt-shadowsocksR-libev-full](https://github.com/bettermanbao/openwrt-shadowsocksR-libev-full/releases) |

---

## 许可证

本项目基于开源协议发布，请遵守相关法律法规使用。