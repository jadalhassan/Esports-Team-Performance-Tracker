-- BASIC SQL QUERIES
SELECT MENA.TeamName AS MENA_Team, NA.TeamName AS NorthAmerica_Team
    FROM Team MENA, Team NA
    WHERE MENA.Region = 'MENA'
    AND NA.Region = 'North America';


SELECT OccurenceID, TournamentSeriesID, Name AS SeriesName, GameTitle, StartDate, EndDate, PrizePool
    FROM TournamentOccurence NATURAL JOIN TournamentSeries;


SELECT TS.TournamentSeriesID, TS.Name AS SeriesName, VG.Name AS VideoGame,
       TOG.Name AS OrganizerName, TOG.ContactEmail
    FROM TournamentSeries TS
    JOIN TournamentOrganizer TOG USING (OrganizerID)
    JOIN VideoGame VG USING (VideoGameID);
    
    
SELECT OM.MatchID, OM.ScheduledDate, OM.StartTime, OM.Type AS MatchType,
       Home.TeamName AS HomeTeam, Away.TeamName AS AwayTeam
    FROM OfficialMatch OM
    JOIN TeamMatchParticipation TMP_H
        ON OM.MatchID = TMP_H.MatchID AND TMP_H.Side = 'Home'
    JOIN Team Home ON TMP_H.TeamID = Home.TeamID
    JOIN TeamMatchParticipation TMP_A
        ON OM.MatchID = TMP_A.MatchID AND TMP_A.Side = 'Away'
    JOIN Team Away ON TMP_A.TeamID = Away.TeamID
    ORDER BY OM.ScheduledDate, OM.StartTime;


SELECT P1.GamerTag AS Player1, P2.GamerTag AS Player2, P1.Country
    FROM Player P1
    JOIN Player P2 ON P1.Country = P2.Country
    AND P1.PlayerID < P2.PlayerID;


SELECT DISTINCT Country
    FROM Player
    WHERE Country IS NOT NULL;


SELECT PlayerID, GamerTag, Role, Country
    FROM Player
    WHERE GamerTag LIKE '%Fox%';

	
SELECT T.TeamName, TMP.MatchID, OM.ScheduledDate, OM.StartTime,
       OM.Type AS MatchType, TS.Name AS SeriesName, TS.GameTitle
    FROM Team T
    JOIN TeamMatchParticipation TMP ON T.TeamID = TMP.TeamID
    JOIN OfficialMatch OM ON TMP.MatchID = OM.MatchID
    JOIN TournamentSeries TS ON OM.TournamentSeriesID = TS.TournamentSeriesID
    WHERE T.TeamName = 'Beirut Blaze'
    ORDER BY OM.ScheduledDate ASC, OM.StartTime ASC;


SELECT DISTINCT TeamID
    FROM TournamentParticipation
UNION
SELECT DISTINCT TeamID
    FROM Sponsorship;

-- MySQL EVUIVALENT
SELECT DISTINCT TP.TeamID
    FROM TournamentParticipation TP
    WHERE TP.TeamID IN
        (SELECT DISTINCT TeamID
            FROM Sponsorship);

-- MySQL EQUIVALENT
SELECT DISTINCT TP.TeamID
    FROM TournamentParticipation TP
    WHERE TP.TeamID NOT IN
        (SELECT DISTINCT TeamID
            FROM Sponsorship);


SELECT SUM(PrizePool) AS TotalPrizePool
    FROM TournamentOccurence;


SELECT T.TeamName, COUNT(DISTINCT TMP.MatchID) AS MatchesPlayed
    FROM TeamMatchParticipation TMP
    JOIN Team T ON TMP.TeamID = T.TeamID
    GROUP BY T.TeamName
    ORDER BY MatchesPlayed DESC;
    

SELECT T.TeamName, VG.Name AS GameTitle,
       SUM(CASE WHEN TR.IsWinner = 1 THEN 1 ELSE 0 END) AS Wins,
       SUM(CASE WHEN TR.IsWinner = 0 THEN 1 ELSE 0 END) AS Losses
    FROM TeamResult TR
    JOIN MatchResult MR ON TR.ResultID = MR.ResultID
    JOIN OfficialMatch OM ON MR.MatchID = OM.MatchID
    JOIN TournamentSeries TS ON OM.TournamentSeriesID = TS.TournamentSeriesID
    JOIN VideoGame VG ON TS.VideoGameID = VG.VideoGameID
    JOIN Team T ON TR.TeamID = T.TeamID
    GROUP BY T.TeamName, VG.Name
    HAVING SUM(CASE WHEN TR.IsWinner = 1 THEN 1 ELSE 0 END) >= 2
    ORDER BY VG.Name, Wins DESC, T.TeamName;



