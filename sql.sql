CREATE DATABASE IF NOT EXISTS Human_friends;
USE Human_friends;
CREATE TABLE IF NOT EXISTS animal_class (	
	id INT AUTO_INCREMENT PRIMARY KEY,
	Class_name VARCHAR(20));
INSERT INTO animal_class (Class_name)
VALUES ('вьючные'), ('домашние');

CREATE TABLE IF NOT EXISTS packs_animals 
(
	ID INT AUTO_INCREMENT PRIMARY KEY,
	breed VARCHAR(20),
    class_id INT,
    FOREIGN KEY(class_id) REFERENCES animal_class(id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO packs_animals (breed, class_id)
VALUES ('Лошадь', 1),
('Осел', 1),  
('Верблюд', 1); 

CREATE TABLE IF NOT EXISTS home_animals
(
	ID INT AUTO_INCREMENT PRIMARY KEY,
    breed VARCHAR (20),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES animal_class (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO home_animals (breed, Class_id)
VALUES ('Кошка', 2),
('Собака', 2),  
('Хомяк', 2); 

CREATE TABLE IF NOT EXISTS cats 
(       
    ID INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    id_breed int,
    FOREIGN KEY (id_breed) REFERENCES home_animals (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO cats(Name, Birthday, Commands, id_breed)
VALUES ('Джесс', '2010-02-05', 'лапу', 1),
('Юкио','2017-08-30','нельзя',1),
('Мурчальник','2014-03-10','',1);


CREATE TABLE IF NOT EXISTS dogs 
(       
    ID INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    id_breed int,
    FOREIGN KEY (id_breed) REFERENCES home_animals (ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO dogs (Name, Birthday, Commands, id_breed)
VALUES ('Рекс', '2020-02-02', 'рядом, лежать, лапу, голос', 2),
('Барон', '2021-06-12', "сидеть, лежать, лапу", 2),  
('Джек', '2018-05-01', "сидеть, лежать, лапу, след, фас", 2), 
('Рон', '2021-05-10', "сидеть, лежать, фу, место", 2);


CREATE TABLE IF NOT EXISTS hamsters 
(       
    ID INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    id_breed int,
    FOREIGN KEY (id_breed) REFERENCES home_animals (ID) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO hamsters (Name, Birthday, Commands, id_breed)
VALUES ('Хмурый', '2021-03-22', 'сальто', 3),
('Толстяк', '2022-02-02', "прыжок", 3),  
('Хом', '2019-06-15', NULL, 3), 
('Бурый', '2013-01-19', NULL, 3);

CREATE TABLE IF NOT EXISTS horses 
(       
    ID INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    id_breed int,
    FOREIGN KEY (id_breed) REFERENCES packs_animals (ID) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO horses (Name, Birthday, Commands, id_breed)
VALUES ('Молния', '2012-12-31', 'рысь, шагом', 3),
('Версаль', '2000-03-06', 'шагом', 3),  
('Астон', '2009-05-19', 'тише, хоп', 3), 
('Зевс', '2017-07-24', NULL, 3);

CREATE TABLE IF NOT EXISTS donkeys 
(       
    ID INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    id_breed int,
    Foreign KEY (id_breed) REFERENCES packs_animals (ID) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO donkeys (Name, Birthday, Commands, id_breed)
VALUES ('Первый', '2019-04-10', NULL, 2),
('Второй', '2020-03-12', "", 2),  
('Третий', '2021-07-12', "", 2), 
('Четвертый', '2022-12-10', NULL, 2);

CREATE TABLE IF NOT EXISTS camels 
(       
    ID INT AUTO_INCREMENT PRIMARY KEY, 
    Name VARCHAR(20), 
    Birthday DATE,
    Commands VARCHAR(50),
    id_breed int,
    Foreign KEY (id_breed) REFERENCES packs_animals (ID) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO camels (Name, Birthday, Commands, id_breed)
VALUES ('Гора', '2009-02-13', 'стоять', 3),
('Бонго', '2017-06-17', "лежать", 3),  
('Ван', '2016-09-04', "каш", 3), 
('Джу', '2023-01-10', "вперед", 3);

DELETE FROM camels;
 

SELECT Name, Birthday, Commands FROM horses
UNION SELECT  Name, Birthday, Commands FROM donkeys;

CREATE TEMPORARY TABLE IF NOT EXISTS animals AS 
SELECT *, 'Лошади' as genus FROM horses
UNION SELECT *, 'Ослы' AS genus FROM donkeys
UNION SELECT *, 'Собаки' AS genus FROM dogs
UNION SELECT *, 'Кошки' AS genus FROM cats
UNION SELECT *, 'Хомяки' AS genus FROM hamsters;

CREATE TABLE IF NOT EXISTS yang_animal AS
SELECT Name, Birthday, Commands, genus, TIMESTAMPDIFF(MONTH, Birthday, CURDATE()) AS Age_in_month
FROM animals WHERE Birthday BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);
 
SELECT * FROM yang_animal;

SELECT h.Name, h.Birthday, h.Commands, pa.breed, ya.Age_in_month 
FROM horses h
LEFT JOIN yang_animal ya ON ya.Name = h.Name
LEFT JOIN packs_animals pa ON pa.Id = h.id_breed
UNION 
SELECT d.Name, d.Birthday, d.Commands, pa.breed, ya.Age_in_month 
FROM donkeys d 
LEFT JOIN yang_animal ya ON ya.Name = d.Name
LEFT JOIN packs_animals pa ON pa.Id = d.id_breed
UNION
SELECT c.Name, c.Birthday, c.Commands, ha.breed, ya.Age_in_month 
FROM cats c
LEFT JOIN yang_animal ya ON ya.Name = c.Name
LEFT JOIN home_animals ha ON ha.Id = c.id_breed
UNION
SELECT d.Name, d.Birthday, d.Commands, ha.breed, ya.Age_in_month 
FROM dogs d
LEFT JOIN yang_animal ya ON ya.Name = d.Name
LEFT JOIN home_animals ha ON ha.Id = d.id_breed
UNION
SELECT hm.Name, hm.Birthday, hm.Commands, ha.breed, ya.Age_in_month 
FROM hamsters hm
LEFT JOIN yang_animal ya ON ya.Name = hm.Name
LEFT JOIN home_animals ha ON ha.Id = hm.id_breed;