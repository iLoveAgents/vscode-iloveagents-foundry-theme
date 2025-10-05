# 🚀 Azure AI Foundry Theme - Quick Start Guide

## ✨ What You Have

A complete VS Code theme extension with Azure AI Foundry colors in both light and dark variants!

## 📦 Installation (Choose One Method)

### Method 1: Direct Installation (Fastest)

```bash
# From this directory, copy to VS Code extensions folder
cp -r . ~/.vscode/extensions/azure-ai-foundry-theme

# Restart VS Code, then:
# Press: Cmd+K Cmd+T (Mac) or Ctrl+K Ctrl+T (Windows/Linux)
# Select: "Azure AI Foundry Dark" or "Azure AI Foundry Light"
```

### Method 2: Package as VSIX (For Sharing)

```bash
# Install packaging tool (one time only)
npm install -g @vscode/vsce

# Package the extension
vsce package

# This creates: azure-ai-foundry-theme-0.0.1.vsix
# Install via: VS Code → Extensions → Install from VSIX
```

## 🎨 Theme Colors Reference

| Element | Color | Hex Code |
|---------|-------|----------|
| Primary Accent | Azure Blue | `#0078d4` |
| Secondary Accent | Purple | `#68217a` |
| Tertiary Accent | Teal | `#00b7c3` |
| Success/Green | Green | `#107c10` |
| Error/Red | Red | `#e74856` |

### Dark Theme
- **Background:** `#1e1e1e`
- **Foreground:** `#d4d4d4`
- **Sidebar:** `#252526`

### Light Theme
- **Background:** `#ffffff`
- **Foreground:** `#1e1e1e`
- **Sidebar:** `#f3f2f1`

## 🧪 Testing the Theme

1. Open the included `sample-code.ts` file
2. You should see:
   - Comments in green (italic)
   - Keywords in blue
   - Strings in orange (dark) or red (light)
   - Functions in yellow (dark) or brown (light)
   - Azure blue accents throughout the UI

## 📁 Project Structure

```
vscode-aifoundry-theme/
├── package.json                      # Extension manifest
├── README.md                         # Full documentation
├── INSTALL.md                        # Detailed installation guide
├── QUICKSTART.md                     # This file
├── CHANGELOG.md                      # Version history
├── LICENSE                           # MIT License
├── sample-code.ts                    # Test file for theme
└── themes/
    ├── azure-ai-foundry-dark.json   # Dark theme
    └── azure-ai-foundry-light.json  # Light theme
```

## 🔧 Customization

To modify colors, edit the JSON files in `themes/`:
- `azure-ai-foundry-dark.json` - Dark theme colors
- `azure-ai-foundry-light.json` - Light theme colors

After changes, reload VS Code with `Cmd+R` (Mac) or `Ctrl+R` (Windows/Linux).

## 📚 Key Features

✅ **Two Complete Themes:** Dark and Light variants
✅ **Azure Branding:** Official Azure blue (#0078d4) throughout
✅ **Syntax Highlighting:** Optimized for 30+ languages
✅ **UI Consistency:** Styled activity bar, sidebar, status bar, editor
✅ **Professional Look:** Clean, readable, and modern
✅ **Terminal Colors:** Azure-themed ANSI colors

## 🎯 What Each Theme Includes

Both themes have comprehensive styling for:
- **Editor:** Background, foreground, line highlighting, selections
- **Activity Bar:** Icons and badges with Azure blue
- **Status Bar:** Azure blue background throughout
- **Sidebar:** File explorer and panels
- **Tabs:** Active and inactive states
- **Terminal:** Custom ANSI color palette
- **Widgets:** Inputs, dropdowns, peek views
- **Syntax:** Comments, keywords, strings, functions, types, variables

## 💡 Tips

- **Switch themes easily:** `Cmd+K Cmd+T` (Mac) or `Ctrl+K Ctrl+T` (Win/Linux)
- **Preview before installing:** Check the color samples in README.md
- **Share with team:** Package as VSIX and distribute
- **Customize:** Edit JSON files to match your exact preferences

## 🌟 Next Steps

1. Install the theme using Method 1 above
2. Open `sample-code.ts` to see syntax highlighting
3. Try both dark and light variants
4. Customize colors if needed
5. Share with your team!

## 📞 Support

For issues or suggestions, see the README.md file for more information.

---

**Enjoy coding with Azure AI Foundry colors!** 💙
