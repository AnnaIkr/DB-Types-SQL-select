CREATE TABLE IF NOT EXISTS Исполнитель (
	id_artist SERIAL PRIMARY key,
	Имя_исполнителя VARCHAR(60) NOT NULL unique
);
CREATE TABLE IF NOT EXISTS Альбом (
	id_album SERIAL PRIMARY key,
	Название_альбома VARCHAR(100)  NOT NULL, 
	Год_выпуска VARCHAR(4) NOT NULL
);
CREATE TABLE IF NOT EXISTS Трек (
	id_track SERIAL PRIMARY key,
	Название_трека VARCHAR(100)  NOT NULL,
	Длительность numeric(3,2) NOT NULL,
	id_album INTEGER REFERENCES Альбом(id_album) NOT NULL
);
CREATE TABLE IF NOT EXISTS Сборник (
	id_collection SERIAL PRIMARY key,
	Название_сборника VARCHAR(100)  NOT NULL, 
	Год_выпуска VARCHAR(4) NOT NULL
);
CREATE TABLE IF NOT EXISTS Жанр (
    id_genre SERIAL PRIMARY key,
	Название_жанра VARCHAR(100)  NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS Жанр_исполнителя (
    id_artist INTEGER REFERENCES Исполнитель(id_artist) NOT null,
    id_genre INTEGER REFERENCES Жанр_исполнителя(id_genre) NOT null
);
CREATE TABLE IF NOT EXISTS Альбом_исполнителя (
    id_album INTEGER REFERENCES Альбом(id_album) NOT null,
	id_artist INTEGER REFERENCES Исполнитель(id_artist) NOT null
);
CREATE TABLE IF NOT EXISTS Сборник_исполнителей (
    id_collection INTEGER REFERENCES Сборник(id_collection) NOT null,
	id_track INTEGER REFERENCES Трек(id_track) NOT NULL
);