SELECT P.GamerTag, P.FirstName, P.LastName, P.Country,
       T.TeamName, PTH.StartDate
    FROM Player P
    JOIN PlayerTeamHistory PTH ON P.PlayerID = PTH.PlayerID
    JOIN Team T ON PTH.TeamID = T.TeamID
    WHERE P.Country = 'Lebanon'
    AND PTH.EndDate IS NULL
    ORDER BY T.TeamName ASC, P.GamerTag ASC;
    
    
SELECT S.StaffID, S.Name, S.Role,
AVG(F.Rating) AS AvgRating, COUNT(F.FeedbackID) AS NumFeedbacks
	FROM Staff S
	JOIN Feedback F ON S.StaffID = F.StaffID
	GROUP BY S.StaffID, S.Name, S.Role
	HAVING AVG(F.Rating) >= 4.0
	ORDER BY AvgRating DESC, NumFeedbacks DESC;


SELECT T.TeamName,
       COUNT(TS.TrainingID) AS NumTrainingSessions
    FROM TrainingSession TS
    JOIN Staff S ON TS.StaffID = S.StaffID
    JOIN Team T ON S.TeamID = T.TeamID
    GROUP BY T.TeamName
    HAVING COUNT(TS.TrainingID) >= 3
    ORDER BY NumTrainingSessions DESC;



-- ADVANCED SQL QUERIES
SELECT DISTINCT P.GamerTag, P.PlayerID
    FROM Player P
    WHERE P.PlayerID IN
        (SELECT DISTINCT PMS.PlayerID
            FROM PlayerMatchStats PMS
            JOIN OfficialMatch OM ON PMS.MatchID = OM.MatchID
            JOIN TournamentSeries TS ON OM.TournamentSeriesID = TS.TournamentSeriesID
            WHERE TS.Name = 'Summit Clash');


SELECT T.TeamName 
    FROM Team T
    JOIN TeamResult TR ON T.TeamID = TR.TeamID
    GROUP BY T.TeamName
    HAVING SUM(CASE WHEN TR.IsWinner = 1 THEN 1 ELSE 0 END) >= ALL
        (SELECT SUM(CASE WHEN TR2.IsWinner = 1 THEN 1 ELSE 0 END)
            FROM TeamResult TR2
            JOIN Team T2 ON TR2.TeamID = T2.TeamID
            GROUP BY T2.TeamName);


SELECT T.TeamName
    FROM Team T
    WHERE NOT EXISTS
        (SELECT *
            FROM TeamResult TR
            WHERE TR.TeamID = T.TeamID
              AND TR.IsWinner = 1);
              
              
SELECT DISTINCT P.GamerTag
    FROM Player P
    WHERE P.PlayerID IN
        (SELECT PATS.PlayerID
            FROM PlayerAttendsTrainingSession PATS
            WHERE PATS.TrainingID IN
                (SELECT TSN.TrainingID
                    FROM TrainingSession TSN
                    WHERE TSN.StaffID IN
                        (SELECT S.StaffID
                            FROM Staff S
                            WHERE S.TeamID IN
                                (SELECT TP.TeamID
                                    FROM TournamentParticipation TP
                                    JOIN TournamentSeries TS
                                        ON TP.TournamentSeriesID = TS.TournamentSeriesID
                                    WHERE TS.Name = 'Summit Clash'))));



SELECT T.TeamName
    FROM Team T
    WHERE NOT EXISTS
        (SELECT O.OccurenceID
            FROM TournamentOccurence O
            WHERE O.TournamentSeriesID = 'TS001'
              AND O.OccurenceID NOT IN
                (SELECT TP.OccurenceID
                    FROM TournamentParticipation TP
                    WHERE TP.TeamID = T.TeamID
                      AND TP.TournamentSeriesID = 'TS001'));



SELECT P.GamerTag, Stats.TotalKills, Stats.TotalDeaths
    FROM Player P
    JOIN (
            SELECT PlayerID,
                   SUM(Kills)  AS TotalKills,
                   SUM(Deaths) AS TotalDeaths
                FROM PlayerMatchStats
                GROUP BY PlayerID
         ) AS Stats
      ON P.PlayerID = Stats.PlayerID
    ORDER BY Stats.TotalKills DESC;
    
    
SELECT T.TeamName,
       (SELECT COUNT(*)
           FROM PlayerTeamHistory PTH
           WHERE PTH.TeamID = T.TeamID
             AND PTH.EndDate IS NULL) AS CurrentPlayers
    FROM Team T
    ORDER BY CurrentPlayers DESC, T.TeamName;



