# iLoveAgents Azure AI Foundry – JetBrains

Unified JetBrains plugin packaging for the iLoveAgents Azure AI Foundry Dark & Light themes.

## Quick Install (Plugin JAR)

1. Build (or download) `iLoveAgents-Azure-AI-Foundry-Theme.jar` in this folder.
2. JetBrains IDE → Settings/Preferences → Plugins → Gear → Install plugin from disk…
3. Select the JAR, restart.
4. Apply under Appearance: choose Dark or Light variant.

See `INSTALL.md` here for full instructions & troubleshooting.

## Build Locally

```bash
zip -r iLoveAgents-Azure-AI-Foundry-Theme.jar META-INF themes colors
```

## Features (Dark / Light)

- Purple accent (#8b5cf6)
- Azure blues for structural tokens
- Teal for numbers & success
- Pink/Magenta for strings
- Cyan for classes / types
- Python + C# tuned token mappings

## Folder Layout

- META-INF/plugin.xml
- colors/ (editor schemes)
- themes/ (UI theme JSON)
- INSTALL.md (detailed guide)

## License

MIT – see root `LICENSE`.

## Contribute

[PRs welcome](https://github.com/iLoveAgents/vscode-iloveagents-foundry-theme)
