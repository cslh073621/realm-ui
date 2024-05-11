
# Realm管理脚本

本项目提供了一个用户友好的菜单界面脚本，用于简化Realm服务的管理过程。通过简单的菜单选择，用户可以轻松地执行安装、卸载、重启和状态检查等操作。

## 功能

- **安装Realm**：自动下载并执行Realm转发一键部署脚本，完成Realm服务的安装和配置。
- **卸载Realm**：彻底移除Realm服务及其相关文件和定时任务。
- **重启Realm**：重新启动Realm服务以应用任何更改。
- **查看Realm状态**：检查Realm服务的当前运行状态。

## 使用前须知

- 请确保您已经充分了解脚本的功能和潜在风险。
- 使用本脚本前，请备份重要数据。
- 本脚本仅供学习和测试使用，请勿用于非法用途。

## 系统要求

- 支持的Linux发行版：Ubuntu/Debian
- 需要具备sudo权限的用户

## 安装步骤

1. **更新系统**：在运行脚本之前，请确保您的系统是最新的。
   ```bash
   sudo apt-get update && sudo apt-get upgrade
   ```

2. **下载脚本**：
   - 使用curl下载
     ```bash
     curl -o realm_menu.sh https://raw.githubusercontent.com/lgwszds/realm-ui/main/realm_menu.sh
     ```
   - 使用wget下载
     ```bash
     wget -O realm_menu.sh https://raw.githubusercontent.com/lgwszds/realm-ui/main/realm_menu.sh
     ```

3. **赋予脚本执行权限**：
   ```bash
   chmod +x realm_menu.sh
   ```

4. **运行脚本**：
   ```bash
   ./realm_menu.sh
   ```

## 注意事项

- 脚本运行过程中，请勿关闭终端。
