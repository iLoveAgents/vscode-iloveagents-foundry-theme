# Contributing – iLoveAgents AI Foundry Theme

Thanks for your interest in improving the theme! Small refinements compound into better focus.

## Philosophy

- Clarity over visual noise
- Semantic differentiation beats random color variety
- Long-session comfort matters
- Incremental, reversible changes preferred

## Quick Start

1. Fork & clone repository
2. Open in VS Code
3. Edit JSON under `themes/`
4. Use command: *Developer: Reload Window*
5. Inspect tokens: *Developer: Inspect Editor Tokens and Scopes*
6. Open sample files (`sample-code.*`) to validate language breadth

## Color / Token Guidelines

| Concept | Intent | Typical Target |
|---------|--------|----------------|
| Keywords / Control | Structure scanning | Azure blue |
| Functions | Discovery & flow anchor | Purple |
| Strings / Text Literals | Content emphasis without glare | Pink/magenta |
| Numbers / Constants | Cool neutrality | Teal-green |
| Success / Added | Positive / healthy | Teal |
| Errors / Critical | Immediate attention | Red |
| Comments | Context / non-primary | Muted cyan-gray |

## Pull Request Checklist

- [ ] Only touched necessary scopes
- [ ] Tested Dark + Light
- [ ] Checked diff for accidental whitespace churn
- [ ] Updated `CHANGELOG.md` if user-facing impact
- [ ] Screenshots (before/after) for notable shifts

## Versioning

Maintainer will bump version before publish. Please do not manually change `version` unless coordinated.

## Reporting Issues

Include:

- VS Code version & OS
- Dark or Light variant
- Language + code snippet
- Expected vs current rendering
- Optional screenshot

## Accessibility

If you need a higher-contrast variant, open an issue. Provide examples of legibility concerns.

## License

By contributing, you agree your changes are MIT licensed.

Enjoy & thank you!
