if status is-interactive
    # Commands to run in interactive sessions can go here
    source ~/.config/fish/aliases.fish
    source ~/.secrets

    set --universal nvm_default_version latest
    set --universal nvm_default_packages yarn prettier vscode-langservers-extracted typescript-language-server @fsouza/prettierd eslint_d eslint-language-server typescript
    # nvm use $nvm_default_version

    # PATH
    fish_add_path ~/.dotnet/tools

    # oh-my-posh init fish | source
    # eval "$(oh-my-posh init fish --config $(brew --prefix oh-my-posh)/themes/powerlevel10k_rainbow.omp.json)"
    eval "$(oh-my-posh init fish --config ~/.dotfiles/fish/themes/my.omp.json)"
end

# pnpm
set -gx PNPM_HOME /Users/shirvonen/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

fish_add_path /Users/samulihirvonen/Library/pnpm
# pnpm end

# .NET
set --universal DOTNET_ROOT $HOME/dotnet
fish_add_path /Users/samulihirvonen/dotnet

# Rust
fish_add_path /Users/samulihirvonen/.cargo/bin

set --universal LOCAL_CHROMIUM_PATH "/Users/shirvonen/chrome/mac_arm-126.0.6478.61/chrome-mac-arm64/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing"
