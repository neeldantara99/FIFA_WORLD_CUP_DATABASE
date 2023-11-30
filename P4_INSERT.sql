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
INSERT INTO WORLD_CUP (World_cup_ID, Winning_Team, Man_of_the_Tournament)
VALUES
    (1, 'France', 'Luka Modric'),
    (2, 'Germany', 'Lionel Messi'),
    (3, 'Spain', 'Andres Iniesta'),
    (4, 'Brazil', 'Zinedine Zidane'),
    (5, 'Italy', 'Zinedine Zidane'),
    (6, 'Argentina', 'Diego Maradona'),
    (7, 'England', 'Pele'),
    (8, 'Uruguay', 'Diego Forlan'),
    (9, 'Brazil', 'Ronaldo'),
    (10, 'Germany', 'Oliver Kahn');

-- Inserting data into REFEREE table
INSERT INTO REFEREE (Referee_ID, World_cup_ID, Years_of_Experience)
VALUES
    (1, 1, 10),
    (2, 1, 8),
    (3, 1, 12),
    (4, 1, 6),
    (5, 1, 15),
    (6, 1, 9),
    (7, 1, 11),
    (8, 1, 7),
    (9, 1, 14),
    (10,1, 8);


-- Inserting data into STADIUM table
INSERT INTO STADIUM (Stadium_ID, World_cup_ID, Stadium_Name, City, Country, Capacity, Ticket_Price, Pitch_Condition)
VALUES
    (1, 1, 'Stade de France', 'Saint-Denis', 'France', 81000, 50.00, 'Excellent'),
    (2, 1, 'Olympiastadion', 'Berlin', 'Germany', 74704, 45.00, 'Good'),
    (3, 1, 'Santiago Bernabeu', 'Madrid', 'Spain', 81044, 55.00, 'Excellent'),
    (4, 1, 'Maracana', 'Rio de Janeiro', 'Brazil', 78838, 60.00, 'Excellent'),
    (5, 1, 'Stadio Olimpico', 'Rome', 'Italy', 72698, 55.00, 'Good'),
    (6, 1, 'Estadio Monumental', 'Buenos Aires', 'Argentina', 78000, 40.00, 'Good'),
    (7, 1, 'Wembley Stadium', 'London', 'England', 90000, 65.00, 'Excellent'),
    (8, 1, 'Estadio Centenario', 'Montevideo', 'Uruguay', 60000, 35.00, 'Good'),
    (9, 1, 'Arena de Sao Paulo', 'Sao Paulo', 'Brazil', 48876, 50.00, 'Excellent'),
    (10, 1, 'Allianz Arena', 'Munich', 'Germany', 75000, 55.00, 'Excellent');

-- Inserting data into MATCH table
INSERT INTO MATCH (Match_ID, Stadium_ID, Match_Type, Date, Mvp)
VALUES
    (1, 1, 'Group Stage', '2022-06-10', 'Kylian Mbappe'),
    (2, 2, 'Quarterfinal', '2022-06-18', 'Thomas Muller'),
    (3, 3, 'Semifinal', '2022-06-26', 'Sergio Ramos'),
    (4, 4, 'Final', '2022-07-03', 'Neymar Jr.'),
    (5, 5, 'Group Stage', '2022-06-15', 'Cristiano Ronaldo'),
    (6, 6, 'Round of 16', '2022-06-30', 'Antoine Griezmann'),
    (7, 7, 'Quarterfinal', '2022-07-07', 'Harry Kane'),
    (8, 8, 'Round of 16', '2022-07-11', 'Luka Modric'),
    (9, 9, 'Round of 16', '2022-07-15', 'Mario Mandzukic'),
    (10, 10, 'Group Stage', '2022-06-16', 'Thomas Muller');

-- Inserting data into SPONSOR table
INSERT INTO SPONSOR (Sponsor_ID, World_cup_ID, Sponsor_Name, Sponsor_Amount, Business_Domain)
VALUES
    (1, 1, 'Adidas', 15000000.00, 'Sportswear'),
    (2, 1, 'Coca-Cola', 12000000.00, 'Beverages'),
    (3, 1, 'BBVA', 10000000.00, 'Banking'),
    (4, 1, 'Nike', 18000000.00, 'Sportswear'),
    (5, 1, 'Puma', 13000000.00, 'Sportswear'),
    (6, 1, 'Quilmes', 8000000.00, 'Brewery'),
    (7, 1, 'VISA', 16000000.00, 'Payment Services'),
    (8, 1, 'AUF', 9000000.00, 'Football Association'),
    (9, 1, 'Itau', 11000000.00, 'Banking'),
    (10,1, 'Volkswagen', 14000000.00, 'Automotive');

