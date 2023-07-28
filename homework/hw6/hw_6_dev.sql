USE hw_4_dev;


/* Задание 1
 * Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. Пользователь задается по id. 
 * Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. 
 * Функция должна возвращать номер пользователя.
 */

DROP FUNCTION IF EXISTS func_user_delete;

DELIMITER // -- выставим разделитель
CREATE FUNCTION func_user_delete(deleted_user_id BIGINT UNSIGNED)
RETURNS BIGINT READS SQL DATA
  BEGIN
	
	-- START TRANSACTION
		DELETE FROM messages 
		WHERE from_user_id = deleted_user_id OR to_user_id = deleted_user_id;
	
		DELETE FROM likes  
		WHERE user_id = deleted_user_id;
	
		DELETE FROM friend_requests  
		WHERE initiator_user_id = deleted_user_id OR target_user_id = deleted_user_id;
	
		DELETE FROM users_communities  
		WHERE user_id = deleted_user_id;
	
		DELETE FROM profiles 
		WHERE user_id = deleted_user_id;
	
		DELETE FROM media 
		WHERE user_id = deleted_user_id;
	
		DELETE FROM users 
		WHERE id = deleted_user_id;
	-- COMMIT;
	  
    RETURN deleted_user_id;
  END// -- не забываем наш новый разделитель
DELIMITER ; -- вернем прежний разделитель


-- Вызов функции / результаты
SELECT func_user_delete(4);


/* Задание 2
 * Предыдущую задачу решить с помощью процедуры и обернуть используемые команды в транзакцию внутри процедуры.
 */
USE hw_4_dev;
DROP PROCEDURE IF EXISTS `proc_del_user`;

DELIMITER $$

CREATE PROCEDURE `proc_del_user`(deleted_user_id BIGINT)
BEGIN   
     START TRANSACTION;
		DELETE FROM messages 
		WHERE from_user_id = deleted_user_id OR to_user_id = deleted_user_id;
	
		DELETE FROM likes  
		WHERE user_id = deleted_user_id;
	
		DELETE FROM friend_requests  
		WHERE initiator_user_id = deleted_user_id OR target_user_id = deleted_user_id;
	
		DELETE FROM users_communities  
		WHERE user_id = deleted_user_id;
	
		DELETE FROM profiles 
		WHERE user_id = deleted_user_id;
	
		DELETE FROM media 
		WHERE user_id = deleted_user_id;
	
		DELETE FROM users 
		WHERE id = deleted_user_id;
	 COMMIT;
END$$

DELIMITER ;
-- вызываем процедуру
call proc_del_user(3);



/* Задание 3
 * Написать триггер, который проверяет новое появляющееся сообщество. 
 * Длина названия сообщества (поле name) должна быть не менее 5 символов. 
 * Если требование не выполнено, то выбрасывать исключение с пояснением.
 */






