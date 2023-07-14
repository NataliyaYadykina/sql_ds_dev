/* Задача 1
Создать БД vk, исполнив скрипт _vk_db_creation.sql (в материалах к уроку)
 */

# Ok
USE vk;


/* Задача 2
Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы 
(с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)
*/

# Добавление таблицы - Заблокированные пользователи
DROP TABLE IF EXISTS users_black_list;
CREATE TABLE users_black_list(
	initiator_user_id BIGINT UNSIGNED NOT NULL,
	target_user_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (initiator_user_id, target_user_id), -- чтобы не было 2 записей о пользователе и заблокированном пользователе
    FOREIGN KEY (initiator_user_id) REFERENCES users(id),
    FOREIGN KEY (target_user_id) REFERENCES users(id)
);

# Добавление таблицы - Закладки
DROP TABLE IF EXISTS bookmarks;
CREATE TABLE bookmarks(
	media_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
  
	PRIMARY KEY (media_id, user_id), -- чтобы не было 2 записей о пользователе и закладке
    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);


/* Задача 3
Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)
*/
-- вставка нескольких строк одной командой (пакетная вставка) - быстро
INSERT INTO `users` (`firstname`, `lastname`, `email`, `phone`) 
VALUES 
('Reuben', 'Nienow', 'arlo521@example.org', '9374071013'),
('Lori', 'Koch', 'damaris349@example.net', '9102291407'),
('Sam', 'Kuphal', 'telly.miller3@example.net', '9017826312'),
('Pearl', 'Prohaska', 'xechmann@example.net', '9106605713'),
('Ozella', 'Hauck', 'idicken@example.com', '9767438197'),
('Emmet', 'Hammes', 'qcremi@example.org', '9624110645'),
('Eleonore', 'Ward', 'antonetta.swift@example.com', '9097815776'),
('Kristina', 'Jast', 'jennifer2.swift@example.com', '9123161481'),
('Nataliya', 'Yadykina', 'yadykina.swift@example.com', '9133161480'),
('Vladimir', 'Popov', 'popov.swift@example.com', '9121161481');

INSERT INTO `messages` (`from_user_id`, `to_user_id`, `body`) 
VALUES 
(1, 2, 'text1 ghfdj'),
(2, 1, 'text2 jnajkv'),
(3, 2, 'text3 jsbagf'),
(1, 4, 'text4 hfjnv da fjn'),
(4, 2, 'text5 gha v fsva'),
(5, 2, 'text6 fdjb nah j'),
(1, 5, 'text7 b n fbshv a'),
(6, 2, 'text8 hv  agv vn vjk'),
(1, 6, 'text9 agh vn shbv '),
(6, 1, 'text10 nsjbsbj  hjvfg  vhjg');

INSERT INTO `users_black_list` (`initiator_user_id`, `target_user_id`) 
VALUES 
(5, 2),
(1, 5),
(6, 2),
(1, 6),
(6, 1);

INSERT INTO `media_types` (`name`) 
VALUES 
('Photo'),
('Music'),
('Video'),
('Link'),
('File');

INSERT INTO `media` (`media_type_id`, `user_id`, `body`) 
VALUES 
(1, 2, 'media1'),
(2, 1, 'media2'),
(3, 2, 'media1'),
(4, 1, 'media2'),
(1, 3, 'media1'),
(2, 5, 'media2');

INSERT INTO `bookmarks` (`media_id`, `user_id`) 
VALUES 
(1, 1),
(1, 2),
(2, 5),
(1, 4),
(3, 1);

INSERT INTO `cities` (`name`)
VALUES
('Moscow'),
('Tula'),
('Lipetsk'),
('Orel');

INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `hometown`, `city_id`)
VALUES 
(1, 'm', '2000-10-21', 'Moscow', 1),
(2, 'm', '2009-11-20', 'Tula', 2),
(3, 'f', '2010-12-23', 'Lipetsk', 3),
(4, 'm', '2002-06-23', 'Moscow', 1),
(5, 'f', '2003-03-11', 'Orel', 4);


/* Задача 4
Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true). 
При необходимости предварительно добавить такое поле в таблицу profiles 
со значением по умолчанию = false (или 0) (ALTER TABLE + UPDATE)
*/
# Добавим новую колонку is_active
ALTER TABLE profiles ADD COLUMN is_active BOOL DEFAULT TRUE;

UPDATE profiles
SET is_active = 0
WHERE (birthday + INTERVAL 18 YEAR) > NOW();


/* Задача 5
 * Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней)
 */

-- добавим флаг is_deleted 
ALTER TABLE messages 
ADD COLUMN is_deleted BIT DEFAULT 0;

-- отметим пару сообщений неправильной датой
UPDATE messages
SET created_at = NOW() + INTERVAL 1 year
LIMIT 2;

-- отметим, как удаленные, сообщения "из будущего"
UPDATE messages
SET is_deleted = 1
WHERE created_at > NOW();


-- физически удалим сообщения "из будущего"
DELETE FROM messages
WHERE created_at > NOW();


-- проверим
SELECT *
FROM messages
ORDER BY created_at DESC;




























