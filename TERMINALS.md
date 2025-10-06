# Terminal & Shell Integration – iLoveAgents Azure AI Foundry

> This file is bundled with the VS Code extension for offline use. Latest updates & light-theme progress: [repository](https://github.com/iLoveAgents/vscode-iloveagents-foundry-theme)

This doc shows exactly what you need (and what you can ignore) to get consistent colors + prompt across terminals and shells.

## Quick Start (Fish + Ghostty Only)

From repo root:

```fish
fish shell-snippets/setup-fish-ghostty.fish
```

Open a new Ghostty window. Done.

What that script does (idempotent):

1. Sets universal fish color vars
2. Installs enhanced prompt (`fish_prompt.fish`)
3. Copies theme file to `~/.config/ghostty/themes/iloveagents-azure-ai-foundry`
4. Writes `theme = iloveagents-azure-ai-foundry` to Ghostty config
5. Leaves everything else untouched

If you only care about VS Code + Ghostty + fish, you can stop here.

## Repo Artifacts

```text
terminal-schemes/
  windows-terminal.json      # Import into Windows Terminal settings (schemes array)
  iLoveAgents-AzureAI.itermcolors  # Import into iTerm2 (macOS)
  alacritty.yml              # Copy fragment into your Alacritty config (optional)
  kitty.conf                 # Include or copy into kitty config (optional)
  wezterm.lua                # Require/merge into your wezterm config (optional)
  ghostty.conf               # Copy into Ghostty themes directory (optional)
```

Ignore anything you don’t use; only copy the schemes for terminals you actually run.

Shell / automation scripts:

```text
shell-snippets/
  fish.fish        # source fish.fish
  fish_prompt.fish # enhanced prompt (copied automatically by setup script)
  zsh.sh           # source after zsh-syntax-highlighting
  psreadline.ps1   # dot-source or copy to PowerShell profile
  setup-fish-ghostty.fish  # one-shot configure fish + ghostty theme
  toggle-ghostty-theme.fish # toggle dark/light (light is placeholder)
```

---

## Windows Terminal (Optional)

1. Open Settings → Open JSON file.
2. Copy the object from `terminal-schemes/windows-terminal.json` into the `schemes` array.
3. Set a profile's `colorScheme` to `iLoveAgents Azure AI Foundry`.

## macOS – iTerm2 (Optional)

1. iTerm2 → Settings → Profiles → Colors.
2. Import: Color Presets… → Import… → select `iLoveAgents-AzureAI.itermcolors`.
3. Re‑open Color Presets… → choose `iLoveAgents-AzureAI`.

(For Apple Terminal you can open iTerm2 profile, then in Terminal.app: Settings → Profiles → gear → Import… and pick the `.terminal` export if you choose to create one later.)


## Ghostty (Manual Setup Alternative)

1. Copy `terminal-schemes/ghostty.conf` to `~/.config/ghostty/themes/iloveagents-azure-ai-foundry.conf` (create the `themes` folder if missing).
2. Ensure your `~/.config/ghostty/config` has a line:

  ```text
  theme = iloveagents-azure-ai-foundry
  ```

1. Open a new Ghostty window.

The provided file sets background, foreground, cursor, selection, and the full 16 ANSI colors.

---

## Shell Highlighting (Manual Details)

Rather than mutate the palette, we selectively accent commands so the prompt remains readable.

### fish (Manual Without Script)

If you didn’t run the quick start script, set colors manually once:

```fish
set -U fish_color_command 8b5cf6 --bold
set -U fish_color_cwd 60a5fa
set -U fish_color_param 93c5fd
set -U fish_color_autosuggestion 6b7280
set -U fish_color_error f87171
```

Reset any variable with `set -eU name`.


### zsh (Optional)

If you use `zsh-syntax-highlighting`, add to `.zshrc` *after* sourcing it:

```zsh
ZSH_HIGHLIGHT_STYLES[command]='fg=#8b5cf6,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#60a5fa'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#93c5fd'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f87171'
```

Prompt example using `prompt_subst`:

```zsh
PROMPT='%F{60a5fa}%~%f %F{8b5cf6}›%f '
```

### PowerShell (PSReadLine, Optional)

Add to your PowerShell profile (`$PROFILE`):

```powershell
Set-PSReadLineOption -Colors @{
  Command       = '#8b5cf6'
  Parameter     = '#93c5fd'
  Operator      = '#60a5fa'
  Member        = '#a78bfa'
  Variable      = '#22d3ee'
  String        = '#f472b6'
  Number        = '#11a194'
  Type          = '#c4b5fd'
  Comment       = '#6a7581'
  Default       = '#e5e7eb'
  Emphasis      = '#fbbf24'
  Error         = '#f87171'
}
```

Reload: `.& $PROFILE`


### Bash (Optional)

Add to `~/.bashrc`:

```bash
PS1='\[\e[38;2;96;165;250m\]\w\[\e[0m\] \[\e[38;2;139;92;246m\]›\[\e[0m\] '
```

---

## Color Reference (Dark)

| Role | Hex |
|------|-----|
| Background | `#14161a` |
| Foreground | `#e5e7eb` |
| Cursor | `#8b5cf6` |
| Selection (solid ref) | `#2b2236` |
| Accent Purple | `#8b5cf6` |
| Azure Blue | `#60a5fa` |
| Teal Success | `#14b8a6` |
| Pink Strings | `#f472b6` |
| Warning Yellow | `#fbbf24` |
| Error Red | `#f87171` |

ANSI (normal → bright):

- Black: `#1f2428` / `#374151`
- Red: `#f87171` / `#fca5a5`
- Green: `#14b8a6` / `#2dd4bf`
- Yellow: `#fbbf24` / `#fcd34d`
- Blue: `#60a5fa` / `#93c5fd`
- Magenta: `#a78bfa` / `#c4b5fd`
- Cyan: `#22d3ee` / `#67e8f9`
- White: `#e5e7eb` / `#f3f4f6`

---

## Philosophy

Keep semantic meaning: green = success, red = errors, purple = action/invocation. Shell config layers *on top* of a neutral terminal foreground instead of recoloring the entire palette.

---

## Roadmap Ideas

- Add macOS Terminal profile export
- Add Warp / Ghostty scheme variants
- Provide Light theme equivalents

PRs welcome.
