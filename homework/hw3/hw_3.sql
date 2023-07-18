DROP DATABASE IF EXISTS hw_3;
CREATE DATABASE hw_3;
USE hw_3;

/* Задание 1
 * Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]
 */
-- Вывод уникальных имен в алфавитном порядке
SELECT DISTINCT firstname
FROM users
ORDER BY firstname;


/* Задание 2
 * Выведите количество мужчин старше 35 лет [COUNT].
 */
SELECT COUNT(*)
FROM profiles 
WHERE gender = 'm' AND TIMESTAMPDIFF(YEAR, birthday, NOW()) > 35  


/* Задание 3
 * Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]
 */
SELECT COUNT(*), status
FROM friend_requests 
GROUP BY status


/* Задание 4
 * Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT].
 */
SELECT 
	COUNT(*) AS quantity,
	initiator_user_id
FROM friend_requests 
GROUP BY initiator_user_id 
ORDER BY quantity DESC
LIMIT 1;


/* Задание 5
 * Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE].
 */
SELECT id, name
FROM communities 
WHERE name LIKE '_____';



