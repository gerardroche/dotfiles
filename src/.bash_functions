find_dirs_not_perm_755() {
    find . ! -perm 755 -type d ! -wholename "*.git/*" -ls
}

find_regular_files_not_perm_644() {
    find . ! -perm 644 -type f ! -wholename "*.git/*" -ls
}

find_regular_files_with_byte_order_marks() {
    find . -type f ! -wholename "*.git*" | while read file; do
        first_3_chars=$(head -c 3 -- ${file})
        if [ "${first_3_chars}" == $'\xef\xbb\xbf' ]; then
            echo "Found BOM in: ${file}"
        fi
    done
}

# MYPY #########################################################################

mypyp3() {
    echo "$(python3 --version) $(python3 -m mypy --version)" && python3 -m mypy $@
}

mypyp36() {
    echo "$(python3.6 --version) $(python3.6 -m mypy --version)" && python3.6 -m mypy $@
}

mypyp38() {
    echo "$(python3.8 --version) $(python3.8 -m mypy --version)" && python3.8 -m mypy $@
}

mypyall() {
    mypyp38 $@
}

# FLAKE8 #######################################################################

flake8p3() {
    python3 -m flake8 --version && python3 -m flake8 $@
}

flake8p36() {
    python3.6 -m flake8 --version && python3.6 -m flake8 $@
}

flake8p38() {
    python3.8 -m flake8 --version && python3.8 -m flake8 $@
}

flake8all() {
    flake8p36 $@ && p38flake8 $@
}

internet_use() {
    lsof -P -i -n | uniq
}

internet_use_full() {
    lsof -P -i -n | cut -f 1 -d " " | uniq
}

gk_default() {
    gitk --branches -n 100 --date-order
}

gka_default() {
    gitk --branches --date-order
}

gk_current() {
    cmd=gitk
    cmd+=" -n 800"
    cmd+=" --date-order"
    cmd+=" master"
    cmd+=" $(git rev-parse --abbrev-ref HEAD)"
    for remote in $(git remote); do
        for accept in origin upstream gerardroche; do
            if test "x$remote" = "x$accept"; then
                cmd+=" $remote/master"
            fi
        done
    done

    $cmd
}

gk_branches() {
    cmd=gitk
    cmd+=" -n 800"
    cmd+=" --date-order"
    cmd+=" --branches"
    cmd+=" master"
    cmd+=" $(git rev-parse --abbrev-ref HEAD)"
    for remote in $(git remote); do
        for accept in origin upstream gerardroche; do
            if test "x$remote" = "x$accept"; then
                cmd+=" $remote/master"
            fi
        done
    done

    $cmd
}

tmuxrenamewindow() {
    tmux rename-window $@
}

tmr() {
    tmuxrenamewindow $@
}

# Create a new directory and enter it
# Source: https://github.com/mathiasbynens/dotfiles
mkd() {
    mkdir -p "$@" && cd "$@"
}

new() {
    git_create_branch $@
}

phpserver() {
    local ip=localhost
    local port="${1:-4000}"
    php -S "${ip}:${port}"
}

rbenv() {
    local cmd="$1"
    if [ "$#" -gt 0 ]; then
        shift
    fi

    case "$cmd" in
        rehash|shell)
            eval "$(rbenv "sh-$cmd" "$@")";;
        *)
            command rbenv "$cmd" "$@";;
    esac
}

appconsole() {
    if test -f ./bin/appconsole; then
        cmd=./bin/appconsole
    elif test -f ./vendor/bin/appconsole; then
        cmd=./vendor/bin/appconsole
    else
        cmd=appconsole
    fi

    command "$cmd" "$@"
}

dbtasks() {
    if test -f ./bin/dbtasks; then
        cmd=./bin/dbtasks
    elif test -f ./vendor/bin/dbtasks; then
        cmd=./vendor/bin/dbtasks
    else
        cmd=dbtasks
    fi

    command "$cmd" "$@"
}

pdoc() {
    if test -f ./bin/pdoc; then
        cmd=./bin/pdoc
    elif test -f ./vendor/bin/pdoc; then
        cmd=./vendor/bin/pdoc
    else
        cmd=pdoc
    fi

    command "$cmd" "$@"
}

