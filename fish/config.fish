if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.config/fish/aliases.fish
    source ~/.secrets

    set --universal nvm_default_version latest
    set --universal nvm_default_packages yarn prettier vscode-langservers-extracted typescript-language-server @fsouza/prettierd eslint_d eslint-language-server typescript
    nvm use $nvm_default_version

    # PATH
    fish_add_path ~/.dotnet/tools

    # oh-my-posh init fish | source
    # eval "$(oh-my-posh init fish --config $(brew --prefix oh-my-posh)/themes/powerlevel10k_rainbow.omp.json)"
    eval "$(oh-my-posh init fish --config ~/.dotfiles/fish/themes/my.omp.json)"
end

# pnpm
set -gx PNPM_HOME "/Users/samuli.hirvonen/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
