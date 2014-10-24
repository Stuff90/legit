
. ~/legit/style/colors.sh

. ~/legit/ext/Matthews-Git-Bash-Prompt.sh
. ~/legit/ext/git-completion.bash

. ~/legit/modules/pane/pane.sh
. ~/legit/modules/commit/commit.sh
. ~/legit/modules/status/status.sh
. ~/legit/modules/www/www.sh

alias ll='ls -lai'
alias graph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
