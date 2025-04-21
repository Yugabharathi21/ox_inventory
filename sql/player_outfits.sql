CREATE TABLE IF NOT EXISTS `player_outfits` (
    `citizenid` varchar(50) NOT NULL,
    `outfit` longtext DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; 