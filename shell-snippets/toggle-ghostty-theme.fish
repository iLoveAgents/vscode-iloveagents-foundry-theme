# Toggle between iLoveAgents Azure AI Foundry dark (current) and a placeholder light variant
# Usage: source toggle-ghostty-theme.fish OR fish ./toggle-ghostty-theme.fish

set -l ghostty_config ~/.config/ghostty/config
set -l theme_dark iloveagents-azure-ai-foundry
set -l theme_light iloveagents-azure-ai-foundry-light

function __ila_toggle_theme
    set -l current (grep -E '^theme[[:space:]]*=' $ghostty_config | tail -1 | awk -F '=' '{print $2}' | string trim)
    if test "$current" = $theme_dark
        # Switch to light (placeholder inline definition if missing)
        if not test -f ~/.config/ghostty/themes/$theme_light
            printf '%s\n' '# Light placeholder (adjust later)' 'background = f5f7fa' 'foreground = 1e2228' 'cursor-color = 8b5cf6' > ~/.config/ghostty/themes/$theme_light
        end
        sed -i '' '/^theme[[:space:]]*=/d' $ghostty_config
        printf 'theme = %s\n' $theme_light >> $ghostty_config
        echo 'Switched to light theme: '$theme_light
    else
        sed -i '' '/^theme[[:space:]]*=/d' $ghostty_config
        printf 'theme = %s\n' $theme_dark >> $ghostty_config
        echo 'Switched to dark theme: '$theme_dark
    end
end

__ila_toggle_theme
