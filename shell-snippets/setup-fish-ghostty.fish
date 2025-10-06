# Setup script for iLoveAgents Azure AI Foundry palette in fish + Ghostty
# Usage: fish ./shell-snippets/setup-fish-ghostty.fish

set -l theme_name iloveagents-azure-ai-foundry
set -l repo_root (pwd)
set -l ghostty_theme_dir ~/.config/ghostty/themes
set -l ghostty_config ~/.config/ghostty/config

# 1. Apply fish universal color variables
set -U fish_color_command 8b5cf6 --bold
set -U fish_color_cwd 60a5fa
set -U fish_color_param 93c5fd
set -U fish_color_autosuggestion 6b7280
set -U fish_color_error f87171

# 2. Install enhanced prompt if not already in functions
set -l prompt_fn ~/.config/fish/functions/fish_prompt.fish
mkdir -p (dirname $prompt_fn)
if not test -f $prompt_fn
    cp $repo_root/shell-snippets/fish_prompt.fish $prompt_fn
else
    # Only overwrite if marker missing
    if not grep -q 'Enhanced iLoveAgents Azure AI Foundry fish prompt' $prompt_fn
        cp $repo_root/shell-snippets/fish_prompt.fish $prompt_fn
    end
end

# 3. Ghostty theme inline (fallback) if no theme file found
mkdir -p $ghostty_theme_dir
set -l theme_file $ghostty_theme_dir/$theme_name
if not test -f $theme_file
    # Use repo theme if present
    if test -f $repo_root/terminal-schemes/ghostty.conf
        cp $repo_root/terminal-schemes/ghostty.conf $theme_file
    else
        # Create minimal theme file
        printf '%s\n' 'background = 14161a' 'foreground = e5e7eb' > $theme_file
    end
end

# 4. Ensure config references theme (and remove inline block if previously added)
mkdir -p (dirname $ghostty_config)
if test -f $ghostty_config
    # Remove inline lines & previous theme lines
    grep -v -E '^(background|foreground|cursor-color|selection-background|selection-foreground|palette |theme = )' $ghostty_config > /tmp/ila_ghostty_cfg
    mv /tmp/ila_ghostty_cfg $ghostty_config
end
printf 'theme = %s\n' $theme_name >> $ghostty_config

# 5. Reload prompt in current shell
functions -e fish_prompt; source $prompt_fn; fish_prompt

printf '\n[iLoveAgents] Applied fish + Ghostty setup. Open a new Ghostty window to verify.\n'
