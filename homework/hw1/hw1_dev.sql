/* Задача 1
Создайте таблицу с мобильными телефонами, используя графический интерфейс. 
Необходимые поля таблицы: product_name (название товара), manufacturer (производитель), 
product_count (количество), price (цена). 
Заполните БД произвольными данными.
*/
-- Новая БД
CREATE DATABASE hw_1;
USE hw_1;

-- Новая таблица
CREATE TABLE phone_store (
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(45) NOT NULL,
  manufacturer VARCHAR(45) NOT NULL,
  product_count INT NOT NULL,
  price FLOAT NOT NULL,
  PRIMARY KEY (id));
  
-- Добавление данных в таблицу phone_store
INSERT INTO phone_store(product_name, manufacturer, product_count, price)
VALUES 
	('Samsung G', 'Samsung', 1, 15000.00),
	('Redmi', 'Xiaomi', 2, 20000.00),
	('LG S', 'LG', 3, 25000.00),
	('Iphone 13', 'Apple', 1, 125000.00),
	('Iphone 14', 'Apple', 3, 150000.00),
	('Samsung G8', 'Samsung', 4, 30000.00);

/* Задача 2
Напишите SELECT-запрос, который выводит название товара, производителя и цену для товаров, 
количество которых превышает 2
*/ 
-- Выборка данных с фильтром
SELECT product_name, manufacturer, price
FROM phone_store
WHERE product_count > 2;


/* Задача 3
Выведите SELECT-запросом весь ассортимент товаров марки “Samsung”
*/
-- Выборка данных с фильтром
SELECT * FROM phone_store
WHERE manufacturer = 'Samsung';

/* Задача 4
С помощью SELECT-запроса с оператором LIKE / REGEXP найти:
*/
/* Задача 4.1
Товары, в которых есть упоминание "Iphone"
*/
-- Выборка данных с фильтром
SELECT * FROM phone_store
WHERE product_name LIKE '%Iphone%';

/* Задача 4.2
Товары, в которых есть упоминание "Samsung"
*/
-- Выборка данных с фильтром
SELECT * FROM phone_store
WHERE product_name LIKE '%Samsung%';

/* Задача 4.3
Товары, в названии которых есть ЦИФРЫ
*/
-- Выборка данных с фильтром
SELECT * FROM phone_store
WHERE product_name REGEXP '[[:digit:]]+';

/* Задача 4.4
Товары, в названии которых есть ЦИФРА "8"
*/
-- Выборка данных с фильтром
SELECT * FROM phone_store
WHERE product_name LIKE '%8%';
