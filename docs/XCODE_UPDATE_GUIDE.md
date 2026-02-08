# Day 2: Xcode Project Update Guide

After running the file reorganization script, the **project.pbxproj** has been updated so that file references point to the new paths (App/, Controllers/, Views/, Models/, Services/, Supporting/, Tests/). This guide explains what was done and how to verify or fix things in Xcode.

---

## What was done automatically

1. **File moves** — All Swift, .h, and .m files were moved with `git mv` into the new folder structure (see [FILE_ORGANIZATION_PLAN.md](FILE_ORGANIZATION_PLAN.md)).
2. **project.pbxproj** — Each `PBXFileReference` path was updated to the new relative path (e.g. `path = "Controllers/Menu/TableViewController.swift"`).
3. **Bridging header** — `SWIFT_BRIDGING_HEADER` was set to `Supporting/KhanaKhazana-Bridging-Header.h`.
4. **Temp file** — `file.temp_caseinsensitive_rename.swift` was deleted (it was not in the Xcode project).

You do **not** need to remove and re-add files in Xcode if you use the updated project file. Just open the project and build.

---

## Verification steps in Xcode

1. **Open the project**  
   Open `KhanaKhazana.xcodeproj` in Xcode.

2. **Check the Project Navigator**  
   - File references may still appear under the old group names (ViewControllers, Models, Database, etc.) in the navigator.  
   - The **physical location** on disk is the new structure (App/, Controllers/, etc.).  
   - If any file shows in **red**, it is missing: check that the path in the project matches the actual path (see “If a file is red” below).

3. **Build**  
   - **Product → Build** (⌘B).  
   - Fix any “file not found” errors by correcting the path for that file reference in the File Inspector (right-hand panel) or in project.pbxproj.

4. **Run**  
   - **Product → Run** (⌘R) on the iPhone Simulator.  
   - Confirm the app launches and that navigation (e.g. menu, cart, final bill) still works.

5. **Run tests**  
   - **Product → Test** (⌘U).  
   - Ensure `Tests/khanakhazanaTests.swift` is found and tests run.

---

## Optional: Reorganize groups in the Project Navigator

The **on-disk** layout is already organized. If you want the **navigator groups** to mirror the folders:

1. **Create groups** (right-click project → New Group):  
   `App`, `Controllers`, `Views`, `Models`, `Services`, `Supporting`, `Tests`.
2. **Create sub-groups** under `Controllers`:  
   `Home`, `Auth`, `Account`, `Menu`, `Cart`, `About`, `Other`.
3. **Drag** the existing file references into the matching groups.  
   This only changes the navigator; it does not move files again if paths are already correct.

Alternatively, leave the existing logical groups (ViewControllers, Models, Database, etc.); the project will still build as long as the file **paths** in the project point to the new locations.

---

## If a file appears red (missing)

1. Select the red file in the Project Navigator.
2. Open the **File Inspector** (right panel, first tab).
3. Under **Location**, check **Relative to Project** and the path (e.g. `Controllers/Menu/TableViewController.swift`).
4. If the path is wrong, click the folder icon and select the correct file on disk, or edit `project.pbxproj` and set the correct `path = "..."` for that file reference.

---

## Storyboard and class names

Storyboards reference view controllers by **class name** (e.g. `FinalBillViewController`), not by file path. The class name did not change; only the file was moved and renamed to `FinalBillViewController.swift`. No storyboard updates are required for the reorganization.

---

## Summary

| Step              | Status |
|-------------------|--------|
| Create folders    | Done (script) |
| Move files (git mv) | Done (script) |
| Update project.pbxproj paths | Done |
| Update bridging header path | Done |
| Delete temp file  | Done |
| Verify in Xcode (build & run) | You do this |

After verification, commit the changes (including `project.pbxproj` and the new docs) and push.
