DROP DATABASE IF EXISTS todo_app;
DROP USER IF EXISTS michael;

CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

CREATE DATABASE todo_app;


\c todo_app

CREATE TABLE tasks (id  SERIAL PRIMARY KEY, title VARCHAR(100) NOT NULL, description text DEFAULT NULL, created_at TIMESTAMP DEFAULT NOW(), updated_at TIMESTAMP, completed  BOOLEAN);

ALTER TABLE tasks DROP COLUMN completed;

ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP DEFAULT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks ALTER COLUMN updated_at TIMESTAMP DEFAULT SET NOT NULL;

INSERT INTO tasks (title, description,created_at, updated_at, completed_at) VALUES('Study SQL', 'Complete this exercise',now(),now(),NULL);

INSERT INTO tasks (title, description,created_at, updated_at, completed_at) VALUES('Study PostgreSQL', 'Read all the documentation',now(),now(),NULL);

SELECT title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks SET completed_at= NOW() WHERE title = 'Study SQL';

SELECT title, description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

INSERT INTO tasks (title, description, created_at, updated_at, completed_at) VALUES ('mistake 1',  'another test entry',now(),now(),NULL);

INSERT INTO tasks (title, description, created_at, updated_at, completed_at) VALUES ('mistake 2',  'another test entry',now(),now(),NULL);


INSERT INTO tasks (title, description, created_at, updated_at, completed_at) VALUES ('mistake third',  'another test entry',now(),now(),NULL);


SELECT title FROM tasks WHERE title LIKE 'mistake%';

DELETE FROM tasks WHERE title = 'mistake'

SELECT * FROM tasks ORDER BY title ASC;
