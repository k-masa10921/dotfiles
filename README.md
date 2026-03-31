# dotfiles

macOS (Apple Silicon) の開発環境設定ファイル。

## 構成

```
dotfiles/
├── .config/
│   ├── fish/config.fish    # Fish shell 設定
│   └── nvim/init.vim       # Neovim 設定
├── .gitconfig              # Git 設定
├── .gitignore_global       # グローバル gitignore
├── .tmux.conf              # tmux 設定
├── .zshrc                  # Zsh 設定 (サブシェル用)
├── .zprofile               # Zsh プロファイル
├── .latexmkrc              # LaTeX ビルド設定
├── Brewfile                # Homebrew パッケージリスト
└── setup.sh                # シンボリックリンク作成スクリプト
```

## セットアップ

```bash
# 1. リポジトリをクローン
git clone https://github.com/k-masa10921/dotfiles.git ~/dotfiles

# 2. Homebrew をインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. パッケージを一括インストール
brew bundle install --file=~/dotfiles/Brewfile

# 4. シンボリックリンクを作成
cd ~/dotfiles && bash setup.sh

# 5. anyenv で言語ランタイムをインストール
anyenv install nodenv
anyenv install phpenv
anyenv install pyenv
exec $SHELL -l
nodenv install 20.7.0 && nodenv global 20.7.0
phpenv install 8.4.19 && phpenv global 8.4.19
pyenv install 3.14.3 && pyenv global 3.14.3
```

## 主なツール

| カテゴリ | ツール |
|---------|--------|
| シェル | Fish + fzf |
| エディタ | Neovim (vim-plug + coc.nvim + telescope) |
| ターミナル | tmux |
| パッケージ管理 | Homebrew + brew-file (Brewfile 自動同期) |
| 言語管理 | anyenv (nodenv, phpenv, pyenv) |
| Git | lazygit |

## Brewfile の自動同期

`brew install` / `brew uninstall` を実行すると、brew-file により Brewfile が自動更新され GitHub に push される。

```
brew install xxx
    ↓ brew-wrap.fish がインターセプト
brew-file が Brewfile を更新
    ↓ _post_brewfile_update
git commit + push → GitHub
```
