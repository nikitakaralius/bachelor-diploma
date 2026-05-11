# bachelor-diploma

[Оригинальный репозиторий шаблона](https://github.com/ParkhomenkoV/SPbPU-student-thesis-template)

## TLDR
- [thesis.tex](thesis.tex) – корневой файл диплома. Здесь подключаются все пакеты, настройки и содержимое.
- В [chapters](chapters) лежат файлы с главами (вступление, глава 1, глава 2 и т.д.) в порядке их следования в дипломе.
- В файле [renames.tex](template_settings/common/renames.tex) переменные имён, дат сдачи, номера групп и прочее.
- `make pdf` – сборка диплома в PDF вместе с библиографией. Итоговый файл создаётся в [build/thesis.pdf](build) и копируется в корень репозитория как `thesis.pdf` (заигнорен).
- `make application` / `make task` – сборка отдельных документов (заявление, задание).
- `make diagrams` – компиляция диаграмм из [diagrams/mmd](diagrams/mmd) (Mermaid) и [diagrams/puml](diagrams/puml) (PlantUML) в PNG (`diagrams/img`).
- `make refs` – извлечение текста из PDF-источников в [refs/pdf](refs/pdf) → `refs/text`.
- [build-latex.yml](.github/workflows/build-latex.yml) – GitHub workflow, который автоматически собирает PDF в PR и при мерже в master.
- В [guides](guides) лежат инструкции (из шаблона + НИР).
- В [refs](refs) – pdf источников.
