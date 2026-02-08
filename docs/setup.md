# Setup & Troubleshooting — Khana Khazana iOS App

This guide covers installation, prerequisites, Xcode configuration, optional CocoaPods/Facebook SDK, and common errors.

---

## 1. Prerequisites

| Requirement | Version / notes |
|-------------|-----------------|
| **macOS** | Ventura 13+ (recommended); Xcode 14+ needs a compatible macOS. |
| **Xcode** | 14.0 or 15.x from [Mac App Store](https://apps.apple.com/app/xcode/id497799835) or [developer.apple.com](https://developer.apple.com/download/). |
| **iOS deployment target** | Set in the project (e.g. iOS 13.0+). |
| **Swift** | 5.0 (project setting). |
| **Apple ID** | Required only for running on a **physical device** or distributing the app; not needed for Simulator. |

No CocoaPods or Swift Package Manager dependencies are required for the default build.

---

## 2. Installation steps

### 2.1 Clone the repository

```bash
git clone https://github.com/kartikrmathur/KhanaKhazanaRestaurantSwiftProject.git
cd KhanaKhazanaRestaurantSwiftProject
```

If the repo is still named `KhanaKhazanaRestaurentSwiftProject`, use that URL; see [REPOSITORY_RENAME.md](REPOSITORY_RENAME.md) if you rename it.

### 2.2 Open in Xcode

```bash
open KhanaKhazana.xcodeproj
```

Or double-click `KhanaKhazana.xcodeproj` in Finder.

### 2.3 Select scheme and destination

- **Scheme:** `KhanaKhazana` (main app target).
- **Destination:** Any **iPhone Simulator** (e.g. iPhone 15, iPhone 14).

### 2.4 Build and run

- **Product → Build** (⌘B).
- **Product → Run** (⌘R).

The app should launch in the Simulator. On first launch, `AppDelegate` copies `database.sqlite` from the app bundle to the Documents directory if it isn’t already there.

---

## 3. Running on a physical device

1. Connect your iPhone and unlock it.
2. In Xcode: select the **KhanaKhazana** target → **Signing & Capabilities**.
3. Under **Signing**, choose your **Team** (Apple ID / developer account).
4. If you see “Failed to register bundle identifier”, change the **Bundle Identifier** to something unique (e.g. `com.yourname.khanakhazana`).
5. Select your device as the run destination and run (⌘R).
6. On the device: **Settings → General → VPN & Device Management** → trust your developer certificate if prompted.

---

## 4. Xcode configuration (optional)

- **Bridging header:** Already set to `Supporting/KhanaKhazana-Bridging-Header.h` (for Obj-C `NSMutableArray+test` and optional Facebook SDK).
- **Info.plist:** At project root; no extra config needed for basic run.
- **Capabilities:** The project may include an entitlements file (e.g. for push or Sign in with Apple); configure only if you use those features.

---

## 5. Database and first run

- **Menu data:** The app expects `database.sqlite` (menu table `file`) in the app’s Documents directory. On first launch, `DatabaseHandler.copyDatabaseIfNeeded()` copies it from the app bundle if the file doesn’t exist in Documents. If you removed `database.sqlite` from the repo (e.g. via .gitignore), ensure a copy is included in the app bundle for development, or add a sample DB and document its location (see README / this doc).
- **User data:** `userdatabase.sqlite` is used for user accounts; the app may create or copy it similarly. If you add a sample, place it in the bundle or document the setup.

---

## 6. Optional: CocoaPods (e.g. Facebook SDK)

The app can be extended with Facebook login. To add it via CocoaPods:

### 6.1 Install CocoaPods (if needed)

```bash
sudo gem install cocoapods
# or: brew install cocoapods
```

### 6.2 Create Podfile and install

In the **project root** (same level as `KhanaKhazana.xcodeproj`):

```bash
pod init
```

Edit `Podfile`: set the platform and add the SDK, e.g.:

```ruby
platform :ios, '13.0'
use_frameworks!

target 'KhanaKhazana' do
  pod 'FBSDKCoreKit'
  # pod 'FBSDKLoginKit'  # if you need login UI
end
```

Then:

```bash
pod install
```

### 6.3 Open workspace and re-enable SDK in code

- **Always open** `KhanaKhazana.xcworkspace` (not the `.xcodeproj`) when using CocoaPods.
- In **KhanaKhazana-Bridging-Header.h**, uncomment: `#import <FBSDKCoreKit/FBSDKCoreKit.h>`.
- In **AppDelegate**, uncomment the `FBSDKApplicationDelegate.sharedInstance().application(...)` line in `application(_:didFinishLaunchingWithOptions:)`.

---

## 7. Optional: Apple Pay / other capabilities

- **Apple Pay:** Add the capability in **Signing & Capabilities**, and configure in App Store Connect and your Apple Developer account.
- **Sign in with Apple:** Add the capability and implement the button and callback in the login flow.

---

## 8. Troubleshooting

### Build fails: “No such module” or missing Swift/Obj-C symbols

- Ensure you’re building the **KhanaKhazana** scheme (not Tests-only).
- If you use CocoaPods, open **`.xcworkspace`** and build again.
- **Clean:** Product → Clean Build Folder (⇧⌘K), then build.

### “Bridging header not found” or Obj-C not visible in Swift

- In the app target → **Build Settings** → search **Swift Bridging Header**.
- Value should be: `Supporting/KhanaKhazana-Bridging-Header.h` (relative to project root).

### Red/missing files in the Project Navigator

- After file reorganization (Day 2), file paths in the project were updated. If a file is still red, select it → File Inspector → **Location** and correct the path, or see [XCODE_UPDATE_GUIDE.md](XCODE_UPDATE_GUIDE.md).

### App crashes on launch or “database not found”

- The app copies `database.sqlite` from the bundle to Documents on first run. If the app bundle doesn’t contain `database.sqlite`, add it to the target’s **Copy Bundle Resources** (or restore it to the repo and ensure it’s in the target).
- Check the console for “DB does not exist in documents folder” or “Couldn’t copy file”; fix bundle/resource setup accordingly.

### Simulator is slow or unavailable

- In Xcode: **Window → Devices and Simulators** → Simulators; add or reset an iPhone simulator.
- Prefer a recent simulator (e.g. iPhone 15) for best compatibility.

### Signing errors on device

- “No signing certificate”: Add your Apple ID in Xcode **Settings → Accounts** and select a Team for the target.
- “Bundle identifier in use”: Change the bundle ID to a unique value (e.g. `com.yourname.khanakhazana`).

### “The operation couldn’t be completed” when running on device

- Ensure the device is trusted (Settings → General → VPN & Device Management).
- Restart the device and try again; re-select the development team and run again.

---

## 9. Quick reference

| Task | Command or action |
|------|-------------------|
| Clone | `git clone https://github.com/kartikrmathur/KhanaKhazanaRestaurantSwiftProject.git` |
| Open project | `open KhanaKhazana.xcodeproj` (or `.xcworkspace` if using Pods) |
| Build | ⌘B |
| Run | ⌘R |
| Clean | ⇧⌘K |
| Run tests | ⌘U |

For architecture and data flow, see [architecture.md](architecture.md).
