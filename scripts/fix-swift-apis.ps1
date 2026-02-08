# Fix all Swift 4.2+ deprecated API usages across the project.
# Run from repo root: .\scripts\fix-swift-apis.ps1

$ErrorActionPreference = "Stop"
$root = Split-Path $PSScriptRoot
Set-Location $root

$replacements = @(
    @{ Old = 'UIAlertControllerStyle\.alert'; New = 'UIAlertController.Style.alert' },
    @{ Old = 'UIAlertControllerStyle\.actionSheet'; New = 'UIAlertController.Style.actionSheet' },
    @{ Old = 'UIAlertControllerStyle'; New = 'UIAlertController.Style' },
    @{ Old = 'UIAlertActionStyle\.default'; New = 'UIAlertAction.Style.default' },
    @{ Old = 'UIAlertActionStyle\.cancel'; New = 'UIAlertAction.Style.cancel' },
    @{ Old = 'UIAlertActionStyle\.destructive'; New = 'UIAlertAction.Style.destructive' },
    @{ Old = 'UIAlertActionStyle'; New = 'UIAlertAction.Style' },
    @{ Old = 'UIViewAutoresizing\.flexibleWidth'; New = 'UIView.AutoresizingMask.flexibleWidth' },
    @{ Old = 'UIViewAutoresizing\.flexibleHeight'; New = 'UIView.AutoresizingMask.flexibleHeight' },
    @{ Old = 'UIViewAutoresizing'; New = 'UIView.AutoresizingMask' },
    @{ Old = 'UIControlEvents\.touchUpInside'; New = 'UIControl.Event.touchUpInside' },
    @{ Old = 'UIControlEvents'; New = 'UIControl.Event' },
    @{ Old = 'UIImagePickerControllerOriginalImage'; New = 'UIImagePickerController.InfoKey.originalImage' },
    @{ Old = 'UIImagePickerControllerEditedImage'; New = 'UIImagePickerController.InfoKey.editedImage' },
    @{ Old = 'UIApplicationLaunchOptionsKey'; New = 'UIApplication.LaunchOptionsKey' },
    @{ Old = 'UITableViewCellEditingStyle'; New = 'UITableViewCell.EditingStyle' }
)

$swiftFiles = Get-ChildItem -Path $root -Recurse -Filter "*.swift" -File | Where-Object { $_.FullName -notmatch "build|DerivedData" }
$count = 0
foreach ($file in $swiftFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    if (-not $content) { continue }
    $original = $content
    foreach ($r in $replacements) { $content = $content -replace $r.Old, $r.New }
    $content = $content -replace 'UIImageJPEGRepresentation\s*\(\s*([^,]+)\s*,\s*([^)]+)\s*\)', '$1?.jpegData(compressionQuality: $2)'
    $content = $content -replace 'UIImagePNGRepresentation\s*\(\s*([^)]+)\s*\)', '$1?.pngData()'
    if ($content -ne $original) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.UTF8Encoding]::new($false))
        $count++
        Write-Host "Updated: $($file.Name)"
    }
}
Write-Host "Done. Files modified: $count"
