#!/bin/bash
# 配置安装脚本 (macOS)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

usage() {
    echo "用法: $0 [选项]"
    echo ""
    echo "选项:"
    echo "  --ghostty    仅安装 Ghostty 配置"
    echo "  --vscode     仅安装 VSCode 配置"
    echo "  (无参数)     安装全部配置"
    exit 0
}

install_ghostty() {
    GHOSTTY_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/ghostty"
    mkdir -p "$GHOSTTY_DIR"
    cp -f "$SCRIPT_DIR/ghostty/config" "$GHOSTTY_DIR/config"
    echo "✓ Ghostty 配置已安装到 $GHOSTTY_DIR"
}

install_vscode() {
    VSCODE_DIR="$HOME/Library/Application Support/Code/User"
    if [ -d "$VSCODE_DIR" ]; then
        cp -f "$SCRIPT_DIR/vscode/mac/settings.json" "$VSCODE_DIR/settings.json"
        cp -f "$SCRIPT_DIR/vscode/mac/keybindings.json" "$VSCODE_DIR/keybindings.json"
        echo "✓ VSCode 配置已安装"
    else
        echo "⚠ VSCode 未安装，跳过 VSCode 配置"
    fi
}

# 无参数时安装全部
if [ $# -eq 0 ]; then
    install_ghostty
    install_vscode
    echo "安装完成!"
    exit 0
fi

# 解析参数
for arg in "$@"; do
    case $arg in
        --ghostty) install_ghostty ;;
        --vscode)  install_vscode ;;
        --help|-h) usage ;;
        *) echo "未知参数: $arg"; usage ;;
    esac
done

echo "安装完成!"