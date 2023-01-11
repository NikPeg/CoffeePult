CREATE TABLE `User`(
    `login` TEXT NOT NULL,
    `password` TEXT NOT NULL,
    `email` TEXT NOT NULL
);
ALTER TABLE
    `User` ADD PRIMARY KEY `user_login_primary`(`login`);
CREATE TABLE `friendsrequest`(
    `from_login` TEXT NOT NULL,
    `to_login` TEXT NOT NULL,
    `status` BINARY(16) NOT NULL
);
ALTER TABLE
    `friendsrequest` ADD PRIMARY KEY `friendsrequest_from_login_primary`(`from_login`);
ALTER TABLE
    `friendsrequest` ADD PRIMARY KEY `friendsrequest_to_login_primary`(`to_login`);
CREATE TABLE `game`(
    `name` TEXT NOT NULL,
    `type` INT NOT NULL,
    `players_count` INT NOT NULL,
    `time` INT NOT NULL,
    `description` TEXT NOT NULL,
    `image` TEXT NOT NULL COMMENT 'a link to the file'
);
ALTER TABLE
    `game` ADD PRIMARY KEY `game_name_primary`(`name`);
CREATE TABLE `event`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `game_name` TEXT NOT NULL,
    `start` DATETIME NOT NULL,
    `end` DATETIME NOT NULL,
    `address` TEXT NOT NULL,
    `longitude` DOUBLE(8, 2) NOT NULL,
    `latitude` DOUBLE(8, 2) NOT NULL,
    `players_level` INT NOT NULL,
    `happened` TINYINT(1) NOT NULL,
    `duration` INT NULL
);
ALTER TABLE
    `event` ADD PRIMARY KEY `event_id_primary`(`id`);
CREATE TABLE `registration`(
    `user_login` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `event_id` INT NOT NULL
);
ALTER TABLE
    `registration` ADD PRIMARY KEY `registration_user_login_primary`(`user_login`);
ALTER TABLE
    `registration` ADD PRIMARY KEY `registration_event_id_primary`(`event_id`);
CREATE TABLE `games_collection`(
    `user_login` TEXT NOT NULL,
    `game_name` TEXT NOT NULL
);
ALTER TABLE
    `games_collection` ADD PRIMARY KEY `games_collection_user_login_primary`(`user_login`);
ALTER TABLE
    `games_collection` ADD PRIMARY KEY `games_collection_game_name_primary`(`game_name`);
CREATE TABLE `winners`(
    `user_login` INT NOT NULL,
    `event_id` INT UNSIGNED NOT NULL AUTO_INCREMENT
);
ALTER TABLE
    `winners` ADD PRIMARY KEY `winners_user_login_primary`(`user_login`);
ALTER TABLE
    `winners` ADD PRIMARY KEY `winners_event_id_primary`(`event_id`);
ALTER TABLE
    `event` ADD CONSTRAINT `event_game_name_foreign` FOREIGN KEY(`game_name`) REFERENCES `game`(`name`);