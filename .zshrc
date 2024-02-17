if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.local/bin":$PATH
export PATH=$PATH:~/lua-language-server/bin     #NOTE: Lua
export PATH=$PATH:~/.cargo/bin:$PATH            #NOTE: Cargo
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=0  #NOTE: Dotnet
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk   #NOTE: Java

#NOTE:============= [ Pyenv ] ===================
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#NOTE:============ [ Android ] =================
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/tools/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:~/android-studio/bin
export PATH=$PATH:/opt/gradle/gradle-7.6.4/bin


#NOTE: NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#NOTE:============ [ Alias ] ==================
alias g lg="lazygit"
alias luamake=~/lua-language-server/3rd/luamake/luamake
alias medsoft="cd ~/medgrupo/voyagers/Medsoft-Pro-Desktop/medsoft-pro-angular-ts && nvm use 14"
alias meditango="cd ~/medgrupo/coisa-linda/Meditango && nvm use --lts"
alias coisa-linda="cd ~/medgrupo/coisa-linda && nvm use --lts"
alias cl="clear"

plugins=(git)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#NOTE: Oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k" # "agnoster", "spaceship"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
	time 					
	node
	venv
  line_sep      # Line break
  # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=needed
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_CHAR_SUFFIX=""

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions


#NOTE: Bun
[ -s "/home/eduardo/.bun/_bun" ] && source "/home/eduardo/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
