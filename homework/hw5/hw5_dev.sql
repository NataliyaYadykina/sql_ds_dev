USE hw_4_dev;

/* Задание 1
 * Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
 */
CREATE OR REPLACE VIEW gender_group AS
SELECT
	gender, count(*) AS count_users
FROM profiles
GROUP BY gender
ORDER BY count(gender) DESC;
-- "OR REPLACE" заменяет представление, если оно существует


/* Задание 2
 * Выведите данные, используя написанное представление [SELECT]
 */
SELECT * FROM gender_group;


/* Задание 3
 * Удалите представление [DROP VIEW]
 */
DROP VIEW gender_group;

-- SELECT * FROM gender_group;


/* Задание 4
 * * Сколько новостей (записей в таблице media) у каждого пользователя? 
 * Вывести поля: news_count (количество новостей), user_id (номер пользователя), user_email (email пользователя). 
 * Попробовать решить с помощью CTE или с помощью обычного JOIN.
 */
SELECT 
	COUNT(*) AS news_count,
	user_id,
	email
FROM media AS m
JOIN users AS u ON u.id = m.user_id 
GROUP BY user_id;









