# Release Guide — Khana Khazana iOS App

How to tag a version, write release notes, and create a GitHub release.

---

## 1. Tag version v1.0.0 (local)

Run from the **project root** with a clean working tree (commit or stash any changes first):

```bash
git checkout master
git pull origin master

# Create an annotated tag (recommended)
git tag -a v1.0.0 -m "Release v1.0.0 - Khana Khazana iOS app"

# Push the tag to the remote
git push origin v1.0.0
```

**Lightweight tag:** `git tag v1.0.0` then `git push origin v1.0.0`

---

## 2. Release notes template (v1.0.0)

Use this when creating the GitHub release. Adjust to match the release.

**Title:** `v1.0.0 — Khana Khazana Restaurant iOS App`

**Description:**

- **Features:** Authentication (sign up/login placeholders), menu browsing (SQLite), add to cart, final bill, account, About Us (web view). Swift 5, UIKit, iOS 13+.
- **Requirements:** Xcode 14+, iOS 13.0+, macOS for building.
- **Installation:** Clone, open `KhanaKhazana.xcodeproj`, select scheme and Simulator, Build and Run. See README and docs/setup.md.
- **Known issues:** Social login is placeholder; database.sqlite may need to be added for new clones; final bill does not submit to backend.
- **License:** MIT. See LICENSE.

---

## 3. Create the release on GitHub

1. Repo → **Releases** → **Draft a new release**.
2. **Tag:** Select or create `v1.0.0` (e.g. from `master`).
3. **Release title:** e.g. `v1.0.0 — Khana Khazana Restaurant iOS App`.
4. **Description:** Paste and edit the release notes above.
5. **Publish release**.

---

## 4. Optional: Release badge for README

```markdown
[![Release](https://img.shields.io/github/v/release/kartikrmathur/KhanaKhazanaRestaurentSwiftProject?include_prereleases&style=flat)](https://github.com/kartikrmathur/KhanaKhazanaRestaurentSwiftProject/releases)
```

Replace repo name if you renamed it.
