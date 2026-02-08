#!/bin/bash
# Fix all Swift 4.2+ deprecated API usages across the project.
# Run from repo root: ./scripts/fix-swift-apis.sh
# Requires: macOS/Linux with sed

set -e
cd "$(dirname "$0")/.."

echo "Applying all Swift API fixes..."

find . -name "*.swift" -type f ! -path "./build/*" ! -path "./DerivedData/*" -exec sed -i.bak \
  -e 's/UIAlertControllerStyle\.alert/UIAlertController.Style.alert/g' \
  -e 's/UIAlertControllerStyle\.actionSheet/UIAlertController.Style.actionSheet/g' \
  -e 's/UIAlertControllerStyle/UIAlertController.Style/g' \
  -e 's/UIAlertActionStyle\.default/UIAlertAction.Style.default/g' \
  -e 's/UIAlertActionStyle\.cancel/UIAlertAction.Style.cancel/g' \
  -e 's/UIAlertActionStyle\.destructive/UIAlertAction.Style.destructive/g' \
  -e 's/UIAlertActionStyle/UIAlertAction.Style/g' \
  -e 's/UIViewAutoresizing\.flexibleWidth/UIView.AutoresizingMask.flexibleWidth/g' \
  -e 's/UIViewAutoresizing\.flexibleHeight/UIView.AutoresizingMask.flexibleHeight/g' \
  -e 's/UIViewAutoresizing\.flexibleLeftMargin/UIView.AutoresizingMask.flexibleLeftMargin/g' \
  -e 's/UIViewAutoresizing\.flexibleRightMargin/UIView.AutoresizingMask.flexibleRightMargin/g' \
  -e 's/UIViewAutoresizing\.flexibleTopMargin/UIView.AutoresizingMask.flexibleTopMargin/g' \
  -e 's/UIViewAutoresizing\.flexibleBottomMargin/UIView.AutoresizingMask.flexibleBottomMargin/g' \
  -e 's/UIViewAutoresizing/UIView.AutoresizingMask/g' \
  -e 's/UIControlEvents\.touchUpInside/UIControl.Event.touchUpInside/g' \
  -e 's/UIControlEvents/UIControl.Event/g' \
  -e 's/UIImagePickerControllerOriginalImage/UIImagePickerController.InfoKey.originalImage/g' \
  -e 's/UIImagePickerControllerEditedImage/UIImagePickerController.InfoKey.editedImage/g' \
  -e 's/UIApplicationLaunchOptionsKey/UIApplication.LaunchOptionsKey/g' \
  -e 's/UITableViewCellEditingStyle/UITableViewCell.EditingStyle/g' \
  -e 's/UIImageJPEGRepresentation(\([^,]*\), *\([^)]*\))/\1?.jpegData(compressionQuality: \2)/g' \
  -e 's/UIImagePNGRepresentation(\([^)]*\))/\1?.pngData()/g' \
  {} +

find . -name "*.swift.bak" -type f -delete
echo "✅ All Swift API fixes applied successfully!"
