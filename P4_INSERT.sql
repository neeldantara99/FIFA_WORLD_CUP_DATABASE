SELECT * FROM WORLD_CUP;
SELECT * FROM REFEREE;
SELECT * FROM STADIUM;
SELECT * FROM MATCH;
SELECT * FROM SPONSOR;
SELECT * FROM TEAM;
SELECT * FROM MATCH_STATISTICS;
SELECT * FROM TEAM_DETAILS;
SELECT * FROM PLAYER;
SELECT * FROM PLAYER_STATISTICS;
SELECT * FROM MATCH_REFEREE;


-- Inserting data into WORLD_CUP table
INSERT INTO WORLD_CUP (Winning_Team, Man_of_the_Tournament)
VALUES
    ('Brazil', 'Neymar'),
    ('Germany', 'Miroslav Klose'),
    ('Spain', 'Andres Iniesta'),
    ('France', 'Zinedine Zidane'),
    ('Italy', 'Fabio Grosso'),
    ('Argentina', 'Diego Maradona'),
    ('England', 'Bobby Charlton'),
    ('Uruguay', 'Diego Forlan'),
    ('Portugal', 'Eusebio'),
    ('Netherlands', 'Johan Cruyff');

-- Inserting data into REFEREE table
INSERT INTO REFEREE (World_cup_ID, Years_of_Experience)
VALUES
    (1, 5),
    (1, 8),
    (1, 9),
    (1, 10),
    (1, 6),
    (1, 12),
    (1, 7),
    (1, 4),
    (1, 9),
    (1, 11);


-- Inserting data into STADIUM table
INSERT INTO STADIUM (World_cup_ID, Stadium_Name, City, Country, Capacity, Ticket_Price, Pitch_Condition)
VALUES
    (1, 'Maracanã', 'Rio de Janeiro', 'Brazil', 78901, 100.50, 'Excellent'),
    (1, 'Olympiastadion', 'Berlin', 'Germany', 74744, 85.25, 'Good'),
    (1, 'Santiago Bernabeu', 'Madrid', 'Spain', 81044, 90.75, 'Excellent'),
    (1, 'Stade de France', 'Saint-Denis', 'France', 81338, 95.00, 'Good'),
    (1, 'Stadio Olimpico', 'Rome', 'Italy', 72698, 88.20, 'Excellent'),
    (1, 'Estadio Azteca', 'Mexico City', 'Mexico', 87154, 110.00, 'Good'),
    (1, 'Wembley Stadium', 'London', 'England', 90000, 105.75, 'Excellent'),
    (1, 'Centenario', 'Montevideo', 'Uruguay', 60235, 75.50, 'Good'),
    (1, 'Estádio da Luz', 'Lisbon', 'Portugal', 64947, 92.30, 'Excellent'),
    (1, 'Johan Cruyff Arena', 'Amsterdam', 'Netherlands', 54851, 80.25, 'Good');

-- Inserting data into MATCH table
INSERT INTO MATCH (Stadium_ID, Match_Type, Date, Mvp)
VALUES
    (1, 'Group Stage', '2022-06-14', 'Neymar'),
    (2, 'Final', '2022-07-15', 'Mario Götze'),
    (3, 'Semifinal', '2022-07-11', 'Xavi Hernandez'),
    (4, 'Group Stage', '2022-07-15', 'Zinedine Zidane'),
    (5, 'Group Stage', '2022-06-18', 'Fabio Grosso'),
    (6, 'Quarterfinal', '2022-07-15', 'Andres Iniesta'),
    (7, 'Quarterfinal', '2022-07-15', 'Geoff Hurst'),
    (8, 'Round of 16', '2022-06-15', 'Diego Forlan'),
    (9, 'Round of 16', '2022-06-17', 'Eusebio'),
    (10, 'Round of 16', '2022-07-15', 'Johan Cruyff');

-- Inserting data into SPONSOR table
INSERT INTO SPONSOR (World_cup_ID, Sponsor_Name, Sponsor_Amount, Business_Domain)
VALUES
    (1, 'Adidas', 5000000.00, 'Sportswear'),
    (1, 'Coca-Cola', 3000000.50, 'Beverages'),
    (1, 'VISA', 4000000.75, 'Finance'),
    (1, 'Hyundai', 2500000.25, 'Automobile'),
    (1, 'Puma', 3500000.80, 'Sportswear'),
    (1, 'Budweiser', 2000000.45, 'Beverages'),
    (1, 'Nike', 4500000.60, 'Sportswear'),
    (1, 'MasterCard', 2800000.35, 'Finance'),
    (1, 'Chevrolet', 3200000.90, 'Automobile'),
    (1, 'Heineken', 1800000.55, 'Beverages');

