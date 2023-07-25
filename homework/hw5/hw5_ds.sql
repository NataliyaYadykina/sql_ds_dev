DROP DATABASE IF EXISTS hw_5_ds;
CREATE DATABASE hw_5_ds;
USE hw_5_ds;

DROP TABLE IF EXISTS cars;
CREATE TABLE cars(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	brand VARCHAR(25),
	cost INT
);

INSERT INTO cars (id, brand, cost)
VALUES
	(1, 'Audi', 52642),
	(2, 'Mercedes', 27127),
	(3, 'Skoda', 9000),
	(4, 'Volvo', 29000),
	(5, 'Bentley', 350000),
	(6, 'Citroen', 21000),
	(7, 'Hummer', 41400),
	(8, 'Volkswagen', 21600);


/* Задание 1
 * Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов 
 * CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000;
 */
CREATE OR REPLACE VIEW CheapCars AS
SELECT brand, cost
FROM cars
WHERE cost < 25000;

SELECT * FROM CheapCars;


/* Задание 2
 * Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов 
 * (используя оператор ALTER VIEW) ALTER VIEW CheapCars AS SELECT Name FROM CarsWHERE Cost<30000;
 */
ALTER VIEW CheapCars AS 
SELECT brand, cost 
FROM cars
WHERE cost < 30000;

SELECT * FROM CheapCars;



/* Задание 3
 * Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично) 
 */
CREATE OR REPLACE VIEW selectCars AS
SELECT *
FROM cars
WHERE brand = 'Skoda' OR brand = 'Audi';

SELECT * FROM selectCars;


/* Задание 4
 * Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю. 
 * Есть таблица анализов Analysis: an_id — ID анализа; an_name — название анализа; an_cost — себестоимость анализа; 
 * an_price — розничная цена анализа; an_group — группа анализов. 
 * Есть таблица групп анализов Groups: gr_id — ID группы; gr_name — название группы; gr_temp — температурный режим хранения. 
 * Есть таблица заказов Orders: ord_id — ID заказа; ord_datetime — дата и время заказа; ord_an — ID анализа.
 */
DROP TABLE IF EXISTS Analysis;
CREATE TABLE Analysis(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(25),
	cost INT,
	price INT,
	an_group INT
);

INSERT INTO Analysis (id, name, cost, price, an_group)
VALUES
	(1, 'an_name1', 100, 150, 1),
	(2, 'an_name2', 103, 153, 1),
	(3, 'an_name3', 105, 154, 2),
	(4, 'an_name4', 107, 156, 3),
	(5, 'an_name5', 108, 159, 2);

DROP TABLE IF EXISTS GroupsAn;
CREATE TABLE GroupsAn(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(25),
	temp VARCHAR(25)
);

INSERT INTO GroupsAn (id, name, temp)
VALUES
	(1, 'an_name1', 'temp1'),
	(2, 'an_name2', 'temp2'),
	(3, 'an_name3', 'temp3');

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	ord_datetime DATE,
	ord_an INT
);

INSERT INTO Orders (id, ord_datetime, ord_an)
VALUES
	(1, '2020-02-05', 5),
	(2, '2020-02-07', 3),
	(3, '2020-02-09', 1),
	(4, '2020-02-25', 4),
	(5, '2020-02-29', 2);

SELECT a.name, a.price, o.ord_datetime 
FROM Analysis AS a
JOIN Orders AS o ON a.id = o.ord_an 
WHERE TIMESTAMPDIFF(DAY, '2020-02-05', o.ord_datetime) <= 7;  







