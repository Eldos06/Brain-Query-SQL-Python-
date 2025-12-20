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
		
        BEGIN TRY
            BEGIN TRAN;
                INSERT INTO tblASSIGNMENT_CARD (CardID, AssignmentID, BeginDateTime, EndDateTime)
                VALUES (@CardID, @AssignmentID, @BeginDateTime, @EndDateTime)

                COMMIT TRAN
        END TRY
        BEGIN CATCH
            ROLLBACK TRAN;
            THROW;
        END CATCH
    END





EXEC ADD_Card_tblCARD
	@DeckID = 1,
	@CardName = 'Store Procedure',
	@CardDescr = 'A stored procedure in SQL is a precompiled collection of SQL statements and optional control-of-flow logic (like loops and conditional statements) that is stored in the database management system as a named object'

EXEC ADD_Card_tblCARD
    @DeckID = 1,
    @CardName = 'SQL Basics',
    @CardDescr = 'Introduction to SQL syntax and queries';

EXEC ADD_Card_tblCARD
    @DeckID = 2,
    @CardName = 'Normalization',
    @CardDescr = 'Normalization is the process of organizing data to avoid redundancy and ensure data integrity in a relational database';

EXEC ADD_Card_tblCARD
    @DeckID = 3,
    @CardName = 'Encapsulation',
    @CardDescr = 'Encapsulation is one of the four fundamental OOP concepts, where data and methods are bundled together inside a class';

EXEC ADD_Card_tblCARD
    @DeckID = 4,
    @CardName = 'Binary Search Tree',
    @CardDescr = 'A binary search tree is a data structure in which each node has at most two children, and for each node, the left child?s value is less than the parent node?s value, and the right child?s value is greater';

EXEC ADD_Card_tblCARD
    @DeckID = 5,
    @CardName = 'Dijkstra?s Algorithm',
    @CardDescr = 'Dijkstra?s algorithm is a graph search algorithm used to find the shortest path between nodes in a graph';

EXEC ADD_Card_tblCARD
    @DeckID = 1,
    @CardName = 'INNER JOIN',
    @CardDescr = 'An INNER JOIN returns records that have matching values in both tables involved in the join';

EXEC ADD_Card_tblCARD
    @DeckID = 2,
    @CardName = 'RDBMS',
    @CardDescr = 'A Relational Database Management System (RDBMS) is a type of database management system (DBMS) that stores data in tables that are related to each other through foreign keys';

EXEC ADD_Card_tblCARD
    @DeckID = 3,
    @CardName = 'PRIMARY KEY',
    @CardDescr = 'A PRIMARY KEY is a column or a set of columns in a table that uniquely identifies each row in the table';

EXEC ADD_Card_tblCARD
    @DeckID = 4,
    @CardName = 'Data Integrity',
    @CardDescr = 'Data integrity refers to the accuracy, consistency, and reliability of data stored in a database';

EXEC ADD_Card_tblCARD
    @DeckID = 5,
    @CardName = 'Stored Procedure',
    @CardDescr = 'A stored procedure in SQL is a precompiled collection of SQL statements and optional control-of-flow logic (like loops and conditional statements) that is stored in the database management system as a named object';











