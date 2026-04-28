
INSERT INTO TournamentOrganizer (OrganizerID, Name, ContactEmail) VALUES
('ORG01', 'Nova Esports Events',    'contact@novaevents.com'),
('ORG02', 'Summit Gaming League',   'info@summitleague.gg'),
('ORG03', 'Phoenix Tournament Co.', 'admin@phoenixtournaments.com'),
('ORG04', 'Vertex Esports Group',   'support@vertexeg.com'),
('ORG05', 'Apex Competitive Series','hello@apexseries.com');



INSERT INTO VideoGame (VideoGameID, Name) VALUES
('VG01', 'Valorant'),
('VG02', 'League of Legends'),
('VG03', 'Overwatch 2'),
('VG04', 'Counter-Strike 2'),
('VG05', 'Rocket League');



INSERT INTO Genres (VideoGameID, Genre) VALUES
('VG01', 'Tactical FPS'),
('VG02', 'MOBA'),
('VG03', 'Hero Shooter'),
('VG04', 'FPS'),
('VG05', 'Sports');



INSERT INTO TournamentSeries
(TournamentSeriesID, Name, GameTitle, OrganizerID, VideoGameID) VALUES
('TS01', 'Nova Masters',       'Nova Masters 2024',     'ORG01', 'VG01'),
('TS02', 'Summit Clash',       'Summit Clash 2024',     'ORG02', 'VG02'),
('TS03', 'Phoenix Showdown',   'Phoenix Showdown 2024', 'ORG03', 'VG03'),
('TS04', 'Vertex Global Cup',  'Vertex Global 2024',    'ORG04', 'VG04'),
('TS05', 'Apex Arena Series',  'Apex Arena 2024',       'ORG05', 'VG05');



INSERT INTO TournamentOccurence
(OccurenceID, TournamentSeriesID, StartDate, EndDate, PrizePool, HostOrganization) VALUES
('OC01', 'TS01', '2024-01-10', '2024-01-12', 50000, 'Nova Esports Arena'),
('OC02', 'TS01', '2024-06-05', '2024-06-07', 60000, 'Nova Esports Arena'),
('OC03', 'TS02', '2024-02-15', '2024-02-18', 75000, 'Summit Hub'),
('OC04', 'TS02', '2024-08-01', '2024-08-03', 80000, 'Summit Hub'),
('OC05', 'TS03', '2024-03-20', '2024-03-22', 40000, 'Phoenix Studio'),
('OC06', 'TS03', '2024-09-10', '2024-09-12', 45000, 'Phoenix Studio'),
('OC07', 'TS04', '2024-04-25', '2024-04-28', 90000, 'Vertex Arena'),
('OC08', 'TS04', '2024-10-05', '2024-10-07', 95000, 'Vertex Arena'),
('OC09', 'TS05', '2024-05-12', '2024-05-14', 30000, 'Apex Stadium'),
('OC10','TS05', '2024-11-01', '2024-11-03', 35000, 'Apex Stadium');



INSERT INTO Team (TeamID, TeamName, Region, FoundingDate, Ranking) VALUES
('T001', 'Atlas Esports',          'Europe',      '2017-03-15', 1),
('T002', 'Lebanon Lions',          'MENA',        '2019-06-10', 5),
('T003', 'Cedar Storm',            'MENA',        '2020-01-05', 8),
('T004', 'North Star Gaming',      'North America','2016-09-22', 3),
('T005', 'Seoul Dragons',          'Asia',        '2015-11-30', 2),
('T006', 'Tokyo Thunder',          'Asia',        '2018-04-09', 7),
('T007', 'Rio Guardians',          'South America','2016-02-19', 9),
('T008', 'Berlin Titans',          'Europe',      '2014-12-01', 4),
('T009', 'Paris Eclipse',          'Europe',      '2018-08-18', 6),
('T010', 'Cairo Falcons',          'MENA',        '2017-01-25', 10),
('T011', 'Istanbul Phoenix',       'MENA',        '2019-09-03', 11),
('T012', 'Madrid Orbit',           'Europe',      '2016-05-06', 12),
('T013', 'Dubai Mirage',           'MENA',        '2020-02-14', 13),
('T014', 'New York Voltage',       'North America','2015-07-21', 14),
('T015', 'Toronto Nebula',         'North America','2018-10-02', 15),
('T016', 'Sydney Wave',            'Oceania',     '2017-12-19', 16),
('T017', 'Melbourne Pulse',        'Oceania',     '2019-03-11', 17),
('T018', 'Warsaw Reapers',         'Europe',      '2018-06-30', 18),
('T019', 'Athens Legacy',          'Europe',      '2016-08-08', 19),
('T020', 'Beirut Blaze',           'MENA',        '2021-01-01', 20);



