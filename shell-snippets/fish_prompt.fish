# Enhanced iLoveAgents Azure AI Foundry fish prompt
# Source this file from config.fish or copy into ~/.config/fish/functions/fish_prompt.fish
# Features: exit status, git branch (+dirty/+ahead/+behind), duration >250ms, themed colors

# Color variables (hex without #)
set -g color_path 60a5fa
set -g color_branch 60a5fa
set -g color_symbol 8b5cf6
set -g color_success 14b8a6
set -g color_error f87171
set -g color_dim 6b7280
set -g color_time 2dd4bf

function __ila_git_segment --description 'Compose git branch segment'
    type -q git; or return
    set -l ref (command git symbolic-ref --short HEAD ^/dev/null 2>/dev/null)
    test -n "$ref"; or return
    set -l dirty ''
    command git diff --quiet --ignore-submodules HEAD ^/dev/null 2>/dev/null; or set dirty '*'
    set -l ahead (command git rev-list --count --left-only @{u}...HEAD 2>/dev/null)
    set -l behind (command git rev-list --count --right-only @{u}...HEAD 2>/dev/null)
    set -l diverge ''
    if test -n "$ahead" -a $ahead -gt 0
        set diverge $diverge'+'$ahead
    end
    if test -n "$behind" -a $behind -gt 0
        set diverge $diverge'-'$behind
    end
    echo $ref$dirty$diverge
end

function fish_prompt
    set -l last_status $status

    # Optional duration if fish >=3.6 sets CMD_DURATION (ms)
    set -l elapsed ''
    if set -q CMD_DURATION
        if test $CMD_DURATION -gt 250
            if test $CMD_DURATION -ge 1000
                set elapsed (printf '%0.1fs' (math -s0 $CMD_DURATION / 1000))
            else
                set elapsed (printf '%dms' $CMD_DURATION)
            end
        end
    end

    set -l pwd_display (prompt_pwd)
    set -l git_segment (__ila_git_segment)

    set -l status_segment ''
    if test $last_status -ne 0
        set status_segment (set_color $color_error)'['$last_status']'(set_color normal)' '
    end

    set -l time_segment ''
    if test -n "$elapsed"
        set time_segment (set_color $color_time)$elapsed' '(set_color normal)
    end

    set_color $color_path
    printf '%s' $pwd_display
    set_color normal

    if test -n "$git_segment"
        printf ' '(set_color $color_branch)'('%s')'(set_color normal) $git_segment
    end

    printf ' %s%s' $status_segment $time_segment
    set_color $color_symbol
    printf '› '
    set_color normal
end
