INSERT INTO genre (genre_name) VALUES ('rock'), ('hip hop'), ('jazz'), ('pop'), ('disco');

INSERT INTO singer (singer_name) VALUES ('Nivana'), ('Linkin Park'), ('Eminem'), ('Gorillaz'), ('Frank Sinatra');
INSERT INTO singer (singer_name) VALUES ('Amy Winehouse'), ('Justin Timberlake'), ('The Beatles');
INSERT INTO singer (singer_name) VALUES ('Michael Jackson'), ('Kylie Minoque')

INSERT INTO album (album_name, data) VALUES ('Nevermind', '2010-09-24'), ('Meteora', '2003-03-23');
INSERT INTO album (album_name, data) VALUES ('Recovery', '2010-01-03'), ('Demon Days', '2005-05-11'), ('Sinatra Reprise', '1991-03-26');
INSERT INTO album (album_name, data) VALUES ('Black to Black', '2006-10-27'), ('Justified', '2002-11-04'), ('Revolver', '1966-08-05');
INSERT INTO album (album_name, data) VALUES ('Thriller', '1982-11-30'), ('Fever', '2001-10-01');


INSERT INTO trek (trek_name, album_id, duration) VALUES ('Smels Like Teen Spirit', 1, 288);
INSERT INTO trek (trek_name, album_id, duration) VALUES ('Come as you are', 1, 218), ('Numb', 2, 187), ('Faint', 2, 163), ('Love the way you lie', 3, 255);
INSERT INTO trek (trek_name, album_id, duration) VALUES ('Not afraid', 3, 250), ('Feel good Ink', 4, 221), ('Dare', 4, 245);
INSERT INTO trek (trek_name, album_id, duration) VALUES ('my way', 5, 275), ('Strangers in the night', 5, 126), ('Black to Black', 6, 241);
INSERT INTO trek (trek_name, album_id, duration) VALUES ('Rehad', 6, 294), ('Cry me a river', 7, 288), ('Rock your body', 7, 297);
INSERT INTO trek (trek_name, album_id, duration) VALUES ('Eleanor rigby', 8, 126), ('Yellow submarine', 8, 178), ('Billie Jean', 9, 290);
INSERT INTO trek (trek_name, album_id, duration) VALUES ('Thriller', 9, 235), ('Can't get you out of my head', 10, 230), ('In my Arms', 10, 212);

INSERT INTO compilation (compilation_name, year_of_ussue) VALUES ('Top 200 Rock на все времена', '2020-08-10'), ('Rock впрок 18', '2022-03-21');
INSERT INTO compilation (compilation_name, year_of_ussue) VALUES ('Top 500 Greatest HIP-HOP', '2018-05-02'), ('No more games', '2021-04-17');
INSERT INTO compilation (compilation_name, year_of_ussue) VALUES ('100 Greatest Classic Jazz songs', '2021-09-09'), ('POP Hits осень', '2022-09-03');
INSERT INTO compilation (compilation_name, year_of_ussue) VALUES ('Лучшая POP музыка', '2020-11-24'), ('The Disco HeadSpace', '2018-06-14');

INSERT INTO genre_singer (genre_id, singer_id) VALUES (1, 1), (1, 2), (1, 9), (2, 3), (2, 4), (2, 7), (2, 9), (3, 5), (3, 6), (4, 7), (4, 8), (4, 3);
INSERT INTO genre_singer (genre_id, singer_id) VALUES (4, 4), (4, 9), (4, 10), (4, 2), (5, 9), (5, 10), (5, 7), (1, 8);

INSERT INTO singer_album (singer_id, album_id) VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO compilation_trek (trek_id, compilation_id) VALUES (2, 1), (4, 1), (7, 1), (1, 2), (4, 2), (6, 2), (7, 2), (5, 3), (8, 3), (14, 3), (13, 4), (7, 4);
INSERT INTO compilation_trek (trek_id, compilation_id) VALUES (6, 4), (9, 5), (10, 5), (11, 5), (13, 6), (16, 6), (14, 7), (15, 7), (18, 7), (18, 8), (20, 8);