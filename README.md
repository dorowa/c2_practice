# c2_practice
module c2 practice<br>
--------------------------------------------ОБЩЕЕ ОПИСАНИЕ
В этом ДЗ полностью реализован сервер голосования:
- бекенд (python3 bottle), по умолчанию запускается в многопоточном режиме 4 процесса по 6 потоков
  согласно ДЗ бекенд:
  - обрабатывает GET запросы по адресу: /    - отображает основное окно голосования,
  которое разделено на 2 вертикальные части для демонстрации отправки POST запросов button и radio
  - обрабатывает GET запросы по адресу: /results/   - отображает страницу с результатами голосования,
  в которой используется технология SSE для отображения текущих результатов голосования с постоянным обновлением результата
  - обрабатывает POST запросы по адресу: /results/  -  принимает данные формы для добавления данных, согласно выбранных radio
  кнопок
  - обрабатывает POST запросы по адресу: /sse/vote/<param>   - где param может принимать значения cats, dogs, parrots и увеличивает
  значение value в БД для соответствующей записи фракции
  - поддерживает SSE по адресу: /sse/vote/stats    - передает браузеру текущие данные о результатах госований используя технологию
  SSE
- фронт-енд (html, css+bootstrap, js) реализован через шаблоны SimpleTemplate bottle, шаблоны - в папке views, реализованы два
шаблона: один для главной страницы - для ввода данных, второй для отображения результатов с использованием SSE
--------------------------------------------СОСТАВ РЕПОЗИТОРИЯ
-----/
     |- main.py - основной модуль для запуска сервера
     |- sse_server.conf - файл конфигурации сервера, где можно задать ip, port, тип http-сервера, опции многозадачности и имя БД
     |- my_db.sqlite - файл с БД
     |- README.md
     |----- /app
     |      |- db.py - модуль для функционала работы с БД, чтение/обновление
     |      |- server.py - модуль для функционала работы сервера, обработка и маршрутизация запросов
     |
     |------/views
            |- votingMainPage.tpl - шаблон основной страницы, кнопки, radio и проч (внутри html, bootstrap)
            |- votingMainResults.tpl - шаблон страницы с результатами, прогрессбары и SSE (внутри html и js, bootstrap)
       
--------------------------------------------СИСТЕМНЫЙ ТРЕБОВАНИЯ
Для запуска системы необходимо установить и запустить следующее ПО:
- python3.7+
- bootle 0.12.18
- guniconr 20.0.4
