# settings

This is my vscode settings including theme, extensions, keyboard shortcuts...

- [vscode-mac](https://github.com/lyx-jay/settings/blob/main/vscode-mac.json)
- [vscode-mac-key](https://github.com/lyx-jay/settings/blob/main/vscode-mac-key.json)
- [vscode-win](https://github.com/lyx-jay/settings/blob/main/vscode-win.json)
- [vscode-win-key](https://github.com/lyx-jay/settings/blob/main/vscode-win-key.json)

## 一键安装 (macOS)

```bash
curl -sL https://raw.githubusercontent.com/lyx-jay/settings/main/install.sh | bash
```

或手动安装：

```bash
git clone https://github.com/lyx-jay/settings.git ~/.settings && cp ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config

## Ghostty 配置说明

配置文件位于 `ghostty/config`，主要快捷键：

| 快捷键 | 功能 |
|--------|------|
| `⌘+m` | 切换快速终端 |
| `⌘+;` | 新建垂直分屏 |
| `⌘+d` | 新建水平分屏 |
| `⌘+w` | 关闭当前分屏/标签 |
| `⌘+]` / `⌘+[` | 切换分屏 |
| `⌘+t` | 新建标签页 |
| `⌘+n` | 新建窗口 |
| `⌘+⇧+数字` | 切换标签页 |
| `⌘+k` | 清屏 |
| `⌘+f` | 搜索 |
| `⌘++` / `⌘+-` | 调整字体大小 |
