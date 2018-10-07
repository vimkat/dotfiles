#
# Custom prompt with Emojis! 🎉
#

# Select a random Emoji.
local emojis=(🎉 🌵 🚀 🍪 🎁 🎈 🌈 "🤪 ")
local emoji=$emojis[$RANDOM%$#emojis+1]

# Set the prompt.
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${emoji}  ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# Show Git status in prompt.
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
