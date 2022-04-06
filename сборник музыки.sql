create table if not exists Жанры (
    id serial primary key,
    жанры_name varchar(100) not null unique
);

create table if not exists Музыканты (
    id serial primary key,
    name varchar(100) not null unique
);

create table if not exists МузыкантыЖанры (
    музыканты_id integer references Музыканты(id),
    жанры_id integer references Жанры(id),
    constraint pk_МузыкантыЖанры primary key (музыканты_id, жанры_id)
);

create table if not exists Альбомы (
    id serial primary key,
    альбомы_name varchar(100) not null,
    альбомы_start integer not null check (альбомы_start > 0)
);

create table if not exists МузыкантыАльбомы (
    музыканты_id integer not null references Музыканты(id),
    альбомы_id integer not null references Альбомы(id),
    constraint pk_МузыкантыАльбомы primary key (музыканты_id, альбомы_id)
);

create table if not exists Треки (
    id serial primary key,
    треки_name varchar(100) not null,
    треки_time numeric(3,2) not null check ( треки_time > 0 ),
    альбомы_id integer not null references Альбомы(id)
);

create table if not exists Сборники (
    id serial primary key,
    сборники_name varchar(100) not null,
    сборники_start numeric(6,2) not null check ( сборники_start > 0 )
);

create table if not exists ТрекиСборники (
    треки_id integer not null references Треки(id),
    сборники_id integer not null references Сборники(id),
    constraint pk_ТрекиСборники primary key (треки_id, сборники_id)
);

INSERT INTO Жанры(жанры_name) VALUES
    ('Pop Music'), ('Rock Music'), ('Rap Music'),('Classic Music'), ('Jazz Music');
   
INSERT INTO Музыканты(name) VALUES
    ('Madonna'),
    ('Metallica'),
    ('Bon Jovi'),
    ('50 Cent'),
    ('Eminem'),
    ('Kendrick Lamar'),
    ('Mozart'),
    ('Frank Sinatra');
   
   
INSERT INTO МузыкантыЖанры(музыканты_id, жанры_id) VALUES (1, 3),
                                                    (2, 2),
                                                    (3, 1),
                                                    (4, 4),
                                                    (5, 5),
                                                    (6, 3),
                                                    (7, 1),
                                                    (8, 3);
                                                   
INSERT INTO Альбомы(альбомы_name, альбомы_start) VALUES
    ('Music', 2000),
    ('Eye of The Beholder', 2019),
    ('Bed of Roses', 2019),
    ('Come and Get You',2018),
    ('Revival', 2017),
    ('DAMN', 2017),
    ('Sonata', 1778),
    ('My Way', 1969);
   
INSERT INTO МузыкантыАльбомы(музыканты_id, альбомы_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8);
   
INSERT INTO Треки(треки_name, треки_time, альбомы_id)  VALUES
    ('Music', 150, 1), ('Amazing', 180, 1),('Gone', 210, 1), --1 2 3
    ('Bettery', 154, 2), ('Blackend)', 125, 2), --4 5
    ('Bed of Roses', 130, 3),('Born To Be My Baby', 220, 3), --6 7
    ('Grew Up', 124, 4), --8
    ('Heat', 210, 5), --9
    ('BLOOD', 158, 6), ('DNA', 106,6), -- 10 11
    ('Piano Sonato # 16', 200, 7), -- 12 
    ('My Way', 136,8), ('Yesterday', 157, 8), ('All My Tomorrows', 140, 8); --13 14 15

INSERT INTO Сборники(сборники_name, сборники_start) VALUES
    ('Сборник №1 Rap', 2017),
    ('Сборник №2 Pop&Rock', 2018),
    ('Сборник №3 Rock', 2019),
    ('Сборник №4 Pop', 2008),
    ('Сборник №5 Pop&Rap', 2000),
    ('Сборник №6 Jazz', 2020),
    ('Сборник №7 Jazz&Classic', 2021),
    ('Сборник №8 All music', 2022);

INSERT INTO ТрекиСборники(треки_id, сборники_id)  VALUES
	(8,1),(9,1),(10,1),
	(1,2),(2,2),(3,2),(4,2),(6,2),
	(4,3),(5,3),(6,3),(7,3),
	(1,4),(2,4),
	(2,5),(9,5),
	(13,6),(14,6),
	(14,7),(15,7),(12,7),
	(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(11,8),(12,8),(13,8),(14,8),(15,8);
