create table TournamentOrganizer
    (OrganizerID     varchar(10),
	Name            varchar(50) not null,
	ContactEmail    varchar(100),
	primary key (OrganizerID)
    );

create table VideoGame
    (VideoGameID     varchar(10),
	Name            varchar(50) not null,
	primary key (VideoGameID)
    );

create table Genres
    (VideoGameID     varchar(10),
	Genre           varchar(30),
	primary key (VideoGameID, Genre),
	foreign key (VideoGameID) references VideoGame (VideoGameID)
		on delete cascade
    );

create table TournamentSeries
    (TournamentSeriesID  varchar(10),
	Name                varchar(50) not null,
	GameTitle           varchar(50),
	OrganizerID         varchar(10) not null,
	VideoGameID         varchar(10) not null,
	primary key (TournamentSeriesID),
	foreign key (OrganizerID) references TournamentOrganizer (OrganizerID)
		on delete cascade,
	foreign key (VideoGameID) references VideoGame (VideoGameID)
		on delete cascade
    );

create table TournamentOccurence
    (OccurenceID         varchar(10),
	TournamentSeriesID  varchar(10) not null,
	StartDate           date not null,
	EndDate             date,
	PrizePool           numeric(12,2) check (PrizePool >= 0),
	HostOrganization    varchar(100),
	primary key (OccurenceID),
	foreign key (TournamentSeriesID) references TournamentSeries (TournamentSeriesID)
		on delete cascade
    );


create table Team
    (TeamID          varchar(10),
	TeamName        varchar(50) not null,
	Region          varchar(30),
	FoundingDate    date,
	Ranking         numeric(4,0) check (Ranking >= 0),
	primary key (TeamID)
    );

create table TournamentParticipation
    (TeamID          varchar(10),
	OccurenceID     varchar(10),
	TournamentSeriesID varchar(10),
	primary key (TeamID, OccurenceID, TournamentSeriesID),
	foreign key (TeamID) references Team (TeamID)
		on delete cascade,
	foreign key (OccurenceID) references TournamentOccurence (OccurenceID)
		on delete cascade,
	foreign key (TournamentSeriesID) references TournamentSeries (TournamentSeriesID)
		on delete cascade
    );

create table Player
    (PlayerID        varchar(10),
	GamerTag        varchar(30) not null,
	Role            varchar(30),
	FirstName       varchar(30),
	LastName        varchar(30),
	Status          varchar(20),
	Day             numeric(2,0) check (Day >= 1 and Day <= 31),
	Month           numeric(2,0) check (Month >= 1 and Month <= 12),
	Year            numeric(4,0),
	Country         varchar(40),
	primary key (PlayerID)
    );

create table PlayerTeamHistory
    (StartDate       date,
	TeamID          varchar(10),
	PlayerID        varchar(10),
	EndDate         date,
	primary key (PlayerID, TeamID, StartDate),
	foreign key (TeamID) references Team (TeamID)
		on delete cascade,
	foreign key (PlayerID) references Player (PlayerID)
		on delete cascade
    );


create table OfficialMatch
    (MatchID             varchar(10),
	Type                varchar(20),
	ScheduledDate       date,
	StartTime           time,
	Round               varchar(20),
	OccurenceID         varchar(10) not null,
	TournamentSeriesID  varchar(10) not null,
	primary key (MatchID),
	foreign key (OccurenceID) references TournamentOccurence (OccurenceID)
		on delete cascade,
     foreign key (TournamentSeriesID) references TournamentSeries (TournamentSeriesID)
        on delete cascade
    );


create table Scrimmage
    (MatchID             varchar(10),
	Type                varchar(20),
	ScheduledDate       date,
	StartTime           time,
	IsExternallyRecorded numeric(1,0)
		check (IsExternallyRecorded in (0,1)),
	primary key (MatchID)
    );


create table TeamMatchParticipation
    (TeamID          varchar(10),
	MatchID         varchar(10),
	Side            varchar(5)
		check (Side in ('Home','Away')),
	primary key (TeamID, MatchID),
	foreign key (TeamID) references Team (TeamID)
		on delete cascade,
	foreign key (MatchID) references OfficialMatch (MatchID)
		on delete cascade

    );

create table Round
    (RoundNumber     numeric(3,0),
	MatchID         varchar(10),
	PlayDetails     varchar(200),
	RoundTime       numeric(3,0),  -- Time it took to finish a round in minutes.
	primary key (RoundNumber, MatchID),
	foreign key (MatchID) references OfficialMatch (MatchID)
		on delete cascade
    );