UPDATE Player P
    SET Status = CASE
        WHEN (SELECT COUNT(*)
                FROM PlayerMatchStats PMS
                WHERE PMS.PlayerID = P.PlayerID) >= 10
            THEN 'Core'
        WHEN (SELECT COUNT(*)
                FROM PlayerMatchStats PMS
                WHERE PMS.PlayerID = P.PlayerID) BETWEEN 1 AND 9
            THEN 'Active'
        ELSE 'New'
    END;



SELECT T.TeamName,
       S.SponsorID,
       S.Name  AS SponsorName,
       SP.Amount
    FROM Team T
    LEFT OUTER JOIN Sponsorship SP ON T.TeamID = SP.TeamID
    LEFT OUTER JOIN Sponsor S      ON SP.SponsorID = S.SponsorID
    ORDER BY T.TeamName ASC;
    
    

DELIMITER //
CREATE TRIGGER check_total_people_before_insert
BEFORE INSERT ON Player
FOR EACH ROW
BEGIN
    DECLARE total INT;
    SELECT (SELECT COUNT(*) FROM Player)
         + (SELECT COUNT(*) FROM Staff)
      INTO total;
    IF total >= 200 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Total people cant exceed 200';
    END IF;
END//
DELIMITER ;


CREATE VIEW TeamWinLoss AS
    SELECT T.TeamID,
           T.TeamName,
           SUM(CASE WHEN TR.IsWinner = 1 THEN 1 ELSE 0 END) AS Wins,
           SUM(CASE WHEN TR.IsWinner = 0 THEN 1 ELSE 0 END) AS Losses
        FROM Team T
        LEFT JOIN TeamResult TR ON T.TeamID = TR.TeamID
        GROUP BY T.TeamID, T.TeamName;
-- Testing the View table:
SELECT * FROM TeamWinLoss;



DELIMITER //
CREATE TRIGGER mark_player_active_after_stats
AFTER INSERT ON PlayerMatchStats
FOR EACH ROW
BEGIN
    UPDATE Player
        SET Status = 'Active'
        WHERE PlayerID = NEW.PlayerID
          AND (Status IS NULL OR Status = 'New');
END//
DELIMITER ;
-- Testing
UPDATE Player
SET Status = 'New'
WHERE PlayerID = 'P017';

SELECT PlayerID, GamerTag, Status
FROM Player
WHERE PlayerID = 'P017';

INSERT INTO PlayerMatchStats
(PlayerID, MatchID, Kills, Assists, Deaths, DamageDealt, Accuracy, Healing, Objective)
VALUES ('P017','M015',12,6,7,3100,48.20,200,'Trigger testing insert');

SELECT PlayerID, GamerTag, Status
FROM Player
WHERE PlayerID = 'P017';
-- end of testing



DELIMITER //
CREATE FUNCTION PlayerKDA(p_player_id VARCHAR(10))
RETURNS DECIMAL(6,2)
BEGIN
    DECLARE k INT DEFAULT 0;
    DECLARE a INT DEFAULT 0;
    DECLARE d INT DEFAULT 0;
    DECLARE kda DECIMAL(6,2);
    SELECT SUM(Kills)
    INTO k
    FROM PlayerMatchStats
    WHERE PlayerID = p_player_id;
    SELECT SUM(Assists)
    INTO a
    FROM PlayerMatchStats
    WHERE PlayerID = p_player_id;
    SELECT SUM(Deaths)
    INTO d
    FROM PlayerMatchStats
    WHERE PlayerID = p_player_id;
    IF k IS NULL THEN SET k = 0; END IF;
    IF a IS NULL THEN SET a = 0; END IF;
    IF d IS NULL THEN SET d = 0; END IF;
    IF d = 0 THEN
        SET kda = k + a;
    ELSE
        SET kda = (k + a) / d;
    END IF;
    RETURN kda;
END //
DELIMITER ;


-- running the function
SELECT PlayerKDA('P001') AS KDA;



SELECT 
    p.PlayerID, p.GamerTag,
    CASE
        WHEN SUM(pms.Deaths) = 0 THEN
            SUM(pms.Kills) + SUM(pms.Assists)
        ELSE
            (SUM(pms.Kills) + SUM(pms.Assists)) / SUM(pms.Deaths)
    END AS KDA_Last_3_Months
FROM Player p
JOIN PlayerMatchStats pms 
    ON p.PlayerID = pms.PlayerID
JOIN OfficialMatch m
    ON pms.MatchID = m.MatchID
WHERE p.PlayerID = 'P001'
  AND m.ScheduledDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
  AND m.ScheduledDate <= CURDATE()
GROUP BY 
    p.PlayerID,
    p.GamerTag;