# Path to your oh-my-zsh installation.
export ZSH="/Users/${USER}/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh

# Load .path, .exports etc.
for file in ~/.{path,exports,aliases,extra}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file
