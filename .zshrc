export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="spaceship"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# android studio
export ANDROID_HOME=$HOME/Android
export ANDROID_SDK_ROOT=$ANDROID_HOME/Sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin


# Adjusts theme SpaceShip
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  venv          # virtualenv section
  conda         # conda virtualenv section
  dotnet        # .NET section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  ibmcloud      # IBM Cloud section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR=#8700ff
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="$"
SPACESHIP_CHAR_SUFFIX=" "

export PATH="$PATH":"$HOME/.local/bin"

# Personal alias
alias vim="nvim"
alias exa="exa --icons --long --all --header --group --octal-permissions"
alias tree="exa --tree"
alias workspace="$HOME/workspace"
alias ws="workspace;"
alias pp="$HOME/workspace/personal-projects && workmode off"
alias gpusho='git push origin "$(git_current_branch)"'
alias gpullu='git pull upstream "$(git_current_branch)"'

# GO
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH="$PATH:$(go env GOPATH)/bin"

export PATH="$PATH:$HOME/workspace/dot/studion-mx-devstack/"

function workmode() {
  ANSWER="$1"

  if [[ "$ANSWER" ]]; then
    nvm use 18
    git config --global user.email "matt.alpe.dev@gmail.com"
    git config --global user.name "Matheus Alves Pereira"
    node -v
    git config --global user.email
    return 2
  fi

  nvm use 16
  git config --global user.email "matheus.pereira@cortex.com.br"
  git config --global user.name "Matheus Alves Pereira"
  node -v
  git config --global user.email
}

# Dot
function dot() {
  COMMAND="$1"
  DOT_WORKSPACE="$HOME/workspace/dot"

  workmode

  case $COMMAND in
  api) cd "$DOT_WORKSPACE/studion-api" ;;
  key) cd "$DOT_WORKSPACE/studion-identity-keycloak" ;;
  web) cd "$DOT_WORKSPACE/studion-web-app" ;;
  dev) cd "$DOT_WORKSPACE/studion-mx-devstack" ;;
  rh) firefox --new-tab "https://platform.senior.com.br/senior-x/#/" >/dev/null 2>&1 & sudo openfortivpn;;
  *) cd "$DOT_WORKSPACE" ;;
  esac
}

# pnpm
export PNPM_HOME="/home/matheus-alpe/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


# initialize tmux
SESSION_NAME="dev"

# 1. First you check if a tmux session exists with a given name.
tmux has-session -t=$SESSION_NAME 2> /dev/null

# 2. Create the session if it doesn't exists.
if [[ $? -ne 0 ]]; then
  TMUX='' tmux new-session -d -s "$SESSION_NAME"
fi

# 3. Attach if outside of tmux, switch if you're in tmux.
if [[ -z "$TMUX" ]]; then
  tmux attach -t "$SESSION_NAME"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
