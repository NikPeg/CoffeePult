CREATE TABLE `User`(
    `login` VARCHAR(255) NOT NULL,
    `password` TEXT NOT NULL,
    `email` TEXT NOT NULL,
    `level` INT NOT NULL
);
ALTER TABLE
    `User` ADD PRIMARY KEY `user_login_primary`(`login`);
CREATE TABLE `friendsrequest`(
    `from_login` VARCHAR(255) NOT NULL,
    `to_login` VARCHAR(255) NOT NULL,
    `status` BINARY(16) NOT NULL
);
ALTER TABLE
    `friendsrequest` ADD PRIMARY KEY `friendsrequest_from_login_primary`(`from_login`);
CREATE TABLE `game`(
    `name` VARCHAR(255) NOT NULL,
    `type` INT NOT NULL,
    `players_count` INT NOT NULL,
    `time` INT NOT NULL,
    `description` TEXT NOT NULL,
    `image` TEXT NOT NULL COMMENT 'a link to the file'
);
ALTER TABLE
    `game` ADD PRIMARY KEY `game_name_primary`(`name`);
CREATE TABLE `event`(
    `id` INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `game_name` TEXT NOT NULL,
    `start` DATETIME NOT NULL,
    `end` DATETIME NOT NULL,
    `address` TEXT NOT NULL,
    `longitude` DOUBLE(8, 2) NOT NULL,
    `latitude` DOUBLE(8, 2) NOT NULL,
    `min_level` INT NOT NULL,
    `happened` TINYINT(1) NOT NULL,
    `duration` INT NOT NULL,
    `author` VARCHAR(255) NOT NULL
);
CREATE TABLE `registration`(
    `user_login` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `event_id` INT NOT NULL
);
ALTER TABLE
    `registration` ADD PRIMARY KEY `registration_user_login_primary`(`user_login`);
CREATE TABLE `games_collection`(
    `user_login` VARCHAR(255) NOT NULL,
    `game_name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `games_collection` ADD PRIMARY KEY `games_collection_user_login_primary`(`user_login`);
CREATE TABLE `winners`(
    `user_login` VARCHAR(255) NOT NULL,
    `event_id` INT UNSIGNED NOT NULL AUTO_INCREMENT
);
ALTER TABLE
    `winners` ADD PRIMARY KEY `winners_user_login_primary`(`user_login`);
ALTER TABLE
    `friendsrequest` ADD CONSTRAINT `friendsrequest_to_login_foreign` FOREIGN KEY(`to_login`) REFERENCES `User`(`login`);
ALTER TABLE
    `event` ADD CONSTRAINT `event_game_name_foreign` FOREIGN KEY(`game_name`) REFERENCES `game`(`name`);
ALTER TABLE
    `winners` ADD CONSTRAINT `winners_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `event`(`id`);
ALTER TABLE
    `event` ADD CONSTRAINT `event_author_foreign` FOREIGN KEY(`author`) REFERENCES `User`(`login`);
ALTER TABLE
    `registration` ADD CONSTRAINT `registration_event_id_foreign` FOREIGN KEY(`event_id`) REFERENCES `event`(`id`);
ALTER TABLE
    `games_collection` ADD CONSTRAINT `games_collection_game_name_foreign` FOREIGN KEY(`game_name`) REFERENCES `game`(`name`);