﻿#language: ru

@tree

Функционал: создание Документа Поступления Товаров
Как Менеджер по Закупкам я хочу
создание Документа Поступления Товаров 
чтобы поставитьТовар на Учет
 
Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий
// создание 
Сценарий: создание Документа Поступления Товаров
* Открытие Формы Создания Документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* Заполнение Шапки Документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И в таблице "Список" я разворачиваю строку:
		| 'Код'       | 'Наименование' |
		| '000000001' | 'Поставщики'   |
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000012' | 'Мосхлеб ОАО'  |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
* Заполнение Табличной Части Товары
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаДерево'
	И в таблице "Список" я разворачиваю строку:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'Продукты'     |
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000032' | 'Торт '        |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Торт '
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1,00'
	И в таблице "Товары" я завершаю редактирование строки
* Проверка корректности заполнения Табличной Части Товары
	Тогда таблица "Товары" содержит строки:
		| 'Товар' | 'Цена'   | 'Артикул' | 'Количество' | 'Сумма'  |
		| 'Торт ' | '150,00' | 'Т78'     | '1,00'       | '150,00' |
		
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
//	И я нажимаю на кнопку с именем "Записать"
	Тогда открылось окно 'Поступление товара * от *'
* Номер
	И я запоминаю значение поля"Номер" как "$Номер$"
* Проведение Документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара * от *' в течение 20 секунд
* Проверка
	И таблица "Список" содержит строки:
		| 'Номер' |
		| '$Номер$'   |
	
