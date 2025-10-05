# Azure AI Foundry Theme - Installation & Usage Guide

## Quick Start

### Option 1: Install in VS Code (Recommended)

1. Copy the entire `vscode-aifoundry-theme` folder to your VS Code extensions directory:

   **macOS/Linux:**

   ```bash
   cp -r vscode-aifoundry-theme ~/.vscode/extensions/
   ```

   **Windows (PowerShell):**

   ```powershell
   Copy-Item -Recurse vscode-aifoundry-theme "$env:USERPROFILE\.vscode\extensions\"
   ```

2. Restart VS Code

3. Press `Cmd+K Cmd+T` (macOS) or `Ctrl+K Ctrl+T` (Windows/Linux)

4. Select either:
   - **Azure AI Foundry Dark**
   - **Azure AI Foundry Light**

### Option 2: Package as VSIX (For Distribution)

Install the VS Code Extension Manager tool:

```bash
npm install -g @vscode/vsce
```

Package the extension:

```bash
cd vscode-aifoundry-theme
vsce package
```

This creates a `.vsix` file that can be:

- Installed via VS Code: Extensions → Install from VSIX
- Shared with others
- Published to the VS Code Marketplace

## Color Scheme Details

### Azure AI Foundry Primary Colors

| Color Name | Hex Code  | Usage                                  |
| ---------- | --------- | -------------------------------------- |
| Azure Blue | `#0078d4` | Primary accent, buttons, focus borders |
| Purple     | `#68217a` | No folder status bar state             |
| Teal       | `#00b7c3` | Terminal cyan, secondary accents       |
| Green      | `#107c10` | Terminal green, success states         |
| Red        | `#e74856` | Terminal red, error states             |

### Dark Theme Specifics

- **Editor Background:** `#1e1e1e` (Dark gray)
- **Editor Foreground:** `#d4d4d4` (Light gray)
- **Sidebar Background:** `#252526` (Slightly lighter dark gray)
- **Title Bar & Status Bar:** `#0078d4` (Azure blue)

### Light Theme Specifics

- **Editor Background:** `#ffffff` (White)
- **Editor Foreground:** `#1e1e1e` (Dark gray)
- **Sidebar Background:** `#f3f2f1` (Light gray)
- **Title Bar & Status Bar:** `#0078d4` (Azure blue)

## What's Included

```
vscode-aifoundry-theme/
├── package.json                           # Extension manifest
├── README.md                              # Documentation
├── CHANGELOG.md                           # Version history
├── LICENSE                                # MIT License
├── .vscodeignore                          # Files to exclude from package
└── themes/
    ├── azure-ai-foundry-dark.json        # Dark theme definition
    └── azure-ai-foundry-light.json       # Light theme definition
```

## Features

✅ Two complete themes (dark and light)
✅ Azure AI Foundry branding colors
✅ Optimized syntax highlighting for:

- JavaScript/TypeScript
- Python
- HTML/CSS
- Markdown
- JSON/YAML
- And many more languages

✅ Consistent UI styling:

- Activity bar
- Status bar
- Sidebar
- Editor
- Terminal
- Panels

## Customization

You can further customize the theme by modifying the JSON files in the `themes/` directory. After making changes, reload VS Code to see the updates.

Common customizations:

- Change the primary accent color by replacing `#0078d4`
- Adjust background colors for better contrast
- Modify syntax highlighting colors for specific languages

## Troubleshooting

**Theme not showing up?**

- Ensure the extension is in the correct directory
- Restart VS Code completely
- Check for any JSON syntax errors

**Colors look wrong?**

- Make sure you selected the correct theme (dark vs light)
- Check your VS Code settings for color customizations that might override the theme

## Publishing to Marketplace (Optional)

To publish this theme to the VS Code Marketplace:

1. Create a publisher account at https://marketplace.visualstudio.com/
2. Get a Personal Access Token from Azure DevOps
3. Run: `vsce login <publisher-name>`
4. Update `package.json` with your publisher name
5. Run: `vsce publish`

---

**Enjoy your Azure AI Foundry themed VS Code!** 💙
