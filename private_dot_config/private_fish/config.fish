if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    zoxide init --cmd cd fish | source
    atuin init fish | source
    starship init fish | source
end

function multicd
    set -l length (math (string length -- $argv) - 1)
    echo cd (string repeat -n $length ../)
end

abbr --add dotdot --regex '^\.\.+$' --function multicd

alias ls="lsd --color=auto"
alias ll="ls -l -g --icon=always"
alias lla="ll -a"
alias update="yay -Syu --devel"
alias d="kitten diff"
alias icat="kitten icat"
alias s="kitten ssh"
alias man="man -a"
alias cat="bat"
alias download-pacman-static="curl https://pkgbuild.com/~morganamilo/pacman-static/x86_64/bin/pacman-static --output pacman-static && chmod +x pacman-static"

# Only run this on Linux interactive shells
if status is-interactive; and test (uname) = Linux
    set SSH_PRIVATE_KEYS \
        ~/.ssh/id_rsa \
        ~/.ssh/id_ed25519 \
        ~/.ssh/webik

# Define GPG key identifiers
    set GPG_PRIVATE_KEYS
    SHELL=fish keychain --quiet --eval $SSH_PRIVATE_KEYS $GPG_PRIVATE_KEYS \
        | source
end

set PATH $PATH /home/gwen/.local/bin
set PATH $PATH /opt/gcc/gcc-arm-none-eabi-10.3-2021.10/bin
set PATH $PATH /home/gwen/.cargo/bin

direnv hook fish | source
