SELECT * FROM `event` WHERE `event`	DATE(`start`)='anyDate' AND 
(SELECT COUNT(*) FROM `registration` WHERE `event_id`=`event`.`id')<
(SELECT MAX(`players_count`) FROM `game` WHERE `game`.`name`=`event`.`name`);