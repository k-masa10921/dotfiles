ARCH=$(uname -m)
# homebrew
if [[ $ARCH == arm64 ]]; then
	eval $(/opt/homebrew/bin/brew shellenv)
elif [[ $ARCH == x86_64 ]]; then
	eval $(/usr/local/bin/brew shellenv)
fi
# PATH 
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"
export PATH="/opt/homebrew/opt/bzip2/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/libiconv/bin:$PATH"
export PATH="/opt/homebrew/opt/krb5/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/tidy-html5/lib:$PATH"
# PKG_CONFIG_PATH 
export PKG_CONFIG_PATH="/opt/homebrew/opt/krb5/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libedit/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libjpeg/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpng/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libxml2/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libzip/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/oniguruma/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/tidy-html5/lib/pkgconfig:$PKG_CONFIG_PATH"
# PHP_RPATHS 
export PHP_RPATHS="/opt/homebrew/opt/zlib/lib /opt/homebrew/opt/bzip2/lib /opt/homebrew/opt/curl/lib /opt/homebrew/opt/libiconv/lib /opt/homebrew/opt/libedit/lib"
# PHP_BUILD_CONFIGURE_OPTS
export PHP_BUILD_CONFIGURE_OPTS="--with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv) --with-tidy=$(brew --prefix tidy-html5) --with-external-pcre=$(brew --prefix pcre2) --with-zip --enable-intl --with-pear"
# laravel installer
export PATH=$HOME/.composer/vendor/bin:$PATH
#anyenv
eval "$(anyenv init -)"
# curl
export PATH=/opt/homebrew/opt/curl/bin:$PATH

# php
export PATH="/opt/homebrew/opt/php@7.4/bin:$PATH"
export PATH="/opt/homebrew/opt/php@7.4/sbin:$PATH"

