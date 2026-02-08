# Architecture — Khana Khazana iOS App

This document describes the app’s architecture, project structure, data flow, and main components.

---

## 1. Architecture pattern: MVC

The app follows **Model–View–Controller (MVC)**:

- **Models** — Data types and domain objects (e.g. menu item, user). No UI.
- **Views** — UI (storyboards, cells, custom views). No business logic.
- **Controllers** — View controllers: bind views to models, handle user input, call services.

There is no separate ViewModel layer; controllers talk directly to **Services** (database handlers), which read/write SQLite and return model objects.

```
┌─────────────────────────────────────────────────────────────────┐
│                         PRESENTATION                              │
│  ┌──────────────┐    ┌─────────────────────┐    ┌────────────┐  │
│  │    View      │◄──►│    Controller       │───►│   Model    │  │
│  │ (Storyboard, │    │ (ViewController)    │    │ (file,     │  │
│  │  Cells)      │    │ - Outlets/Actions   │    │  user)     │  │
│  └──────────────┘    │ - tableList, etc.   │    └─────┬──────┘  │
│                      └──────────┬──────────┘          │         │
└─────────────────────────────────┼──────────────────────┼─────────┘
                                  │                      │
                                  ▼                      │
┌─────────────────────────────────────────────────────────┼─────────┐
│                         SERVICES                         │         │
│  ┌─────────────────────┐  ┌─────────────────────────┐  │         │
│  │   DatabaseHandler    │  │  UserDatabaseHandler    │  │         │
│  │   - openDatabase()  │  │  - openDatabase()      │  │         │
│  │   - selectUserData()│  │  - selectUserNameData()│  │         │
│  │   - Select(id)      │  │  - Select(id)           │  │         │
│  └──────────┬──────────┘  └────────────┬────────────┘  │         │
└─────────────┼──────────────────────────┼───────────────┼─────────┘
              │                          │               │
              ▼                          ▼               │
┌─────────────────────────────────────────────────────────────────┐
│                      PERSISTENCE (SQLite)                         │
│   database.sqlite (menu: file)   userdatabase.sqlite (user)      │
└─────────────────────────────────────────────────────────────────┘
```

---

## 2. Project structure and layers

On-disk layout (after Day 2 reorganization):

