# settings

个人开发环境配置仓库

## 目录结构

```
settings/
├── vscode/
│   ├── mac/              # macOS 版本
│   │   ├── settings.json
│   │   └── keybindings.json
│   └── win/              # Windows 版本
│       ├── settings.json
│       └── keybindings.json
├── ghostty/
│   └── config            # Ghostty 终端配置
├── install.sh            # 一键安装脚本 (macOS)
└── README.md
```

## 安装 (macOS)

```bash
git clone https://github.com/lyx-jay/settings.git ~/.settings
```

使用方式：

```bash
bash ~/.settings/install.sh              # 安装全部配置
bash ~/.settings/install.sh --ghostty    # 仅安装 Ghostty
bash ~/.settings/install.sh --vscode     # 仅安装 VSCode
```

配置文件位置：
- Ghostty: `~/.config/ghostty/config`
- VSCode: `~/Library/Application Support/Code/User/`

## Ghostty 快捷键

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
| `⌘++` / `⌘+-` | 调整字体大小