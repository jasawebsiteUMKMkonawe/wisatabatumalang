$files = @('travel.html','about.html','contact.html','blog-detail.html','privacy.html','terms.html')
foreach ($f in $files) {
    $bytes = [System.IO.File]::ReadAllBytes($f)
    $content = [System.Text.Encoding]::UTF8.GetString($bytes)
    $content = $content.Replace([char]0xF0, '').Replace([char]0x9F, '')
    # Just replace the garbled lines with safe ASCII alternatives 
    $content = $content -replace 'destination-batu.html">[^<]*Destinasi Batu', 'destination-batu.html">Destinasi Batu'
    $content = $content -replace 'destination-malang.html">[^<]*Destinasi Malang', 'destination-malang.html">Destinasi Malang'
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText((Resolve-Path $f).Path, $content, $utf8NoBom)
    Write-Host "Cleaned: $f"
}
Write-Host "Done!"
