# Выкладывает самую свежую версию карты Джомтьена на GitHub Pages.
# Ищет новейший файл Pattaya_Jomtien_*.html в папке Codex, копирует его
# в index.html, коммитит и отправляет на GitHub. Без изменений — ничего не делает.
$ErrorActionPreference = 'Stop'
$repo = $PSScriptRoot
$codex = Join-Path $env:USERPROFILE 'Documents\Codex'

$latest = Get-ChildItem -Path $codex -Recurse -Filter 'Pattaya_Jomtien_*.html' |
    Sort-Object LastWriteTime -Descending | Select-Object -First 1
if (-not $latest) { throw "В $codex не найден ни один файл Pattaya_Jomtien_*.html" }

Write-Host "Свежий файл: $($latest.FullName) ($($latest.LastWriteTime))"
Copy-Item $latest.FullName (Join-Path $repo 'index.html') -Force

$readme = Join-Path $repo 'README.md'
(Get-Content $readme -Raw) -replace 'Опубликованная версия: .*', "Опубликованная версия: $($latest.Name)" |
    Set-Content $readme -NoNewline

Set-Location $repo
if (-not (git status --porcelain)) { Write-Host 'Изменений нет — на сайте уже эта версия.'; exit 0 }
git add index.html README.md
git commit -q -m "map: publish $($latest.Name)"
git push -q origin main
Write-Host 'Готово. Страница обновится через 1–2 минуты:'
Write-Host 'https://martini2023rus-crypto.github.io/pattaya-jomtien-map/'
