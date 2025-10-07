# Personalized!

# Grab the current date (%D) and time (%T) wrapped in {}: {%D %T}
DALLAS_CURRENT_TIME_="%{$fg[white]%}{%{$fg[yellow]%}%D %T%{$fg[white]%}}%{$reset_color%}"
# Function to get abbreviated hostname
get_abbreviated_hostname() {
  local hostname=$(hostname)
  case "$hostname" in
    "ag-r15") echo "r15" ;;
    "ag-r15vm-ubuntu24") echo "vm" ;;
    "ag-vm-ubuntu") echo "vm" ;;
    "ag-r15vm-fedora42") echo "fdr" ;;
    "ag-vm-fedora") echo "fdr" ;;
    "ag-r15vm-debian13") echo "dbn" ;;
    "ag-vm-debian") echo "dbn" ;;
    "ag-r15vm-manjaro") echo "mjr" ;;
    "ag-r15vm-endeavour") echo "ndv" ;;
    "ag-vm-endeavour") echo "ndv" ;;
    "ag-vm-opensuse") echo "suse" ;;
    "ag-x51-r3") echo "x51" ;;
    "ag-mbp-15-2016.local") echo "mbp" ;;
    "ag-xps-13-9350") echo "xps" ;;
    *) echo "$hostname" ;;  # fallback to full hostname if not matched
  esac
}

# Grab the current machine name (abbreviated)
DALLAS_CURRENT_MACH_="%{$fg[green]%}\$(get_abbreviated_hostname)%{$fg[white]%}:%{$reset_color%}"
# Simpler parse_git_dirty function without duplicate symbols
git_dirty_simple() {
  if [[ -n $(git status --porcelain 2> /dev/null) ]]; then
    echo "%{$fg[cyan]%}✗%{$reset_color%}"
  fi
}
# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository: ~aw@master
DALLAS_CURRENT_LOCA_="%{$fg[cyan]%}%~\$(git_prompt_info)\$(git_dirty_simple)"
# Grab the current username: dallas
DALLAS_CURRENT_USER_="%{$fg[red]%}%n%{$reset_color%}"
# Use a % for normal users and a # for privileged (root) users.
DALLAS_PROMPT_CHAR_="%{$fg[white]%}%(!.#.🐷)%{$reset_color%}"
# For the git prompt, use a white @ and blue text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}@%{$fg[blue]%}"
# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN=""
# Add cyan ✗ if this branch is diiirrrty! Dirty branch!
ZSH_THEME_GIT_PROMPT_DIRTY=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[white]%}[%{$fg[magenta]%}"
ZSH_THEME_RUBY_PROMPT_SUFFIX="%{$fg[white]%}]%{$reset_color%}"

# Put it all together!
PROMPT="$DALLAS_CURRENT_TIME_ \$(ruby_prompt_info)$DALLAS_CURRENT_MACH_$DALLAS_CURRENT_LOCA_ $DALLAS_CURRENT_USER_$DALLAS_PROMPT_CHAR_ "
