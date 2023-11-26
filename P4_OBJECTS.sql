-- 3 STORED PROCEDURES

-- PROCEDURE 1: This stored procedure takes the Team_ID as input and returns information about the top goal scorer for that team using output parameters.
CREATE PROCEDURE GetTopScorerByTeam
    @TeamID INT,
    @PlayerID INT OUTPUT,
    @TotalGoals INT OUTPUT
AS
BEGIN
    SELECT TOP 1
        @PlayerID = PS.Player_ID,
        @TotalGoals = PS.Total_Goals
    FROM
        PLAYER_STATISTICS PS
    JOIN
        PLAYER P ON PS.Player_ID = P.Player_ID
    WHERE
        P.Team_ID = @TeamID
    ORDER BY
        PS.Total_Goals DESC;
END;

DECLARE
    @PlayerID INT,
    @TotalGoals INT;

EXEC GetTopScorerByTeam
    @TeamID = 1, -- Specify the Team_ID
    @PlayerID = @PlayerID OUTPUT,
    @TotalGoals = @TotalGoals OUTPUT;

PRINT 'Top Scorer ID: ' + CAST(@PlayerID AS VARCHAR);
PRINT 'Total Goals: ' + CAST(@TotalGoals AS VARCHAR);

-- PROCEDURE 2: This stored procedure takes the manager's name as input and returns information about the team managed by that manager using output parameters.
CREATE PROCEDURE GetTeamByManager
    @ManagerName VARCHAR(255),
    @TeamID INT OUTPUT,
    @Nationality VARCHAR(255) OUTPUT,
    @CaptainName VARCHAR(255) OUTPUT,
    @ViceCaptainName VARCHAR(255) OUTPUT,
    @KitColor VARCHAR(255) OUTPUT
AS
BEGIN
    SELECT TOP 1
        @TeamID = T.Team_ID,
        @Nationality = T.Nationality,
        @CaptainName = TD.Captain_Name,
        @ViceCaptainName = TD.Vice_Captain_Name,
        @KitColor = TD.Kit_Color
    FROM
        TEAM T
    JOIN
        TEAM_DETAILS TD ON T.Team_ID = TD.Team_ID
    WHERE
        T.Team_Manager = @ManagerName;
END;

DECLARE
    @TeamID INT,
    @Nationality VARCHAR(255),
    @CaptainName VARCHAR(255),
    @ViceCaptainName VARCHAR(255),
    @KitColor VARCHAR(255);

EXEC GetTeamByManager
    @ManagerName = 'Tite', -- Provide the manager name you want to search for
    @TeamID = @TeamID OUTPUT,
    @Nationality = @Nationality OUTPUT,
    @CaptainName = @CaptainName OUTPUT,
    @ViceCaptainName = @ViceCaptainName OUTPUT,
    @KitColor = @KitColor OUTPUT;

SELECT 'Team ID: ' + CAST(@TeamID AS VARCHAR) AS TeamID,
       'Nationality: ' + @Nationality AS Nationality,
       'Captain Name: ' + @CaptainName AS CaptainName,
       'Vice-Captain Name: ' + @ViceCaptainName AS ViceCaptainName,
       'Kit Color: ' + @KitColor AS KitColor;

--PROCEDURE 3: This stored procedure takes a specific date as input and returns details about the matches that occurred on that date using output parameters.
CREATE PROCEDURE GetMatchByDate
    @MatchDate DATE,
    @MatchID INT OUTPUT,
    @StadiumID INT OUTPUT,
    @MatchType VARCHAR(255) OUTPUT,
    @MVP VARCHAR(255) OUTPUT,
    @Goals INT OUTPUT,
    @Fouls INT OUTPUT,
    @Corner INT OUTPUT,
    @Offside INT OUTPUT,
    @TotalDistance INT OUTPUT
AS
BEGIN
    SELECT TOP 1
        @MatchID = M.Match_ID,
        @StadiumID = M.Stadium_ID,
        @MatchType = M.Match_Type,
        @MVP = M.Mvp,
        @Goals = MS.Goals,
        @Fouls = MS.Fouls,
        @Corner = MS.Corner,
        @Offside = MS.Offside,
        @TotalDistance = MS.Total_Distance
    FROM
        MATCH M
    JOIN
        MATCH_STATISTICS MS ON M.Match_ID = MS.Match_ID
    WHERE
        M.Date = @MatchDate;
END;

DECLARE
    @OutputMatchID INT,
    @OutputStadiumID INT,
    @OutputMatchType VARCHAR(255),
    @OutputMVP VARCHAR(255),
    @OutputGoals INT,
    @OutputFouls INT,
    @OutputCorner INT,
    @OutputOffside INT,
    @OutputTotalDistance INT;

EXEC GetMatchByDate
    @MatchDate = '2022-06-14', -- Provide the match date you want to search for
    @MatchID = @OutputMatchID OUTPUT,
    @StadiumID = @OutputStadiumID OUTPUT,
    @MatchType = @OutputMatchType OUTPUT,
    @MVP = @OutputMVP OUTPUT,
    @Goals = @OutputGoals OUTPUT,
    @Fouls = @OutputFouls OUTPUT,
    @Corner = @OutputCorner OUTPUT,
    @Offside = @OutputOffside OUTPUT,
    @TotalDistance = @OutputTotalDistance OUTPUT;