INSERT INTO TournamentParticipation (TeamID, OccurenceID, TournamentSeriesID) VALUES
('T001','OC01','TS01'),
('T002','OC01','TS01'),
('T003','OC02','TS01'),
('T004','OC03','TS02'),
('T005','OC03','TS02'),
('T006','OC04','TS02'),
('T007','OC05','TS03'),
('T008','OC05','TS03'),
('T009','OC06','TS03'),
('T010','OC07','TS04'),
('T011','OC07','TS04'),
('T012','OC08','TS04'),
('T013','OC09','TS05'),
('T014','OC09','TS05'),
('T015','OC10','TS05'),
('T016','OC02','TS01'),
('T017','OC04','TS02'),
('T018','OC06','TS03'),
('T019','OC08','TS04'),
('T020','OC10','TS05');



INSERT INTO Player
(PlayerID, GamerTag, Role, FirstName, LastName, Status, Day, Month, Year, Country) VALUES
('P001','ShadowFox','Duelist','Adam','Khalil','Active', 4,  3,1999,'Lebanon'),
('P002','LunarWolf','Controller','Maya','Haddad','Active',12,  5,2000,'Lebanon'),
('P003','IronHeart','Initiator','Omar','Zidan','Active', 23,  7,1998,'Jordan'),
('P004','PixelMage','Sentinel','Lea','Mansour','Active', 14, 11,1997,'France'),
('P005','CrimsonAce','Top','Lucas','Moreira','Active',  9,  1,1996,'Brazil'),
('P006','StormRider','Jungle','Elias','Haddou','Active', 30,  6,1995,'Morocco'),
('P007','VoltStrike','ADC','Noah','Smith','Active',    2,  2,1999,'USA'),
('P008','FrostNova','Support','Emma','Clark','Active', 16, 10,1998,'UK'),
('P009','ZenBlade','Tank','Hiro','Tanaka','Active',   27,  4,1997,'Japan'),
('P010','Skyline','Flex','Ava','Johnson','Active',    19,  9,1996,'USA'),
('P011','NightOwl','DPS','Yuki','Sato','Active',      11,  8,1998,'Japan'),
('P012','EchoRush','Support','Sami','Karim','Active',  6, 12,1999,'Lebanon'),
('P013','SolarFlare','Duelist','Lara','Nassar','Active',21,  3,2001,'Lebanon'),
('P014','NeonDash','Controller','Jonas','Schmidt','Active',5,  5,1997,'Germany'),
('P015','ArcWarden','Mid','Nikita','Ivanova','Active', 8,  2,1995,'Russia'),
('P016','BlazeWing','Offlane','Marco','Rossi','Inactive',10,  7,1994,'Italy'),
('P017','SilentStep','Support','Rami','Saad','Inactive',13, 11,1993,'Lebanon'),
('P018','CrystalOrb','Flex','Sara','Khatib','Inactive',17,  6,1992,'Lebanon'),
('P019','RapidFire','DPS','David','Brown','Inactive',  1,  9,1991,'USA'),
('P020','OceanSoul','Tank','Chloe','Nguyen','Inactive',25, 10,1990,'Australia');



