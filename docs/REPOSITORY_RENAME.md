# Repository rename: KhanaKhazanaRestaurentSwiftProject → KhanaKhazanaRestaurantSwiftProject

This guide explains how to rename the GitHub repository (fixing the typo **Restaurent** → **Restaurant**) and what to do about existing clones.

---

## Why rename?

- **Spelling:** "Restaurant" is correct; "Restaurent" is a typo.
- **Portfolio:** A correct name looks more professional to recruiters and hiring managers.
- **Discoverability:** People searching for "restaurant" won’t find "restaurent."

---

## Step-by-step: Rename on GitHub

1. **Open the repository** on GitHub:  
   `https://github.com/kartikrmathur/KhanaKhazanaRestaurentSwiftProject`

2. **Go to Settings**  
   - Click **Settings** in the repository’s top tab bar (not your profile settings).

3. **Rename the repository**  
   - In the **General** section, find **Repository name**.
   - Change:
     - **From:** `KhanaKhazanaRestaurentSwiftProject`
     - **To:** `KhanaKhazanaRestaurantSwiftProject`
   - Click **Rename**.

4. **Confirm**  
   - GitHub may ask you to type the new name to confirm. Do that and confirm.

5. **Result**  
   - The repo URL becomes:  
     `https://github.com/kartikrmathur/KhanaKhazanaRestaurantSwiftProject`  
   - Old URL will redirect to the new one, but **clones and remotes that use the old URL will break** until they are updated (see below).

---

## ⚠️ Breaking change for existing clones

Renaming the repo **breaks**:

- **Existing clone URLs** — Any copy of the repo that was cloned with the old name.
- **Remote `origin`** — `git remote -v` will still show the old URL; fetch/push will fail until you update it.

**What still works:**

- **GitHub redirects** — Visits to the old URL (e.g. in browser or shared links) are redirected to the new repo. Bookmarks and shared links will still open the right place.
- **Repo contents** — Commits, issues, PRs, and stars are unchanged.

---

## What to do after renaming (on each machine that has a clone)

Run these in your **local clone** (the folder where you have the project):

```bash
# 1. See current remote (will show old URL)
git remote -v

# 2. Update origin to the new repository URL
git remote set-url origin https://github.com/kartikrmathur/KhanaKhazanaRestaurantSwiftProject.git

# 3. Confirm
git remote -v
git fetch origin
```

If you use **SSH**:

```bash
git remote set-url origin git@github.com:kartikrmathur/KhanaKhazanaRestaurantSwiftProject.git
git fetch origin
```

After this, `git pull`, `git push`, and `git fetch` will use the new name.

**Optional:** Rename your **local folder** to match (e.g. from `KhanaKhazanaRestaurentSwiftProject` to `KhanaKhazanaRestaurantSwiftProject`). This is cosmetic and does not affect Git.

---

## Documentation updates (already done in this repo)

The following have been updated to use **KhanaKhazanaRestaurantSwiftProject**:

- **README.md** — Clone URL, `cd` command, and project structure tree.
- **docs/SCREENSHOTS_GUIDE.md** — Folder structure diagram.

After you rename on GitHub, commit and push these changes so the README matches the actual repo name.

---

## Checklist

- [ ] Rename repository on GitHub (Settings → Repository name).
- [ ] On each existing clone: `git remote set-url origin <new-url>` and `git fetch`.
- [ ] (Optional) Rename local project folder to `KhanaKhazanaRestaurantSwiftProject`.
- [ ] Update any CI/CD, links, or scripts that reference the old repo URL.
