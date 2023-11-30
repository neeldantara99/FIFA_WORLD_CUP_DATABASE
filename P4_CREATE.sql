CREATE DATABASE [P4 FIFA]
GO
USE [P4 FIFA]
GO


-- Creating the WORLD_CUP table
CREATE TABLE WORLD_CUP (
    World_cup_ID INT PRIMARY KEY,
    Winning_Team VARCHAR(255) NOT NULL,
    Man_of_the_Tournament VARCHAR(255) NOT NULL
);

-- Creating the REFEREE table
CREATE TABLE REFEREE (
    Referee_ID INT PRIMARY KEY,
    World_cup_ID INT REFERENCES WORLD_CUP(World_cup_ID),
    Years_of_Experience INT,
    CHECK (Years_of_Experience >= 0)
);

-- Creating the STADIUM table
CREATE TABLE STADIUM (
    Stadium_ID INT PRIMARY KEY,
    World_cup_ID INT REFERENCES WORLD_CUP(World_cup_ID),
    Stadium_Name VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    Capacity INT,
    Ticket_Price DECIMAL(10, 2) NOT NULL,
    Pitch_Condition VARCHAR(255) NOT NULL,
    CHECK (Ticket_Price >= 0)
);

-- Creating the MATCH table
CREATE TABLE MATCH (
    Match_ID INT PRIMARY KEY,
    Stadium_ID INT REFERENCES STADIUM(Stadium_ID),
    Match_Type VARCHAR(255) NOT NULL,
    Date DATE NOT NULL,
    Mvp VARCHAR(255) NOT NULL,
    CHECK (Match_Type IN ('Group Stage', 'Round of 16', 'Quarterfinal', 'Semifinal', 'Final'))

);

-- Creating the SPONSOR table
CREATE TABLE SPONSOR (
    Sponsor_ID INT PRIMARY KEY,
    World_cup_ID INT REFERENCES WORLD_CUP(World_cup_ID),
    Sponsor_Name VARCHAR(255) NOT NULL,
    Sponsor_Amount DECIMAL(15, 2),
    Business_Domain VARCHAR(255) NOT NULL
);

-- Creating the TEAM table
CREATE TABLE TEAM (
    Team_ID INT PRIMARY KEY,
    Sponsor_ID INT REFERENCES SPONSOR(Sponsor_ID),
    World_cup_ID INT REFERENCES WORLD_CUP(World_cup_ID),
    Nationality VARCHAR(255) NOT NULL,
    Team_Manager VARCHAR(255) NOT NULL
);

-- Creating the MATCH_STATISTICS table (Associative Entity)
CREATE TABLE MATCH_STATISTICS (
    Statistics_ID INT PRIMARY KEY,
    Team_ID INT REFERENCES TEAM(Team_ID),
    Match_ID INT REFERENCES MATCH(Match_ID),
    Goals INT,
    Fouls INT,
    Corner INT,
    Offside INT,
    Total_Distance INT
);

-- Creating the TEAM_DETAILS table
CREATE TABLE TEAM_DETAILS (
    Team_Details_ID INT PRIMARY KEY,
    Team_ID INT REFERENCES TEAM(Team_ID),
    Formation VARCHAR(255) NOT NULL,
    Captain_Name VARCHAR(255) NOT NULL,
    Vice_Captain_Name VARCHAR(255) NOT NULL,
    Kit_Color VARCHAR(255) NOT NULL
);

-- Creating the PLAYER table
CREATE TABLE PLAYER (
    Player_ID INT PRIMARY KEY,
    Team_ID INT REFERENCES TEAM(Team_ID),
    Date_of_Birth DATE NOT NULL,
    Position VARCHAR(255) NOT NULL,
    Jersey_Number INT NOT NULL,
    Strong_Foot VARCHAR(50) NOT NULL,
    CHECK (Jersey_Number BETWEEN 1 AND 99)
);

-- Creating the PLAYER_STATISTICS table
CREATE TABLE PLAYER_STATISTICS (
    Player_Stats_ID INT PRIMARY KEY,
    Player_ID INT REFERENCES PLAYER(Player_ID),
    Match_ID INT REFERENCES MATCH(Match_ID),
    Total_Goals INT,
    Total_Saves INT,
    Total_Fouls INT,
    Total_Offsides INT,
    Total_Freekicks INT,
    Total_Corners INT
);

-- Creating the MATCH_REFEREE table (Associative Entity)
CREATE TABLE MATCH_REFEREE (
    Match_Referee_ID INT PRIMARY KEY,
    Match_ID INT REFERENCES MATCH(Match_ID),
    Referee_ID INT REFERENCES REFEREE(Referee_ID)
);
