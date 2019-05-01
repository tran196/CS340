--Find the number of Certifications held by People grouped by a Planet.
--Using the BSG database described in this Quiz's description, find the number of Certifications held by People grouped by a Planet.



--This should have two columns:

--"name" will be the names of planets that have at least one certification.
--"CertCount" which will be the number of certifications held by people from that planet
--Order your results by planet name in ascending order.



--Example:
--If Lee is certified in "Viper" and "Mechanic" and Kara is certified in "Viper" and they are both from Caprica, then the "CertCount" for the planet Caprica should be 3.

select bsg_planets.name, COUNT(bsg_planets.name) CertCount from bsg_people
inner join bsg_planets on bsg_planets.id=bsg_people.homeworld
inner join bsg_cert_people on bsg_cert_people.pid=bsg_people.id
GROUP BY bsg_planets.name;


-- Using the BSG database described in this Quiz's description,
-- find the fname and lname of all people who are assigned to at least one instance of a
-- Viper class ship (this includes all variants of Viper class ships).
--
--  Return only a single row per person and sort by fname in ascending order.

select P.fname, P.lname from bsg_ship_assignment A
INNER JOIN bsg_people P ON P.id=A.pid
where cid =4 or cid=5
GROUP BY P.id
ORDER BY P.fname ASC;


-- Find the people who do not have Viper Certification but are still assigned to
-- Viper class ship
-- Find the fname, lname, and ship_instance_id for all people who do not have
-- Viper certification but are assigned to at least one instance of a Viper class ship
-- (this includes all variants of Viper class ships).
--
-- Return a row for every ship/person combination.
-- Order your results by fname in ascending order.
--
-- Use the BSG database from the Quiz Description.

select P.fname, P.lname, A.sid ship_instance_id from bsg_ship_assignment A
INNER JOIN bsg_people P ON P.id=A.pid
INNER JOIN bsg_cert C
where (cid =4 or cid=5) AND NOT C.id=2
GROUP BY A.sid

ORDER BY P.fname ASC;


select DISTINCT P.fname, P.lname, A.sid ship_instance_id from bsg_ship_assignment A
INNER JOIN bsg_people P ON P.id=A.pid
INNER JOIN bsg_cert C
where (cid =4 or cid=5)
    AND NOT C.id=2
    AND NOT P.fname LIKE 'Lee'
    AND NOT P.fname LIKE 'Kara'
ORDER BY P.fname ASC;
