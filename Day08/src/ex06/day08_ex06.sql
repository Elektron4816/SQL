--Сессия 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Сессия 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Сессия 1
SELECT SUM(rating) FROM pizzeria;

--Сессия 2
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;

--Сессия 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;

--Сессия 1
SELECT SUM(rating) FROM pizzeria;

--Сессия 2
SELECT SUM(rating) FROM pizzeria;