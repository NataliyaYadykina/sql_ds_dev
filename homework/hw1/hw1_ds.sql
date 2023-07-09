/* Задача 1
Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
*/

-- Новая БД
CREATE DATABASE hw_1;
USE phones;

-- 1. Новая таблица
CREATE TABLE phones (
  id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(45) NOT NULL,
  manufacturer VARCHAR(45) NOT NULL,
  product_count INT NOT NULL,
  price FLOAT NOT NULL,
  PRIMARY KEY (id));
  
-- 1. Добавление данных в таблицу phones
INSERT INTO phones(product_name, manufacturer, product_count, price)
VALUES 
	('Samsung G', 'Samsung', 1, 15000.00),
	('Redmi', 'Xiaomi', 2, 20000.00),
	('LG S', 'LG', 3, 25000.00),
	('Samsung G2', 'Samsung', 4, 30000.00);

/* Задача 2
Выведите название, производителя и цену для товаров, количество которых превышает 2
*/
  
-- 2. Выборка данных с фильтром
SELECT product_name, manufacturer, price
FROM phones
WHERE product_count > 2;


/* Задача 3
Выведите весь ассортимент товаров марки “Samsung”
*/
-- 3. Выборка данных с фильтром
SELECT * FROM phones
WHERE manufacturer = 'Samsung';
