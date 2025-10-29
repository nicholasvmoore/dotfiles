source /usr/share/cachyos-fish-config/cachyos-config.fish
set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
source /usr/share/powerline/bindings/fish/powerline-setup.fish
powerline-setup

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
fish_add_path $HOME/.local/bin

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/nicholas/.lmstudio/bin
# End of LM Studio CLI section

alias vi /usr/local/bin/nvim
