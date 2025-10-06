# iLoveAgents – Azure AI Foundry Theme

Modern Azure AI Foundry + Agent Framework dark & light theme for focused agent development. Purposeful purple (functions), Azure blue (structure), teal (success & diagnostics).

**Why**: Faster iteration (and simply more fun) while building tools, prompts, evaluation flows, and multi‑agent orchestration on Azure AI Foundry + the Microsoft Agent Framework.

**Highlights**
• Azure AI Foundry aligned palette (purple • azure • teal)  
• Agent Framework friendly (function + tool call clarity)  
• Distinct semantics: keywords azure, functions purple, strings pink, numbers cool‑teal  
• Tuned terminal ANSI (teal success; clearer red/yellow)  
• Low color noise → longer, less fatiguing sessions  

**Palette (Dark / Light)** Keywords `#0078d4 / #60a5fa` • Functions `#8b5cf6 / #a78bfa` • Strings `#d7368f / #f472b6` • Numbers `#046b5f / #11a194` • Success `#0d766e / #14b8a6` • Error `#d92c3a / #f87171`

**Install**: Extensions View → search “iLoveAgents AI Foundry” → choose Dark or Light.

Docs & agent patterns: <https://iloveagents.ai>

## Screenshots

Light: ![Light Theme](images/screenshot-light.png)

Dark: ![Dark Theme](images/screenshot-dark.png)

---

## More Details (Repository Only)

Extended design principles, configuration tips, roadmap & contribution guidelines are kept for repository browsing.

### Design Principles

1. Reduce cognitive color switching  
2. Preserve structure cues without glare  
3. Keep functions visually findable  
4. Pleasant success / healthy state signaling  
5. Sustain long-session comfort  

### Configuration (Optional)

```jsonc
{
  "editor.bracketPairColorization.enabled": false,
  "editor.semanticHighlighting.enabled": true,
  "workbench.preferredDarkColorTheme": "iLoveAgents - Azure AI Foundry Dark",
  "workbench.preferredLightColorTheme": "iLoveAgents - Azure AI Foundry Light"
}
```

### Terminals & Shells

Want matching Ghostty / fish (prompt + colors) or other terminal schemes? See `TERMINALS.md` (bundled in the extension).

Fast path (fish + Ghostty only) from repo root:

```fish
fish shell-snippets/setup-fish-ghostty.fish
```

This single script handles fish colors, prompt, and Ghostty theme reference. Everything else in `shell-snippets/` and `terminal-schemes/` is optional.

### Included Extras

The extension package includes these helper assets for a cohesive environment:

```text
terminal-schemes/   # Windows Terminal, iTerm2, Ghostty, Alacritty, Kitty, WezTerm palettes
shell-snippets/     # setup-fish-ghostty.fish, enhanced fish prompt, zsh & PowerShell snippets
TERMINALS.md        # Detailed instructions & quick start
sample-code.*       # Small language samples to preview syntax coloring
```

JetBrains theme variants live only in the repository (`jetbrains/`) and are not part of the VS Code extension.

### Contributing

Issues & improvements welcome: <https://github.com/iLoveAgents/vscode-iloveagents-foundry-theme>

### License

MIT. Not affiliated with Microsoft; “Azure” & related names are trademarks of Microsoft.

Enjoy & build great agents! 💙
