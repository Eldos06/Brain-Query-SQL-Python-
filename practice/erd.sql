CREATE TABLE Note_media{
    NoteMediaID INTEGER PRIMARY KEY
    UsageContext VARCHAR(1000)
    FOREIGN KEY (NoteID) REFERENCES Note(NoteID)
    FOREIGN KEY (MediaID) REFERENCES Media(MediaID)
}

CREATE TABLE Note{
    NoteID INTEGER PRIMARY KEY
    Guid VARCHAR(100)
    CreatedAt TIMESTAMP
    UpdateAt TIMESTAMP
    FOREIGN KEY (ModelID) REFERENCES Note_model(ModelID)
    FOREIGN KEY (OwnerUserID) REFERENCES User(UserID)
}

CREATE TABLE Note_model{
    ModelID INTEGER PRIMARY KEY
    ModelName VARCHAR(100)
    Description VARCHAR(10000)   
}

CREATE TABLE Note_field{
    FieldID INTEGER PRIMARY KEY
    Description TEXT
    FieldName VARCHAR(100)
    Ordinal INTEGER
}

CREATE TABLE Model_field{
    ModelFieldID INTEGER PRIMARY KEY
    FieldName VARCHAR(100)
    Ordinal INTEGER
    FOREIGN KEY (ModelID) REFERENCES Note_model(ModelID)
}

CREATE TABLE Note_field_value{
    NoteFieldID INTEGER PRIMARY KEY
    FieldValue TEXT
    FOREIGN KEY (NoteID) REFERENCES Note(NoteID)
    FOREIGN KEY (ModelFieldID) REFERENCES Model_field(ModelFieldID)
}

CREATE TABLE Model_template{
    TemplateID INTEGER PRIMARY KEY
    TemplateName VARCHAR(100)
    FrontTemplate TEXT
    BackTemplate TEXT
    CSS TEXT
    FOREIGN KEY (ModelID) REFERENCES Note_model(ModelID)   
}

CREATE TABLE Note_tag{
    NoteTagID INTEGER PRIMARY KEY
    FOREIGN KEY (NoteID) REFERENCES Note(NoteID)
    FOREIGN KEY (TagID) REFERENCES Tag(TagID)
}

CREATE TABLE Tag{
    TagID INTEGER PRIMARY KEY
    TagName VARCHAR(100)
    Description TEXT
}

CREATE TABLE User {
        UserID INTEGER PRIMARY KEY
        email VARCHAR(100) UNIQUE NOT NULL
        password_hash VARCHAR(255) NOT NULL
        display_name VARCHAR(100)
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
}


CREATE TABLE Media {
      MediaID INTEGER  PRIMARY KEY
      OwnerUserID REFERENCES users(UserID) ON DELETE CASCADE
      file_name VARCHAR(255) NOT NULL
      mime_type VARCHAR(100)
      size_bytes BIGINT
      sha256 CHAR(64)
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
}


CREATE TABLE Desk{
      DeskID INTEGER  PRIMARY KEY
      OwnerUserID REFERENCES Users(UserID) ON DELETE CASCADE
      DeskName VARCHAR(100) NOT NULL
      Description TEXT
      CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      isPublic BOOLEAN DEFAULT FALSE
 }

CREATE TABLE Card{
      CardID INTEGER PRIMARY KEY
      NoteID  REFERENCES Note(NoteID) ON DELETE CASCADE
      TemplateID  REFERENCES Model_template(TemplateID)
      DeskID  REFERENCES desk(DeskID)
      DueAt TIMESTAMP
      EasyFactor FLOAT
      Intervals INT
      Reps INT
      Lapses INT DEFAULT 0,
      State VARCHAR(50)
}

CREATE TABLE Deck_tag{
      DeckTagID INTEGER PRIMARY KEY
      DeskID  REFERENCES Desk(DeskID) ON DELETE CASCADE
      TagId  REFERENCES Tag(TagID) ON DELETE CASCADE
}

CREATE TABLE Review_log{
      ReviewID INTEGER PRIMARY KEY
      CardID  REFERENCES Card(CardID) ON DELETE CASCADE
      ReviewedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      Rating INT CHECK (Rating BETWEEN 1 AND 5)
      TimeTakenMs INT
      OldInterval INT
      NewInterval INT
      OldEase FLOAT
      NewEase FLOAT
}

