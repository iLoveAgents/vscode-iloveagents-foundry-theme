# Changelog

## 0.5.0 – Dual Theme Family & Logo-Coherent Palette

**Major Update: Two Theme Families**

This release introduces a dual-brand strategy with four complete themes:

- **iLoveAgents - Dark** (classic vibrant purple/teal palette)
- **iLoveAgents - Light** (classic vibrant purple/teal palette)
- **iLoveAgents - Azure AI Foundry Dark** (new logo-coherent palette)
- **iLoveAgents - Azure AI Foundry Light** (new logo-coherent palette)

**New Azure AI Foundry Palette:**
- Keywords: Azure Blue `#0078D4`
- Functions: Indigo `#5637C9` (dark) / `#5D4BD8` (light)
- Strings: Magenta `#E3008C` (dark) / `#D90082` (light)
- Numbers/Constants: Cyan `#1AA4E8` (dark) / `#008FD8` (light)
- Success: Teal `#0FA8A0` (dark) / `#079A93` (light)
- Error: Coral `#E84855` (dark) / `#D92C3A` (light)
- Background: Deep blue-black `#101224` (dark) / White (light)

**Classic Palette Preserved:**
- Original purple `#8b5cf6`, teal `#14b8a6`, pink `#f472b6` palette maintained
- Available as "iLoveAgents - Dark" and "iLoveAgents - Light"

**Changes:**
- Renamed extension to "iLoveAgents Themes" (reflects multi-theme collection)
- Updated all terminal schemes to Azure AI Foundry palette (Ghostty, Kitty, Alacritty, WezTerm, iTerm2, Windows Terminal)
- JetBrains plugin now includes 4 themes (Classic Dark/Light + Azure AI Foundry Dark/Light)
- Updated README with dual palette documentation
- Consistent en dash spacing in all theme labels

**Breaking Changes:**
- Terminal schemes now use Azure AI Foundry palette by default (classic palette available only in VS Code/JetBrains editor themes)

## 0.4.2 – Packaging & Terminal Extras

- Renamed theme labels to include "Azure AI Foundry" (picker clarity)
- Added `terminal-schemes/` and `shell-snippets/` (multi-terminal color + shell setup) kept out of VSIX via `.vscodeignore`
- Introduced `shell-snippets/setup-fish-ghostty.fish` one-shot environment script
- Added enhanced fish prompt (`fish_prompt.fish`) with git status, duration, exit code coloring
- Added Ghostty, Windows Terminal, iTerm2, Alacritty, Kitty, WezTerm, and shell color documentation in `TERMINALS.md`
- Tightened `.vscodeignore` to ship only core theme assets
- README: terminals section + quick start link

## 0.4.1 – Label + DisplayName Update

- Updated theme display name & contributes labels to "Azure AI Foundry"

## 0.4.0 – Palette Refinements

- Adjusted dark/light palette values for consistency & contrast
- Minor semantic token tuning

## 0.1.0 – Initial Release

- Dark + Light Azure AI Foundry–inspired themes
- Purposeful semantic coloring (purple functions, azure keywords, teal success)
- Tuned terminal ANSI (teal replaces default green)
- Reduced visual noise, balanced contrast, readable comments

