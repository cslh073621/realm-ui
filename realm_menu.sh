#!/bin/bash

# 检查并安装whiptail（如果尚未安装）
if ! command -v whiptail &> /dev/null; then
    echo "whiptail未安装，现在安装..."
    sudo apt-get update
    sudo apt-get install -y whiptail
    if [ $? -eq 0 ]; then
        echo "whiptail安装成功。"
    else
        echo "whiptail安装失败，请检查系统更新和软件源。"
        exit 1
    fi
fi

# 检查并安装cron（如果尚未安装）
if ! command -v cron &> /dev/null; then
    echo "cron未安装，现在安装..."
    sudo apt-get install -y cron
    if [ $? -eq 0 ]; then
        echo "cron安装成功。"
    else
        echo "cron安装失败，请检查系统更新和软件源。"
        exit 1
    fi
fi

# 定义菜单函数
function show_menu() {
    local choice

    while true; do
        clear
        echo "================ Realm管理菜单 ================"
        echo "1. 安装Realm"
        echo "2. 卸载Realm"
        echo "3. 重启Realm"
        echo "4. 查看Realm状态"
        echo "5. 退出"
        echo "6. 删除脚本"
        echo "==============================================="
        read -p "请输入你的选择 [1-6]: " choice
        case $choice in
            1) install_realm ;;
            2) uninstall_realm ;;
            3) restart_realm ;;
            4) check_status ;;
            5) exit 0 ;;
            6) delete_script ;;
            *) echo "无效的选择，请重新输入。" ;;
        esac
        read -p "按任意键继续..."
    done
}

# 安装Realm函数
function install_realm() {
    # 下载并执行Realm转发一键部署脚本
    curl -sSL https://raw.githubusercontent.com/lgwszds/realm-/main/setup_realm.sh -o setup_realm.sh
    chmod +x setup_realm.sh
    ./setup_realm.sh
    if [ $? -eq 0 ]; then
        whiptail --title "安装结果" --msgbox "Realm已成功安装并启动。" 8 78
    else
        whiptail --title "安装结果" --msgbox "安装过程中出现错误。" 8 78
    fi
}

# 卸载Realm函数
function uninstall_realm() {
    # 停止Realm服务
    sudo systemctl stop realm

    # 禁用Realm服务
    sudo systemctl disable realm

    # 删除Realm服务配置文件
    sudo rm /etc/systemd/system/realm.service

    # 重新加载systemd配置
    sudo systemctl daemon-reload

    # 删除Realm可执行文件和配置文件
    sudo rm /root/realm
    sudo rm /root/realm.toml

    # 删除下载的Realm压缩包（如果需要）
    sudo rm /root/realm.tar.gz

    # 删除定时任务中设置的重启Realm服务的条目
    (crontab -l | grep -v 'systemctl restart realm') | crontab -

    whiptail --title "卸载结果" --msgbox "Realm已成功卸载。" 8 78
}

# 重启Realm函数
function restart_realm() {
    # 执行重启命令
    sudo systemctl restart realm
    if [ $? -eq 0 ]; then
        whiptail --title "重启结果" --msgbox "Realm已成功重启。" 8 78
    else
        whiptail --title "重启结果" --msgbox "重启过程中出现错误。" 8 78
    fi
}

# 查看状态函数
function check_status() {
    # 执行查看状态命令
    sudo systemctl status realm

    # 等待用户按任意键继续
    echo "按任意键继续..."
    read -n 1 -s

    # 检查上一条命令的退出状态
    if [ $? -eq 0 ]; then
        whiptail --title "状态查询" --msgbox "Realm状态查询成功。" 8 78
    else
        whiptail --title "状态查询" --msgbox "状态查询时出现错误。" 8 78
    fi
}

# 删除脚本函数
function delete_script() {
    # 确认删除
    if whiptail --title "确认删除" --yesno "你确定要删除这个脚本和Realm吗？" 8 78; then
        # 卸载Realm
        uninstall_realm

        # 删除脚本文件
        rm "$0"
        echo "脚本和Realm已删除。"
        exit 0
    else
        echo "删除操作已取消。"
    fi
}

# 显示菜单
show_menu
