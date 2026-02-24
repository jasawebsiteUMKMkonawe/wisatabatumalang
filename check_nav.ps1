$files = @('travel.html','about.html','contact.html','blog-detail.html','privacy.html','terms.html')
foreach ($f in $files) {
    $content = Get-Content -Path $f -Raw -Encoding UTF8
    $hasOldNav = $content -match 'Home</a></li>'
    $hasOldFooter = $content -match 'All rights reserved'
    Write-Host "File: $f | OldNav: $hasOldNav | OldFooter: $hasOldFooter"
}
