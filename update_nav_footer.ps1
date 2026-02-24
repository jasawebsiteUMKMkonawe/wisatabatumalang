# This script replaces old English navbars and footers with the new Indonesian versions
# For each file, it replaces the <nav>...</nav> block and the <footer>...</footer> + floating btns block

$files = @(
    @{ name='travel.html'; active='Panduan' },
    @{ name='about.html'; active='Tentang' },
    @{ name='contact.html'; active='Kontak' },
    @{ name='blog-detail.html'; active='Blog' },
    @{ name='privacy.html'; active='' },
    @{ name='terms.html'; active='' }
)

foreach ($file in $files) {
    $f = $file.name
    $activePage = $file.active
    $content = Get-Content -Path $f -Raw -Encoding UTF8

    # Build navbar with correct active state
    $navLinks = @"
                    <li class="nav-item"><a class="nav-link$(if($activePage -eq 'Beranda'){' active'}else{''})" href="index.html">Beranda</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="destination.html" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">Destinasi</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="destination.html">Semua Destinasi</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="destination-batu.html">🏔️ Destinasi Batu</a></li>
                            <li><a class="dropdown-item" href="destination-malang.html">🌆 Destinasi Malang</a></li>
                        </ul>
                    </li>
                    <li class="nav-item"><a class="nav-link$(if($activePage -eq 'Paket Wisata'){' active'}else{''})" href="package.html">Paket Wisata</a></li>
                    <li class="nav-item"><a class="nav-link$(if($activePage -eq 'Blog'){' active'}else{''})" href="blog.html">Blog</a></li>
                    <li class="nav-item"><a class="nav-link$(if($activePage -eq 'Panduan'){' active'}else{''})" href="travel.html">Panduan</a></li>
                    <li class="nav-item"><a class="nav-link$(if($activePage -eq 'Tentang'){' active'}else{''})" href="about.html">Tentang</a></li>
                    <li class="nav-item"><a class="nav-link$(if($activePage -eq 'Kontak'){' active'}else{''})" href="contact.html">Kontak</a></li>
"@

    $newNavbar = @"
    <nav class="navbar navbar-expand-lg wb-navbar fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="index.html">
                <span class="material-icons brand-icon">landscape</span>
                <div class="d-flex flex-column"><span>WisataBatu</span><span class="brand-sub">Malang</span></div>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigasi">
                <span class="material-icons" style="font-size:1.75rem;color:#475569;">menu</span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
$navLinks
                </ul>
            </div>
            <div class="d-none d-lg-block">
                <a class="btn btn-primary btn-pill" href="package.html">Rencanakan Perjalanan</a>
            </div>
        </div>
    </nav>
"@

    $newFooter = @"
    <footer class="wb-footer">
        <div class="container">
            <div class="row g-4 mb-4">
                <div class="col-lg-3 col-md-6">
                    <div class="footer-brand"><span class="material-icons">landscape</span><span>WisataBatu</span></div>
                    <p>Panduan lengkap Anda untuk menjelajahi keindahan Kota Batu dan Malang. Dari pegunungan hingga
                        museum, kami bantu Anda merencanakan liburan sempurna.</p>
                    <div class="footer-social">
                        <a href="#" aria-label="Facebook"><span class="material-icons"
                                style="font-size:1.1rem;">facebook</span></a>
                        <a href="#" aria-label="Instagram">IG</a>
                        <a href="#" aria-label="Twitter">TW</a>
                        <a href="#" aria-label="YouTube">YT</a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 col-6">
                    <h5>Tautan Cepat</h5>
                    <ul class="footer-links">
                        <li><a href="index.html">Beranda</a></li>
                        <li><a href="destination.html">Destinasi</a></li>
                        <li><a href="about.html">Tentang Kami</a></li>
                        <li><a href="blog.html">Blog Wisata</a></li>
                        <li><a href="contact.html">Kontak</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 col-6">
                    <h5>Wisata Populer</h5>
                    <ul class="footer-links">
                        <li><a href="detail-jatimpark.html">Jatim Park 1, 2, 3</a></li>
                        <li><a href="detail-museum-angkut.html">Museum Angkut</a></li>
                        <li><a href="detail-bns.html">Batu Night Spectacular</a></li>
                        <li><a href="detail-selecta.html">Selecta</a></li>
                        <li><a href="detail-coban-rondo.html">Coban Rondo</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-6">
                    <h5>Buletin</h5>
                    <p>Berlangganan untuk info wisata terbaru dan penawaran spesial.</p>
                    <div class="footer-newsletter">
                        <div class="input-group">
                            <input type="email" class="form-control" placeholder="Alamat email Anda"
                                aria-label="Email" />
                            <button class="btn btn-primary" type="button">Langganan</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom d-flex flex-column flex-md-row justify-content-between align-items-center gap-3">
                <p class="mb-0" style="font-size:0.8rem;color:#64748b;">© 2024 WisataBatu Malang. Hak cipta dilindungi.
                </p>
                <div class="d-flex gap-4" style="font-size:0.8rem;">
                    <a href="privacy.html">Kebijakan Privasi</a>
                    <a href="terms.html">Syarat &amp; Ketentuan</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Tombol Melayang -->
    <div class="wb-floating-btns">
        <a href="https://wa.me/6281234567890" target="_blank" rel="noopener" class="btn-wa"
            aria-label="Hubungi via WhatsApp"><span class="material-icons">chat</span></a>
        <a href="#" class="btn-top" aria-label="Kembali ke Atas"><span
                class="material-icons">arrow_upward</span></a>
    </div>
"@

    # Replace navbar: from <nav to </nav>
    $content = $content -replace '(?s)<nav class="navbar[^>]*id="mainNav"[^>]*>.*?</nav>', $newNavbar.Trim()

    # Replace footer + floating btns: from <footer to end of wb-floating-btns div
    $content = $content -replace '(?s)<footer class="wb-footer">.*?</footer>\s*(?:<!--[^>]*-->\s*)?<div class="wb-floating-btns">.*?</div>', $newFooter.Trim()

    [System.IO.File]::WriteAllText((Resolve-Path $f).Path, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $f"
}

Write-Host "`nAll files updated!"
