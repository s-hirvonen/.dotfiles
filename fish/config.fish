if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.config/fish/aliases.fish
    source ~/.secrets

    set --universal nvm_default_version v16.14.2
    set --universal nvm_default_packages yarn vscode-langservers-extracted typescript-language-server

    # oh-my-posh init fish | source
    eval "$(oh-my-posh init fish --config $(brew --prefix oh-my-posh)/themes/powerlevel10k_rainbow.omp.json)"
end
