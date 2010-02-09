drop table if exists 'courses';
CREATE TABLE `courses` (
  `course_id` INTEGER primary key,
  `name` text varchar(128) default null,
  `location` text varchar(128) default null
);

drop table if exists 'game_players';
CREATE TABLE `game_players` (
  `game_player_id` integer primary key,
  `player_id` integer default null,
  `game_id` integer default null
);

drop table if exists 'games';
CREATE TABLE `games` (
  `game_id` integer primary key,
  `course_id` integer default NULL,
  `date` text varchar(128) default NULL,
  `timestamp` text varchar(50) default NULL,
  `description` text varchar(3000) default NULL
);

DROP TABLE IF EXISTS `holes`;
CREATE TABLE `holes` (
  `hole_id` integer primary key,
  `number` integer default NULL,
  `par` integer default NULL,
  `course_id` integer default NULL
);

DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores` (
  `score_id` integer primary key,
  `hole_id` integer default NULL,
  `game_id` integer default NULL,
  `player_id` integer default NULL,
  `score` integer default NULL
);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` integer primary key,
  `firstName` text varchar(50) default NULL,
  `lastName` text varchar(50) default NULL,
  `userName` text varchar(50) default NULL,
  `password` text varchar(128) default NULL,
  `admin` integer default NULL
);
