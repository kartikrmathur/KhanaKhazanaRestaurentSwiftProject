$text = [System.Console]::In.ReadToEnd()
$line = "Co-authored-by: Cursor <cursoragent@cursor.com>"
$lines = $text -split "`r?`n"
$lines | Where-Object { $_.Trim() -ne $line } | ForEach-Object { [System.Console]::Out.WriteLine($_) }
