# iLoveAgents - Azure AI Foundry Themes

## What This Is

Professional VS Code color themes optimized for AI development work.

## Theme Variants

### Azure AI Foundry (Recommended)

- **Light**: Modern palette aligned with Azure AI branding
- **Dark**: Matching dark variant with consistent color hierarchy

### Classic iLoveAgents

- **Light**: Original vibrant purple-teal palette
- **Dark**: Matching dark variant

## Key Design Principles

### Visual Hierarchy

- **Functions**: Purple/Indigo (`#5637C9`) - Most important, stands out
- **Keywords**: Azure Blue (`#0078D4`) - Control flow and language constructs  
- **Strings**: Magenta (`#E3008C`) - Data and content
- **Numbers**: Cyan (`#1AA4E8`) - Literals and constants
- **Comments**: Muted gray with italic styling

### Developer Experience

- **Low color noise**: Reduced visual fatigue during long sessions
- **High contrast**: Clear distinction between code elements
- **Agent-friendly**: Functions and tool calls are visually prominent
- **Consistent semantics**: Same element types use same colors across themes

## Installation

1. Open VS Code Extensions
2. Search "iLoveAgents Themes"
3. Install and select your preferred variant

## Customization

The themes work well with:

```json
{
  "editor.bracketPairColorization.enabled": false,
  "editor.semanticHighlighting.enabled": true,
  "workbench.preferredDarkColorTheme": "iLoveAgents - Azure AI Foundry Dark",
  "workbench.preferredLightColorTheme": "iLoveAgents - Azure AI Foundry Light"
}
```

## Terminal Integration

Matching terminal color schemes included for:

- Ghostty
- Kitty  
- Alacritty
- WezTerm
- iTerm2
- Windows Terminal

Quick setup for fish + Ghostty:

```bash
fish shell-snippets/setup-fish-ghostty.fish
```

## Contributing

- Issues and improvements welcome
- Follow existing color hierarchy
- Test with multiple languages (Python, TypeScript, etc.)
- Ensure accessibility contrast ratios

### Development Workflow

For theme development and testing:

```bash
# Copy themes to VS Code (stable)
npm run copy-to-vscode

# Copy themes to VS Code Insiders
npm run copy-to-insiders

# Copy to both VS Code versions
npm run dev-sync
```

**Note**: Install the extension from the marketplace first, then use these commands to sync your local changes.

## Related Tools

- VS Code extension provides the themes
- Terminal schemes for consistent environment
- JetBrains variants available in repository
- Shell prompts and color configurations

## Philosophy

Good themes fade into the background while making important code structure visible. These themes prioritize:

1. **Function visibility** - The most important code elements stand out
2. **Sustained focus** - Colors that don't tire eyes over long sessions  
3. **Semantic consistency** - Same meaning = same color across contexts
4. **Agent workflow** - Clear distinction between functions, data, and control flow

Perfect for AI/ML development, agent frameworks, and any coding work requiring sustained concentration.
