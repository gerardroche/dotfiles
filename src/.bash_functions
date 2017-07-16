
find_dirs_not_perm_755() {
    find . ! -perm 755 -type d ! -wholename "*.git*" -ls
}

find_regular_files_not_perm_644() {
    find . ! -perm 644 -type f ! -wholename "*.git*" -ls
}

find_regular_files_with_byte_order_marks() {
    find . -type f ! -wholename "*.git*" | while read file; do
        first_3_chars=$(head -c 3 -- ${file})
        if [ "${first_3_chars}" == $'\xef\xbb\xbf' ]; then
            echo "Found BOM in: ${file}"
        fi
    done
}

internet_use() {
    lsof -P -i -n | uniq
}

internet_use_full() {
    lsof -P -i -n | cut -f 1 -d " " | uniq
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

phpcs() {
    if test -f ./vendor/bin/php-cs-fixer; then
        php -d xdebug.scream=0 ./vendor/bin/php-cs-fixer "$@"
    else
        if test ! -f ./.php_cs.dist && test ! -f ./.php_cs && test -f ~/.php_cs; then
            if test "x$1" = "xfix"; then
                php-cs-fixer "$@" --config ~/.php_cs
            else
                php-cs-fixer "$@"
            fi
        else
            php-cs-fixer "$@"
        fi
    fi
}

title() {
    echo -n -e "\033]0;$*\007"
}

versioninfo() {
    echo -n "Hostname: "
    cat /etc/hostname

    echo -n "Uname: "
    uname -a

    echo -n "Debian: "
    cat /etc/debian_version

    echo -n "Release: "
    cat /etc/lsb-release

    echo -n "Unity: "
    unity --version

    echo -n "Gnome: "
    gnome-shell --version
}

watch_app_logs() {
    tail -v -f /var/log/{apache2,mysql}/{,*}{access,error,mysql}.log ./data/logs/*.log
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

snodebug() {
    if test -f ./.debug; then
        rm ./.debug
        echo 'Debug disabled'
    else
        echo 'Debug already disabled'
    fi
}

sdebug() {
    if test ! -f ./.debug; then
        touch  ./.debug
        echo 'Debug enabled'
    else
        echo 'Debug already enabled'
    fi
}