INSERT INTO PlayerTeamHistory (StartDate, TeamID, PlayerID, EndDate) VALUES
('2023-01-01','T020','P001',NULL),
('2023-01-01','T020','P002',NULL),
('2022-09-15','T002','P003',NULL),
('2021-05-10','T001','P004',NULL),
('2021-07-20','T005','P005',NULL),
('2022-02-28','T006','P006',NULL),
('2021-11-11','T004','P007',NULL),
('2023-03-03','T008','P008',NULL),
('2022-04-04','T005','P009',NULL),
('2022-06-06','T004','P010',NULL),
('2023-02-02','T010','P011',NULL),
('2023-02-02','T010','P012',NULL),
('2023-08-01','T003','P013',NULL),
('2023-08-01','T003','P014',NULL),
('2021-09-01','T001','P015',NULL),
('2021-09-01','T001','P016',NULL),
('2020-10-10','T009','P017',NULL),
('2020-10-10','T009','P018',NULL),
('2019-12-12','T007','P019',NULL),
('2019-12-12','T007','P020',NULL);



INSERT INTO OfficialMatch
(MatchID, Type, ScheduledDate, StartTime, Round, OccurenceID, TournamentSeriesID) VALUES
('M001','BestOf3','2024-01-10','16:00:00','Group A','OC01','TS01'),
('M002','BestOf3','2024-01-10','18:00:00','Group A','OC01','TS01'),
('M003','BestOf3','2024-01-11','16:00:00','Group B','OC01','TS01'),
('M004','BestOf3','2024-01-11','18:00:00','Group B','OC01','TS01'),
('M005','BestOf5','2024-02-15','17:00:00','Quarterfinal','OC03','TS02'),
('M006','BestOf5','2024-02-16','17:00:00','Quarterfinal','OC03','TS02'),
('M007','BestOf5','2024-03-20','17:00:00','Semifinal','OC05','TS03'),
('M008','BestOf5','2024-03-21','17:00:00','Semifinal','OC05','TS03'),
('M009','BestOf5','2024-04-25','19:00:00','Final','OC07','TS04'),
('M010','BestOf5','2024-05-12','19:00:00','Final','OC09','TS05'),
('M011','BestOf3','2024-06-05','16:00:00','Group C','OC02','TS01'),
('M012','BestOf3','2024-06-05','18:00:00','Group C','OC02','TS01'),
('M013','BestOf3','2024-06-06','16:00:00','Group D','OC02','TS01'),
('M014','BestOf3','2024-06-06','18:00:00','Group D','OC02','TS01'),
('M015','BestOf3','2024-08-01','16:00:00','Group E','OC04','TS02'),
('M016','BestOf3','2024-08-01','18:00:00','Group E','OC04','TS02'),
('M017','BestOf3','2024-09-10','17:00:00','Lower Bracket','OC06','TS03'),
('M018','BestOf3','2024-10-05','17:00:00','Upper Bracket','OC08','TS04'),
('M019','BestOf3','2024-11-01','17:00:00','Qualifier','OC10','TS05'),
('M020','BestOf3','2024-11-02','17:00:00','Qualifier','OC10','TS05');



INSERT INTO Scrimmage (MatchID, Type, ScheduledDate, StartTime, IsExternallyRecorded) VALUES
('S001','Practice','2024-01-05','15:00:00',1),
('S002','Practice','2024-01-07','15:30:00',0),
('S003','Practice','2024-02-10','14:00:00',1),
('S004','Practice','2024-03-01','13:30:00',1),
('S005','Practice','2024-03-15','16:15:00',0),
('S006','Practice','2024-04-10','17:00:00',1),
('S007','Practice','2024-05-20','18:00:00',0),
('S008','Practice','2024-06-10','19:00:00',1),
('S009','Practice','2024-07-01','14:45:00',0),
('S010','Practice','2024-07-15','16:45:00',1);


INSERT INTO TeamMatchParticipation (TeamID, MatchID, Side) VALUES
('T001','M001','Home'), ('T002','M001','Away'),
('T003','M002','Home'), ('T004','M002','Away'),
('T005','M003','Home'), ('T006','M003','Away'),
('T007','M004','Home'), ('T008','M004','Away'),
('T001','M005','Home'), ('T005','M005','Away'),
('T002','M006','Home'), ('T006','M006','Away'),
('T003','M007','Home'), ('T007','M007','Away'),
('T004','M008','Home'), ('T008','M008','Away'),
('T009','M009','Home'), ('T010','M009','Away'),
('T011','M010','Home'), ('T012','M010','Away'),
('T013','M011','Home'), ('T014','M011','Away'),
('T015','M012','Home'), ('T016','M012','Away'),
('T017','M013','Home'), ('T018','M013','Away'),
('T019','M014','Home'), ('T020','M014','Away'),
('T020','M015','Home'), ('T001','M015','Away'),
('T002','M016','Home'), ('T003','M016','Away'),
('T004','M017','Home'), ('T005','M017','Away'),
('T006','M018','Home'), ('T007','M018','Away'),
('T008','M019','Home'), ('T009','M019','Away'),
('T010','M020','Home'), ('T011','M020','Away');



