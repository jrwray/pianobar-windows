# Prints the password saved by set-password.ps1 (used by password_command).
$file = Join-Path $PSScriptRoot "pianobar.pw"
if (-not (Test-Path $file)) {
    [Console]::Error.WriteLine("No saved password, run set-password.ps1 first.")
    exit 1
}
$secure = Get-Content $file | ConvertTo-SecureString
[Console]::Out.Write([Net.NetworkCredential]::new("", $secure).Password)
