# Day 2: File Reorganization Script
# Run from project root (parent of KhanaKhazana.xcodeproj).
# Creates folder structure, moves files with git mv (preserves history), deletes temp file.

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot + "\.."
Set-Location $root

# 1. Create directory structure
$dirs = @(
    "App",
    "Controllers", "Controllers/Home", "Controllers/Auth", "Controllers/Account",
    "Controllers/Menu", "Controllers/Cart", "Controllers/About", "Controllers/Other",
    "Views", "Models", "Services", "Supporting", "Tests"
)
foreach ($d in $dirs) {
    New-Item -ItemType Directory -Force -Path $d | Out-Null
    Write-Host "Created: $d"
}

# 2. Move files (git mv to preserve history)
$moves = @(
    @("AppDelegate.swift", "App/AppDelegate.swift"),
    @("HomeViewController.swift", "Controllers/Home/HomeViewController.swift"),
    @("ViewController.swift", "Controllers/Home/ViewController.swift"),
    @("LoginViewController.swift", "Controllers/Auth/LoginViewController.swift"),
    @("AccountViewController.swift", "Controllers/Account/AccountViewController.swift"),
    @("UserTableViewController.swift", "Controllers/Account/UserTableViewController.swift"),
    @("userDatabaseViewController.swift", "Controllers/Account/UserDatabaseViewController.swift"),
    @("TableViewController.swift", "Controllers/Menu/TableViewController.swift"),
    @("databaseViewController.swift", "Controllers/Menu/databaseViewController.swift"),
    @("DescriptionViewController.swift", "Controllers/Menu/DescriptionViewController.swift"),
    @("DetailViewController.swift", "Controllers/Menu/DetailViewController.swift"),
    @("optionViewController.swift", "Controllers/Menu/optionViewController.swift"),
    @("finalBillViewController.swift", "Controllers/Cart/FinalBillViewController.swift"),
    @("AboutUsViewController.swift", "Controllers/About/AboutUsViewController.swift"),
    @("ScrollViewController.swift", "Controllers/Other/ScrollViewController.swift"),
    @("FruitsTableViewController.swift", "Controllers/Other/FruitsTableViewController.swift"),
    @("TableViewCell.swift", "Views/TableViewCell.swift"),
    @("TableView.swift", "Views/TableView.swift"),
    @("CustomCollectionViewCell.swift", "Views/CustomCollectionViewCell.swift"),
    @("MyCollectionViewCell.swift", "Views/MyCollectionViewCell.swift"),
    @("UserTableViewCell.swift", "Views/UserTableViewCell.swift"),
    @("file.swift", "Models/file.swift"),
    @("user.swift", "Models/User.swift"),
    @("DatabaseHandler.swift", "Services/DatabaseHandler.swift"),
    @("UserDatabaseHandler.swift", "Services/UserDatabaseHandler.swift"),
    @("KhanaKhazana-Bridging-Header.h", "Supporting/KhanaKhazana-Bridging-Header.h"),
    @("NSMutableArray+test.h", "Supporting/NSMutableArray+test.h"),
    @("NSMutableArray+test.m", "Supporting/NSMutableArray+test.m"),
    @("khanakhazanaTests.swift", "Tests/khanakhazanaTests.swift")
)

foreach ($m in $moves) {
    $src = $m[0]
    $dst = $m[1]
    if (Test-Path $src) {
        git mv $src $dst
        Write-Host "Moved: $src -> $dst"
    } else {
        Write-Warning "Skip (not found): $src"
    }
}

# 3. Delete temp file (not in Xcode project)
$tempFile = "file.temp_caseinsensitive_rename.swift"
if (Test-Path $tempFile) {
    Remove-Item $tempFile -Force
    Write-Host "Deleted: $tempFile"
} else {
    Write-Host "Temp file already absent: $tempFile"
}

Write-Host "Done. Next: update Xcode project paths (see docs/XCODE_UPDATE_GUIDE.md) or run the pbxproj update."
Set-Location $root
