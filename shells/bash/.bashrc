[[ $- != *i* ]] && return

PS1="\\[\\e[01;34m\\][\\[\\e[0m\\]\\[\\e[00;32m\\]\\w\\[\\e[0m\\]\\[\\e[01;34m\\]]\
\\[\\e[0;34m\\]:\\[\\e[0m\\]\\[\\e[1;37m\\]\\$\\[\\e[0m\\]\\[\\e[00;37m\\] \\[\\e[0m\\]"
PS2='> '
PS3='> '
PS4='+ '

case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;termux: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

command_not_found_handle() {
    "$PREFIX/libexec/termux/command-not-found" "$1"
}

if [[ -x "$PREFIX/bin/dircolors" ]] && [[ -f "$PREFIX/etc/dircolors.conf" ]]; then
    eval "$(dircolors -b $PREFIX/etc/dircolors.conf)"
fi

[[ -f $HOME/.functions ]] && . $HOME/.functions
[[ -f $HOME/.variables ]] && . $HOME/.variables
