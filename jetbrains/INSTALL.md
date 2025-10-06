# iLoveAgents Azure AI Foundry Theme (JetBrains Unified)

## Install (Plugin JAR)

1. Build the JAR (or download a released one) in this `jetbrains/` folder:

   ```bash
   zip -r iLoveAgents-Azure-AI-Foundry-Theme.jar META-INF themes colors
   ```

2. JetBrains IDE → Settings/Preferences → Plugins → ⚙ → Install Plugin from Disk…
3. Choose `iLoveAgents-Azure-AI-Foundry-Theme.jar`
4. Restart IDE when prompted
5. Apply: Settings → Appearance & Behavior → Appearance → Theme → select:
   - iLoveAgents Azure AI Foundry – Dark
   - iLoveAgents Azure AI Foundry – Light

## What’s Included

✅ Full UI theme (menus, toolbars, sidebars)  
✅ Editor color schemes (syntax)  
✅ Python & C# tuned token colors  
✅ Consistent accent + structural palette  

## Manual (Fallback) Install (Not Needed Normally)

If you only want color schemes (not full UI): copy the XML files in `colors/` & JSON in `themes/` into your IDE config directories. Using the plugin JAR is preferred.

## Update / Replace

1. Uninstall previous plugin version (Settings → Plugins).  
2. Restart IDE (ensures old schemes unloaded).  
3. Install new JAR, restart, reselect theme if needed.  

## Troubleshooting

Theme not visible:

- Confirm `Settings → Plugins` lists the theme and it's enabled.
- Fully restart (quit, not just close window).

Colors look off (Dark washed out):

- Disable semantic highlighting temporarily: Settings → Editor → Color Scheme → General.
- Switch to another theme, then back.

Python tokens not colored:

- Open a .py file: keywords (purple/blue), strings (pink), numbers (teal), decorators (gold), classes (cyan). If not, Invalidate Caches & Restart.

## Version

Current plugin.xml version: 1.1.0 (marketing: v1)

## License

MIT – see project root.
