settitle() {
    echo -n -e "\033]0;$*\007"
}

find_dirs_not_perm_755() {
    find . ! -perm 755 -type d ! -wholename "*.git/*" -ls
}

find_files_not_perm_644() {
    find . ! -perm 644 -type f ! -wholename "*.git/*" -ls
}

find_files_with_byte_order_marks() {
    find . -type f ! -wholename "*.git*" | while read file; do
        first_3_chars=$(head -c 3 -- ${file})
        if [ "${first_3_chars}" == $'\xef\xbb\xbf' ]; then
            echo "Found BOM in: ${file}"
        fi
    done
}

rbenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(rbenv "sh-$command" "$@")";;
  *)
    command rbenv "$command" "$@";;
  esac
}

pyenv() {
    local command
    command="${1:-}"
    if [ "$#" -gt 0 ]; then
        shift
    fi

    case "$command" in
        rehash|shell)
            eval "$(pyenv "sh-$command" "$@")";;
        *)
            command pyenv "$command" "$@";;
    esac
}

mypy3() {
    echo "$(python3 --version) $(python3 -m mypy --version)"
    python3 -m mypy $@
}

mypy36() {
    echo "$(python3.6 --version) $(python3.6 -m mypy --version)"
    python3.6 -m mypy $@
}

mypy38() {
    echo "$(python3.8 --version) $(python3.8 -m mypy --version)"
    python3.8 -m mypy $@
}

mypylatest() {
    mypyp38 $@
}

flake8py3() {
    python3 -m flake8 --version
    python3 -m flake8 $@
}

flake8py36() {
    python3.6 -m flake8 --version
    python3.6 -m flake8 $@
}

flake8py38() {
    python3.8 -m flake8 --version
    python3.8 -m flake8 $@
}

flake8all() {
    flake8py36 $@
    flake8py38 $@
}
