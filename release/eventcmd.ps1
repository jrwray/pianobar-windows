# pianobar event handler: pianobar runs this with the event name as the
# first argument and key=value event data on stdin.
#  - songstart: shows a Windows notification and appends to history.txt
#  - songlove / songban: appends to history.txt
param([string]$type)

[Console]::InputEncoding = [Text.Encoding]::UTF8
$data = @{}
foreach ($line in [Console]::In.ReadToEnd() -split "`n") {
    $i = $line.IndexOf("=")
    if ($i -gt 0) { $data[$line.Substring(0, $i)] = $line.Substring($i + 1).TrimEnd("`r") }
}

function Write-History([string]$what) {
    $stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    $entry = "$stamp  $what  $($data.artist) - $($data.title) ($($data.album)) [$($data.stationName)]"
    Add-Content -Path (Join-Path $PSScriptRoot "history.txt") -Value $entry -Encoding UTF8
}

function Show-Toast([string]$title, [string]$body) {
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
    [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null
    $t = [Security.SecurityElement]::Escape($title)
    $b = [Security.SecurityElement]::Escape($body)
    $xml = New-Object Windows.Data.Xml.Dom.XmlDocument
    $xml.LoadXml("<toast><visual><binding template='ToastGeneric'><text>$t</text><text>$b</text></binding></visual><audio silent='true'/></toast>")
    $toast = [Windows.UI.Notifications.ToastNotification]::new($xml)
    $toast.Tag = "pianobar"
    $appId = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($appId).Show($toast)
}

switch ($type) {
    "songstart" {
        Write-History "play"
        Show-Toast $data.title "$($data.artist) - $($data.album)"
    }
    "songlove" { Write-History "love" }
    "songban"  { Write-History "ban " }
}
