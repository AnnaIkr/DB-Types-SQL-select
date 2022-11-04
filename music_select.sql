import sqlalchemy
from pprint import pprint

engine = sqlalchemy.create_engine('')
pprint(engine)

connection = engine.connect()
print(connection)
pprint(engine.table_names())

#1.Название и год выхода альбомов, вышедших в 2018 году
select_1 = connection.execute('''SELECT  name, releasedate FROM album
WHERE releasedate BETWEEN '2018';
''').fetchall()
pprint(select_1)

#2.Название и продолжительность самого длительного трека
select_2 = connection.execute('''SELECT   name, tracklength FROM track
ORDER BY tracklength DESC;
''').fetchone()
pprint(select_2)

#3.Название треков, продолжительность которых не менее 3,5 минуты
select_3 = connection.execute('''SELECT  name FROM track
WHERE tracklength >= 03.50;
''').fetchall()
pprint(select_3)

#4.Названия сборников, вышедших в период с 2018 по 2020 год включительно
select_4 = connection.execute('''SELECT name FROM collections
WHERE release_year BETWEEN '2018' AND '2020';
''').fetchall()
pprint(select_4)

#5.Исполнители, чье имя состоит из 1 слова
select_5 = connection.execute('''SELECT name FROM artist
WHERE name NOT LIKE '%% %%';
''').fetchall()
pprint(select_5)

#6.Название треков, которые содержат слово "мой"/"my"
select_6 = connection.execute('''SELECT name FROM track
WHERE name LIKE '%%my%%';
''').fetchall()
pprint(select_6)