INSERT INTO Round (RoundNumber, MatchID, PlayDetails, RoundTime) VALUES
(1,'M001','Pistol round on Ascent', 10),
(2,'M001','Eco round retake A site', 8),
(3,'M001','Full buy push mid', 9),
(1,'M002','Early aggression B main', 11),
(2,'M002','Slow default mid control', 12),
(1,'M003','Fast rush A site', 7),
(2,'M003','Post-plant hold', 9),
(1,'M004','Operator pick mid', 10),
(2,'M004','Late round rotate', 13),
(1,'M005','Baron fight at 20 min', 20),
(2,'M005','Base siege attempt', 18),
(1,'M006','Dragon contest', 16),
(2,'M006','Elder fight', 21),
(1,'M007','First payload push', 6),
(2,'M007','Overtime defense', 8),
(1,'M008','Control point capture', 7),
(2,'M008','Last team fight', 9),
(1,'M009','Map control default', 12),
(2,'M009','B site execute', 14),
(1,'M010','Kickoff and first goal', 5),
(2,'M010','Last-minute equalizer', 6);


INSERT INTO WonBy (RoundNumber, MatchID, TeamID) VALUES
(1,'M001','T001'),
(2,'M001','T001'),
(3,'M001','T002'),
(1,'M002','T003'),
(2,'M002','T004'),
(1,'M003','T005'),
(2,'M003','T005'),
(1,'M004','T008'),
(2,'M004','T007'),
(1,'M005','T001'),
(2,'M005','T005'),
(1,'M006','T002'),
(2,'M006','T006'),
(1,'M007','T003'),
(2,'M007','T007'),
(1,'M008','T008'),
(2,'M008','T004'),
(1,'M009','T009'),
(2,'M009','T010'),
(1,'M010','T011'),
(2,'M010','T012');



INSERT INTO MatchResult (ResultID, Score, EndTime, MatchID) VALUES
('R001','2-1','18:40:00','M001'),
('R002','2-0','19:10:00','M002'),
('R003','2-1','18:50:00','M003'),
('R004','0-2','19:30:00','M004'),
('R005','3-2','21:30:00','M005'),
('R006','3-1','21:10:00','M006'),
('R007','3-0','20:45:00','M007'),
('R008','3-2','21:20:00','M008'),
('R009','3-1','21:55:00','M009'),
('R010','3-0','21:40:00','M010'),
('R011','2-0','18:45:00','M011'),
('R012','2-1','19:20:00','M012'),
('R013','2-0','19:05:00','M013'),
('R014','1-2','19:35:00','M014'),
('R015','2-1','19:50:00','M015'),
('R016','0-2','20:05:00','M016'),
('R017','2-0','19:25:00','M017'),
('R018','2-1','20:10:00','M018'),
('R019','2-0','19:15:00','M019'),
('R020','2-1','20:25:00','M020');



INSERT INTO TeamResult (ResultID, TeamID, IsWinner) VALUES
('R001','T001',1), ('R001','T002',0),
('R002','T003',1), ('R002','T004',0),
('R003','T005',1), ('R003','T006',0),
('R004','T008',1), ('R004','T007',0),
('R005','T001',1), ('R005','T005',0),
('R006','T002',1), ('R006','T006',0),
('R007','T003',1), ('R007','T007',0),
('R008','T004',1), ('R008','T008',0),
('R009','T009',1), ('R009','T010',0),
('R010','T011',1), ('R010','T012',0),
('R011','T013',1), ('R011','T014',0),
('R012','T015',1), ('R012','T016',0),
('R013','T017',1), ('R013','T018',0),
('R014','T020',1), ('R014','T019',0),
('R015','T020',1), ('R015','T001',0),
('R016','T003',1), ('R016','T002',0),
('R017','T004',1), ('R017','T005',0),
('R018','T006',1), ('R018','T007',0),
('R019','T008',1), ('R019','T009',0),
('R020','T010',1), ('R020','T011',0);