-- Inserting data into TEAM table
INSERT INTO TEAM (Team_ID, Sponsor_ID, World_cup_ID, Nationality, Team_Manager)
VALUES
    (1, 1, 1, 'France', 'Didier Deschamps'),
    (2, 2, 1, 'Germany', 'Joachim Low'),
    (3, 3, 1, 'Spain', 'Vicente del Bosque'),
    (4, 4, 1, 'Brazil', 'Tite'),
    (5, 5, 1, 'Italy', 'Roberto Mancini'),
    (6, 6, 1, 'Argentina', 'Lionel Scaloni'),
    (7, 7, 1, 'England', 'Gareth Southgate'),
    (8, 8, 1, 'Uruguay', 'Oscar Tabarez'),
    (9, 9, 1, 'Brazil', 'Luiz Felipe Scolari'),
    (10, 10, 1, 'Germany', 'Joachim Low');

-- Inserting data into MATCH_STATISTICS table
INSERT INTO MATCH_STATISTICS (Statistics_ID, Team_ID, Match_ID, Goals, Fouls, Corner, Offside, Total_Distance)
VALUES
    (1, 1, 1, 2, 12, 8, 2, 10500),
    (2, 2, 2, 1, 18, 5, 1, 9800),
    (3, 3, 3, 3, 10, 6, 3, 11000),
    (4, 4, 4, 4, 14, 7, 0, 11500),
    (5, 5, 5, 3, 16, 9, 1, 10200),
    (6, 6, 6, 4, 22, 10, 0, 12000),
    (7, 7, 7, 2, 8, 4, 3, 9500),
    (8, 8, 8, 1, 15, 6, 1, 10300),
    (9, 9, 9, 3, 20, 8, 2, 10800),
    (10, 10, 10, 2, 14, 7, 1, 10000);

-- Inserting data into TEAM_DETAILS table
INSERT INTO TEAM_DETAILS (Team_Details_ID, Team_ID, Formation, Captain_Name, Vice_Captain_Name, Kit_Color)
VALUES
    (1, 1, '4-3-3', 'Hugo Lloris', 'Raphael Varane', 'Blue'),
    (2, 2, '4-2-3-1', 'Manuel Neuer', 'Toni Kroos', 'White'),
    (3, 3, '4-3-3', 'Sergio Ramos', 'Andres Iniesta', 'Red'),
    (4, 4, '4-2-3-1', 'Thiago Silva', 'Neymar Jr.', 'Yellow'),
    (5, 5, '4-3-3', 'Giorgio Chiellini', 'Leonardo Bonucci', 'Blue'),
    (6, 6, '4-3-3', 'Lionel Messi', 'Sergio Aguero', 'White'),
    (7, 7, '3-4-3', 'Harry Kane', 'Jordan Henderson', 'White'),
    (8, 8, '4-4-2', 'Diego Godin', 'Luis Suarez', 'Sky Blue'),
    (9, 9, '4-2-3-1', 'Neymar Jr.', 'Thiago Silva', 'Yellow'),
    (10, 10, '4-2-3-1', 'Manuel Neuer', 'Toni Kroos', 'White');

-- Inserting data into PLAYER table
INSERT INTO PLAYER (Player_ID, Team_ID, Date_of_Birth, Position, Jersey_Number, Strong_Foot)
VALUES
    (1, 1, '1992-02-05', 'Forward', 10, 'Left'),
    (2, 2, '1986-03-27', 'Goalkeeper', 1, 'Right'),
    (3, 3, '1986-03-30', 'Defender', 4, 'Right'),
    (4, 4, '1986-12-26', 'Goalkeeper', 1, 'Right'),
    (5, 5, '1984-08-14', 'Defender', 3, 'Left'),
    (6, 6, '1987-06-24', 'Forward', 10, 'Left'),
    (7, 7, '1993-07-28', 'Midfielder', 9, 'Right'),
    (8, 8, '1986-02-16', 'Defender', 3, 'Right'),
    (9, 9, '1985-02-05', 'Forward', 7, 'Right'),
    (10, 10, '1991-07-08', 'Midfielder', 4, 'Right');

-- Inserting data into PLAYER_STATISTICS table
INSERT INTO PLAYER_STATISTICS (Player_Stats_ID, Player_ID, Match_ID, Total_Goals, Total_Saves, Total_Fouls, Total_Offsides, Total_Freekicks, Total_Corners)
VALUES
    (1, 1, 1, 1, 0, 2, 1, 0, 2),
    (2, 2, 2, 0, 5, 1, 0, 0, 1),
    (3, 3, 3, 1, 0, 3, 1, 0, 3),
    (4, 4, 4, 1, 0, 4, 0, 0, 4),
    (5, 5, 5, 2, 0, 3, 1, 0, 3),
    (6, 6, 6, 3, 0, 4, 0, 0, 4),
    (7, 7, 7, 1, 0, 1, 1, 0, 1),
    (8, 8, 8, 0, 5, 2, 0, 0, 2),
    (9, 9, 9, 2, 0, 3, 1, 0, 3),
    (10, 10, 10, 1, 0, 2, 1, 0, 2);

-- Inserting data into MATCH_REFEREE table
INSERT INTO MATCH_REFEREE (Match_Referee_ID, Match_ID, Referee_ID)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7),
    (8, 8, 8),
    (9, 9, 9),
    (10, 10, 10);
