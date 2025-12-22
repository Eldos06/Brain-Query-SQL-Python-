------ tblCARD --------------
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

------------ tblASSIGNMENT_CARD -------------
EXEC AssingCardToStudent
    @CardID = 1,
    @AssignmentID = 1,
    @BeginDateTime = '2025-11-20 16:00:00',
	@EndDateTime = '2025-11-20 17:40:00';

EXEC AssingCardToStudent
    @CardID = 1,
    @AssignmentID = 1,
    @BeginDateTime = '2025-11-20 16:00:00',
    @EndDateTime = '2025-11-20 17:40:00';

EXEC AssingCardToStudent
    @CardID = 2,
    @AssignmentID = 3,
    @BeginDateTime = '2025-12-01 09:00:00',
    @EndDateTime = '2025-12-01 10:30:00';

EXEC AssingCardToStudent
    @CardID = 3,
    @AssignmentID = 5,
    @BeginDateTime = '2025-12-05 14:00:00',
    @EndDateTime = '2025-12-05 15:30:00';

EXEC AssingCardToStudent
    @CardID = 4,
    @AssignmentID = 2,
    @BeginDateTime = '2025-12-10 10:00:00',
    @EndDateTime = '2025-12-10 11:00:00';

EXEC AssingCardToStudent
    @CardID = 5,
    @AssignmentID = 7,
    @BeginDateTime = '2025-12-12 13:00:00',
    @EndDateTime = '2025-12-12 14:00:00';

EXEC AssingCardToStudent
    @CardID = 6,
    @AssignmentID = 4,
    @BeginDateTime = '2025-12-15 08:30:00',
    @EndDateTime = '2025-12-15 10:00:00';

EXEC AssingCardToStudent
    @CardID = 7,
    @AssignmentID = 8,
    @BeginDateTime = '2025-12-18 11:00:00',
    @EndDateTime = '2025-12-18 12:30:00';

EXEC AssingCardToStudent
    @CardID = 8,
    @AssignmentID = 6,
    @BeginDateTime = '2025-12-20 15:00:00',
    @EndDateTime = '2025-12-20 16:30:00';

EXEC AssingCardToStudent
    @CardID = 9,
    @AssignmentID = 9,
    @BeginDateTime = '2025-12-22 17:00:00',
    @EndDateTime = '2025-12-22 18:30:00';

EXEC AssingCardToStudent
    @CardID = 10,
    @AssignmentID = 10,
    @BeginDateTime = '2025-12-25 12:00:00',
    @EndDateTime = '2025-12-25 13:30:00';

------------ tblMEDIA_CARD -------------

EXEC InsertMediaCard 
    @MediaName = 'Text', 
    @CardName = 'Store Procedure', 
    @Words = 'What is a stored procedure in SQL?';

EXEC InsertMediaCard 
    @MediaName = 'Text', 
    @CardName = 'SQL Basics', 
    @Words = 'What are the fundamental concepts of SQL?';

EXEC InsertMediaCard 
    @MediaName = 'Text', 
    @CardName = 'Normalization', 
    @Words = 'What is normalization in database design, and why is it important?';

EXEC InsertMediaCard 
    @MediaName = 'Text', 
    @CardName = 'Encapsulation', 
    @Words = 'What does encapsulation mean in object-oriented programming?';

EXEC InsertMediaCard 
    @MediaName = 'Diagram', 
    @CardName = 'Binary Search Tree', 
    @Words = 'What is a binary search tree, and how does it work?';

EXEC InsertMediaCard 
    @MediaName = 'Diagram', 
    @CardName = 'Dijkstra’s Algorithm', 
    @Words = 'How does Dijkstra’s algorithm find the shortest path in a graph?';

EXEC InsertMediaCard 
    @MediaName = 'Code', 
    @CardName = 'INNER JOIN', 
    @Words = 'What does the SQL INNER JOIN operation do, and how is it used?';

EXEC InsertMediaCard 
    @MediaName = 'Text', 
    @CardName = 'RDBMS', 
    @Words = 'What is an RDBMS (Relational Database Management System), and what are its key features?';

EXEC InsertMediaCard 
    @MediaName = 'Text', 
    @CardName = 'PRIMARY KEY', 
    @Words = 'What is a primary key in SQL, and why is it important for database integrity?';

EXEC InsertMediaCard 
    @MediaName = 'Text', 
    @CardName = 'Data Integrity', 
    @Words = 'What is data integrity in the context of databases?';
