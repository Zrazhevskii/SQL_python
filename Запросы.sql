SELECT album_name, data FROM album
WHERE data > '2018-01-01' AND data > '2019-01-01'

SELECT trek_name, duration FROM trek
ORDER BY duration DESC
LIMIT 1

SELECT trek_name FROM trek
WHERE duration >= 210

SELECT compilation_name FROM compilation
WHERE year_of_ussue between '2018-01-01' and '2020-01-01'

SELECT singer_name FROM singer
WHERE singer_name NOT LIKE '% %'

SELECT trek_name FROM trek
WHERE trek_name like '%мой%' OR trek_name like '%my%'