| Layer / folder   | Contents |
|-----------------|----------|
| **App**         | `AppDelegate` — launch, copies DB from bundle to Documents if needed. |
| **Controllers/**| View controllers by feature: Home, Auth, Account, Menu, Cart, About, Other. |
| **Views/**      | Custom cells (`TableViewCell`, `UserTableViewCell`, etc.) and custom `TableView`. |
| **Models/**     | `file` (menu item), `user` (user profile). |
| **Services/**   | `DatabaseHandler` (menu DB), `UserDatabaseHandler` (user DB). |
| **Supporting/** | Bridging header, Obj-C helpers. |
| **Tests/**      | Unit tests. |
| **Resources**   | `Base.lproj` (storyboards), `Assets.xcassets`, `Info.plist`, entitlements (at root). |

Controllers own their screen’s logic; they hold arrays of models (e.g. `tableList: [file]`) and call service methods to load/save data.

---

## 3. Data flow

### 3.1 App launch and database setup

```
App launch
    → AppDelegate.application(didFinishLaunchingWithOptions:)
    → DatabaseHandler.copyDatabaseIfNeeded()
        → If database.sqlite not in Documents: copy from Bundle to Documents
    → Window shows initial VC (from Main.storyboard)
```

### 3.2 Menu list (TableViewController)

```
User opens Menu
    → TableViewController.viewWillAppear
    → db = databaseHandler.openDatabase()        // Documents/database.sqlite
    → tableList = databaseHandler.selectUserData(dbPointer:)  // SELECT from file
    → tableView reloads; cellForRow uses tableList[indexPath.row] (file)
```

### 3.3 Add to cart and final bill

```
User taps "Add to cart" on a row
    → arrSelectedData.add(tableList[tag])

User taps "Order Now"
    → Instantiate FinalBillViewController (storyboard ID: FinalBillViewController)
    → desc.arrSelectedData = arrSelectedData
    → navigationController?.pushViewController(desc)
```

Data flows **UI → Controller → (Controller holds cart) → FinalBillViewController**. No service call for the cart; it’s in-memory.

### 3.4 Dish detail (DescriptionViewController)

```
User taps a row
    → didSelectRowAt: recordId = fileData.id
    → Instantiate DescriptionViewController, set recordId
    → pushViewController(desc)
    → DescriptionViewController loads: databaseHandler.Select(dbPointer:, searchId: recordId)
```

### 3.5 User data

```
UserDatabaseHandler
    → userdatabase.sqlite in Documents
    → selectUserNameData(dbPointer:) → [user]
    → Used by UserTableViewController and related flows
```

---

## 4. Major components and responsibilities

| Component | Responsibility |
|-----------|----------------|
| **AppDelegate** | Launch; copy `database.sqlite` from bundle to Documents if needed. |
| **HomeViewController** | Home screen; segues to Sign Up or Login. |
| **ViewController** (Home) | Add-dish flow; uses `DatabaseViewController` and `tableList` of `file`. |
| **LoginViewController** | Login UI; segue to Account. |
| **AccountViewController** | Account screen; segues to Table (menu) or Scroll. |
| **TableViewController** | Menu list; loads menu via `DatabaseHandler`, manages `arrSelectedData` (cart), navigates to Description or FinalBill. |
| **DescriptionViewController** | Single dish detail; loads one record by id via `DatabaseHandler.Select`. |
| **FinalBillViewController** | Receives `arrSelectedData`; shows order summary (cart). |
| **AboutUsViewController** | Web view for khanakhazana.com. |
| **DatabaseHandler** | Open/copy `database.sqlite`; `selectUserData()` (all menu rows); `Select(dbPointer:, searchId:)` (one row). |
| **UserDatabaseHandler** | Open/copy `userdatabase.sqlite`; select/insert user data. |
| **file** (model) | Menu item: id, dishname, cost, filename. |
| **user** (model) | User: id, username, password, name, fathersName, mothersName, phoneNo, emailId, address, photo. |

---

## 5. Navigation overview

Navigation is **storyboard-driven** (segues) plus **programmatic push** where the next VC is instantiated and configured before push.

| From | To | How |
|------|-----|-----|
| Home | Sign Up | segue `signupSegue` |
| Home | Login | segue `LoginViewSegue` |
| Login | Account | segue `AccountViewSegue` |
| Account | Menu (table) | segue `TableViewSegue` |
| Account | Scroll | segue `ScrollViewSegue` |
| Menu | Add-dish (ViewController) | segue `viewControllerSegue` |
| Menu | Final bill | `instantiateViewController("FinalBillViewController")`, set `arrSelectedData`, then `pushViewController` |
| Menu | Dish detail | `instantiateViewController("descriptionctrl")`, set `recordId`, then `pushViewController` |
| Option | About Us | segue `AboutUSSegue` |

```
                    ┌─────────────┐
                    │    Home     │
                    └──────┬──────┘
              signupSegue  │  LoginViewSegue
                    ┌──────▼──────┐
                    │    Login    │
                    └──────┬──────┘
                    AccountViewSegue
                    ┌──────▼──────┐     TableViewSegue    ┌─────────────┐
                    │   Account   │──────────────────────►│ Menu (Table)│
                    └──────┬──────┘                        └──────┬──────┘
                    ScrollViewSegue                               │
                    ┌──────▼──────┐              pushViewController
                    │   Scroll    │              (FinalBill / Description)
                    └─────────────┘                        ┌──────▼──────┐
                                                          │ Final Bill  │
                                                          │ or Detail   │
                                                          └─────────────┘
```

---

## 6. Database schema

### 6.1 Menu database: `database.sqlite`

**Table: `file`** (menu items)

| Column   | Type    | Description |
|----------|---------|-------------|
| id       | INTEGER | Primary key (AUTOINCREMENT) |
| dishname | TEXT    | Dish name |
| cost     | TEXT    | Price/cost |
| filename | TEXT    | Image filename (stored in app Documents) |

Used by: `DatabaseHandler`, `TableViewController`, `DescriptionViewController`, add-dish flow.

### 6.2 User database: `userdatabase.sqlite`

**Table: `user`**

| Column      | Type    | Description |
|-------------|---------|-------------|
| id          | INTEGER | Primary key |
| username    | TEXT    | |
| password    | TEXT    | |
| name        | TEXT    | |
| fathersname | TEXT    | |
| mothersname | TEXT    | |
| phoneNo     | TEXT    | |
| emailId     | TEXT    | |
| address     | TEXT    | |
| photo       | TEXT    | Photo filename |

Used by: `UserDatabaseHandler`, user-management and account screens.

---

## 7. Code examples

### Controller using a service and model

```swift
// TableViewController (simplified)
var databaseHandler = DatabaseHandler()
var tableList = [file]()

override func viewWillAppear(_ animated: Bool) {
    db = databaseHandler.openDatabase()
    tableList = databaseHandler.selectUserData(dbPointer: db!) as! [file]
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    let file = tableList[indexPath.row]
    cell.lblDishName.text = file.dishname
    cell.lblCost.text = file.cost
    // ...
}
```

### Passing data to the next screen

```swift
// TableViewController → FinalBillViewController
@IBAction func btnOrderNow(_ sender: UIButton) {
    let desc = storyboard?.instantiateViewController(withIdentifier: "FinalBillViewController") as! FinalBillViewController
    desc.arrSelectedData = arrSelectedData
    navigationController?.pushViewController(desc, animated: true)
}
```

---

## 8. Summary

- **Pattern:** MVC with Controllers calling Services (database handlers) and holding Models.
- **Data flow:** UI events → Controller → Service → SQLite; results as model arrays or single model.
- **Navigation:** Segues for simple flows; programmatic instantiate + push when passing cart or record ID.
- **Persistence:** Two SQLite DBs (menu + user); menu DB copied from bundle to Documents on first launch.

For setup and run instructions, see [setup.md](setup.md).
