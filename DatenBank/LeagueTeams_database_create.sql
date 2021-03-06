#League Of Legends Website/APP

drop database if exists LeagueTeams;
create database if not exists LeagueTeams;
use LeagueTeams;

#Tabellen

create table if not exists t_rolle (
  r_id int auto_increment not null,
  r_bezeichnung varchar(25),
  primary key (r_id)
);

create table if not exists t_team (
   te_id int auto_increment not null,
   te_name varchar(50),
   te_kuerzel varchar(3),
   primary key (te_id)
);

create table if not exists t_player (
    p_id int auto_increment not null,
    p_name varchar(25),
    p_vname varchar(25),
  	 p_ingamename varchar(50),
  	 p_herkunft varchar(50) default 'unbekannt',
    p_team int,
  	 p_r_rolle int,
    p_geb date,
    primary key (p_id),
    foreign key (p_team) references t_team(te_id),
  	 foreign KEY (p_r_rolle) references t_rolle(r_id)
);

CREATE TABLE if NOT EXISTS t_gesamt_stats
(
    s_te_id INT auto_increment not null,
    s_win INT,
    s_loose INT,
    s_nashes INT,
    s_tower INT,
    PRIMARY KEY (s_te_id),
    FOREIGN KEY (s_te_id) REFERENCES t_team(te_id)
);

Create table if not exists t_spieltag
(
	sp_id int auto_increment not null,
  sp_tag int not null,
  sp_blue_side int,
  sp_red_side int,
  sp_blue_win boolean not null default 0,
  primary key (sp_id),
  foreign key (sp_blue_side) references t_team(te_id),
  foreign key (sp_red_side) references t_team(te_id)
);

Create table if not exists t_spiel_stats
(
  ss_sp_id int auto_increment not null,
  ss_blue_kills int,
  ss_blue_drakes int,
  ss_blue_nashes int,
  ss_blue_turrets int,
  ss_blue_inhibs int,
  ss_red_kills int,
  ss_red_drakes int,
  ss_red_nashes int,
  ss_red_turrets int,
  ss_red_inhibs int,
  primary key (ss_sp_id),
  foreign key (ss_sp_id) references t_team(te_id)
);


#INSERT INTO

#Rollen
INSERT INTO t_rolle (r_bezeichnung) VALUES

('Toplane'),
('Jungle'),
('Midlane'),
('Botlane'),
('Support');


#Teams
INSERT INTO t_team (te_name, te_kuerzel) VALUES

('G2 ESports', 'G2'), ('Fnatic', 'FNC'),
('Rogue', 'RGE'), ('Schalke 04', 'S04'),
('SK Gaming', 'SK'), ('Unicorns of Love', 'UOL'),
('Funplus Phoenix', 'FPX'), ('Vega Squadron', 'VEG'),
('Damwon Gaming', 'DWG'), ('Gambit Esports', 'GMB');


#Spieler
INSERT INTO t_player (p_name, p_vname, p_ingamename, p_team, p_r_rolle) VALUES

#G2 Esports

('Larsson', 'Martin', 'G2 Rekkles', 1, 4),
('Winther','Rasmus', 'G2 Caps', 1, 3),
('Mehle', 'Mihael', 'G2 Mikyx', 1, 5),
('Hansen', 'Martin', 'G2 Wunder', 1, 1),
('Jankowski', 'Marcin', 'G2 Jankos', 1, 2),

#Fnatic

('Rau', 'Gabriël', 'FNC Bwipo ', 2, 1),
('Boderek', 'Oskar', 'FNC Selfmade', 2, 2),
('Dinçer', 'Yasin', 'FNC Nisqy', 2, 3),
('Lipp', 'Elias', 'FNC Upset', 3, 4),
('Iliev Galabov', 'Zdravets', 'FNC Hylissang', 3, 5),

#Rogue

('Pascu', 'Andrei', 'RGE Odoamne', 3, 1),
('Słoma','Kacper', 'RGE Inspired', 3, 2),
('Larsson', 'Emil', 'RGE Larssen ', 3, 3),
('Liv', 'Steven', 'RGE Hans Sama', 3, 4),
('Trybus', 'Adrian', 'RGE Trymbi', 3, 5),

#Schalke 04

('Çelik', 'Sergen', 'S04 Broken Blade', 4, 1),
('Demir','Erberk', 'S04 Gilius', 4, 2),
('Braun', 'Felix', 'S04 Abbedagge', 4, 3),
('Jakubčík', 'Matúš', 'S04 Neon', 4, 4),
('Tot', 'Dino', 'S04 LIMIT', 4, 5),

#SK Gaming

('Bartels', 'Janik', 'SK Jenax', 5, 1),
('Østergaard Hansen','Kristian', 'SK TynX', 5, 2),
('Gören', 'Ersin', 'SK Blue', 5, 3),
('Massol', 'Jean', 'SK Jezu', 5, 4),
('Wessén', 'Erik', 'SK Treatz', 5, 5),

#Unicorns Of Love

('Fomin', 'Vladislav', 'UOL BOSS', 6, 1),
('Skvortsov','Kirill', 'UOL AHaHaCiK ', 6, 2),
('Yakshin', 'Lev', 'UOL Nomanz', 6, 3),
('Botezatu', 'Antonio', 'UOL Frappii', 6, 4),
('Lifashin', 'Aleksandr', 'UOL SaNTaS', 6, 5),

#Funplus Phoenix

('Jang', 'Ha-gwon', 'FPX Nuguri', 7, 1),
('Yang','Ling', 'FPX Beichuan', 7, 2),
('Kim', 'Tae-sang', 'FPX Doinb', 7, 3),
('Lin', 'Wei-Xiang', 'FPX Lwx', 7, 4),
('Liu', 'Quing-Song', 'FPX Crisp', 7, 5),

#Vega Squadron

('Zuravlev', 'Oleg', 'VEG Charger ', 8, 1),
('Zenyan','Artem', 'VEG Rein ', 8, 2),
('Moskalenko', 'Zhenya', 'VEG PekiDo', 8, 3),
('Averin', 'Vadim', 'VEG CyraXx', 8, 4),
('Musaev', 'Ali', 'VEG Mercenary', 8, 5),

#Damwon Gaming

('Kim', 'Dong-ha', 'DWG Khan', 9, 1),
('Kim','Geon-bu', 'DWG Canyon', 9, 2),
('Heo', 'Su', 'DWG ShowMaker', 9, 3),
('Jang', 'Yong-jun', 'DWG Ghost', 9, 4),
('Cho', 'Geon-hee', 'DWG BeryL', 9, 5),

#Gambit Esports

('Leksin', 'Mark', 'GMB DREAMPYLLA', 10, 1),
('Glazkov','Alexander', 'GMB PvPStejos', 10, 2),
('Lemeshchuk', 'Alexey', 'GMB Phlaty', 10, 3),
('Pervushin', 'Artyom', 'GMB Shiganari', 10, 4),
('Lexikov', 'Alexander', 'GMB Lekcycc', 10, 5);