-- DROP DATABASE IF EXISTS hw_4_ds;
-- CREATE DATABASE hw_4_ds;
USE hw_4_ds;
SELECT * FROM auto a;

/* Задание 1
 * Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
 */
SELECT MARK, COLOR, count(*) cnt
FROM auto a
WHERE MARK = 'BMW'
GROUP BY COLOR
UNION 
SELECT MARK, COLOR, count(*) cnt
FROM auto a
WHERE MARK = 'LADA'
GROUP BY COLOR;


/* Задание 2
 * Вывести на экран марку авто и количество AUTO не этой марки
 */
SELECT MARK
FROM auto a 
WHERE MARK = 'BMW'
GROUP BY MARK
UNION 
SELECT count(*)
FROM auto a 
WHERE NOT MARK = 'BMW';


/* Задание 3
 * Даны 2 таблицы.
 * Напишите запрос, который вернет строки из таблицы test_a, 
 * id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
 */
create table test_a (id int, data varchar(1));
create table test_b (id int);

insert into test_a(id, data) 
values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

insert into test_b(id) 
values
(10),
(30),
(50);

SELECT *
FROM test_a a
LEFT JOIN test_b b 
	ON a.id = b.id
WHERE b.id IS NULL;




