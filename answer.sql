--Укажите корабли, потопленные в сражениях в Северной Атлантике (North Atlantic). Вывод: ship.
Select ship from outcomes,battles where result= 'sunk' and battle = 'North Atlantic' group by ship

--По Вашингтонскому международному договору от начала 1922 г. запрещалось строить линейные корабли водоизмещением более 35 тыс.тонн. Укажите корабли, нарушившие этот договор (учитывать только корабли c известным годом спуска на воду). Вывести названия кораблей.

Select name from classes,ships where launched >=1922 and displacement>35000 and type='bb' and ships.class = classes.class

--Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), вывести название, водоизмещение и число орудий.


SELECT o.ship, displacement, numGuns FROM
(SELECT name AS ship, displacement, numGuns
FROM Ships s JOIN Classes c ON c.class=s.class
UNION
SELECT class AS ship, displacement, numGuns
FROM classes c) AS a
RIGHT JOIN Outcomes o
ON o.ship=a.ship
WHERE battle = 'Guadalcanal'