INSERT INTO PlayerMatchStats
(PlayerID, MatchID, Kills, Assists, Deaths, DamageDealt, Accuracy, Healing, Objective) VALUES
('P001','M001',22, 5,10, 4300, 47.50,  300, 'Entry frag and open sites'),
('P002','M001',15, 9, 8, 3200, 52.10,  500, 'Smoke and control space'),
('P003','M002',18, 7, 9, 3900, 49.30,  280, 'Flash and start engages'),
('P004','M002',20,10, 7, 4100, 53.20,  150, 'Hold mid angle with OP'),
('P005','M003',12,14, 6, 3500, 45.80,  900, 'Peel for ADC'),
('P006','M003', 8,16, 5, 3100, 41.60, 1200, 'Tank frontline damage'),
('P007','M004',25, 4,11, 4800, 50.00,  100, 'Hard carry late fights'),
('P008','M004',10,18, 7, 2800, 46.70, 1100, 'Main healer'),
('P009','M005', 7,20, 4, 2600, 44.40, 1300, 'Zone control and CC'),
('P010','M005',19, 8, 8, 4200, 51.30,  200, 'Split push and flank'),
('P011','M006',14,11, 9, 3300, 48.90,  400, 'High ground DPS'),
('P012','M006', 6,19, 5, 2500, 42.20, 1500, 'Pocket healer'),
('P013','M007',23, 6,12, 4700, 49.80,  350, 'Aggressive duelist'),
('P014','M007', 9,17, 6, 2900, 43.70, 1000, 'Anchor sites'),
('P015','M008',16,13, 9, 3600, 46.20,  600, 'Roam and support calls'),
('P016','M008', 8,15, 7, 2750, 40.90,  950, 'Off-tank peel'),
('P017','M009',11, 9, 3, 2400, 55.10,  200, 'Lurk and clutch'),
('P018','M010', 5,12, 4, 1900, 38.50,  700, 'Defensive support'),
('P019','M011',21, 3,10, 4100, 51.80,  150, 'High tempo duelist'),
('P020','M012',13,10, 8, 3000, 45.00,  600, 'Objective-focused tank');



INSERT INTO Sponsor (SponsorID, Name, Email) VALUES
('SP01','HyperTech','sponsorship@hypertech.com'),
('SP02','Pulse Energy Drink','contact@pulseenergy.gg'),
('SP03','Galaxy Peripherals','info@galaxygear.com'),
('SP04','NextNet Fiber','support@nextnet.com'),
('SP05','Aurora Headsets','hello@auroraaudio.com'),
('SP06','Vertex PCs','sales@vertexpc.com'),
('SP07','Nova Chairs','support@novachairs.com'),
('SP08','Starlight Snacks','contact@starlightsnacks.com'),
('SP09','Cloud9 VPN','info@cloud9vpn.com'),
('SP10','GameHub Store','support@gamehubstore.com');



INSERT INTO Sponsorship
(SponsorID, OccurenceID, TournamentSeriesID, TeamID, Amount) VALUES
('SP01','OC01','TS01','T001',15000),
('SP02','OC01','TS01','T002',12000),
('SP03','OC03','TS02','T004',20000),
('SP04','OC03','TS02','T005',18000),
('SP05','OC05','TS03','T007',10000),
('SP06','OC07','TS04','T009',22000),
('SP07','OC07','TS04','T010',19000),
('SP08','OC09','TS05','T013', 8000),
('SP09','OC09','TS05','T014', 9000),
('SP10','OC02','TS01','T016',11000),
('SP01','OC04','TS02','T017',13000),
('SP02','OC06','TS03','T018',14000),
('SP03','OC08','TS04','T019',16000),
('SP04','OC10','TS05','T020',12000),
('SP05','OC05','TS03','T008', 9000);