SELECT 'Match ID: ' + CAST(@OutputMatchID AS VARCHAR) AS OutputMatchID,
       'Stadium ID: ' + CAST(@OutputStadiumID AS VARCHAR) AS OutputStadiumID,
       'Match Type: ' + @OutputMatchType AS OutputMatchType,
       'MVP: ' + @OutputMVP AS OutputMVP,
       'Goals: ' + CAST(@OutputGoals AS VARCHAR) AS OutputGoals,
       'Fouls: ' + CAST(@OutputFouls AS VARCHAR) AS OutputFouls,
       'Corner: ' + CAST(@OutputCorner AS VARCHAR) AS OutputCorner,
       'Offside: ' + CAST(@OutputOffside AS VARCHAR) AS OutputOffside,
       'Total Distance: ' + CAST(@OutputTotalDistance AS VARCHAR) AS OutputTotalDistance;


-- 3 VIEWS

-- VIEW 1: This view combines information from the TEAM, SPONSOR, and TEAM_DETAILS tables to provide comprehensive team details.
CREATE VIEW TeamDetailsView AS 
SELECT
    T.Team_ID,
    T.Nationality,
    T.Team_Manager,
    S.Sponsor_Name,
    TD.Formation,
    TD.Captain_Name,
    TD.Vice_Captain_Name,
    TD.Kit_Color
FROM
    TEAM T
JOIN
    SPONSOR S ON T.Sponsor_ID = S.Sponsor_ID
JOIN
    TEAM_DETAILS TD ON T.Team_ID = TD.Team_ID;

-- VIEW 2: This view combines information from the MATCH and MATCH_STATISTICS tables to provide details about each match, including statistics.
CREATE VIEW MatchDetailsView AS
SELECT
    M.Match_ID,
    M.Stadium_ID,
    M.Match_Type,
    M.Date,
    M.Mvp,
    MS.Goals,
    MS.Fouls,
    MS.Corner,
    MS.Offside,
    MS.Total_Distance
FROM
    MATCH M
JOIN
    MATCH_STATISTICS MS ON M.Match_ID = MS.Match_ID;

-- VIEW 3: This view combines information from the PLAYER and PLAYER_STATISTICS tables to provide player statistics.
CREATE VIEW PlayerStatsView AS
SELECT
    P.Player_ID,
    P.Team_ID,
    P.Date_of_Birth,
    P.Position,
    P.Jersey_Number,
    P.Strong_Foot,
    PS.Total_Goals,
    PS.Total_Saves,
    PS.Total_Fouls,
    PS.Total_Offsides,
    PS.Total_Freekicks,
    PS.Total_Corners
FROM
    PLAYER P
JOIN
    PLAYER_STATISTICS PS ON P.Player_ID = PS.Player_ID;

SELECT * FROM TeamDetailsView;
SELECT * FROM MatchDetailsView;
SELECT * FROM PlayerStatsView;


-- DML TRIGGER
-- Create the UpdateTotalGoals trigger
CREATE TRIGGER UpdateTotalGoals
ON MATCH_STATISTICS
AFTER INSERT
AS
BEGIN
    DECLARE @TeamID INT, @Goals INT;

    -- Get the Team_ID and Goals from the inserted row
    SELECT
        @TeamID = Team_ID,
        @Goals = Goals
    FROM
        inserted;

    -- Update the total goals in PLAYER_DETAILS table
    UPDATE
        PLAYER_STATISTICS
    SET
        Total_Goals = Total_Goals + @Goals
    WHERE
        Player_ID IN (SELECT Player_ID FROM PLAYER WHERE Team_ID = @TeamID);
END;

-- Sample INSERT query into MATCH_STATISTICS
INSERT INTO MATCH_STATISTICS (Team_ID, Match_ID, Goals, Fouls, Corner, Offside, Total_Distance)
VALUES (1, 1, 2, 5, 3, 1, 150);

SELECT * FROM PLAYER_STATISTICS;


-- USER DEFINED FUNCTION
CREATE FUNCTION dbo.CalculateAge
(
    @DateOfBirth DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;

    SET @Age = DATEDIFF(YEAR, @DateOfBirth, GETDATE());

    RETURN @Age;
END;

ALTER TABLE PLAYER
ADD Age AS dbo.CalculateAge(Date_of_Birth);

SELECT * FROM PLAYER;


-- COLUMN DATA ENCRYPTION
-- Create a symmetric key
CREATE SYMMETRIC KEY SymmetricKey_FIFA
WITH ALGORITHM = AES_256
ENCRYPTION BY PASSWORD = 'FIFA@2023';

-- Alter the STADIUM table to encrypt columns
ALTER TABLE STADIUM
ADD Ticket_Price_Encrypted VARBINARY(MAX) NULL;

ALTER TABLE STADIUM
ADD Pitch_Condition_Encrypted VARBINARY(MAX) NULL;

-- Update existing data with encrypted values
OPEN SYMMETRIC KEY SymmetricKey_FIFA
DECRYPTION BY PASSWORD = 'FIFA@2023';

UPDATE STADIUM
SET Ticket_Price_Encrypted = ENCRYPTBYKEY(KEY_GUID('SymmetricKey_FIFA'), CONVERT(VARBINARY(MAX), Ticket_Price));

UPDATE STADIUM
SET Pitch_Condition_Encrypted = ENCRYPTBYKEY(KEY_GUID('SymmetricKey_FIFA'), CONVERT(VARBINARY(MAX), Pitch_Condition));

SELECT * FROM STADIUM;


-- 3 NON-CLUSTERED INDEXES
CREATE NONCLUSTERED INDEX IX_Team_Team_ID
ON TEAM (Team_ID);

CREATE NONCLUSTERED INDEX IX_Match_Match_ID
ON MATCH (Match_ID);

CREATE NONCLUSTERED INDEX IX_Player_Player_ID
ON PLAYER (Player_ID);



