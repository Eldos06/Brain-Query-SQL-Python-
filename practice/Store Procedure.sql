CREATE OR ALTER PROCEDURE ADD_Card_tblCARD
          @DeckID INT,
		  @CardFront VARCHAR(500),
		  @CardBack VARCHAR(500)
	AS
	BEGIN 
		BEGIN TRY
			BEGIN TRAN;
				INSERT INTO tblCARD(DeckID, CardFront, CardBack)
				VALUES (@DeckID, @CardFront, @CardBack)

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













