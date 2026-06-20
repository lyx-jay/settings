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
├── nvim/                 # Neovim 配置 (NvChad)
│   ├── init.lua
│   └── lua/
│       ├── chadrc.lua
│       ├── options.lua
│       ├── mappings.lua
│       ├── configs/
│       │   ├── conform.lua
│       │   ├── lazy.lua
│       │   └── lspconfig.lua
│       └── plugins/
│           └── init.lua
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
bash ~/.settings/install.sh --nvim       # 仅安装 Neovim
```

配置文件位置：
- Ghostty: `~/.config/ghostty/config`
- VSCode: `~/Library/Application Support/Code/User/`
- Neovim: `~/.config/nvim/` (符号链接)

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
| `⌘++` / `⌘+-` | 调整字体大小 |

## Neovim 快捷键 (Leader = 空格)

### 通用

| 快捷键 | 功能 |
|--------|------|
| `;` | 进入命令模式 |
| `jk` | 退出插入模式 |

### 文件操作

| 快捷键 | 功能 |
|--------|------|
| `<leader>ff` | 搜索文件 |
| `<leader>fg` | 全局搜索内容 |
| `<leader>fb` | 查看所有 buffer |
| `<leader>fh` | 搜索帮助文档 |
| `<leader>e` | 打开/关闭文件树 |

### 窗口导航

| 快捷键 | 功能 |
|--------|------|
| `<C-h>` | 切换到左侧窗口 |
| `<C-l>` | 切换到右侧窗口 |
| `<C-j>` | 切换到下方窗口 |
| `<C-k>` | 切换到上方窗口 |

### Buffer 操作

| 快捷键 | 功能 |
|--------|------|
| `Tab` | 下一个 buffer |
| `S-Tab` | 上一个 buffer |
| `<leader>x` | 关闭当前 buffer |

### 代码操作

| 快捷键 | 功能 |
|--------|------|
| `<leader>fm` | 格式化文件 |
| `<leader>z` | 切换折叠/展开 |

### 终端

| 快捷键 | 功能 |
|--------|------|
| `<leader>t` | 打开/关闭浮动终端 |
| `<C-x>` | 退出终端模式 |
