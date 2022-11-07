# @author     Yassine Rodani <yassine.rodani@gmail.com>
# @license    https://opensource.org/licenses/MIT

# My custom zsh configuration file

# General aliases
alias cl="clear -x "
alias hist="history -c "
alias zsh="code ~/.zshrc"
alias yassine="open https://yassine-rodani.info"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Setting permanent environment variables
export ZSH="$HOME/.oh-my-zsh"
# Docker ps narrow format
export FORMAT="ID\t{{.ID}}\nNAME\t{{.Names}}\nImage\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom plugins
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search git-open)

source $ZSH/oh-my-zsh.sh

# Conda settings
# export PATH="/Users/kheey/miniforge3/bin:$PATH"  # commented out by conda initialize
__conda_setup="$('/Users/kheey/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kheey/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/kheey/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kheey/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup