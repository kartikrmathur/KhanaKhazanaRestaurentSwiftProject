# Unit tests — Khana Khazana iOS App

The project includes XCTest-based unit tests for models and a basic sanity check for `DatabaseHandler`.

---

## Test structure

| Test class | What it tests |
|------------|----------------|
| **UserModelTests** | `user` model: init with all fields, init with nil fields. |
| **MenuItemModelTests** | `file` (menu item) model: init with all fields, init with nil. |
| **DatabaseHandlerTests** | Handler instantiation; `copyDatabaseIfNeeded()` does not crash. |

Tests follow **AAA** (Arrange, Act, Assert). No UI or real database required for model tests.

---

## Run tests locally

**In Xcode:** **Product → Test** (⌘U), or click the diamond next to a test.

**Command line:**

```bash
xcodebuild test -scheme KhanaKhazana \
  -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' \
  -configuration Debug \
  CODE_SIGN_IDENTITY="-" \
  CODE_SIGNING_REQUIRED=NO
```

---

## Module name

Tests use `@testable import KhanaKhazana`. If your app target’s module name is different (e.g. `khanakhazana`), change the import in `Tests/khanakhazanaTests.swift` to match.

---

## CI

GitHub Actions runs build and tests on push/PR to `master` or `main`. See [.github/workflows/ios.yml](../.github/workflows/ios.yml).
