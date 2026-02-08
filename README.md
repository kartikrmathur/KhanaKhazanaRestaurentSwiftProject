# 🍽️ Khana Khazana Restaurant — iOS App

[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
[![iOS 13.0+](https://img.shields.io/badge/iOS-13.0+-blue.svg)](https://developer.apple.com/ios/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Xcode 14+](https://img.shields.io/badge/Xcode-14%2B-147EFB.svg)](https://developer.apple.com/xcode/)

A native **iOS restaurant ordering app** for Khana Khazana: browse the menu, add items to cart, and complete your order. Built with **Swift** and **UIKit** — no third‑party UI frameworks — and designed to showcase clean architecture and real-world iOS development.

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Screenshots](#-screenshots)
- [Tech Stack](#-tech-stack)
- [Prerequisites](#-prerequisites)
- [Installation](#-installation)
- [Usage](#-usage)
- [Project Structure](#-project-structure)
- [Documentation](#-documentation)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🎯 Overview

**Khana Khazana** is a full-featured iOS app that lets users:

- **Sign up and log in** — Create an account or sign in to manage profile and orders.
- **Browse the menu** — View dishes with names, prices, and images loaded from a local SQLite database.
- **Add to cart** — Select items and build an order.
- **Checkout** — Review the final bill before completing the order.
- **Learn about the restaurant** — About Us screen with web content from the restaurant’s site.

The app uses **SQLite** for menu and user data, **UIKit** for all UI, and follows standard iOS patterns (ViewControllers, segues, storyboards). It’s a solid portfolio piece that demonstrates Swift, UIKit, persistence, and app flow.

---

## ✨ Features

| Feature | Description |
|--------|-------------|
| 🔐 **Authentication** | Sign up, login, and placeholder flows for Google/Facebook/Instagram. |
| 📜 **Menu browsing** | List of dishes with name, price, and image from SQLite. |
| 🛒 **Cart** | Add items to cart from the menu and pass selection to the final bill screen. |
| 📄 **Final bill** | Review selected items before completing the order. |
| 👤 **Account & profile** | Account screen and user data handling via `UserDatabaseHandler`. |
| ℹ️ **About Us** | In-app web view for [khanakhazana.com](https://www.khanakhazana.com). |
| 📱 **Native iOS** | Built with Swift 5 and UIKit; runs on iPhone (iOS 13+). |

---

## 📸 Screenshots

_Add your own screenshots to the `screenshots/` folder and they will appear here. See [Screenshots Guide](docs/SCREENSHOTS_GUIDE.md) for naming and dimensions._

| Screen | Description |
|--------|-------------|
| **Home** | Landing screen with Sign Up and Login options. |
| **Login** | Email/username and password login. |
| **Menu** | List of dishes with add-to-cart actions. |
| **Cart / Order** | Selected items before checkout. |
| **Final Bill** | Order summary and final bill view. |
| **About Us** | Web view of the restaurant website. |

<!-- Placeholder rows — replace the image paths when you add real screenshots -->
<!--
| ![Home](screenshots/01-home.png) | Home screen |
| ![Login](screenshots/02-login.png) | Login screen |
| ![Menu](screenshots/03-menu.png) | Menu list |
| ![Cart](screenshots/04-cart.png) | Cart |
| ![Final Bill](screenshots/05-final-bill.png) | Final bill |
| ![About Us](screenshots/06-about-us.png) | About Us |
-->

---

## 🛠 Tech Stack

- **Language:** Swift 5.0
- **UI:** UIKit, Storyboards
- **Min. iOS:** 13.0+
- **Persistence:** SQLite3 (menu + user data)
- **Tools:** Xcode 14 or 15 (recommended)
- **Optional:** CocoaPods (e.g. for Facebook SDK if you enable it)

---

## 📌 Prerequisites

Before you run the project, ensure you have:

- **macOS** (Ventura or later recommended)
- **Xcode 14 or 15** from the [Mac App Store](https://apps.apple.com/app/xcode/id497799835) or [Apple Developer](https://developer.apple.com/download/)
- **iOS Simulator** or a physical **iPhone** with iOS 13+
- **Apple ID** (required only for running on a real device or distributing the app)

No CocoaPods or external dependencies are required for the default build.

---

## 🚀 Installation

### 1. Clone the repository

```bash
git clone https://github.com/kartikrmathur/KhanaKhazanaRestaurantSwiftProject.git
cd KhanaKhazanaRestaurantSwiftProject
```

### 2. Open in Xcode

```bash
open KhanaKhazana.xcodeproj
```

Or double-click `KhanaKhazana.xcodeproj` in Finder.

### 3. Select scheme and destination

- **Scheme:** `KhanaKhazana`
- **Destination:** Any **iPhone Simulator** (e.g. iPhone 15, iPhone 14)

### 4. Build and run

- **Product → Build** (⌘B)
- **Product → Run** (⌘R)

The app will launch in the Simulator. For a **physical device**, open the project → select the **KhanaKhazana** target → **Signing & Capabilities** → choose your **Team** and set a unique **Bundle Identifier** if needed (default: `com.khanakhazana.app`).

---

## 📱 Usage

1. **Launch** the app to see the Home screen (Sign Up / Login).
2. **Sign Up** or **Login** to reach the main flow (or use the segues as configured in the storyboard).
3. **Open the menu** to see dishes; tap **Add to cart** on items you want.
4. **Order Now** to go to the final bill screen with your selected items.
5. Use **Account** and **About Us** from the navigation as set up in your storyboard.

The app uses a bundled **database.sqlite** for menu data and can use **userdatabase.sqlite** for user data when that flow is enabled.

---

## 📁 Project Structure

```
KhanaKhazanaRestaurantSwiftProject/
├── KhanaKhazana.xcodeproj
├── App/
│   └── AppDelegate.swift
├── Controllers/
│   ├── Home/       # Home, root / add-dish
│   ├── Auth/       # Login
│   ├── Account/    # Account, user table, user DB VC
│   ├── Menu/       # Menu list, description, detail, options
│   ├── Cart/       # Final bill
│   ├── About/      # About Us
│   └── Other/      # Scroll, Fruits table
├── Views/          # Cells, custom TableView
├── Models/         # Menu item (file), User
├── Services/       # DatabaseHandler, UserDatabaseHandler
├── Supporting/     # Bridging header, Obj-C helpers
├── Tests/          # Unit tests
├── Base.lproj/     # Main.storyboard, LaunchScreen
├── Assets.xcassets
├── README.md
└── docs/           # Architecture, setup, screenshots, etc.
```

For a detailed breakdown and architecture, see [docs/architecture.md](docs/architecture.md) and [docs/setup.md](docs/setup.md). After file reorganization, see [docs/XCODE_UPDATE_GUIDE.md](docs/XCODE_UPDATE_GUIDE.md).

---

## 📚 Documentation

- **[Setup & troubleshooting](docs/setup.md)** — Prerequisites, installation, CocoaPods, signing, troubleshooting.
- **[Architecture](docs/architecture.md)** — MVC, data flow, database schema, navigation.
- **[Screenshots guide](docs/SCREENSHOTS_GUIDE.md)** — How to capture and add screenshots to this README.
- **[Repository rename](docs/REPOSITORY_RENAME.md)** — If you renamed the repo from `KhanaKhazanaRestaurentSwiftProject`, update your remote URL and clones.
- **[Xcode update (Day 2)](docs/XCODE_UPDATE_GUIDE.md)** — After file reorganization: verify build and optional navigator groups.

---

## 🤝 Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) for:

- Code style (Swift conventions)
- Commit message format (e.g. Conventional Commits)
- Pull request process and issue reporting

---

## 📄 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for the full text.

---

## ⭐ Show your support

If this project helps you or you use it in your portfolio, consider giving it a **star** on GitHub — it helps others find it and supports the author.

---

**Khana Khazana Restaurant iOS App** — Swift • UIKit • SQLite • iOS 13+
