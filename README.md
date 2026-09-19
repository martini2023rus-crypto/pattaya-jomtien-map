# Карта: Джомтьен · Pristine Park III · здания 3–4 этажа

Страница собирается Codex и публикуется через GitHub Pages:
https://martini2023rus-crypto.github.io/pattaya-jomtien-map/

- `index.html` — текущая версия карты (копия файла из папки Codex).
- `publish.ps1` — выкладывает свежую версию: берёт самый новый файл
  `Pattaya_Jomtien_*.html` из `Documents\Codex`, копирует в `index.html`,
  делает коммит и `git push`.

Обновить страницу (PowerShell):

    C:\Users\Максим\Desktop\Claude\pattaya-jomtien-map\publish.ps1

Опубликованная версия: Pattaya_Jomtien_Pristine3_Map_V7_2026-09-17.html

## Доска собраний

- `board/index.html` — страница с темами собрания команды (без имён сотрудников),
  адрес: https://martini2023rus-crypto.github.io/pattaya-jomtien-map/board/
  Обновляется руками: правится файл, затем `git add board/index.html`, коммит и `git push`.
  `publish.ps1` эту папку не трогает.

## Вторая страница: график саппорта мастеров

`support/index.html` — статистика «когда пишут мастера» (журнал бота поддержки, 4 недели)
и предложение по графику смен саппорта тремя шагами. Собирается Claude Code (сессия FatherBot),
`publish.ps1` её не трогает: скрипт копирует только `index.html`.
https://martini2023rus-crypto.github.io/pattaya-jomtien-map/support/
