# Changelog

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
