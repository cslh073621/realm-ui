
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
为了简化用户的操作流程，您可以提供一个一键指令，该指令将自动完成下载脚本、赋予执行权限以及运行脚本的所有步骤。以下是一个示例命令，您可以将其包含在自述文件中：


## 一键安装与执行

如果您希望一次性执行所有安装和执行步骤，可以使用以下一键指令：

```bash
sudo apt-get update && sudo apt-get upgrade -y && curl -sSL https://raw.githubusercontent.com/lgwszds/realm-ui/main/realm_menu.sh -o realm_menu.sh && chmod +x realm_menu.sh && ./realm_menu.sh
```

或者使用wget：

```bash
sudo apt-get update && sudo apt-get upgrade -y && wget -qO- https://raw.githubusercontent.com/lgwszds/realm-ui/main/realm_menu.sh -o realm_menu.sh && chmod +x realm_menu.sh && ./realm_menu.sh
```

这些命令将在执行脚本之前自动更新系统。请根据您的实际需求选择合适的一键指令。
