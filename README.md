# 🎮 Esports Team Performance Tracker — Database Design

> **CSC375 – Database Management System**  
> Lebanese American University · School of Arts and Sciences  
> Department of Computer Science and Mathematics

**Team:** Kareem Naous · Jad Al Hassan · Issam Fawaz  
**Submitted to:** Dr. Khaleel Merchad  
**Date:** December 7, 2025

---

## 📋 Table of Contents

1. [Introduction](#introduction)
2. [Database Requirements](#database-requirements)
3. [E-R Model](#e-r-model)
   - [Entity Types & Attributes](#entity-types--attributes)
   - [Relationships](#relationships)
4. [Relational Model](#relational-model)
5. [Database Implementation](#database-implementation)
   - [DDL — Table Definitions](#ddl--table-definitions)
   - [DML — Data Population](#dml--data-population)
6. [Basic Queries](#basic-queries)
7. [Advanced Queries](#advanced-queries)
8. [Conclusion](#conclusion)

---

## Introduction

In the rapidly growing world of competitive gaming, esports organizations manage players, coaches, and tournaments across a variety of games and leagues. As teams compete in global events across games such as **League of Legends**, **Valorant**, and **CS:GO**, the volume of data generated from player performances, match outcomes, and training activities continues to expand.

The **Esports Team Performance Tracker** is a centralized relational database system designed to monitor every aspect of team and player activity — from tournament results and player statistics to training sessions and coaching feedback. It supports data-driven management by enabling analysts and coaches to identify trends, evaluate player development, and make evidence-based strategic decisions.

---

## Database Requirements

The system is intended to monitor:

- Team performance and composition over time
- Individual player statistics per match
- Match outcomes (official and scrimmage)
- Tournament participation across series and occurrences
- Training sessions and attendance
- Staff supervision and player feedback
- Sponsor relationships per tournament

### Sample Queries the System Supports

- List all tournaments in which Team Alpha participated in 2025
- Display the match history of a player across all games
- Show team composition changes over time
- Retrieve the KDA ratio of a player for the past three months
- Generate win–loss statistics for each team by game title

---

## E-R Model

### ER Diagram Notation

| Symbol | Component |
|--------|-----------|
| Rectangle | Entity |
| Double-bordered Rectangle | Weak Entity |
| Oval | Attribute |
| Oval with Underlined Text | Key Attribute |
| Dashed Underlined Oval | Partial Key Attribute |
| Double-border Oval | Multi-valued Attribute |
| Dashed Oval | Derived Attribute |
| Diamond | Relationship |
| Double-bordered Diamond | Identifying Relationship |

### Entity Types & Attributes

| Entity | Key | Notable Attributes |
|--------|-----|--------------------|
| `TournamentOrganizer` | OrganizerID | Name, ContactEmail |
| `TournamentSeries` | TournamentSeriesID | Name, GameTitle |
| `TournamentOccurrence` | OccurrenceID *(weak)* | HostOrganization, StartDate, EndDate, PrizePool |
| `Team` | TeamID | TeamName, Region, FoundingDate, Ranking |
| `Player` | PlayerID | GamerTag, FullName *(composite)*, Country, Role, Status, DateOfBirth *(composite)* |
| `PlayerTeamHistory` | *(weak: PlayerID + TeamID + StartDate)* | EndDate |
| `Sponsor` | SponsorID | Name, Email |
| `VideoGame` | VideoGameID | Name, Creator, Genre *(multi-valued)* |
| `Staff` | StaffID | Name, Role |
| `Feedback` | FeedbackID | Notes, Rating |
| `TrainingSession` | TrainingID | Type, Date, Duration |
| `Match` | MatchID | Type, ScheduledDate, StartTime |
| `OfficialMatch` | MatchID *(subtype)* | Round, OccurrenceID |
| `Scrimmage` | MatchID *(subtype)* | IsExternallyRecorded |
| `MatchResult` | ResultID | Score, EndTime, Duration *(derived)* |
| `Round` | RoundNumber + MatchID *(weak)* | PlayDetails, RoundTime |

### Relationships

| Relationship | Entities | Cardinality |
|-------------|----------|-------------|
| Organizes | TournamentOrganizer → TournamentSeries | 1:N |
| Has a | TournamentSeries → TournamentOccurrence | 1:N *(identifying)* |
| Is played during | VideoGame → TournamentSeries | 1:N |
| Occurs in | OfficialMatch → TournamentOccurrence | M:1 |
| Has Rounds | Match → Round | 1:N *(identifying)* |
| Participates In | Match ↔ Team | M:N *(with Side: Home/Away)* |
| Plays In | Player ↔ Match | M:N *(with Kills, Deaths, Assists, etc.)* |
| Has a Result | Match → MatchResult | 1:1 *(identifying)* |
| Won By | Round → Team | M:1 |
| Has History | Player → PlayerTeamHistory | 1:N *(identifying)* |
| Team Membership | Team → PlayerTeamHistory | 1:N *(identifying)* |
| Supervises | Staff → TrainingSession | 1:N |
| Attends | Player ↔ TrainingSession | M:N |
| Writes | Staff → Feedback | 1:N |
| About | Feedback → (Player attends TrainingSession) | 1:1 *(aggregation)* |
| Sponsorship | Team ↔ Sponsor ↔ TournamentOccurrence | N:N:N *(ternary, with Amount)* |
| ISA | Match → OfficialMatch / Scrimmage | Disjoint, Total |

---

## Relational Model

```
TournamentOrganizer      (OrganizerID, Name, ContactEmail)
TournamentSeries         (TournamentSeriesID, Name, GameTitle, #OrganizerID NOT NULL, #VideoGameID NOT NULL)
VideoGame                (VideoGameID, Name)
Genres                   (#VideoGameID, Genre)
TournamentOccurrence     (OccurrenceID, #TournamentSeriesID, StartDate, EndDate, PrizePool, HostOrganization)
Team                     (TeamID, TeamName, Region, FoundingDate, Ranking)
TournamentParticipation  (#TeamID, #OccurrenceID, #TournamentSeriesID)
Player                   (PlayerID, GamerTag, Role, FirstName, LastName, Status, Day, Month, Year, Country)
PlayerTeamHistory        (StartDate, #TeamID, #PlayerID, EndDate)
OfficialMatch            (MatchID, Type, ScheduledDate, StartTime, Round, #OccurrenceID NOT NULL, #TournamentSeriesID NOT NULL)
Scrimmage                (MatchID, Type, ScheduledDate, StartTime, IsExternallyRecorded)
TeamMatchParticipation   (#TeamID, #MatchID, Side{Home/Away})
Round                    (RoundNumber, #MatchID, PlayDetails, RoundTime)
WonBy                    (#RoundNumber, #TeamID)
PlayerMatchStats         (#PlayerID, #MatchID, Kills, Assists, Deaths, DamageDealt, Accuracy, Healing, Objective)
MatchResult              (ResultID, Score, EndTime, #MatchID NOT NULL)
TeamResult               (#ResultID, #TeamID, IsWinner)
Sponsor                  (SponsorID, Name, Email)
Sponsorship              (#SponsorID, #OccurrenceID, #TournamentSeriesID, #TeamID, Amount)
Staff                    (StaffID, Name, Role, #TeamID)
TrainingSession          (TrainingID, Date, Type, Duration, #StaffID NOT NULL)
PlayerAttendsTrainingSession (#PlayerID, #TrainingID)
Feedback                 (FeedbackID, Notes, Rating, #StaffID NOT NULL, #PlayerID NOT NULL, #TrainingID NOT NULL)
```

---

## Database Implementation

The database was implemented in **MySQL**. Tables were created in dependency order to avoid foreign key violations, then populated with realistic test data.

### DDL — Table Definitions

Key constraints applied across tables:

- `PRIMARY KEY` on all entity identifiers
- `FOREIGN KEY ... ON DELETE CASCADE` for dependent entities
- `NOT NULL` on mandatory attributes
- `CHECK` on bounded values:
  - `Ranking >= 0`
  - `Day BETWEEN 1 AND 31`, `Month BETWEEN 1 AND 12`
  - `Accuracy BETWEEN 0 AND 100`
  - `IsWinner IN (0, 1)`, `IsExternallyRecorded IN (0, 1)`
  - `Rating BETWEEN 1 AND 5`
  - `PrizePool >= 0`, `Amount >= 0`
  - `Side IN ('Home', 'Away')`
- `ON DELETE SET NULL` for Staff → Team (staff survives team deletion)

> Full DDL available in `DDL.sql`

### DML — Data Population

Insertion order followed parent-before-child dependency:

1. `TournamentOrganizer`, `VideoGame`, `TournamentSeries`, `Team`, `Player`, `Sponsor`
2. `TournamentOccurrence`, `OfficialMatch`, `Scrimmage`, `Staff`
3. `TournamentParticipation`, `TeamMatchParticipation`, `PlayerTeamHistory`, `Round`
4. `WonBy`, `PlayerMatchStats`, `MatchResult`, `TeamResult`
5. `Sponsorship`, `TrainingSession`, `PlayerAttendsTrainingSession`, `Feedback`

Core tables (`Team`, `Player`, `OfficialMatch`, `PlayerMatchStats`, `MatchResult`, `TeamResult`) contain **≥ 20 tuples** each. Supporting tables contain 10–15 tuples each.

> Full DML available in `DML.sql`

---

## Basic Queries

| # | Query Type | Description |
|---|-----------|-------------|
| 6.1 | Cartesian Product | All possible MENA vs North America team matchups |
| 6.2 | Natural Join | Tournament occurrences with their series info |
| 6.3 | Theta Join (`USING`) | Series, organizers, and video games |
| 6.4 | Theta Join (`ON`) | Official matches with home and away teams |
| 6.5 | Self-Join | Pairs of players from the same country |
| 6.6 | `DISTINCT` | Unique list of player countries |
| 6.7 | `LIKE` | Players with "Fox" in their gamertag |
| 6.8 | `ORDER BY` | Beirut Blaze matches sorted chronologically |
| 6.9 | `UNION` | Teams in tournaments or sponsorships |
| 6.10 | `INTERSECT` *(MySQL equiv.)* | Teams in both tournaments and sponsorships |
| 6.11 | `EXCEPT` *(MySQL equiv.)* | Teams in tournaments but without sponsorships |
| 6.12 | Aggregate | Total prize pool across all occurrences |
| 6.13 | `GROUP BY` | Match count per team, ranked descending |
| 6.14 | `GROUP BY` + `HAVING` | Win–loss stats filtered to teams with ≥ 2 wins |
| 6.15 | Multi-Join | Active Lebanese players and their current teams |
| 6.16 | Aggregate + `HAVING` | Staff with average feedback rating ≥ 4.0 |
| 6.17 | `GROUP BY` + `HAVING` | Teams with more than 2 training sessions |

---

## Advanced Queries

| # | Query Type | Description |
|---|-----------|-------------|
| 7.1 | Set Membership (`IN`) | Players who competed in the "Summit Clash" series |
| 7.2 | Set Comparison (`ALL`) | Team(s) with the highest total wins |
| 7.3 | Set Cardinality (`NOT EXISTS`) | Teams that have never won an official match |
| 7.4 | Multi-level Nesting | Players trained by staff of Summit Clash teams |
| 7.5 | SQL Division (`NOT EXISTS` + `EXCEPT`) | Teams that participated in all occurrences of a series |
| 7.6 | Subquery in `FROM` | Player leaderboard by total kills and deaths |
| 7.7 | Subquery in `SELECT` | Current active player count per team |
| 7.8 | `UPDATE` + `CASE` | Auto-update player status based on match count |
| 7.9 | `OUTER JOIN` | All teams with sponsorship info (including unsupported) |
| 7.10 | Trigger (assertion simulation) | Enforce total players + staff ≤ 200 |
| 7.11 | `CREATE VIEW` | Reusable team win–loss summary view |
| 7.12 | `CREATE TRIGGER` | Auto-mark players as Active when match stats are inserted |
| 7.13 | Stored Function | `PlayerKDA(playerID)` — overall KDA ratio |
| 7.14 | Stored Function | `PlayerKDA_Last3Months(playerID)` — KDA over last 3 months |

### Highlights

**KDA Stored Function**
```sql
SELECT PlayerKDA('P001') AS KDA;
-- Returns: 2.79
```

**TeamWinLoss View**
```sql
SELECT * FROM TeamWinLoss;
```
| TeamID | TeamName | Wins | Losses |
|--------|----------|------|--------|
| T001 | Atlas Esports | 4 | 1 |
| T002 | Lebanon Lions | 1 | 3 |
| T003 | Cedar Storm | 4 | 1 |

**Player Status Trigger** — automatically upgrades a player from `New` → `Active` upon their first recorded `PlayerMatchStats` insert.

---

## Conclusion

This project delivered a fully implemented relational database for an Esports Team Performance Tracker, covering:

- Complete ER modeling with weak entities, ISA hierarchies, aggregation, and ternary relationships
- MySQL implementation with integrity constraints, cascading deletes, and CHECK conditions
- 17 basic queries covering all major SQL operations
- 14 advanced queries including views, triggers, stored functions, and multi-level subqueries

**Future improvements could include:**
- Expanded stored procedures for automated monthly reports
- Transaction control for bulk insertions
- Role-based access control
- A front-end interface for non-technical users
