# Day 2: File Organization Plan

Mapping of each source file to its new location and actions (move, rename, delete). Use this with the reorganization script and Xcode update steps.

---

## 1. Mapping table: Current file → New location → Action

| Current file | New location | Action |
|--------------|--------------|--------|
| AppDelegate.swift | App/AppDelegate.swift | Move |
| HomeViewController.swift | Controllers/Home/HomeViewController.swift | Move |
| ViewController.swift | Controllers/Home/ViewController.swift | Move |
| LoginViewController.swift | Controllers/Auth/LoginViewController.swift | Move |
| AccountViewController.swift | Controllers/Account/AccountViewController.swift | Move |
| UserTableViewController.swift | Controllers/Account/UserTableViewController.swift | Move |
| userDatabaseViewController.swift | Controllers/Account/UserDatabaseViewController.swift | Move + Rename |
| TableViewController.swift | Controllers/Menu/TableViewController.swift | Move |
| databaseViewController.swift | Controllers/Menu/databaseViewController.swift | Move |
| DescriptionViewController.swift | Controllers/Menu/DescriptionViewController.swift | Move |
| DetailViewController.swift | Controllers/Menu/DetailViewController.swift | Move |
| optionViewController.swift | Controllers/Menu/optionViewController.swift | Move |
| finalBillViewController.swift | Controllers/Cart/FinalBillViewController.swift | Move + Rename |
| AboutUsViewController.swift | Controllers/About/AboutUsViewController.swift | Move |
| ScrollViewController.swift | Controllers/Other/ScrollViewController.swift | Move |
| FruitsTableViewController.swift | Controllers/Other/FruitsTableViewController.swift | Move |
| TableViewCell.swift | Views/TableViewCell.swift | Move |
| TableView.swift | Views/TableView.swift | Move |
| CustomCollectionViewCell.swift | Views/CustomCollectionViewCell.swift | Move |
| MyCollectionViewCell.swift | Views/MyCollectionViewCell.swift | Move |
| UserTableViewCell.swift | Views/UserTableViewCell.swift | Move |
| file.swift | Models/file.swift | Move |
| user.swift | Models/User.swift | Move + Rename |
| DatabaseHandler.swift | Services/DatabaseHandler.swift | Move |
| UserDatabaseHandler.swift | Services/UserDatabaseHandler.swift | Move |
| KhanaKhazana-Bridging-Header.h | Supporting/KhanaKhazana-Bridging-Header.h | Move |
| NSMutableArray+test.h | Supporting/NSMutableArray+test.h | Move |
| NSMutableArray+test.m | Supporting/NSMutableArray+test.m | Move |
| khanakhazanaTests.swift | Tests/khanakhazanaTests.swift | Move |

**Not moved (stay at project root):** Base.lproj/, Assets.xcassets/, Info.plist, foodie.jpg, khanakhazana.entitlements, KhanaKhazana.xcodeproj/, README.md, LICENSE, .gitignore, docs/, screenshots/.

---

## 2. Files to delete (with reasons)

| File | Reason |
|------|--------|
| **file.temp_caseinsensitive_rename.swift** | Temporary/leftover file from a case rename; not referenced in the Xcode project. Safe to delete. |

**No other duplicates:** There is only one physical file for `finalBillViewController` (class `FinalBillViewController`), one for `user` (class `user`), and one for `userDatabaseViewController`. We are only renaming those files for convention, not removing duplicates.

---

## 3. Renames (filename only; class names unchanged for now)

- **userDatabaseViewController.swift** → **UserDatabaseViewController.swift** (file name; class remains `userDatabaseViewController` unless you refactor later).
- **finalBillViewController.swift** → **FinalBillViewController.swift** (matches class `FinalBillViewController`).
- **user.swift** → **User.swift** (Swift convention; class remains `user` unless you rename it later).

---

## 4. Summary

- **Move:** 28 files into App, Controllers/*, Views, Models, Services, Supporting, Tests.
- **Rename (file only):** 3 files (userDatabaseViewController, finalBillViewController, user).
- **Delete:** 1 file (file.temp_caseinsensitive_rename.swift).
- **Unchanged on disk:** Storyboards, assets, Info.plist, entitlements, project file, docs, README, LICENSE.

After running the reorganization script, you must **update the Xcode project** so file references use the new paths. See [XCODE_UPDATE_GUIDE.md](XCODE_UPDATE_GUIDE.md).
