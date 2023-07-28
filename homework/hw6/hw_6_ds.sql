DROP DATABASE IF EXISTS hw_6_ds;
CREATE DATABASE hw_6_ds;
USE hw_6_ds;


/* Задание 1
 * Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
 */
DROP FUNCTION IF EXISTS task1;

DELIMITER // 
CREATE FUNCTION task1(countsec INT)
RETURNS VARCHAR(255) READS SQL DATA
  BEGIN
	
	DECLARE days INT;
	DECLARE hours INT;
	DECLARE minutes INT;
	DECLARE seconds INT;
	DECLARE res VARCHAR(255);

	IF countsec < 0 THEN
		RETURN 0;
	ELSE 
		SET days = countsec DIV 86400;
		SET hours = (countsec - days * 86400) DIV 3600;
		SET minutes = (countsec - days * 86400 - hours * 3600) DIV 60;
		SET seconds = countsec - days * 86400 - hours * 3600 - minutes * 60;
		SET res = CONCAT(days, ' days, ', hours, ' hours, ', minutes, ' minutes, ', seconds, ' seconds');
		RETURN res;
	END IF;
END // 
DELIMITER ; 
  
SELECT task1(123456);


/* Задание 2
 * Выведите только четные числа от 1 до 10.
 */
DROP PROCEDURE IF EXISTS while_loop_example;

DELIMITER //

CREATE PROCEDURE while_loop_example(min_point INT, max_point INT)
BEGIN
  DECLARE x INT;
  DECLARE str VARCHAR(255);
  SET x = min_point;
  SET str = '';

  WHILE x <= max_point DO
  	IF x MOD 2 = 0 THEN
    	SET str = CONCAT(str,x,',');
    END IF;
    SET x = x + 1;
  END WHILE;
 
  SELECT str;
END//

DELIMITER ;

CALL while_loop_example(1, 10);


