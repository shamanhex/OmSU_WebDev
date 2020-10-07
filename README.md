# Практикум по Web-разработке

Практикум по веб-разработке состоит в разработке web-приложения с пользовательским интерфейсом и WebAPI, которое предназначено для мониторинга показателей компьютера.

Основной план по лабораторным работам:

1. Разработка и верстка главной страницы
2. Реализация хранилища в СУБД
3. Добавление WebAPI для возможности интеграции с внешними системами
4. Разработка приёмочных тестов

Требования:

1. Веб-интерфейс должен быть интерактивным и регулярно обновлять отображаемую информацию без необходимости перезагружать страницу.
2. Разработку рекомендуется вести в Visual Studio на языке C# в формате ASP.NET приложения
3. Разработку приёмочного тестирования рекомендуется вести с использованием технологии Selenium

## 1. Разработка и верстка главной страницы

Задача, разработать веб-приложение с минимальной функциональностью, состоящее из единственной веб-страницы на которой отображаются данные мониторинга CPU, RAM.

Требования:

1. Страница должна быть логически разбита на несколько типовых элементов (Заголовок, Левое меню, Основную часть и "Подвал")
2. Заголовок должен содержать Название приложения (выравнивание по левому краю) и дату и время (выравниание по правому краю). Название приложения придумать самостоятельно.
3. Дата и время должны обновляться автоматически и отображаться по Московскому часовому поясу.
4. Левое меню должно содержать форму с полями для добавления значения на график. 
5. Форма ввода должна состоять из меню выбора параметра (выпадающий список), поле для ввода значения и кнопки "Сохранить". При нажатии на кнопку, значение сохраняется в ряд значений с текущим временем и добавляется на график или в виджет.
6. Работоспособность формы на данном этапе не требуется, только отображение элементов.
7. Основная страница должна быть сверстана блоками, каждый из которых представляет собой определённый виджет (прямоугольный элемент с диаграммой или иным показателем), который отображается информацию об отслеживаемом параметре.
8. Внизу страницы должно отображаться имя/ник автора разработки и группа.

На странице должны отображаться несколько стандарных элементов мониторинга:
1. Гистограмма загрузки CPU (пример 1, рекомендуется использовать https://www.chartjs.org/samples/latest/charts/line/basic.html, либо другой компонент на усмотрение исполнителя)
2. Гистограмма загрузки RAM (пример 1)
3. Индикатор высокой загрузки CPU (пример 2, по умолчанию зелёный, становится красным при загрузке >90%)
4. Отображение лога событий (текстовое поле, отображающее последние 1000 строк из лога моноширинным шрифтом, ширина поля должна вмещать 150 символов)

Пример интерфейса

![UI](Lab01_UIExample.png)

Для сдачи этой части, интерфейс следует первоначально наполнить случайными данными, которые позволят увидеть интерфейс в работе. Наполнение на усмотрение исполнителя.

## 2. Реализация хранилища в СУБД

Добавить в приложение СУБД для хранения данных мониторинга. 

Требования:

1. Рекомендуется использовать PostgreSQL в качестве СУБД
2. Необходимо спроектировать структуру для хранения данных мониторинга
3. Необходимо разработать скрипты для создания первоначальной структуры БД (создание таблиц и представлений)
4. Необходимо разработать скрипты для наполнения БД демонстрационными данными, а так же скрипт очистки всех данных из БД.
5. В приложении реализовать WebAPI для запроса отображаемых данных (данные должны возвращаться в формате JSON)
6. В виджеты добавить возможноть запрашивать данные с заданной периодичностью (CPU и RAM - 30 сек., Лог событий - 3 сек)

## 3. Добавление WebAPI для возможности интеграции с внешними системами

Реализовать возможность наполнения приложения данными без прямого доступа в БД.

Требования:

1. Реализовать WebAPI для добавления данных 
2. Реализуйте функционал формы добавления данных в левом меню на странице вашего приложения
3. Реализуйте консольное приложение для отправки данных по параметрам мониторина CPU и RAM. (Один зауск, одна отправка данных)

## 4. Разработка приёмочных тестов

Реализуйте selenium тесты для контроля следующей функциональности:

1. Добавление данных через WebAPI мониторинга
2. Добавление данных через Web-форму
3. Наличие на странице всех виджетов

Рекомендации:
1. Перед запуском тестов рекомендуется очистить БД от данных.
2. Тесты рекомендуется реализовывать на фреймворке NUnit.
3. Запускать selenium лучше в standalone режиме.
4. Тесты лучше запускать в браузере Chrome
