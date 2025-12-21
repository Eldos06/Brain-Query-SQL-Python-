CREATE OR ALTER PROCEDURE AssignCardToStudent
	@CardID INT,
	@AssignmentID INT,
	@BeginDateTime  DATETIME,
	@EndDateTime DATETIME
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN;
		
		IF NOT EXISTS (SELECT 1 FROM tblCARD WHERE CardID = @CardID)
		BEGIN;
			THROW 50000, 'The specified CardID does not exist.', 1;
			RETURN;
		END

		IF NOT EXISTS (SELECT 1 FROM tblASSIGNMENT WHERE AssignmentID = @AssignmentID)
		BEGIN;
			THROW 50001, 'The specified AssignmentID does not exist.', 1;
			RETURN;
		END

		INSERT INTO tblASSIGNMENT_CARD (CardID, AssignmentID, BeginDateTime, EndDateTime)
		VALUES (@CardID, @AssignmentID, @BeginDateTime, @EndDateTime);

		COMMIT TRAN;
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW;
	END CATCH
END;
GO

CREATE OR ALTER PROCEDURE InsertCardWithAssignment
	@DeckID INT,
	@CardFront VARCHAR(500),
	@CardBack  VARCHAR(500),
	@StudentID INT,
	@BeginDateTime DATETIME,
	@EndDateTime DATETIME
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN;

		DECLARE @CardID INT;

		INSERT INTO tblCARD (DeckID, CardFront, CardBack)
		VALUES (@DeckID, @CardFront, @CardBack);

		SET @CardID = SCOPE_IDENTITY();

		DECLARE @AssignmentID INT;

		INSERT INTO tblASSIGNMENT (DeckID, StudentID)
		VALUES (@DeckID, @StudentID);

		SET @AssignmentID = SCOPE_IDENTITY();

		EXEC AssignCardToStudent
			@CardID = @CardID,
			@AssignmentID = @AssignmentID,
			@BeginDateTime = @BeginDateTime,
			@EndDateTime = @EndDateTime;

		COMMIT TRAN;

	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW;
	END CATCH
END

			




