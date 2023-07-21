USE hw_4_dev;


/* Задание 1
 * Подсчитать количество групп (сообществ), в которые вступил каждый пользователь.
 */
SELECT 
	id,
	count(*)
FROM
	users u
JOIN users_communities uc ON
	u.id = uc.user_id
GROUP BY
	u.id
ORDER BY
	count(*) DESC;


/* Задание 2
 * Подсчитать количество пользователей в каждом сообществе.
 */
SELECT
	count(*),
	c.name
FROM
	users_communities AS uc
JOIN communities AS c ON
	uc.community_id = c.id
GROUP BY
	c.id;


/* Задание 3
 * Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
 * который больше всех общался с выбранным пользователем (написал ему сообщений).
 */
SELECT 
	from_user_id,
	CONCAT(
		(SELECT firstname FROM users WHERE id = m.from_user_id), ' ', 
		(SELECT lastname FROM users WHERE id = m.from_user_id)
	) AS name,
	COUNT(*) count_msg
FROM
	messages AS m
WHERE
	to_user_id = 1
GROUP BY
	from_user_id
ORDER BY
	count_msg DESC
LIMIT 1;


/* Задание 4
 * * Подсчитать общее количество лайков, которые получили пользователи младше 18 лет..
 */
SELECT
	COUNT(*)
FROM
	likes AS l
JOIN media AS m ON
	l.media_id = m.id
JOIN profiles AS p ON
	p.user_id = m.user_id
WHERE
	YEAR(CURDATE()) - YEAR(birthday) < 18;


/* Задание 5
 * * Определить кто больше поставил лайков (всего): мужчины или женщины.
 */
SELECT
	gender,
	COUNT(*)
FROM
	likes AS l
JOIN profiles AS p ON
	l.user_id = p.user_id
GROUP BY
	gender;