create table WonBy
    (RoundNumber     numeric(3,0),
	MatchID         varchar(10),
	TeamID          varchar(10),
	primary key (RoundNumber, MatchID, TeamID),
	foreign key (RoundNumber, MatchID) references Round (RoundNumber, MatchID)
		on delete cascade,
	foreign key (TeamID) references Team (TeamID)
		on delete cascade
    );

create table PlayerMatchStats
    (PlayerID        varchar(10),
	MatchID         varchar(10),
	Kills           numeric(4,0)  check (Kills >= 0),
	Assists         numeric(4,0)  check (Assists >= 0),
	Deaths          numeric(4,0)  check (Deaths >= 0),
	DamageDealt     numeric(10,0) check (DamageDealt >= 0),
	Accuracy        numeric(5,2)  check (Accuracy >= 0 and Accuracy <= 100),
	Healing         numeric(10,0) check (Healing >= 0),
	Objective       varchar(200),
	primary key (PlayerID, MatchID),
	foreign key (PlayerID) references Player (PlayerID)
        on delete cascade,
	foreign key (MatchID) references OfficialMatch (MatchID)
		on delete cascade
    );

create table MatchResult
    (ResultID        varchar(10),
	Score           varchar(20),
	EndTime         time,
	MatchID         varchar(10) not null,
	primary key (ResultID),
	foreign key (MatchID) references OfficialMatch (MatchID)
		on delete cascade
    );

create table TeamResult
    (ResultID        varchar(10),
	TeamID          varchar(10),
	IsWinner        numeric(1,0)
		check (IsWinner in (0,1)),  -- 1 means winner and 0 means loser
	primary key (ResultID, TeamID),
	foreign key (ResultID) references MatchResult (ResultID)
		on delete cascade,
	foreign key (TeamID) references Team (TeamID)
		on delete cascade
    );


create table Sponsor
    (SponsorID       varchar(10),
	Name            varchar(50) not null,
	Email           varchar(100),
	primary key (SponsorID)
    );

create table Sponsorship
    (SponsorID       varchar(10),
	OccurenceID     varchar(10),
	TournamentSeriesID varchar(10),
	TeamID          varchar(10),
	Amount          numeric(12,2) check (Amount >= 0),
	primary key (SponsorID, OccurenceID, TournamentSeriesID, TeamID),
	foreign key (SponsorID) references Sponsor (SponsorID)
		on delete cascade,
	foreign key (OccurenceID) references TournamentOccurence (OccurenceID)
        on delete cascade,
	foreign key (TournamentSeriesID) references TournamentSeries (TournamentSeriesID)
        on delete cascade,
	foreign key (TeamID) references Team (TeamID)
        on delete cascade
    );

create table Staff
    (StaffID         varchar(10),
	Name            varchar(50) not null,
	Role            varchar(30),
	TeamID          varchar(10),
	primary key (StaffID),
	foreign key (TeamID) references Team (TeamID)
        on delete set null
    );

create table TrainingSession
    (TrainingID      varchar(10),
	Date            date not null,
	Type            varchar(30),
	Duration        numeric(3,0),  -- minutes it took to complete training session
	StaffID         varchar(10) not null,
	primary key (TrainingID),
	foreign key (StaffID) references Staff (StaffID)
        on delete cascade
    );

create table PlayerAttendsTrainingSession
    (PlayerID        varchar(10),
	TrainingID      varchar(10),
	primary key (PlayerID, TrainingID),
	foreign key (PlayerID) references Player (PlayerID)
        on delete cascade,
	foreign key (TrainingID) references TrainingSession (TrainingID)
        on delete cascade
    );

create table Feedback
    (FeedbackID      varchar(10),
	Notes           varchar(500),
	Rating          numeric(2,1) check (Rating >= 1 and Rating <= 5),
	StaffID         varchar(10) not null,
	PlayerID        varchar(10) not null,
	TrainingID      varchar(10) not null,
	primary key (FeedbackID),
	foreign key (StaffID) references Staff (StaffID)
        on delete cascade,
	foreign key (PlayerID) references Player (PlayerID)
        on delete cascade,
	foreign key (TrainingID) references TrainingSession (TrainingID)
        on delete cascade
    );
