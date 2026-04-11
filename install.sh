#!/bin/bash
# Ghostty 配置安装脚本

CONFIG_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"

mkdir -p "$CONFIG_DIR"
cp -f "$(dirname "$0")/ghostty/config" "$CONFIG_DIR/config"

echo "Ghostty 配置已安装到 $CONFIG_DIR/config"