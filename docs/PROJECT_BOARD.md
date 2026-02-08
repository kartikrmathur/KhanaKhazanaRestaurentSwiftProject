# Project Board & Issues — Khana Khazana iOS App

How to set up GitHub labels, create issues for future work, and use issue/PR templates.

---

## 1. Labels to create

In the repo: **Issues → Labels** (or **Settings** if you manage labels there). Create these (or adjust names/colors to taste):

| Label | Color | Description |
|-------|--------|-------------|
| `bug` | `#d73a4a` (red) | Something isn’t working. |
| `enhancement` | `#a2eeef` (light blue) | New feature or improvement. |
| `documentation` | `#0075ca` (blue) | Docs, README, comments. |
| `good first issue` | `#7057ff` (purple) | Good for new contributors. |
| `help wanted` | `#008672` (teal) | Extra help welcome. |
| `question` | `#d876e3` (pink) | Question or discussion. |
| `wontfix` | `#ffffff` (white) | Won’t be fixed. |

---

## 2. Issues to create (5–10 for future work)

Create these as **Open** issues so the project board has clear next steps. Adjust titles/descriptions to match the repo.

| # | Title | Label | Description (short) |
|---|--------|--------|----------------------|
| 1 | Add sample database.sqlite for new clones | enhancement, documentation | Provide a sample `database.sqlite` in repo or document how to get one so the app runs after clone. |
| 2 | Rename model class `file` to `MenuItem` | enhancement, refactor | Rename `file` to `MenuItem` (or `Dish`) and update all references for clarity. |
| 3 | Add input validation on Login screen | enhancement | Validate email/username and password format before segue. |
| 4 | Implement Final Bill order submission | enhancement | Wire final bill to a backend or local order history instead of only displaying items. |
| 5 | Add unit tests for DatabaseHandler | enhancement, good first issue | XCTest for `openDatabase`, `selectUserData`, `Select(id)`. |
| 6 | Add SwiftLint and fix warnings | enhancement | Add SwiftLint (e.g. CocoaPods/SPM) and fix or document exceptions. |
| 7 | Improve error handling when database is missing | bug, enhancement | Show an alert or fallback UI when DB copy fails instead of silent failure. |
| 8 | Add pull-to-refresh on Menu list | enhancement | Allow user to refresh the menu table. |
| 9 | Document how to add Facebook/Google login | documentation | Step-by-step in docs/setup.md for CocoaPods and SDK setup. |
| 10 | Add GitHub Actions CI (build + test) | enhancement | Workflow to build on push/PR and run tests. |

Copy each row into a new issue: **Title**, **Labels**, and **Description** (expand the “short” text as needed).

---

## 3. Issue templates

The repo includes templates under `.github/ISSUE_TEMPLATE/`. Use them when opening a new issue:

- **Bug report** — When something is broken.
- **Feature request** — When proposing a new feature or improvement.

You can add a **config.yml** to the issue template folder to add a blank “Custom” option or reorder choices.

---

## 4. Pull request template

A **Pull request template** is in `.github/PULL_REQUEST_TEMPLATE.md`. It will appear in the PR description box when someone opens a PR. Edit it to match your CONTRIBUTING.md (e.g. What / Why / How to test / Checklist).

---

## 5. Quick checklist

- [ ] Create labels (bug, enhancement, documentation, etc.).
- [ ] Create 5–10 issues from the table above (or your own list).
- [ ] Optionally set up a **Project** (Projects → New project) and add columns (e.g. Todo, In progress, Done) and link issues.
- [ ] Use issue and PR templates when opening new issues/PRs.

For contribution guidelines, see [CONTRIBUTING.md](../CONTRIBUTING.md).
