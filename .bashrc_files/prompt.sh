_in_color() {
    echo "\e[0;$1m$2\e[m"
}

_add_colors_to_ps1() {
    for color in {1..100}; do
        export PS1="$PS1\n[$(_in_color $color "color $color")]"
    done
}

export PS1=""
export PS1="$PS1\n"
export PS1="$PS1$(_in_color 34 '\u@\h')"
export PS1="$PS1$(_in_color 37 ' | ')"
export PS1="$PS1$(_in_color 33 '\w')"
export PS1="$PS1\n"
export PS1="$PS1\\\$ "
