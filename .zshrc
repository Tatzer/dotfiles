# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PATH=~/bin:/usr/local/bin:$PATH:$HOME/.npm-packages/bin
PZ_PLUGIN_HOME=~/.config/zsh/plugins/
ZSH=~/pz

# get PZ if you haven't already
[[ -d ~/pz ]] ||
  git clone https://github.com/mattmc3/pz.git ~/pz
source ~/pz/pz.zsh

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
setopt autocd

# source regular plugins
# pz source mafredri/zsh-async
pz source zsh-users/zsh-autosuggestions
pz source zsh-users/zsh-completions

pz prompt -a ohmyzsh/ohmyzsh themes/agnoster
pz prompt romkatv/powerlevel10k

# always source syntax highlighting plugin last
pz source zsh-users/zsh-syntax-highlighting
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HYPHEN_INSENSITIVE="true"

alias ls="ls -Al"
alias zshconfig="nano ~/.zshrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
