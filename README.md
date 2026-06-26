# settings

个人开发环境配置仓库

## 目录结构

```
settings/
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
├── vscode/
│   ├── mac/              # macOS 版本
│   │   ├── settings.json
│   │   └── keybindings.json
│   └── win/              # Windows 版本
│       ├── settings.json
│       └── keybindings.json
├── zsh/                  # Zsh 配置
│   ├── .zshrc            # Zsh 主配置
│   └── .bash_git         # Git 别名
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
bash ~/.settings/install.sh --zsh        # 仅安装 Zsh
```

配置文件位置：
- Ghostty: `~/.config/ghostty/config`
- VSCode: `~/Library/Application Support/Code/User/`
- Neovim: `~/.config/nvim/` (符号链接)
- Zsh: `~/.zshrc`, `~/.bash_git`

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

### 搜索

| 快捷键 | 功能 |
|--------|------|
| `<leader>sg` | 全局搜索 |
| `<leader>sw` | 搜索光标下的单词 |
| `Ctrl + 鼠标左键` | 点击单词搜索 |

### 终端

| 快捷键 | 功能 |
|--------|------|
| `<leader>t` | 打开/关闭浮动终端 |
| `<C-x>` | 退出终端模式 |

### Git

| 快捷键 | 功能 |
|--------|------|
| `<leader>gg` | 打开 Lazygit |

### OpenCode (AI 编码助手)

| 快捷键 | 功能 |
|--------|------|
| `<leader>oa` | 向 OpenCode 提问 |
| `<leader>os` | 打开 OpenCode 选择菜单 |
| `Ctrl + .` | 切换 OpenCode 侧边栏 |

## Zsh Git 别名

| 别名 | 命令 |
|------|------|
| `gi` | `git init` |
| `gst` | `git status` |
| `gbls` | `git branch -a` |
| `glog` | `git log` |
| `gpull` | `git pull` |
| `gpush` | `git push` |
| `gpushsu` | `git push --set-upstream origin` |
| `gup` | `git remote update` |
| `gss` | `git stash save` |
| `gsp` | `git stash pop` |
| `gadd` | `git add` |
| `gunst` | `git reset HEAD --` |
| `gcomm` | `git commit -m` |
| `gamend` | `git commit --amend` |
| `gbr` | `git checkout -b` |
| `gbrdel` | `git branch -d` |
| `gco` | `git checkout` |
| `grev` | `git checkout --` |
| `gclone` | `git clone` |
| `gmm` | `git merge master` |

## 依赖

使用前需要安装以下依赖：

```bash
# macOS
brew install ripgrep lazygit

# Ubuntu/Debian
sudo apt install ripgrep
sudo add-apt-repository ppa:lazygit-team/release
sudo apt update && sudo apt install lazygit
```

| 依赖 | 用途 |
|------|------|
| [ripgrep](https://github.com/BurntSushi/ripgrep) | 全局搜索（snacks.nvim 依赖） |
| [lazygit](https://github.com/jesseduffield/lazygit) | Git TUI 工具 |
| [opencode](https://opencode.ai/) | AI 编码助手（可选） |
