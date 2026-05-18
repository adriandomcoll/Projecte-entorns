CREATE TABLE Tracks (
    TrackID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    NationalityID INT,
    Year INT
);

CREATE TABLE Variants (
    VariantID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Link VARCHAR(500),
    TrackID INT,
    CONSTRAINT FK_Variants_Tracks
        FOREIGN KEY (TrackID)
        REFERENCES Tracks(TrackID)
);

CREATE TABLE CompetitionTypes (
    CompetitionTypeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Description TEXT
);

CREATE TABLE Competitions (
    CompetitionID INT PRIMARY KEY AUTO_INCREMENT,
    Laps INT,
    Time INT,
    CompetitionTypeID INT,
    CONSTRAINT FK_Competitions_CompetitionTypes
        FOREIGN KEY (CompetitionTypeID)
        REFERENCES CompetitionTypes(CompetitionTypeID)
);

CREATE TABLE Drivers (
    SteamID BIGINT PRIMARY KEY,
    AuthNum VARCHAR(255),
    Name VARCHAR(255),
    Lastname VARCHAR(255),
    Dorsal INT,
    NationalityID INT,
    TeamID INT
);

CREATE TABLE Laps (
    LapID INT PRIMARY KEY AUTO_INCREMENT,
    SteamID BIGINT,
    CompetitionID INT,
    Number INT,
    CONSTRAINT FK_Laps_Drivers
        FOREIGN KEY (SteamID)
        REFERENCES Drivers(SteamID),
    CONSTRAINT FK_Laps_Competitions
        FOREIGN KEY (CompetitionID)
        REFERENCES Competitions(CompetitionID)
);

CREATE TABLE Sectors (
    SectorID INT PRIMARY KEY AUTO_INCREMENT,
    LapID INT,
    Time INT,
    Number INT,
    CONSTRAINT FK_Sectors_Laps
        FOREIGN KEY (LapID)
        REFERENCES Laps(LapID)
);

CREATE TABLE Rounds (
    RoundID INT PRIMARY KEY AUTO_INCREMENT,
    ChampionshipID INT,
    VariantID INT,
    Date DATE,
    Hour TIME,
    QualyID INT,
    Race1ID INT,
    Race2ID INT,
    ReverseGrid INT,
    CONSTRAINT FK_Rounds_Variants
        FOREIGN KEY (VariantID)
        REFERENCES Variants(VariantID),
    CONSTRAINT FK_Rounds_QualyCompetition
        FOREIGN KEY (QualyID)
        REFERENCES Competitions(CompetitionID),
    CONSTRAINT FK_Rounds_Race1Competition
        FOREIGN KEY (Race1ID)
        REFERENCES Competitions(CompetitionID),
    CONSTRAINT FK_Rounds_Race2Competition
        FOREIGN KEY (Race2ID)
        REFERENCES Competitions(CompetitionID)
);
