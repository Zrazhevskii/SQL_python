---------Домашнее задание «Select-запросы, выборки из одной таблицы»---------

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

----------------Домашнее задание «Продвинутая выборка данных»---------
--количество жанров у исполнителей
SELECT singer_name, COUNT(genre_name) FROM singer s
LEFT JOIN genre_singer gs ON s.singer_id = gs.singer_id
LEFT JOIN genre g ON gs.genre_id = g.genre_id
GROUP BY singer_name
ORDER BY COUNT(genre_name) DESC;

--название жанров у исполнителей
SELECT singer_name, genre_name FROM singer s
LEFT JOIN genre_singer gs ON s.singer_id = gs.singer_id
LEFT JOIN genre g ON gs.genre_id = g.genre_id
ORDER BY singer_name;

--количество исполнителей в каждом жанре 1
SELECT genre_name, COUNT(gs.genre_id) FROM genre_singer gs 
JOIN genre g ON g.genre_id = gs.genre_id
GROUP BY genre_name, gs.genre_id
ORDER BY COUNT(gs.genre_id) DESC;

--количество треков, вошедших в альбомы 2019-2020 годов 2
SELECT COUNT(trek_name) FROM trek t 
JOIN album a ON t.trek_id = a.album_id 
WHERE data between '2019-01-01' and '2020-12-31';

--с выводом названия альбома 2.1
SELECT album_name, COUNT(trek_name) FROM album a  
JOIN trek t  ON t.trek_id = a.album_id 
WHERE data between '2019-01-01' and '2020-12-31'
GROUP BY album_name
order by COUNT(trek_name);

--средняя продолжительность треков по каждому альбому 3
SELECT album_name, AVG(duration) FROM album a 
LEFT JOIN trek t ON t.album_id = a.album_id
GROUP BY album_name
order by AVG(duration) DESC;

--все исполнители, которые не выпустили альбомы в 2020 году 4
SELECT singer_name FROM singer s
WHERE singer_name NOT IN (
	SELECT singer_name FROM singer s
	JOIN singer_album sa ON s.singer_id = sa.singer_id 
	JOIN album a ON sa.album_id = a.album_id 
	WHERE data BETWEEN '2019-12-31' and '2021-01-01'
)
ORDER BY singer_name;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами) 5
SELECT compilation_name FROM compilation c
LEFT JOIN compilation_trek ct ON c.compilation_id = ct.compilation_id 
LEFT JOIN trek t ON ct.trek_id = t.trek_id 
LEFT JOIN album a ON a.album_id = t.album_id 
LEFT JOIN singer_album sa ON a.album_id = sa.album_id 
LEFT JOIN singer s ON s.singer_id = sa.singer_id 
WHERE singer_name LIKE 'Nivana'
ORDER BY singer_name;

--название альбомов, в которых присутствуют исполнители более 1 жанра 6
SELECT album_name, singer_name FROM album a 
LEFT JOIN singer_album sa ON a.album_id = sa.album_id 
LEFT JOIN singer s ON sa.singer_id = s.singer_id 
LEFT JOIN genre_singer gs ON gs.singer_id = s.singer_id 
GROUP BY album_name, singer_name
HAVING COUNT(gs.singer_id) > 1;
ORDER BY COUNT(gs.singer_id) DESC;

--наименование треков, которые не входят в сборники 7
SELECT trek_name, ct.compilation_id FROM trek t
LEFT JOIN compilation_trek ct ON t.trek_id = ct.trek_id
WHERE ct.compilation_id IS null;

--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько)8
SELECT singer_name, duration FROM singer s 
LEFT JOIN singer_album sa ON s.singer_id = sa.singer_id
LEFT JOIN album a ON a.album_id = sa.album_id
LEFT JOIN trek t ON a.album_id = t.album_id 
WHERE duration = (
	SELECT MIN(duration) FROM trek 
	);
	
--название альбомов, содержащих наименьшее количество треков 9
SELECT album_name, COUNT(trek_name) FROM album a 
JOIN trek t ON a.album_id = t.album_id 
GROUP BY album_name 
HAVING COUNT(trek_name) = ( 
	SELECT MIN(COUNT) FROM (
		SELECT album_name, COUNT(trek_name) FROM album a 
		JOIN trek t ON a.album_id = t.album_id 
		GROUP BY album_name
	)
as min);
