#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Setup tab completion for dotfile manager
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Setup our dotfile managing system
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# Check if our dotfiles are out of date
homeshick --quiet refresh

# Add ~/bin to the path
export PATH=$HOME/bin:$PATH

# Setup powerline prompt
. ~/.homesick/repos/dotfiles-core/powerline/powerline/bindings/zsh/powerline.zsh

# Source everything in .sh.d so that it's easy for multiple repos to add to rc.
for f in ~/.sh.d/*; do
   . $f
done
