# Day 2: iOS Folder Structure — Khana Khazana

This document defines the target directory layout (MVC-oriented, with feature-friendly grouping) and how it maps to the Xcode project.

---

## 1. Folder tree

```
KhanaKhazanaRestaurentSwiftProject/   (or KhanaKhazanaRestaurantSwiftProject)
├── App/
│   └── AppDelegate.swift
├── Controllers/
│   ├── Home/
│   │   ├── HomeViewController.swift
│   │   └── ViewController.swift              # Root / add-dish flow
│   ├── Auth/
│   │   └── LoginViewController.swift
│   ├── Account/
│   │   ├── AccountViewController.swift
│   │   ├── UserTableViewController.swift
│   │   └── UserDatabaseViewController.swift  # was userDatabaseViewController.swift
│   ├── Menu/
│   │   ├── TableViewController.swift         # Menu list + cart
│   │   ├── databaseViewController.swift
│   │   ├── DescriptionViewController.swift
│   │   ├── DetailViewController.swift
│   │   └── optionViewController.swift
│   ├── Cart/
│   │   └── FinalBillViewController.swift     # was finalBillViewController.swift
│   ├── About/
│   │   └── AboutUsViewController.swift
│   └── Other/
│       ├── ScrollViewController.swift
│       └── FruitsTableViewController.swift
├── Views/
│   ├── TableViewCell.swift
│   ├── TableView.swift                       # Custom UITableView subclass
│   ├── CustomCollectionViewCell.swift
│   ├── MyCollectionViewCell.swift
│   └── UserTableViewCell.swift
├── Models/
│   ├── file.swift                            # Menu item model (dishname, cost, etc.)
│   └── User.swift                            # was user.swift
├── Services/
│   ├── DatabaseHandler.swift
│   └── UserDatabaseHandler.swift
├── Supporting/
│   ├── KhanaKhazana-Bridging-Header.h
│   ├── NSMutableArray+test.h
│   └── NSMutableArray+test.m
├── Resources/                                # Optional group; can stay at root
│   ├── Base.lproj/
│   │   ├── Main.storyboard
│   │   └── LaunchScreen.storyboard
│   ├── Assets.xcassets/
│   ├── Info.plist
│   ├── foodie.jpg
│   └── khanakhazana.entitlements
├── Tests/
│   └── khanakhazanaTests.swift
├── docs/
├── screenshots/
├── KhanaKhazana.xcodeproj/
├── README.md
└── LICENSE
```

For **Day 2 we do not move** `Base.lproj`, `Assets.xcassets`, `Info.plist`, `foodie.jpg`, or `khanakhazana.entitlements` into a `Resources/` folder, so the Xcode project keeps pointing at the current paths. Only source files (Swift, .h, .m) are moved.

---

## 2. Purpose of each directory

| Directory      | Purpose |
|----------------|--------|
| **App**        | App lifecycle and entry point (e.g. `AppDelegate`). |
| **Controllers**| View controllers, grouped by feature: Home, Auth, Account, Menu, Cart, About, Other. |
| **Views**      | Custom UI subclasses (cells, custom table/collection views). |
| **Models**     | Data models (e.g. menu item, user). |
| **Services**   | Data and business logic (database handlers, API, etc.). |
| **Supporting** | Bridging headers, Obj-C categories, and other non-feature support files. |
| **Tests**      | Unit and UI tests. |
| **Resources**  | (Optional) Storyboards, assets, plists, entitlements; can stay at root to avoid path churn. |

---

## 3. Commands to create directories (PowerShell)

Run from the **project root** (where `KhanaKhazana.xcodeproj` lives):

```powershell
New-Item -ItemType Directory -Force -Path App
New-Item -ItemType Directory -Force -Path Controllers
New-Item -ItemType Directory -Force -Path Controllers/Home
New-Item -ItemType Directory -Force -Path Controllers/Auth
New-Item -ItemType Directory -Force -Path Controllers/Account
New-Item -ItemType Directory -Force -Path Controllers/Menu
New-Item -ItemType Directory -Force -Path Controllers/Cart
New-Item -ItemType Directory -Force -Path Controllers/About
New-Item -ItemType Directory -Force -Path Controllers/Other
New-Item -ItemType Directory -Force -Path Views
New-Item -ItemType Directory -Force -Path Models
New-Item -ItemType Directory -Force -Path Services
New-Item -ItemType Directory -Force -Path Supporting
New-Item -ItemType Directory -Force -Path Tests
```

One-liner:

```powershell
@("App","Controllers","Controllers/Home","Controllers/Auth","Controllers/Account","Controllers/Menu","Controllers/Cart","Controllers/About","Controllers/Other","Views","Models","Services","Supporting","Tests") | ForEach-Object { New-Item -ItemType Directory -Force -Path $_ }
```

---

## 4. Convention

- **Controllers** use subfolders by feature (Home, Menu, Cart, etc.) for clarity; the app remains MVC.
- **One main type per file** (e.g. one view controller per file, one model per file).
- **Filenames** match type names where possible (e.g. `FinalBillViewController.swift`, `User.swift`).

Next: [FILE_ORGANIZATION_PLAN.md](FILE_ORGANIZATION_PLAN.md) for the exact file → folder mapping and delete list.
