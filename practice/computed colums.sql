ALTER TABLE tblSTUDENT
ADD FullName AS (StudentFname + ' ' + StudentLname) PERSISTED;

SELECT StudentID, FullName FROM tblSTUDENT;


ALTER TABLE tblASSIGNMENT_CARD
ADD Duration AS DATEDIFF(MINUTE, BeginDateTime, EndDateTime) PERSISTED;

SELECT AssignmentCardID, Duration FROM tblASSIGNMENT_CARD;
