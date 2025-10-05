# iLoveAgents – AI Foundry VS Code Theme

Focused, modern, cool‑toned Azure AI Foundry–inspired dark + light themes. Purple for flow & function discovery, Azure blue for structure, teal for success / status. Built by iLoveAgents – **[iloveagents.ai](https://iloveagents.ai)**.

> Build better AI agents & workflows: Read guides, patterns, and deep‑dives at [iloveagents.ai](https://iloveagents.ai). This theme ships as a lightweight companion to that content.

---

## ✨ Highlights

• Dark + Light variants (balanced contrast, not shouty)  
• Brand‑aligned cool palette (purple / azure / cyan / teal)  
• Distinct semantic roles: keywords azure, functions purple, strings pink, numbers teal‑green, success states teal  
• Tuned terminal ANSI (teal replaces legacy green; clearer red & yellow)  
• Readable, slightly cooled comments (non‑distracting)  
• Works well with Python, TypeScript, C#, Markdown, JSON, YAML  
• Minimal color noise → faster visual parsing  

## 🚀 Install

1. Open Extensions view (`⇧⌘X` / `Shift+Ctrl+X`)  
2. Search: `iLoveAgents AI Foundry`  
3. Install → Command Palette → `Color Theme` → pick: *iLoveAgents – AI Foundry Dark* or *Light*

## 🎨 Palette Snapshot

| Role | Dark | Light | Notes |
|------|------|-------|-------|
| Keyword / Control | `#0078d4` | `#60a5fa` | Azure accent, structural scanning |
| Function / Method | `#8b5cf6` | `#a78bfa` | Purple focus color |
| String / Text | `#d7368f` | `#f472b6` | Vivid but not neon |
| Number / Value | `#046b5f` | `#11a194` | Cool teal‑green |
| Success / Accent | `#0d766e` | `#14b8a6` | Also status / diff additions |
| Error / Critical | `#d92c3a` | `#f87171` | Clear & accessible |
| Comment | desaturated cyan/gray | neutral gray | Low contrast, still legible |

Terminal ANSI colors are re‑mapped for clarity (teal instead of dated green; improved red/yellow differentiation).

## 🧪 Preview / Samples

Open `sample-code.py`, `sample-code.ts`, and `sample-code.cs` for broad syntax coverage.  
Want more language tuning? Open an issue (see below) with a before/after screenshot.

## 🧭 Design Principles

1. Reduce cognitive color switching  
2. Preserve structure cues (keywords & punctuation clear, but not glowing)  
3. Keep functions findable (distinct purple)  
4. Make success / healthy states pleasant (teal)  
5. Avoid eye fatigue over long agent dev sessions  

## 📰 About the Blog (Why This Exists)

The [iLoveAgents](https://iloveagents.ai) blog explores:  
• Practical agent patterns (tool orchestration, memory strategies)  
• Azure AI Foundry & OpenAI integration tips  
• Prompt & evaluation workflows  
• Secure deployment + observability practices  

This theme is a small ergonomics booster for that workflow.

## 🔧 Configuration Tips

Optional settings you may like (add to `settings.json`):

```jsonc
{
  "editor.bracketPairColorization.enabled": false, // theme already differentiates scopes clearly
  "editor.semanticHighlighting.enabled": true,
  "workbench.preferredDarkColorTheme": "iLoveAgents - AI Foundry Dark",
  "workbench.preferredLightColorTheme": "iLoveAgents - AI Foundry Light"
}
```

## ♿ Accessibility & Contrast

Contrast aims for a practical midpoint: not ultra‑high (which can increase glare) but above typical readability thresholds. If you require higher contrast, combine with VS Code's *High Contrast* accessibility features or open an issue—happy to add an alt variant.

## 🤝 Contributing

Issues, suggestions, palette discussions welcome.  
Repo: <https://github.com/iLoveAgents/vscode-iloveagents-foundry-theme>  

Please include:  
• Language + sample snippet  
• Current vs desired effect  
• Screenshot (Dark / Light if relevant)

## 🗺 Roadmap / Ideas

- Optional High Contrast sibling
- JetBrains port (maybe)  
- Inline evaluation / diff coloring refinements  
- Additional language token fine‑tuning (Rust, Go, Shell)

## 🛠 Development

Clone & edit JSON under `themes/` then use the VS Code command: *Developer: Reload Window* to iterate.  
You can also use *Developer: Inspect Editor Tokens and Scopes* to refine color targets.

## 📣 Marketplace / Social

If you like it: ⭐ the repo & share.  
Blog again (last time, promise!): **[iloveagents.ai](https://iloveagents.ai)**

## ⚖️ License & Attribution

MIT. Not affiliated with Microsoft; “Azure” & related names are trademarks of Microsoft. Palette decisions are original work inspired by modern Azure UI accents & cool-neon SaaS ergonomics.

Enjoy & build great agents! 💙

---

### Quick Copy (for referencing elsewhere)

Short tagline: *Calm Azure AI Foundry–inspired dark & light themes with purposeful purple + teal accents. From the iLoveAgents blog.*

---

> Found a token scope that feels off? Open an issue—small tweaks compound into lasting focus.
