DROP TABLE IF EXISTS Teams;

CREATE TABLE Teams
(
  Team_name varchar(50) NOT NULL,
  Team_code varchar(50) NOT NULL,
  Owner varchar(50) NOT NULL,
  Home_Ground varchar(50) NOT NULL,
  Debut int NOT NULL,
  no_of_trophies int NOT NULL,
  Coach varchar(50) NOT NULL,
  Captain_ID int NOT NULL UNIQUE,
  PRIMARY KEY (Team_code)
);

DROP TABLE IF EXISTS Players;

CREATE TABLE Players
(
  Player_ID int NOT NULL,
  First_Name varchar(50) NOT NULL,
  Last_Name varchar(50) NOT NULL,
  Base_Price int NOT NULL,
  Age int NOT NULL,
  Batting_Style varchar(50) ,
  Bowling_Style varchar(50) ,
  Captain_ID int NOT NULL,
  Team_code varchar(50) NOT NULL,
  PRIMARY KEY(Player_ID),
  FOREIGN KEY (Team_code) REFERENCES Teams(Team_code) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Captain_ID) REFERENCES Players(Player_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Captain_ID) REFERENCES Teams(Captain_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Prev_Team;

CREATE TABLE Prev_Team
(
  Team_name varchar(50) NOT NULL,
  Player_ID int NOT NULL,
  PRIMARY KEY (Team_name, Player_ID)
);

DROP TABLE IF EXISTS Years_active;

CREATE TABLE Years_active
(
  Year int NOT NULL,
  Team_code varchar(50) NOT NULL,
  PRIMARY KEY(Year, Team_code)
);

DROP TABLE IF EXISTS win_years;

CREATE TABLE win_years
(
  win_Year int NOT NULL,
  Team_code varchar(50) NOT NULL,
  PRIMARY KEY(win_Year, Team_code)
);

DROP TABLE IF EXISTS Venues;

CREATE TABLE Venues
(
  Venue_Name varchar(50) NOT NULL,
  Venue_ID int NOT NULL,
  Seating_capacity int NOT NULL,
  Contact_number int NOT NULL,
  Images varchar(50) NOT NULL,
  location varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  state varchar(50) NOT NULL,
  pin int NOT NULL,
  Home_Team varchar(50) NOT NULL,
  PRIMARY KEY(Venue_ID)
);

DROP TABLE IF EXISTS Bowling_Stats;

CREATE TABLE Bowling_Stats
(
  No_of_matches int NOT NULL,
  No_of_innings int NOT NULL,
  No_of_overs_bowled int NOT NULL,
  Total_Runs_Conceded int NOT NULL,
  Total_Wickets int NOT NULL,
  Best_Bowling_in_Innings varchar(50) NOT NULL,
  Year int NOT NULL,
  Player_ID int NOT NULL,
  PRIMARY KEY(Year, Player_ID),
  FOREIGN KEY (Player_ID) REFERENCES Players(Player_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS MVP;

CREATE TABLE MVP
(
  Matches int NOT NULL,
  Wickets int NOT NULL,
  Dots int NOT NULL,
  Total_no_fours int NOT NULL,
  Total_no_sixs int NOT NULL,
  Catches int NOT NULL,
  Run_outs int NOT NULL,
  Stumpings int NOT NULL,
  Year int NOT NULL,
  Player_ID int NOT NULL,
  PRIMARY KEY(Year, Player_ID),
  FOREIGN KEY (Player_ID) REFERENCES Players(Player_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Umpires;

CREATE TABLE Umpires
(
  First_Name varchar(50) NOT NULL,
  Last_Name varchar(50) NOT NULL,
  Age int NOT NULL,
  Country varchar(25) NOT NULL,
  Umpire_ID int NOT NULL,
  PRIMARY KEY (Umpire_ID)
);

DROP TABLE IF EXISTS Matches;

CREATE TABLE Matches
(
  date int NOT NULL,
  month varchar(15) NOT NULL,
  time varchar(10) NOT NULL,
  Team1_Code varchar(5) NOT NULL,
  Team2_Code varchar(5) NOT NULL,
  Match_Status varchar(15) NOT NULL,
  Winner_Team varchar(50),
  Player_of_the_match varchar(50) ,
  Venue_ID int NOT NULL,
  Year int NOT NULL,
  Match_ID int NOT NULL,
  PRIMARY KEY (Year, Match_ID),
  FOREIGN KEY (Venue_ID) REFERENCES Venues(Venue_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS umpires_a;

CREATE TABLE umpires_a
(
  Umpire_ID int NOT NULL,
  Year int NOT NULL,
  Match_ID int NOT NULL,
  FOREIGN KEY (Umpire_ID) REFERENCES Umpires(Umpire_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Year, Match_ID) REFERENCES Matches(Year, Match_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY (Umpire_ID, Year, Match_ID)
);

DROP TABLE IF EXISTS plays;

CREATE TABLE plays
(
  Team_code varchar(50) NOT NULL,
  Year int NOT NULL,
  Match_ID int NOT NULL,
  PRIMARY KEY (Team_code, Year, Match_ID),
  FOREIGN KEY (Team_code) REFERENCES Teams(Team_code) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Year, Match_ID) REFERENCES Matches(Year, Match_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Batting_Stats;

CREATE TABLE Batting_Stats
(
  Year int NOT NULL,
  Player_ID int NOT NULL,
  No_of_matches int DEFAULT 0,
  No_of_innings int DEFAULT 0,
  Total_Runs int DEFAULT 0,
  Highest_Score int DEFAULT 0,
  Balls_faced int DEFAULT 0,
  No_of_fours int DEFAULT 0,
  No_of_sixs int DEFAULT 0,
  No_of_centuries int DEFAULT 0,
  No_of_half_centuries int DEFAULT 0,
  Total_Not_outs int DEFAULT 0,
  PRIMARY KEY (Year, Player_ID),
  FOREIGN KEY (Player_ID) REFERENCES Players(Player_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CHECK(No_of_matches>=No_of_innings)
);

DROP TABLE IF EXISTS umpired_by;

CREATE TABLE umpired_by
(
  Year int NOT NULL,
  Match_ID int NOT NULL,
  Team_code varchar(50) NOT NULL,
  Umpire_ID int NOT NULL,
  PRIMARY KEY (Year, Match_ID, Team_code, Umpire_ID),
  FOREIGN KEY (Year, Match_ID) REFERENCES Matches(Year, Match_ID) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Team_code) REFERENCES Teams(Team_code) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Umpire_ID) REFERENCES Umpires(Umpire_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Overseas_Players;

CREATE TABLE Overseas_Players
(
  Player_ID int NOT NULL,
  Country_Of_Player varchar(50) NOT NULL,
  PRIMARY KEY (Player_ID)
);

DROP TABLE IF EXISTS Indian_Players;

CREATE TABLE Indian_Players
(
  Player_ID int NOT NULL,
  State_Of_Player varchar(50) NOT NULL,
  PRIMARY KEY (Player_ID)
);

DROP TABLE IF EXISTS Ticket_Prices;

CREATE TABLE Ticket_Prices
(
  Price int NOT NULL,
  Venue_ID int NOT NULL,
  PRIMARY KEY (Price, Venue_ID)
);

DROP TABLE IF EXISTS Points_Table;

CREATE TABLE Points_Table (
    Year int NOT NULL,
    Team_code varchar(5) NOT NULL,
    No_Matches_Played int DEFAULT 0,
    No_Won int DEFAULT 0,
    No_Lost int DEFAULT 0,
    No_Tied int DEFAULT 0,
    Net_RR double DEFAULT 0,
    PRIMARY KEY(Year, Team_code)
);