phptinstalldeps() {
    # dpkg -l | grep postgresql >/dev/null 2>&1 || sudo apt-get install postgresql
    # dpkg -l | grep postgresql-contrib >/dev/null 2>&1 || sudo apt-get install postgresql-contrib
    dpkg -l | grep bison >/dev/null 2>&1 || sudo apt-get install bison
    dpkg -l | grep language-pack-de >/dev/null 2>&1 || sudo apt-get install language-pack-de
    dpkg -l | grep libargon2-dev >/dev/null 2>&1 || sudo apt-get install libargon2-dev
    dpkg -l | grep libaspell-dev >/dev/null 2>&1 || sudo apt-get install libaspell-dev
    dpkg -l | grep libcurl4-openssl-dev >/dev/null 2>&1 || sudo apt-get install libcurl4-openssl-dev
    dpkg -l | grep libenchant-dev >/dev/null 2>&1 || sudo apt-get install libenchant-dev
    dpkg -l | grep libgmp-dev >/dev/null 2>&1 || sudo apt-get install libgmp-dev
    dpkg -l | grep libgssapi-krb5-2 >/dev/null 2>&1 || sudo apt-get install libgssapi-krb5-2
    dpkg -l | grep libicu-dev >/dev/null 2>&1 || sudo apt-get install libicu-dev
    dpkg -l | grep libkrb5-dev >/dev/null 2>&1 || sudo apt-get install libkrb5-dev
    dpkg -l | grep libldap2-dev >/dev/null 2>&1 || sudo apt-get install libldap2-dev
    dpkg -l | grep libonig-dev >/dev/null 2>&1 || sudo apt-get install libonig-dev
    dpkg -l | grep libpq-dev >/dev/null 2>&1 || sudo apt-get install libpq-dev
    dpkg -l | grep libpspell-dev >/dev/null 2>&1 || sudo apt-get install libpspell-dev
    dpkg -l | grep libreadline-dev >/dev/null 2>&1 || sudo apt-get install libreadline-dev
    dpkg -l | grep libsasl2-dev >/dev/null 2>&1 || sudo apt-get install libsasl2-dev
    dpkg -l | grep libsodium-dev >/dev/null 2>&1 || sudo apt-get install libsodium-dev
    dpkg -l | grep libsqlite3-dev >/dev/null 2>&1 || sudo apt-get install libsqlite3-dev
    dpkg -l | grep libtidy-dev >/dev/null 2>&1 || sudo apt-get install libtidy-dev
    dpkg -l | grep libwebp-dev >/dev/null 2>&1 || sudo apt-get install libwebp-dev
    dpkg -l | grep libxml2-dev >/dev/null 2>&1 || sudo apt-get install libxml2-dev
    dpkg -l | grep libxpm-dev >/dev/null 2>&1 || sudo apt-get install libxpm-dev
    dpkg -l | grep libxslt1-dev >/dev/null 2>&1 || sudo apt-get install libxslt1-dev
    dpkg -l | grep libzip-dev >/dev/null 2>&1 || sudo apt-get install libzip-dev
    dpkg -l | grep llvm >/dev/null 2>&1 || sudo apt-get install llvm
    dpkg -l | grep locales >/dev/null 2>&1 || sudo apt-get install locales
    dpkg -l | grep re2c >/dev/null 2>&1 || sudo apt-get install re2c
}

phptbuild() {
    source .env

    ./buildconf

    if test "x$1" = "x--minimal"; then

        ./configure \
            --disable-gd \
            --enable-cgi \
            --enable-cli \
            --enable-gcov \
            --enable-phpdbg \
            --with-zlib

    else

        ./configure \
            --disable-gd \
            --disable-sockets \
            --enable-bcmath \
            --enable-calendar \
            --enable-debug \
            --enable-exif \
            --enable-fpm \
            --enable-ftp \
            --enable-gcov \
            --enable-intl \
            --enable-mbstring \
            --enable-option-checking=fatal \
            --enable-pcntl \
            --enable-phpdbg \
            --enable-shmop \
            --enable-soap \
            --enable-sysvmsg \
            --enable-sysvsem \
            --enable-sysvshm \
            --enable-werror \
            --enable-xmlreader \
            --enable-zend-test \
            --with-bz2 \
            --with-curl \
            --with-enchant \
            --with-ffi \
            --with-freetype \
            --with-gettext \
            --with-gmp \
            --with-jpeg \
            --with-kerberos \
            --with-mysqli \
            --with-pdo-mysql \
            --with-pdo-pgsql \
            --with-pdo-sqlite \
            --with-pgsql \
            --with-pspell \
            --with-readline \
            --with-sodium \
            --with-tidy \
            --with-webp \
            --with-xpm \
            --with-xsl \
            --with-zip \
            --with-zlib \
            --without-ldap \
            --without-ldap-sasl \
            --without-mhash \
            --without-openssl \
            --without-password-argon2 \
            --without-pear

            # --with-xmlrpc \
    fi

    NO_INTERACTION=1 make -j$(nproc)
}

phptreset() {
    git clean -e "/.env*" -e "/*.sublime-project" -xdf
    source .env
    phptbuild "$@"
}

phptphp() {
    source .env
    php "$@"
}

phpt() {
    source .env
    make -j$(nproc) TEST_PHP_ARGS="-q --offline --show-diff $*" lcov-clean lcov-clean-data test
}

phptcov() {
    source .env
    NO_INTERACTION=1 make -j$(nproc) TEST_PHP_ARGS="-q --offline --show-diff $*" lcov-html gcovr-html
}

