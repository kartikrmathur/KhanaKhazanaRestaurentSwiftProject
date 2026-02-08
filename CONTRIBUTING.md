# Contributing to Khana Khazana iOS App

Thank you for considering contributing. This document covers code style, commit messages, pull requests, and reporting issues.

---

## 1. Code style (Swift)

- Follow [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/) and common Swift conventions.
- **Naming:**
  - Types and protocols: `PascalCase` (e.g. `FinalBillViewController`, `DatabaseHandler`).
  - Variables, functions, parameters: `camelCase` (e.g. `tableList`, `selectUserData`).
  - Constants: `camelCase` or `kConstantName` if you prefer (e.g. `maxItems`).
- **Formatting:**
  - Indent with 4 spaces (or match existing files).
  - Place opening braces on the same line as the declaration; closing braces on their own line.
- **Organization:**
  - Use `// MARK: - Section Name` to group related code (e.g. `// MARK: - Lifecycle`, `// MARK: - Actions`).
  - Order: properties, lifecycle, IBActions, table/data source, private helpers.
- **Optionals:** Prefer optional binding (`if let`, `guard let`) over force unwraps when the value might be nil.
- **Files:** One primary type per file; filename should match the type (e.g. `FinalBillViewController.swift`).

Existing code may not follow every rule; new code should align with these guidelines where practical.

---

## 2. Commit messages (Conventional Commits)

Use a short, consistent format so history is easy to scan and automate.

**Format:** `type(scope): short description`

**Types:**

| Type | Use for |
|------|--------|
| `feat` | New feature or user-facing change |
| `fix` | Bug fix |
| `docs` | Documentation only (README, docs/, comments) |
| `refactor` | Code change that doesn’t fix a bug or add a feature |
| `style` | Formatting, whitespace, no logic change |
| `test` | Adding or updating tests |
| `chore` | Build, tooling, dependencies, repo housekeeping |

**Scope** (optional): area of the app, e.g. `menu`, `cart`, `auth`, `setup`.

**Examples:**

```
feat(menu): add pull-to-refresh for menu list
fix(cart): correct total when items are removed
docs: add architecture.md and setup.md
refactor: move view controllers into Controllers/ subfolders
chore: add .gitignore and MIT LICENSE
```

**Good:**

- `fix: resolve crash when database is missing`
- `docs(setup): add CocoaPods and troubleshooting section`
- `refactor(controllers): extract cart logic into a helper`

**Bad:**

- `updated stuff`
- `fix bug`
- `WIP` (use a descriptive message and optional `WIP` in the PR title instead)

---

## 3. Pull request process

1. **Fork** the repository and create a branch from `master` (or the default branch).
2. **Make your changes** and keep commits focused (one logical change per commit when possible).
3. **Run** the app and, if applicable, tests (⌘R, ⌘U in Xcode).
4. **Push** your branch and open a **Pull Request** against the upstream `master` (or default branch).
5. **Describe** what you changed and why; reference any issues (e.g. “Fixes #12”).
6. **Respond** to review feedback and update the PR as needed.

**PR title:** Prefer the same style as commit messages, e.g. `feat(menu): add pull-to-refresh`.

**PR description:** Use the template below when opening a PR (copy into the description box).

---

### Pull request template

```markdown
## What
(Brief description of the change.)

## Why
(Reason or issue: e.g. “Fixes #N” or “Improves menu load performance”.)

## How to test
(Steps to verify: e.g. “Open Menu → pull to refresh → list updates”.)

## Checklist
- [ ] Builds and runs in Xcode (Simulator / device as relevant)
- [ ] No new warnings (or documented if intentional)
- [ ] Docs updated if needed (README, setup, architecture)
```

---

## 4. Reporting issues

When opening an issue, please include:

- **Short title** (e.g. “App crashes when opening Menu with empty database”).
- **Steps to reproduce** (numbered list).
- **Expected behavior** vs **actual behavior**.
- **Environment:** Xcode version, iOS version (Simulator or device), macOS version if relevant.
- **Screenshots or logs** if they help (e.g. crash log, console output).

**Labels** (if the repo has them): e.g. `bug`, `enhancement`, `documentation`. Maintainers may add these.

---

## 5. Code of conduct (basics)

- Be respectful and constructive in discussions and reviews.
- Focus on the code and the project; avoid personal attacks or off-topic comments.
- This project is licensed under the MIT License; contributions are welcome under the same terms.

---

## 6. Summary

| Topic | Guideline |
|-------|-----------|
| **Style** | Swift conventions, MARK sections, one main type per file |
| **Commits** | Conventional Commits: `type(scope): description` |
| **PRs** | Fork → branch → test → push → open PR with description and checklist |
| **Issues** | Clear title, steps, expected vs actual, environment |

For setup and architecture, see [docs/setup.md](docs/setup.md) and [docs/architecture.md](docs/architecture.md).
