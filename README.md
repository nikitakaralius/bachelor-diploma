# bachelor-diploma

[Оригинальный репозиторий шаблона](https://github.com/ParkhomenkoV/SPbPU-student-thesis-template)

## TLDR
- [thesis.tex](thesis.tex) – корневой файл диплома. Здесь подключаются все пакеты и настройки, а также содержимое диплома.
- В [chapters](chapters) лежат файлы с главами (вступление, глава 1, глава 2 и т.д.) в порядке их следования в дипломе.
- В файле [renames.tex](template_settings/common/renames.tex) переменные имён, дат сдачи, номера групп и прочее. 
- `make pdf` – сборка диплома в формате PDF вместе с библиографией. Файл `thesis.pdf` будет создан в папке [build](build).
- [build-latex.yaml](.github/workflows/build-latex.yml) – GitHub workflow, который автотически будет собирать pdf в PR и при мерже в master.
- В [guides](guides) лежат инструкции (из шаблона + НИР).
- В [nrw](nrw) – артефакты НИР.
- В [refs](refs) – pdf источников. 
