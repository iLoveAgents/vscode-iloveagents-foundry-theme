# Publishing Guide – iLoveAgents AI Foundry Theme

End‑to‑end steps for releasing a new version to the VS Code Marketplace.

## 1. Prerequisites

- Node.js (18+ recommended)
- `@vscode/vsce` CLI installed globally
- Publisher: `iloveagents` already created
- Personal Access Token (PAT) with Marketplace "Manage" scope

## 2. Install vsce

# Patch release

```bash
npm install -g @vscode/vsce
```

Verify:

```bash
vsce --version
```

## 3. Create / Rotate Personal Access Token (PAT)

1. Go to <https://dev.azure.com/>
2. Avatar (top-right) → Personal Access Tokens → New Token
3. Name: `vsce-publish-iloveagents`
4. Scopes: Marketplace → Manage (or Acquire + Publish if UI differs)
5. Expiration: 90 or 180 days
6. Create → Copy immediately (cannot be viewed again)

Store securely (password manager). Revoke immediately if leaked.

## 4. Authenticate (one-time per machine)

Interactive:

```bash
vsce login iloveagents
```

Paste PAT when prompted.

Or ephemeral (no caching):

```bash
export VSCE_PAT="<token>"
vsce publish patch
unset VSCE_PAT
```

## 5. Update Changelog

Edit `CHANGELOG.md` – add a new heading at the top:

```markdown
## 0.x.y – Summary
- Short bullet(s) of changes
```

## 6. Choose Version Bump Strategy

Semantic Versioning:

- Patch: backwards-compatible fixes (e.g. minor palette tweak)
- Minor: new non-breaking enhancements (e.g. README overhaul, new assets)
- Major: breaking semantics (rare for a theme)

### Option A: Use npm for explicit control

```bash
npm version patch   # or minor / major
```

Creates commit + git tag (e.g. v0.3.0).

### Option B: Let vsce do the bump

```bash
vsce publish patch   # or minor / major
```

Performs version bump, packaging, and publish in one step.

## 7. Push Repository State (if using npm version)

```bash
git push
git push --tags
```

Ensure CI / remote reflects same version.

## 8. Sanity Check Before Publishing

```bash
vsce package
unzip -l iloveagents-ai-foundry-theme-*.vsix | grep -E '\\.mypy_cache|node_modules' || echo "No unwanted large dirs"
code --install-extension iloveagents-ai-foundry-theme-<version>.vsix   # optional local test
```

## 9. Publish

If not using the one-step `vsce publish <bump>`:

```bash
vsce publish
```

Output includes the new version if successful.

## 10. Verify Marketplace

Refresh extension page after 1–3 minutes: <https://marketplace.visualstudio.com/items?itemName=iLoveAgents.iloveagents-ai-foundry-theme>

Check:

- Version number updated
- README top section looks concise
- Icon correct

## 11. After Publish

- Add any new screenshots or badges
- Close related issues / PRs
- Announce (optional)

## 12. Troubleshooting

| Symptom | Cause | Fix |
|---------|-------|-----|
| 401 / Forbidden | Wrong / expired PAT | Regenerate PAT with Marketplace Manage scope |
| Version already exists | Forgot to bump | `npm version patch` or use `vsce publish patch` |
| Icon missing warning | Wrong path | Ensure `icon.png` exists & path matches `package.json` |
| Large VSIX | Unwanted caches | Update `.vscodeignore` (e.g. add `.mypy_cache/`) |
| README not updated | Caching delay | Wait a minute or re-publish next bump |

## 13. Automation (Optional)

GitHub Actions example (save as `.github/workflows/publish.yml`):

```yaml
name: Publish Extension
on:
  push:
    tags:
      - 'v*'
jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 18
      - run: npm install -g @vscode/vsce
      - run: vsce publish --pat ${{ secrets.VSCE_PAT }}
```‚

Add secret in GitHub: Settings → Secrets → `VSCE_PAT`.

## 14. Clean Up / Rotation

- Rotate PAT before expiry
- Revoke old tokens
- Remove any accidental token inclusion from commit history (use `git filter-repo` if leaked)

## 15. Quick Cheat Sheet

```bash
# Patch release
npm version patch
git push && git push --tags
vsce publish

# One-shot minor bump
vsce publish minor

# Local test
vsce package
code --install-extension iloveagents-ai-foundry-theme-<version>.vsix
```

---
Need an automated badge update or release notes generator? Open an issue.