INSERT INTO Staff (StaffID, Name, Role, TeamID) VALUES
('ST01','Karim Youssef','Head Coach','T020'),
('ST02','Nour Abou Hassan','Analyst','T001'),
('ST03','James Miller','Assistant Coach','T004'),
('ST04','Hana Kobayashi','Strategist','T005'),
('ST05','Lucas Pereira','Performance Coach','T007'),
('ST06','Sarah Ahmed','Team Manager','T002'),
('ST07','Daniel Green','Head Coach','T009'),
('ST08','Maria Lopez','Analyst','T010'),
('ST09','Ali Mansour','Assistant Coach','T003'),
('ST10','Sophia Wilson','Team Manager','T008');


INSERT INTO TrainingSession
(TrainingID, Date, Type, Duration, StaffID) VALUES
('TR01','2024-01-03','Aim practice',90,'ST01'),
('TR02','2024-01-04','Team scrim review',75,'ST02'),
('TR03','2024-01-06','Macro strategy',80,'ST03'),
('TR04','2024-01-08','Communication drill',60,'ST04'),
('TR05','2024-01-10','VOD review',70,'ST05'),
('TR06','2024-01-12','Scrim block',120,'ST06'),
('TR07','2024-01-15','Map defaults',90,'ST07'),
('TR08','2024-01-18','Execute practice',85,'ST08'),
('TR09','2024-01-20','Utility usage',65,'ST09'),
('TR10','2024-01-22','Mental performance',55,'ST10');



INSERT INTO PlayerAttendsTrainingSession (PlayerID, TrainingID) VALUES
('P001','TR01'),
('P002','TR01'),
('P003','TR02'),
('P004','TR02'),
('P005','TR03'),
('P006','TR03'),
('P007','TR04'),
('P008','TR04'),
('P009','TR05'),
('P010','TR05'),
('P011','TR06'),
('P012','TR06'),
('P013','TR07'),
('P014','TR07'),
('P015','TR08'),
('P016','TR08'),
('P017','TR09'),
('P018','TR09'),
('P019','TR10'),
('P020','TR10');



INSERT INTO Feedback
(FeedbackID, Notes, Rating, StaffID, PlayerID, TrainingID) VALUES
('FB01','Great energy and solid communication.',4.5,'ST01','P001','TR01'),
('FB02','Needs to work on crosshair placement.',3.5,'ST01','P002','TR01'),
('FB03','Macro decisions were very good today.',4.0,'ST02','P003','TR02'),
('FB04','Shotcalling improved compared to last week.',4.2,'ST02','P004','TR02'),
('FB05','Excellent peel for carries.',4.8,'ST03','P005','TR03'),
('FB06','Positioning sometimes too aggressive.',3.8,'ST04','P007','TR04'),
('FB07','Very focused and disciplined.',4.7,'ST05','P009','TR05'),
('FB08','Should communicate cooldowns earlier.',3.9,'ST06','P011','TR06'),
('FB09','Reads opponents very well.',4.6,'ST07','P013','TR07'),
('FB10','Maintains positive mindset under pressure.',4.9,'ST10','P020','TR10');



INSERT INTO Staff (StaffID, Name, Role, TeamID) VALUES
('S101', 'Ahmad Saade', 'Head Coach', 'T001'),
('S102', 'Karim Nasser', 'Analyst',    'T001'),
('S103', 'Omar Haddad', 'Head Coach',  'T002'),
('S104', 'Fadi Mansour','Coach',       'T002');


INSERT INTO TrainingSession (TrainingID, Date, Type, Duration, StaffID) VALUES
('TR201', '2024-03-01', 'Strategy', 90, 'S101'),
('TR202', '2024-03-05', 'Scrim',    120,'S102'),
('TR203', '2024-03-10', 'Review',   60, 'S101'),
('TR204', '2024-03-15', 'Scrim',    110,'S102');

INSERT INTO TrainingSession (TrainingID, Date, Type, Duration, StaffID) VALUES
('TR205', '2024-03-02', 'Strategy', 90, 'S103'),
('TR206', '2024-03-06', 'Scrim',    120,'S104'),
('TR207', '2024-03-12', 'Review',   60, 'S103');



INSERT INTO TournamentOccurence
    (OccurenceID, TournamentSeriesID, StartDate, EndDate, PrizePool, HostOrganization)
