@echo off

if not exist artifacts (
    md artifacts
)

pushd title
for /D %%d in ("*") do (
    echo Creating %%d.parkseq...
    pushd %%d
    rm ..\..\artifacts\%%d.parkseq
    7z a -tzip -mx9 -mtc=off -r ..\..\artifacts\%%d.parkseq * > nul
    popd
)
popd
