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
    echo "  --nvim       仅安装 Neovim 配置"
    echo "  --zsh        仅安装 Zsh 配置"
    echo "  --deps       仅安装依赖"
    echo "  (无参数)     安装全部配置"
    exit 0
}

install_deps() {
    echo "检查依赖..."
    if ! command -v rg &> /dev/null; then
        echo "安装 ripgrep..."
        brew install ripgrep
    else
        echo "✓ ripgrep 已安装"
    fi
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

install_nvim() {
    NVIM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
    if [ -d "$NVIM_DIR" ]; then
        echo "⚠ Neovim 配置目录已存在: $NVIM_DIR"
        echo "  跳过安装，如需覆盖请手动删除后重试"
    else
        ln -sf "$SCRIPT_DIR/nvim" "$NVIM_DIR"
        echo "✓ Neovim 配置已链接到 $NVIM_DIR"
    fi
}

install_zsh() {
    cp -f "$SCRIPT_DIR/zsh/.zshrc" "$HOME/.zshrc"
    cp -f "$SCRIPT_DIR/zsh/.bash_git" "$HOME/.bash_git"
    echo "✓ Zsh 配置已安装"
}

# 无参数时安装全部
if [ $# -eq 0 ]; then
    install_deps
    install_ghostty
    install_vscode
    install_nvim
    install_zsh
    echo "安装完成!"
    exit 0
fi

# 解析参数
for arg in "$@"; do
    case $arg in
        --deps)    install_deps ;;
        --ghostty) install_ghostty ;;
        --vscode)  install_vscode ;;
        --nvim)    install_nvim ;;
        --zsh)     install_zsh ;;
        --help|-h) usage ;;
        *) echo "未知参数: $arg"; usage ;;
    esac
done

echo "安装完成!"