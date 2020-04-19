#!/bin/bash

# Load .path, .exports etc.
for file in ~/.{path,exports,aliases,extra,dockerfunc,functions}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    # shellcheck source=/dev/null
    source "$file"
  fi
done
unset file

# Enable bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
