# Screenshots Guide — Khana Khazana iOS App

This guide tells you **which screens to capture**, **how to name and store them**, and **how to display them in the README**.

---

## Folder structure

Put all app screenshots in the **`screenshots/`** folder at the project root:

```
KhanaKhazanaRestaurantSwiftProject/
├── README.md
├── screenshots/           ← All screenshot images go here
│   ├── 01-home.png
│   ├── 02-login.png
│   ├── 03-menu.png
│   ├── 04-cart.png
│   ├── 05-final-bill.png
│   └── 06-about-us.png
├── docs/
│   └── SCREENSHOTS_GUIDE.md  (this file)
└── ...
```

**Create the folder if it doesn’t exist:**

```bash
mkdir screenshots
```

---

## Naming convention

Use this pattern so order and purpose are clear:

| Pattern | Example | Use |
|--------|--------|-----|
| `NN-short-name.png` | `01-home.png` | Number (01–06), lowercase, hyphen-separated, `.png` |

**Rules:**

- **Number:** Two digits (`01`, `02`, … `06`) so files sort correctly.
- **Name:** Short, lowercase, no spaces (e.g. `home`, `login`, `menu`, `final-bill`).
- **Format:** `.png` recommended (sharp for UI; use `.jpg` only if you need smaller size).

**Do not:** Use spaces, capitals, or long names (e.g. avoid `Home Screen.png`, `login_screen_final.jpg`).

---

## Recommended resolution and dimensions

- **Device:** Capture on **iPhone 14** or **iPhone 15** Simulator (or equivalent device) so the app looks current.
- **Logical size (points):** 390×844 (iPhone 14/15).
- **Pixel size (@3x):** Up to **1170×2532 px** is fine for full-screen.
- **For README:** To keep repo and load time small, **resize to max width 390–500 px** (height scales). You can keep one “hero” screenshot at full size if you want.

**In Simulator:**  
**File → New Screen Shot** (⌘S) saves at full resolution. Resize with Preview (macOS) or another tool before committing if you want smaller files.

---

## Numbered checklist: screens to capture

Capture **at least these 6 screens** in this order:

| # | Filename | Screen to capture | How to get there |
|---|----------|-------------------|-------------------|
| 1 | `01-home.png` | **Home** — landing with Sign Up / Login | Launch app (initial screen). |
| 2 | `02-login.png` | **Login** — email/username and password fields | From Home, tap Login (or the segue that shows the login screen). |
| 3 | `03-menu.png` | **Menu** — list of dishes with Add to cart | After login (or via your storyboard flow), open the menu / table of dishes. |
| 4 | `04-cart.png` | **Cart** — selected items (optional if same as menu) | Add a few items from the menu; if you have a dedicated cart screen, open it. Otherwise use menu with items selected. |
| 5 | `05-final-bill.png` | **Final bill** — order summary | From menu, add items → tap “Order Now” to reach FinalBillViewController. |
| 6 | `06-about-us.png` | **About Us** — web view (khanakhazana.com) | Navigate to About Us from your app’s navigation. |

**Optional 7th screenshot:** Account/Profile screen (e.g. `07-account.png`) if you want to highlight that flow.

---

## How to capture in Xcode Simulator

1. **Run the app** in the iPhone 14 or 15 Simulator (⌘R).
2. **Navigate** to the screen you want.
3. **Take screenshot:** Simulator menu **File → Save Screen** (or **⌘S**).  
   - Image is saved on Desktop by default (e.g. `Simulator Screen Shot - iPhone 15 - 2024-01-15 at 12.00.00.png`).
4. **Rename** to the convention above (e.g. `01-home.png`).
5. **Resize (optional):** Open in Preview → Tools → Adjust Size → set width to 390–500 px.
6. **Move** the file into the project’s **`screenshots/`** folder.

---

## How to reference screenshots in the README

Once the files are in `screenshots/`, use this Markdown in **README.md** in the **Screenshots** section.

**Option A — Table with thumbnails and descriptions:**

```markdown
## 📸 Screenshots

| Screen | Description |
|--------|-------------|
| ![Home](screenshots/01-home.png) | **Home** — Sign Up and Login. |
| ![Login](screenshots/02-login.png) | **Login** — Email and password. |
| ![Menu](screenshots/03-menu.png) | **Menu** — Dishes with Add to cart. |
| ![Cart](screenshots/04-cart.png) | **Cart** — Selected items. |
| ![Final Bill](screenshots/05-final-bill.png) | **Final bill** — Order summary. |
| ![About Us](screenshots/06-about-us.png) | **About Us** — Restaurant web view. |
```

**Option B — One row of thumbnails, then captions:**

```markdown
## 📸 Screenshots

<p align="center">
  <img src="screenshots/01-home.png" width="19%" />
  <img src="screenshots/02-login.png" width="19%" />
  <img src="screenshots/03-menu.png" width="19%" />
  <img src="screenshots/04-cart.png" width="19%" />
  <img src="screenshots/05-final-bill.png" width="19%" />
  <img src="screenshots/06-about-us.png" width="19%" />
</p>
<p align="center">
  <em>Home · Login · Menu · Cart · Final bill · About Us</em>
</p>
```

**Option C — List with links (no inline images):**

```markdown
## 📸 Screenshots

- [Home](screenshots/01-home.png)
- [Login](screenshots/02-login.png)
- [Menu](screenshots/03-menu.png)
- [Cart](screenshots/04-cart.png)
- [Final Bill](screenshots/05-final-bill.png)
- [About Us](screenshots/06-about-us.png)
```

Replace the current placeholder table and comment block in **README.md** with one of the options above (Option A matches the style already suggested in the README).

---

## Quick checklist

- [ ] Create `screenshots/` folder in the project root.
- [ ] Run app in Simulator (iPhone 14 or 15).
- [ ] Capture **01-home.png** (Home).
- [ ] Capture **02-login.png** (Login).
- [ ] Capture **03-menu.png** (Menu).
- [ ] Capture **04-cart.png** (Cart or menu with items).
- [ ] Capture **05-final-bill.png** (Final bill).
- [ ] Capture **06-about-us.png** (About Us).
- [ ] Optionally resize images (e.g. max width 390–500 px).
- [ ] Copy the chosen Markdown block from above into README.md (Screenshots section).
- [ ] Commit: `git add screenshots/ README.md && git commit -m "docs: add app screenshots and update README"`.

Done. Your repo will look professional and show the app at a glance.
