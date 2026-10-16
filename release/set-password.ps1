# Saves your Pandora password next to pianobar.exe, encrypted for your
# Windows account (DPAPI). Only you, on this PC, can read it back.
$secure = Read-Host -AsSecureString "Pandora password"
$secure | ConvertFrom-SecureString | Set-Content -Path (Join-Path $PSScriptRoot "pianobar.pw")
Write-Host "Saved. Set password_command in pianobar.cfg to use it."
