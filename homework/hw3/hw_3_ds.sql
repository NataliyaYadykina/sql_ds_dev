DROP DATABASE IF EXISTS hw_3_ds;
CREATE DATABASE hw_3_ds;
USE hw_3_ds;


/* Задание 1
 * Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
 */
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	onum INT UNSIGNED NOT NULL,
	amt FLOAT,
	odate DATE,
	cnum INT UNSIGNED,
	snum INT UNSIGNED
);

INSERT INTO `orders` (`onum`, `amt`, `odate`, `cnum`, `snum`) 
VALUES 
(3001, 20.00, '2016-01-01', 2001, 1007),
(3002, 767.00, '2016-01-25', 2001, 1001),
(3003, 1900.00, '2016-01-01', 2007, 1004),
(3004, 5160.00, '2016-01-16', 2004, 1002),
(3005, 75.00, '2016-01-23', 2004, 1001);

SELECT SUM(amt)
FROM orders
WHERE odate = '2016-01-01';


/* Задание 2
 * Напишите запрос, который сосчитал бы число различных, 
 * отличных от NULL значений поля city в таблице заказчиков.
 */
DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
	cnum INT UNSIGNED NOT NULL,
	cname VARCHAR(50) NOT NULL,
	city VARCHAR(25),
	rating INT UNSIGNED,
	snum INT UNSIGNED
);

INSERT INTO `customers` (`cnum`, `cname`, `city`, `rating`, `snum`) 
VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', NULL, NULL, 1002),
(2004, 'Grass', 'London', 300, 1002),
(2005, 'Glemens', 'Rome', 100, 1001);

SELECT COUNT(DISTINCT city)
FROM customers;


/* Задание 3
 * Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
 */
SELECT MIN(amt), cnum
FROM orders
GROUP BY cnum;


/* Задание 4
 * Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г. 
 * Используется оператор "LIKE": https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
 */
SELECT cnum, cname
FROM customers
WHERE cname LIKE 'G%';


/* Задание 5
 * Напишите запрос, который выбрал бы высший рейтинг в каждом городе.
 */
SELECT MAX(rating), city
FROM customers
GROUP BY city;


-- ----------------------------------------------------

/* Задание 6
 * Отсортируйте поле “сумма” в порядке убывания и возрастания
 */

SELECT * 
FROM orders
ORDER BY amt;

SELECT * 
FROM orders
ORDER BY amt DESC;


/* Задание 7
 * Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой
 */

DROP TABLE IF EXISTS emploies;
CREATE TABLE emploies(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NULL,
	surname VARCHAR(100) NULL,
	speciality VARCHAR(100) NULL,
	seniority INT NULL,
	salary INT NULL,
	age INT NULL
);

INSERT emploies(name, surname, speciality, seniority, salary, age)
VALUES
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
	('Петя', 'Петькин', 'начальник', 8, 70000, 30),
	('Катя', 'Катькина', 'инженер', 2, 73000, 25),
	('Иван', 'Ванькин', 'инженер', 12, 50000, 35),
	('Егор', 'Егоркин', 'рабочий', 40, 40000, 59),
	('Сергей', 'Серенькин', 'инженер', 12, 50000, 35),
	('Маша', 'Машкина', 'рабочий', 40, 15000, 59);

SELECT * 
FROM emploies
ORDER BY salary DESC
LIMIT 5;


/* Задание 8
 * Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000
 */
SELECT COUNT(speciality) count_spec, speciality
FROM emploies 
WHERE salary > 20000
GROUP BY speciality
HAVING speciality = 'рабочий';







