-- Insert cards using the ADD_Card_tblCARD stored procedure
EXEC ADD_Card_tblCARD
    @DeckID = 1,
    @CardFront = 'Store Procedure',
    @CardBack = 'A stored procedure in SQL is a precompiled collection of SQL statements and optional control-of-flow logic (like loops and conditional statements) that is stored in the database management system as a named object';

EXEC ADD_Card_tblCARD
    @DeckID = 1,
    @CardFront = 'SQL Basics',
    @CardBack = 'Introduction to SQL syntax and queries';

EXEC ADD_Card_tblCARD
    @DeckID = 2,
    @CardFront = 'Normalization',
    @CardBack = 'Normalization is the process of organizing data to avoid redundancy and ensure data integrity in a relational database';

EXEC ADD_Card_tblCARD
    @DeckID = 3,
    @CardFront = 'Encapsulation',
    @CardBack = 'Encapsulation is one of the four fundamental OOP concepts, where data and methods are bundled together inside a class';

EXEC ADD_Card_tblCARD
    @DeckID = 4,
    @CardFront = 'Binary Search Tree',
    @CardBack = 'A binary search tree is a data structure in which each node has at most two children, and for each node, the left child?s value is less than the parent node?s value, and the right child?s value is greater';

EXEC ADD_Card_tblCARD
    @DeckID = 5,
    @CardFront = 'Dijkstra?s Algorithm',
    @CardBack = 'Dijkstra?s algorithm is a graph search algorithm used to find the shortest path between nodes in a graph';

EXEC ADD_Card_tblCARD
    @DeckID = 1,
    @CardFront = 'INNER JOIN',
    @CardBack = 'An INNER JOIN returns records that have matching values in both tables involved in the join';

EXEC ADD_Card_tblCARD
    @DeckID = 2,
    @CardFront = 'RDBMS',
    @CardBack = 'A Relational Database Management System (RDBMS) is a type of database management system (DBMS) that stores data in tables that are related to each other through foreign keys';

EXEC ADD_Card_tblCARD
    @DeckID = 3,
    @CardFront = 'PRIMARY KEY',
    @CardBack = 'A PRIMARY KEY is a column or a set of columns in a table that uniquely identifies each row in the table';

EXEC ADD_Card_tblCARD
    @DeckID = 4,
    @CardFront = 'Data Integrity',
    @CardBack = 'Data integrity refers to the accuracy, consistency, and reliability of data stored in a database';

EXEC ADD_Card_tblCARD
    @DeckID = 5,
    @CardFront = 'Stored Procedure',
    @CardBack = 'A stored procedure in SQL is a precompiled collection of SQL statements and optional control-of-flow logic (like loops and conditional statements) that is stored in the database management system as a named object';



-- Assign cards to students using the AssingCardToStudent stored procedure
EXEC AssingCardToStudent
    @CardID = 1, -- Ensure CardID exists in tblCARD
    @AssignmentID = 1, -- Ensure AssignmentID exists in tblASSIGNMENT
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