-- Inserting data into TEAM table
INSERT INTO TEAM (Sponsor_ID, World_cup_ID, Nationality, Team_Manager)
VALUES
    (1, 1, 'Brazil', 'Tite'),
    (2, 1, 'Germany', 'Joachim Low'),
    (3, 1, 'Spain', 'Luis Enrique'),
    (4, 1, 'France', 'Didier Deschamps'),
    (5, 1, 'Italy', 'Roberto Mancini'),
    (6, 1, 'Argentina', 'Lionel Scaloni'),
    (7, 1, 'England', 'Gareth Southgate'),
    (8, 1, 'Uruguay', 'Óscar Tabárez'),
    (9, 1, 'Portugal', 'Fernando Santos'),
    (10, 1, 'Netherlands', 'Frank de Boer');

-- Inserting data into MATCH_STATISTICS table
INSERT INTO MATCH_STATISTICS (Team_ID, Match_ID, Goals, Fouls, Corner, Offside, Total_Distance)
VALUES
    (1, 1, 3, 10, 5, 2, 12000),
    (2, 2, 2, 8, 7, 1, 11000),
    (3, 3, 1, 12, 4, 3, 10500),
    (4, 4, 4, 9, 6, 0, 11500),
    (5, 5, 2, 11, 8, 2, 12500),
    (6, 6, 3, 10, 5, 1, 11200),
    (7, 7, 1, 9, 6, 2, 11800),
    (8, 8, 4, 8, 7, 0, 10800),
    (9, 9, 2, 10, 4, 3, 11300),
    (10, 10, 3, 11, 5, 1, 12200);

-- Inserting data into TEAM_DETAILS table
INSERT INTO TEAM_DETAILS (Team_ID, Formation, Captain_Name, Vice_Captain_Name, Kit_Color)
VALUES
    (1, '4-3-3', 'Neymar', 'Casemiro', 'Yellow'),
    (2, '4-2-3-1', 'Manuel Neuer', 'Joshua Kimmich', 'White'),
    (3, '4-3-3', 'Sergio Ramos', 'Sergio Busquets', 'Red'),
    (4, '4-4-2', 'Hugo Lloris', 'Raphael Varane', 'Blue'),
    (5, '4-3-3', 'Giorgio Chiellini', 'Leonardo Bonucci', 'Blue'),
    (6, '4-2-3-1', 'Lionel Messi', 'Nicolas Otamendi', 'White'),
    (7, '4-3-3', 'Harry Kane', 'Harry Maguire', 'White'),
    (8, '4-4-2', 'Diego Godín', 'Luis Suárez', 'Sky Blue'),
    (9, '4-3-3', 'Cristiano Ronaldo', 'Bruno Fernandes', 'Red'),
    (10, '4-2-3-1', 'Virgil van Dijk', 'Georginio Wijnaldum', 'Orange');

-- Inserting data into PLAYER table
INSERT INTO PLAYER (Team_ID, Date_of_Birth, Position, Jersey_Number, Strong_Foot)
VALUES
    (1, '1992-02-05', 'Forward', 10, 'Left'),
    (2, '1986-03-27', 'Goalkeeper', 1, 'Right'),
    (3, '1986-03-30', 'Defender', 4, 'Right'),
    (4, '1986-12-26', 'Goalkeeper', 1, 'Right'),
    (5, '1984-08-14', 'Defender', 3, 'Left'),
    (6, '1987-06-24', 'Forward', 10, 'Left'),
    (7, '1993-07-28', 'Midfielder', 9, 'Right'),
    (8, '1986-02-16', 'Defender', 3, 'Right'),
    (9, '1985-02-05', 'Forward', 7, 'Right'),
    (10, '1991-07-08', 'Midfielder', 4, 'Right');

-- Inserting data into PLAYER_STATISTICS table
INSERT INTO PLAYER_STATISTICS (Player_ID, Match_ID, Total_Goals, Total_Saves, Total_Fouls, Total_Offsides, Total_Freekicks, Total_Corners)
VALUES
    (1, 1, 12, 0, 1, 1, 3, 5),
    (2, 2, 10, 5, 2, 0, 0, 0),
    (3, 3, 11, 0, 3, 2, 1, 2),
    (4, 4, 0, 3, 1, 0, 0, 0),
    (5, 5, 5, 0, 2, 1, 2, 3),
    (6, 6, 2, 0, 1, 1, 4, 2),
    (7, 7, 1, 0, 2, 0, 0, 0),
    (8, 8, 3, 2, 1, 0, 0, 0),
    (9, 9, 4, 0, 1, 1, 2, 1),
    (10, 10, 7, 0, 2, 0, 0, 0);

-- Inserting data into MATCH_REFEREE table
INSERT INTO MATCH_REFEREE (Match_ID, Referee_ID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
