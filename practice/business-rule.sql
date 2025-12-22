CREATE OR ALTER FUNCTION dbo.fn_AssignmentCard_DeckMismatch()
RETURNS INT
AS
BEGIN
    DECLARE @RET INT = 0;

    IF EXISTS (
        SELECT *
        FROM tblASSIGNMENT_CARD AC
        JOIN tblASSIGNMENT A
            ON AC.AssignmentID = A.AssignmentID
        JOIN tblCARD C
            ON AC.CardID = C.CardID
        WHERE A.DeckID <> C.DeckID
    )
    BEGIN
        SET @RET = 1;
    END

    RETURN @RET;
END
GO

ALTER TABLE tblASSIGNMENT_CARD WITH NOCHECK
ADD CONSTRAINT MustBelongToAssignmentDeck
CHECK (dbo.fn_AssignmentCard_DeckMismatch() = 0)