VALUES
    ('OC11', 'TS01', '2025-10-01', '2025-10-03', 70000, 'Nova Esports Arena'),
    ('OC12', 'TS02', '2025-10-10', '2025-10-12', 85000, 'Summit Hub'),
    ('OC13', 'TS03', '2025-11-05', '2025-11-07', 50000, 'Phoenix Studio');


INSERT INTO TournamentParticipation
    (TeamID, OccurenceID, TournamentSeriesID)
VALUES
    ('T001', 'OC02', 'TS01'),
    ('T001', 'OC11', 'TS01'),
    ('T002', 'OC02', 'TS01'),
    ('T002', 'OC11', 'TS01'),
    ('T003', 'OC01', 'TS01'),
    ('T003', 'OC11', 'TS01');


INSERT INTO OfficialMatch
    (MatchID, Type, ScheduledDate, StartTime, Round, OccurenceID, TournamentSeriesID)
VALUES
    ('M021', 'BestOf3', '2025-10-01', '16:00:00', 'Group Stage',   'OC11', 'TS01'),
    ('M022', 'BestOf3', '2025-10-02', '18:00:00', 'Group Stage',   'OC11', 'TS01'),
    ('M023', 'BestOf5', '2025-10-10', '17:00:00', 'Semifinal',     'OC12', 'TS02'),
    ('M024', 'BestOf3', '2025-11-05', '19:00:00', 'Quarterfinal',  'OC13', 'TS03');


INSERT INTO TeamMatchParticipation
    (TeamID, MatchID, Side)
VALUES
    ('T001', 'M021', 'Home'),  ('T002', 'M021', 'Away'),
    ('T003', 'M022', 'Home'),  ('T004', 'M022', 'Away'),
    ('T005', 'M023', 'Home'),  ('T006', 'M023', 'Away'),
    ('T001', 'M024', 'Home'),  ('T003', 'M024', 'Away');


INSERT INTO MatchResult
    (ResultID, Score, EndTime, MatchID)
VALUES
    ('R021', '2-0', '18:00:00', 'M021'),
    ('R022', '2-1', '20:10:00', 'M022'),
    ('R023', '3-2', '21:45:00', 'M023'),
    ('R024', '2-0', '21:10:00', 'M024');

INSERT INTO TeamResult
    (ResultID, TeamID, IsWinner)
VALUES
    ('R021', 'T001', 1),
    ('R021', 'T002', 0),
    ('R022', 'T003', 1),
    ('R022', 'T004', 0),
    ('R023', 'T005', 1),
    ('R023', 'T006', 0),
    ('R024', 'T001', 1),
    ('R024', 'T003', 0);



INSERT INTO PlayerMatchStats
    (PlayerID, MatchID, Kills, Assists, Deaths, DamageDealt, Accuracy, Healing, Objective)
VALUES
    ('P001', 'M021', 20,  5,  8, 4000, 48.50, 300, 'Entry frags and site executes'),
    ('P001', 'M022', 18,  7,  9, 3800, 46.20, 200, 'Mid control and lurks'),
    ('P001', 'M023', 25,  4, 11, 5000, 49.80, 100, 'Hard carry performance'),

    ('P002', 'M021', 10, 12,  7, 3200, 45.00, 500, 'Smokes and support'),
    ('P002', 'M022', 14,  9,  8, 3400, 47.30, 450, 'Utility usage and spacing'),
    ('P002', 'M024', 16,  8,  9, 3600, 50.10, 300, 'Flank guard and retakes'),

    ('P003', 'M022', 22,  6, 10, 4600, 51.60, 150, 'Aggressive initiator'),
    ('P003', 'M023', 19, 10,  9, 4300, 50.40, 250, 'Follow-up duelist'),
    ('P003', 'M024', 17, 11,  8, 4100, 49.90, 200, 'Post-plant anchor');



INSERT INTO Sponsorship
    (SponsorID, OccurenceID, TournamentSeriesID, TeamID, Amount)
VALUES
    ('SP01', 'OC02', 'TS01', 'T002', 14000),
    ('SP01', 'OC03', 'TS02', 'T004', 16000),

    ('SP02', 'OC02', 'TS01', 'T003', 12500);
