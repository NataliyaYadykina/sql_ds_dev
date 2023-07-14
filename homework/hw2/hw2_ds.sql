DROP DATABASE IF EXISTS hw_2;	-- удалить БД с проверкой
CREATE DATABASE hw_2; 		-- создать БД
USE hw_2; 					-- выбрать БД


/* Задание 1
 * Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
 */

-- Создаем таблицу
DROP TABLE IF EXISTS `sales`; -- тоже DDL команда
CREATE TABLE `sales` (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	count_product INT,
	created_at DATETIME DEFAULT NOW()
);

-- Добавляем данные
INSERT INTO `sales` (`count_product`) 
VALUES
(123),
(87),
(100),
(350),
(210),
(50),
(400);

-- Проверим
-- SELECT * FROM `sales`;


/* Задание 2
 * Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
 */

SELECT 
	`id`, 
	`count_product`, 
	`created_at`,
	CASE 
		WHEN `count_product` < 100
			THEN 'Меньше 100'
		WHEN `count_product` BETWEEN 100 AND 300
			THEN '100-300'
		ELSE 'Больше 300'
	END `bucket`
FROM `sales`;


/* Задание 3
 * Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
 */

-- Создаем таблицу
DROP TABLE IF EXISTS `orders`; -- тоже DDL команда
CREATE TABLE `orders` (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	employeeid CHAR(3),
	amount FLOAT,
	orderstatus VARCHAR(15)
);

-- Добавляем данные
INSERT INTO `orders` (`employeeid`, `amount`, `orderstatus`) 
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED'),
('e04', 99.00, 'OPEN');

-- Проверим
-- SELECT * FROM `orders`;

-- Покажем полный статус заказов
SELECT 
	`id`, 
	`orderstatus`, 
	CASE `orderstatus`
		WHEN 'OPEN'
			THEN 'Order is in open state'
		WHEN 'CLOSED'
			THEN 'Order is closed'
		WHEN 'CANCELLED'
			THEN 'Order is cancelled'
		ELSE 'Other'
	END `order_summary`
FROM `orders`;
	

/* Задание 4
 * Чем NULL отличается от 0?
 * ------------------------
 * ОТВЕТ:
 * 0 - это значение, которое может быть, например, типа int, tinyint, bool
 * NULL - это отсутствие какого-либо значения
 */







