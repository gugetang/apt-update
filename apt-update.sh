#!/bin/bash
# 一键更新系统脚本（支持 Ubuntu/Debian/CentOS/RHEL/Fedora）

set -e

echo ">>> 检测系统类型..."
if [ -f /etc/debian_version ]; then
    echo "检测到 Debian/Ubuntu 系统，开始更新..."
    apt-get update -y
    apt-get upgrade -y
    apt-get autoremove -y
    apt-get autoclean -y

elif [ -f /etc/redhat-release ]; then
    if command -v dnf &>/dev/null; then
        echo "检测到 RHEL/CentOS/Fedora (dnf)，开始更新..."
        dnf upgrade -y
        dnf autoremove -y
    else
        echo "检测到 RHEL/CentOS (yum)，开始更新..."
        yum update -y
        yum autoremove -y
    fi
else
    echo "未知系统，请手动更新。"
    exit 1
fi

echo ">>> 系统更新完成！"

