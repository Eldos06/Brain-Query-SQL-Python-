CREATE OR ALTER PROCEDURE ADD_Card_tblCARD
          @DeckID INT,
		  @CardName VARCHAR(50),
		  @CardDescr VARCHAR(500)
	AS
	BEGIN 
		BEGIN TRY
			BEGIN TRAN;
				INSERT INTO tblCARD(DeckID, CardName, CardDescr)
				VALUES (@DeckID, @CardName, @CardDescr)

				COMMIT TRAN
		END TRY
		BEGIN CATCH
			ROLLBACK TRAN;
			THROW;
		END CATCH
	END
GO


CREATE OR ALTER PROCEDURE AssingCardToStudent
    @CardID INT,
    @AssignmentID INT,
    @BeginDateTime DATETIME,
    @EndDateTime   DATETIME
    AS
    BEGIN
        BEGIN TRY
            BEGIN TRAN
                IF NOT EXISTS (SELECT 1 FROM tblCARD WHERE CardID = @CardID)
                BEGIN;
                    THROW 50000, 'The specified CardID does not exists in the system. ', 1;
                    RETURN;
                END

                IF NOT EXISTS (SELECT 1 FROM tblASSIGNMENT WHERE AssignmentID = @AssignmentID)
                BEGIN;
                    THROW 50001, 'The specified AssignmentID does not exists in the system.', 1;
                    RETURN;
                END
		

                INSERT INTO tblASSIGNMENT_CARD (CardID, AssignmentID, BeginDateTime, EndDateTime)
                VALUES (@CardID, @AssignmentID, @BeginDateTime, @EndDateTime)

                COMMIT TRAN
                PRINT 'Assignment card successfully assigned to the student'
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN;
            THROW;
        END CATCH
    END
GO

CREATE OR ALTER PROCEDURE InsertMediaCard 
@MediaName VARCHAR(50),
@CardFront VARCHAR(50),
@Words TEXT
AS
BEGIN
    DECLARE @MediaID INT;
    DECLARE @CardID INT;

    SET @MediaID = (SELECT MediaID
                    FROM tblMEDIA
                    WHERE MediaName = @MediaName);

    SET @CardID = (SELECT CardID
                    FROM tblCARD
                    WHERE CardFront = @CardFront);

    IF @MediaID IS NULL OR @CardID IS NULL
    BEGIN
        PRINT 'Hey....uhh... it looks like one of the IDs is empty: check spelling or existence';
        THROW 55442, 'MediaID or CardID cannot be NULL; process is terminating', 1;
	END
END
BEGIN TRANSACTION T1;

INSERT INTO tblMEDIA_CARD (MediaID, CardID, Words)
VALUES (@MediaID, @CardID, @Words);
IF @@ERROR <> 0
	BEGIN
		PRINT 'Something went wrong prior to COMMIT';
        ROLLBACK TRANSACTION T1;
	END
ELSE
	COMMIT TRANSACTION T1;
GO

CREATE OR ALTER PROCEDURE InsertNote
@NT_Name varchar(50),
@C_Front VARCHAR(200),
@M_Name VARCHAR(30),
@N_Date datetime
AS
BEGIN
	DECLARE @MC_ID INT;
	DECLARE @NT_ID INT;

	SET @MC_ID = (SELECT MediaCardID
					FROM tblMEDIA_CARD mc
					JOIN tblCARD c ON c.CardID = mc.CardID
					JOIN tblMEDIA m ON m.MediaID = mc.MediaID
					WHERE c.CardFront = @C_Front
					AND m.MediaName = @M_Name);
	SET @NT_ID = (SELECT NoteTypeID FROM tblNOTE_TYPE WHERE NoteTypeName = @NT_Name);
	IF @MC_ID IS NULL OR @NT_ID IS NULL
		BEGIN
			PRINT 'Hey....uhh... it looks like one of the IDs is empty: check spelling or existence';
			THROW 55442, 'IDs cannot be NULL; process is terminating', 1;
		END
END
BEGIN TRANSACTION T1;
INSERT INTO tblNOTE (MediaCardID, NoteTypeID, NoteDate)
VALUES (@MC_ID, @NT_ID, @N_Date);

IF @@ERROR > 0
	BEGIN
		PRINT 'Something went wrong prior to COMMIT';
        ROLLBACK TRANSACTION T1;
	END
ELSE
	COMMIT TRANSACTION T1;
GO

CREATE OR ALTER PROCEDURE InsertAssignment
    @DeckName VARCHAR(100),
    @StudentEmail VARCHAR(100)
AS
BEGIN
    DECLARE @DeckID INT;
    DECLARE @StudentID INT;

    SET @DeckID = (SELECT DeckID
    FROM tblDECK
    WHERE DeckName = @DeckName);

    SET @StudentID = (SELECT StudentID
    FROM tblSTUDENT
    WHERE email = @StudentEmail);

    IF @DeckID IS NULL OR @StudentID IS NULL
    BEGIN
        PRINT 'Hey....uhh... it looks like one of the IDs is empty: check spelling or existence';
        THROW 55442, 'DeckID or StudentID cannot be NULL; process is terminating', 1;
	END
END
BEGIN TRANSACTION T1;

INSERT INTO tblASSIGNMENT (DeckID, StudentID)
VALUES (@DeckID, @StudentID);
IF @@ERROR <> 0
	BEGIN
		PRINT 'Something went wrong prior to COMMIT';
        ROLLBACK TRANSACTION T1;
	END
ELSE
	COMMIT TRANSACTION T1;
GO

CREATE OR ALTER PROCEDURE InsertReview
    @AssignmentCardID INT,
    @RatingName VARCHAR(50),
    @IntervalID INT,
    @ReviewDate DATETIME
AS
BEGIN
    DECLARE @RatingID INT;

    SET @RatingID = (SELECT RatingID
    FROM tblRATING
    WHERE RatingName = @RatingName);

	IF @RatingID IS NULL OR @IntervalID IS NULL OR @AssignmentCardID IS NULL
		BEGIN
			PRINT 'Hey....uhh... it looks like one of the IDs is empty: check spelling or existence';
			THROW 55442, 'AssignmentCardID or RatingID or IntervalID cannot be NULL; process is terminating', 1;
		END
END
BEGIN TRANSACTION T1;
INSERT INTO tblREVIEW (AssignmentCardID, RatingID, IntervalID, ReviewDate)
VALUES (@AssignmentCardID, @RatingID, @IntervalID, @ReviewDate);

IF @@ERROR <> 0
	BEGIN
		PRINT 'Something went wrong prior to COMMIT';
        ROLLBACK TRANSACTION T1;
	END
ELSE
	COMMIT TRANSACTION T1;
GO