# インタラクティブセッションの場合のみ実行
if status is-interactive
    # インタラクティブセッション用のコマンドをここに記述

    # Homebrewの初期化
    eval (/opt/homebrew/bin/brew shellenv)  # Homebrewの環境設定を実行

    # anyenvの初期化
    fish_add_path "$HOME/.anyenv/bin"  # anyenvのバイナリディレクトリをPATHに追加
    anyenv init - fish | source

    # php-build用パスの設定 (fish_add_pathで重複排除)
    fish_add_path "/opt/homebrew/opt/tidy-html5/lib"
    fish_add_path "/opt/homebrew/opt/icu4c/bin"
    fish_add_path "/opt/homebrew/opt/openssl@3/bin"
    fish_add_path "/opt/homebrew/opt/krb5/bin"
    fish_add_path "/opt/homebrew/opt/libiconv/bin"
    fish_add_path "/opt/homebrew/opt/curl/bin"
    fish_add_path "/opt/homebrew/opt/bzip2/bin"
    fish_add_path "/opt/homebrew/opt/libxml2/bin"
    fish_add_path "/opt/homebrew/opt/bison/bin"
    fish_add_path "/opt/homebrew/opt/grep/libexec/gnubin"
    alias grep='/opt/homebrew/opt/grep/libexec/gnubin/grep'

    # ライブラリのパスを設定 (重複排除して一括設定)
    set -gx PKG_CONFIG_PATH \
        /opt/homebrew/opt/tidy-html5/lib/pkgconfig \
        /opt/homebrew/opt/openssl@3/lib/pkgconfig \
        /opt/homebrew/opt/oniguruma/lib/pkgconfig \
        /opt/homebrew/opt/libzip/lib/pkgconfig \
        /opt/homebrew/opt/libxml2/lib/pkgconfig \
        /opt/homebrew/opt/libpng/lib/pkgconfig \
        /opt/homebrew/opt/libjpeg/lib/pkgconfig \
        /opt/homebrew/opt/libedit/lib/pkgconfig \
        /opt/homebrew/opt/icu4c/lib/pkgconfig \
        /opt/homebrew/opt/krb5/lib/pkgconfig
    set -gx PHP_RPATHS \
        "/opt/homebrew/opt/zlib/lib"\
        "/opt/homebrew/opt/bzip2/lib"\
        "/opt/homebrew/opt/curl/lib"\
        "/opt/homebrew/opt/libiconv/lib"\
        "/opt/homebrew/opt/libedit/lib"
    set -gx LDFLAGS "-L/opt/homebrew/opt/icu4c/lib"
    set -gx CPPFLAGS "-I/opt/homebrew/opt/icu4c/include"
    set -gx PHP_BUILD_CONFIGURE_OPTS \
        --with-icu-dir=(brew --prefix icu4c) \
        --with-zlib-dir=(brew --prefix zlib) \
        --with-bz2=(brew --prefix bzip2) \
        --with-iconv=(brew --prefix libiconv) \
        --with-openssl=(brew --prefix openssl@3) \
        --with-tidy=(brew --prefix tidy-html5) \
        --with-external-pcre=(brew --prefix pcre2) \
        --with-zip \
        --enable-intl \
        --with-pear \
        --with-external-gd=(brew --prefix gd) \
        --with-gd=(brew --prefix gd)
end  # インタラクティブセッションの終了

# fish_preexecイベント時に履歴を保存・マージする関数を定義
function history-merge --on-event fish_preexec
    history --save  # 現在の履歴を保存
    history --merge  # セッション間の履歴をマージ
end

# BrewFile設定の読み込み
set -gx HOMEBREW_BREWFILE_APPSTORE 0  # App Store アプリの追跡を無効化 (mdlsエラー回避)
if test -f (brew --prefix)/etc/brew-wrap.fish  # BrewFileラッパーが存在するか確認
    source (brew --prefix)/etc/brew-wrap.fish  # BrewFileラッパースクリプトを読み込む
    function _post_brewfile_update  # BrewFile更新後の処理を定義
        brew file update  # BrewFileの更新を実行 (kondo_dotfiles/ → ~/dotfiles)
        git -C "$HOME/dotfiles" push origin master 2>/dev/null &  # ~/dotfiles → GitHub
    end
end
fish_add_path "$HOME/.local/bin"
