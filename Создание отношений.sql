CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS singer (
	singer_id SERIAL PRIMARY KEY,
	singer_name VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS genre_singer (
	genre_id INTEGER NOT NULL REFERENCES genre(genre_id),
	singer_id INTEGER NOT NULL REFERENCES singer(singer_id),
	CONSTRAINT pk PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(160)NOT NULL UNIQUE,
	data date NOT NULL
);

CREATE TABLE IF NOT EXISTS singer_album (
	singer_album_id SERIAL PRIMARY KEY,
	singer_id INTEGER NOT NULL REFERENCES singer(singer_id),
	album_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS trek (
	trek_id SERIAL PRIMARY KEY,
	trek_name VARCHAR(160) NOT NULL UNIQUE,
	album_id INTEGER NOT NULL REFERENCES album(album_id),
	duration int CHECK(duration > 0 AND duration < 600)
);

CREATE TABLE IF NOT EXISTS compilation (
	compilation_id SERIAL PRIMARY KEY,
	compilation_name VARCHAR(160) NOT NULL,
	year_of_ussue date NOT NULL
);

CREATE TABLE IF NOT EXISTS compilation_trek (
	compilation_trek_id SERIAL PRIMARY KEY,
	trek_id INTEGER NOT NULL REFERENCES Trek(trek_id),
	compilation_id INTEGER NOT NULL REFERENCES compilation(compilation_id)
);