phptlcov() {
    source .env
    NO_INTERACTION=1 make -j$(nproc) lcov-html
}

phptgcovr() {
    source .env
    NO_INTERACTION=1 make -j$(nproc) gcovr-html
}

phptgcovrxml() {
    source .env
    NO_INTERACTION=1 make -j$(nproc) gcovr-xml
}

# https://askubuntu.com/questions/73443/how-to-stop-the-terminal-from-wrapping-lines
setnowrap() {
    tput rmam
}

# https://askubuntu.com/questions/73443/how-to-stop-the-terminal-from-wrapping-lines
setwrap() {
    tput smam
}

setmygitremote() {
    git_origin_url="$(git remote get-url origin 2> /dev/null || true)"

    if test -z "$git_origin_url"; then
        echo >&2 "origin remote not found"
        return
    fi

    new_origin="$(echo "$git_origin_url" |\
        grep "^https://github.com/gerardroche/" |\
        sed '
        s_https://github.com/gerardroche/_git@github.com:gerardroche/_
        '\
    )"

    if test -n "$new_origin"; then
        git remote -v
        git remote set-url origin "$new_origin"
    fi

    git remote -v
}

settitle() {
    echo -n -e "\033]0;$*\007"
}

rubyversions() {
    if command -v ruby >/dev/null 2>&1; then
        echo -n "ruby "
        ruby --version 2> /dev/null || true
        echo "  $(which ruby)"
    fi

    if command -v gem >/dev/null 2>&1; then
        echo -n "gem "
        gem --version 2> /dev/null || true
        echo "  $(which gem)"
    fi

    if command -v bundle >/dev/null 2>&1; then
        echo -n "bundle "
        bundle --version 2> /dev/null || true
        echo "  $(which bundle)"
    fi

    if command -v rails >/dev/null 2>&1; then
        echo -n "rails "
        rails --version 2> /dev/null || true
        echo "  $(which rails)"
    fi

    if command -v rake >/dev/null 2>&1; then
        echo -n "rake "
        rake --version 2> /dev/null || true
        echo "  $(which rake)"
    fi
}

appversions() {
    php --version | head -1 2> /dev/null || true

    if command -v nvm >/dev/null 2>&1; then
        echo -n "nvm "
        nvm --version 2> /dev/null || true
    fi

    if command -v npm >/dev/null 2>&1; then
        echo -n "npm "
        npm --version 2> /dev/null || true
    fi

    if command -v node >/dev/null 2>&1; then
        echo -n "node "
        node --version 2> /dev/null || true
    fi

    rubyversions
}

sysversions() {
    echo "$(uname -s) $(uname -r)"
    uname -v
    echo "$(uname -o) $(uname -m) $(uname -p) $(uname -i)"
    uname -n
    echo -n "Hostname: "
    cat /etc/hostname
    echo -n "Debian: "
    cat /etc/debian_version
    echo -n "Release: "
    cat /etc/lsb-release
    gnome-shell --version
}

projects() {
    if test -n "$PROJECTS_PATH" && test -d "$PROJECTS_PATH"; then
        for project in "$PROJECTS_PATH"/*/*; do
            test -d "$project" || continue
            echo "${project#$PROJECTS_PATH/}"
        done
    fi
}

vendors() {
    if test -n "$VENDOR_PATH" && test -d "$VENDOR_PATH"; then
        for vendor in "$VENDOR_PATH"/*/*; do
            test -d "$vendor" || continue
            echo "${vendor#$VENDOR_PATH/}"
        done
    fi
}

c() {
    if test -z "$PROJECTS_PATH"; then
        return
    fi

    if test "$#" = 0 && test "$PWD" = "$PROJECTS_PATH"; then
        return
    fi

    if test -n  "$1"; then
        cd "$PROJECTS_PATH/$1"

        return
    fi

    if [[ "$PWD" = "$PROJECTS_PATH"/* ]]; then # we are within a project; go to its root

        path="$PWD"
        projects_path_depth=
        for (( i = 1; i < 10; i++ )); do
            path="$(dirname "$path")"
            if [ "$path" == "$PROJECTS_PATH" ]; then
                projects_path_depth=$i
                break
            fi
        done

        if [ "$projects_path_depth" -eq 2 ]; then
            return
        fi

        if [ "$projects_path_depth" -gt 2 ]; then
            projects_path_depth=$(expr $projects_path_depth - 2)

            path="$PWD"
            for (( i = 0; i < $projects_path_depth; i++ )); do
                path="$(dirname "$path")"
            done

            cd "$path"

            return
        fi
    else # we are not within a project; go to projects path

        cd "$PROJECTS_PATH"
    fi
}

v() {
    cd "$VENDOR_PATH/$1"
}

wslsshadd() {
    eval $(ssh-add -s)
    ssh-add ~/.ssh/id_rsa
}
