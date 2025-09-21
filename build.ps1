# Package park sequences
New-Item -ItemType Directory "artifacts" -Force > $null
Get-ChildItem -Attributes Directory "title" | ForEach-Object {
    $destFile = "..\..\artifacts\$($_.Name).parkseq"
    Write-Host "Creating $($_.Name).parkseq..."
    Push-Location $_.FullName
        Remove-Item $destFile -ErrorAction SilentlyContinue
        7z a -tzip -mx9 -mtc=off -r $destFile * > $null
        if ($LASTEXITCODE -ne 0)
        {
            Write-Host "Failed to create $($_.Name)" -ForegroundColor Red
        }
    Pop-Location
}
Set-Location artifacts
Copy-Item v0.4.26.parkseq openrct2.parkseq
7z a -tzip -mx9 -mtc=off -r title-sequences.zip rct1.parkseq rct1aa.parkseq rct1aall.parkseq rct2.parkseq openrct2.parkseq
