# Reads commit message from stdin, removes "Co-authored-by: Cursor <cursoragent@cursor.com>", writes to stdout
$input | Where-Object { $_ -notmatch '^\s*Co-authored-by:\s*Cursor\s*<' }
