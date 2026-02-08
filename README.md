# KhanaKhazana Restaurant iOS App

iOS app for the KhanaKhazana restaurant: menu browsing, cart, and bill flow. Built with Swift and UIKit.

## Requirements

- **macOS** with **Xcode** (14 or 15 recommended)
- iOS deployment target is set by the project (defaults to current Xcode SDK)

## Opening and building the project

1. **Open in Xcode**  
   Double‑click `KhanaKhazana.xcodeproj` or in Terminal:
   ```bash
   open KhanaKhazana.xcodeproj
   ```

2. **Select scheme and run destination**  
   - Scheme: **KhanaKhazana**  
   - Run destination: pick an **iPhone Simulator** (e.g. iPhone 15) to build and run without any signing setup  

3. **Build and run**  
   - **Product → Build** (⌘B)  
   - **Product → Run** (⌘R)  

**Running on a physical device or distributing the app:**  
You must set up code signing: select the **KhanaKhazana** target → **Signing & Capabilities** → choose your **Team** (Apple ID / Developer account). Change the **Bundle Identifier** if needed (default: `com.khanakhazana.app`). This step is not required for the Simulator.

## Project layout (added for building)

- **KhanaKhazana.xcodeproj** – Xcode project (targets, build phases, settings)
- **xcshareddata/xcschemes/KhanaKhazana.xcscheme** – shared scheme for build/run/test
- **KhanaKhazana-Bridging-Header.h** – bridging header (Facebook SDK import commented out so the app builds without it)
- **AppDelegate** – Facebook SDK call commented out; uncomment when you add the SDK
- **FinalBillViewController** – class renamed from `finalBillViewController` to `FinalBillViewController` and `arrSelectedData` added so the storyboard and cart handoff work

## Optional: Facebook SDK

To re‑enable Facebook login:

1. Add the Facebook SDK (e.g. CocoaPods: `pod 'FacebookCore'` / `FBSDKCoreKit`).
2. In **KhanaKhazana-Bridging-Header.h**, uncomment:  
   `#import <FBSDKCoreKit/FBSDKCoreKit.h>`
3. In **AppDelegate.swift**, uncomment the  
   `FBSDKApplicationDelegate.sharedInstance().application(...)` line in `application(_:didFinishLaunchingWithOptions:)`.

## Notes

- The app uses a bundled **database.sqlite** (menu data) and stores dish images in the app Documents directory.
- **userdatabase.sqlite** is used for user data when that flow is implemented.
