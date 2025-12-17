-- Insert 20 SUBJECTS
INSERT INTO tblSUBJECT (SubjectName, SubjectDescr) VALUES
('Mathematics', 'Study of numbers, quantity, and space'),
('Physics', 'Science of matter, energy, and their interactions'),
('Chemistry', 'Study of substances and their properties'),
('Biology', 'Science of living organisms'),
('History', 'Study of past events'),
('Geography', 'Study of Earth and its features'),
('Literature', 'Study of written works'),
('Computer Science', 'Study of computation and information'),
('Psychology', 'Study of mind and behavior'),
('Economics', 'Study of production and consumption'),
('Philosophy', 'Study of fundamental questions'),
('Art', 'Creative and visual expression'),
('Music', 'Study of sound and composition'),
('Engineering', 'Application of science to design'),
('Medicine', 'Science of health and disease'),
('Law', 'System of rules and regulations'),
('Sociology', 'Study of society and social behavior'),
('Astronomy', 'Study of celestial objects'),
('Linguistics', 'Study of language'),
('Political Science', 'Study of government and politics');

-- Insert 20 OWNERS
INSERT INTO tblOWNER (OwnerFname, OwnerLname, OwnerDescr) VALUES
('John', 'Smith', 'High school teacher'),
('Emma', 'Johnson', 'University professor'),
('Michael', 'Williams', 'Online educator'),
('Sophia', 'Brown', 'Subject matter expert'),
('James', 'Jones', 'Curriculum developer'),
('Olivia', 'Garcia', 'Educational content creator'),
('William', 'Martinez', 'Private tutor'),
('Ava', 'Rodriguez', 'Academic coordinator'),
('Alexander', 'Wilson', 'Department head'),
('Isabella', 'Anderson', 'Learning specialist'),
('Daniel', 'Thomas', 'Education consultant'),
('Mia', 'Taylor', 'Course instructor'),
('Matthew', 'Moore', 'Teaching assistant'),
('Charlotte', 'Jackson', 'Educational researcher'),
('David', 'Martin', 'Training manager'),
('Amelia', 'Lee', 'E-learning developer'),
('Joseph', 'Perez', 'Study guide author'),
('Harper', 'White', 'Academic advisor'),
('Andrew', 'Harris', 'Education specialist'),
('Evelyn', 'Clark', 'Content strategist');

-- Insert 20 STUDENTS
INSERT INTO tblSTUDENT (StudentFname, StudentLname, BirthDate, email) VALUES
('Alice', 'Cooper', '2005-03-15', 'alice.cooper@email.com'),
('Bob', 'Dylan', '2006-07-22', 'bob.dylan@email.com'),
('Carol', 'King', '2005-11-08', 'carol.king@email.com'),
('David', 'Bowie', '2006-01-30', 'david.bowie@email.com'),
('Emily', 'Stone', '2005-09-12', 'emily.stone@email.com'),
('Frank', 'Ocean', '2006-04-18', 'frank.ocean@email.com'),
('Grace', 'Kelly', '2005-06-25', 'grace.kelly@email.com'),
('Henry', 'Ford', '2006-08-03', 'henry.ford@email.com'),
('Iris', 'West', '2005-12-19', 'iris.west@email.com'),
('Jack', 'Ryan', '2006-02-14', 'jack.ryan@email.com'),
('Kate', 'Bush', '2005-05-27', 'kate.bush@email.com'),
('Leo', 'Messi', '2006-10-09', 'leo.messi@email.com'),
('Maya', 'Angelou', '2005-04-04', 'maya.angelou@email.com'),
('Noah', 'Webster', '2006-03-21', 'noah.webster@email.com'),
('Olive', 'Garden', '2005-08-16', 'olive.garden@email.com'),
('Peter', 'Parker', '2006-06-11', 'peter.parker@email.com'),
('Quinn', 'Fabray', '2005-10-28', 'quinn.fabray@email.com'),
('Rachel', 'Green', '2006-05-07', 'rachel.green@email.com'),
('Sam', 'Winchester', '2005-07-02', 'sam.winchester@email.com'),
('Tina', 'Turner', '2006-09-13', 'tina.turner@email.com');

-- Insert 20 TAGS
INSERT INTO tblTAG (TagName, TagDescr) VALUES
('Beginner', 'Entry level content'),
('Intermediate', 'Medium difficulty content'),
('Advanced', 'Expert level content'),
('Quick Review', 'Short review sessions'),
('Comprehensive', 'In-depth coverage'),
('Exam Prep', 'Preparation for examinations'),
('Practice', 'Exercise and practice material'),
('Theory', 'Theoretical concepts'),
('Practical', 'Hands-on applications'),
('Visual', 'Image-heavy content'),
('Audio', 'Sound-based learning'),
('Interactive', 'Engaging activities'),
('Daily', 'Daily practice material'),
('Weekly', 'Weekly review content'),
('Monthly', 'Monthly assessment'),
('Core', 'Essential concepts'),
('Supplementary', 'Additional material'),
('Challenge', 'Difficult problems'),
('Fun', 'Entertaining content'),
('Critical', 'Must-know information');

-- Insert 20 DECKS using subqueries
INSERT INTO tblDECK (SubjectID, OwnerID, DeckName, DeckDescr)
VALUES
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Mathematics'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'John' AND OwnerLname = 'Smith'),
    'Algebra Basics',
    'Fundamental algebra concepts'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Physics'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Emma' AND OwnerLname = 'Johnson'),
    'Classical Mechanics',
    'Newton laws and motion'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Chemistry'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Michael' AND OwnerLname = 'Williams'),
    'Organic Chemistry',
    'Carbon compounds and reactions'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Biology'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Sophia' AND OwnerLname = 'Brown'),
    'Cell Biology',
    'Structure and function of cells'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'History'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'James' AND OwnerLname = 'Jones'),
    'World War II',
    'Key events of WWII'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Geography'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Olivia' AND OwnerLname = 'Garcia'),
    'World Capitals',
    'Capital cities around the world'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Literature'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'William' AND OwnerLname = 'Martinez'),
    'Shakespeare Plays',
    'Works of William Shakespeare'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Computer Science'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Ava' AND OwnerLname = 'Rodriguez'),
    'Python Programming',
    'Basics of Python language'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Psychology'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Alexander' AND OwnerLname = 'Wilson'),
    'Cognitive Psychology',
    'Mental processes and cognition'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Economics'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Isabella' AND OwnerLname = 'Anderson'),
    'Microeconomics',
    'Supply, demand, and markets'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Philosophy'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Daniel' AND OwnerLname = 'Thomas'),
    'Ethics',
    'Moral philosophy concepts'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Art'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Mia' AND OwnerLname = 'Taylor'),
    'Renaissance Art',
    'Art from 14th-17th century'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Music'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Matthew' AND OwnerLname = 'Moore'),
    'Music Theory',
    'Notes, scales, and harmony'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Engineering'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Charlotte' AND OwnerLname = 'Jackson'),
    'Civil Engineering',
    'Infrastructure and construction'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Medicine'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'David' AND OwnerLname = 'Martin'),
    'Human Anatomy',
    'Body systems and organs'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Law'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Amelia' AND OwnerLname = 'Lee'),
    'Constitutional Law',
    'Principles of constitution'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Sociology'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Joseph' AND OwnerLname = 'Perez'),
    'Social Structures',
    'Society organization'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Astronomy'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Harper' AND OwnerLname = 'White'),
    'Solar System',
    'Planets and celestial bodies'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Linguistics'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Andrew' AND OwnerLname = 'Harris'),
    'Grammar Rules',
    'Syntax and language structure'
),
(
    (SELECT SubjectID FROM tblSUBJECT WHERE SubjectName = 'Political Science'),
    (SELECT OwnerID FROM tblOWNER WHERE OwnerFname = 'Evelyn' AND OwnerLname = 'Clark'),
    'Political Systems',
    'Forms of government'
);

-- Insert 20 DECK_TAGS using subqueries
INSERT INTO tblDECK_TAG (DeckID, TagID)
VALUES
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Algebra Basics'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Beginner')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Classical Mechanics'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Intermediate')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Organic Chemistry'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Advanced')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Cell Biology'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Beginner')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'World War II'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Quick Review')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'World Capitals'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Comprehensive')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Shakespeare Plays'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Exam Prep')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Python Programming'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Practice')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Cognitive Psychology'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Theory')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Microeconomics'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Practical')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Ethics'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Visual')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Renaissance Art'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Audio')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Music Theory'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Interactive')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Civil Engineering'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Daily')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Human Anatomy'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Weekly')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Constitutional Law'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Core')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Social Structures'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Supplementary')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Solar System'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Challenge')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Grammar Rules'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Fun')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Political Systems'),
    (SELECT TagID FROM tblTAG WHERE TagName = 'Critical')
);

-- Insert 20 CARDS using subqueries
INSERT INTO tblCARD (DeckID, CardName, CardDescr)
VALUES
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Algebra Basics'),
    'Linear Equations',
    'Solving equations with one variable'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Classical Mechanics'),
    'Newton First Law',
    'Law of inertia'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Organic Chemistry'),
    'Alkanes',
    'Saturated hydrocarbons'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Cell Biology'),
    'Mitochondria',
    'Powerhouse of the cell'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'World War II'),
    'D-Day',
    'Normandy invasion 1944'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'World Capitals'),
    'Paris',
    'Capital of France'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Shakespeare Plays'),
    'Hamlet',
    'Tragedy by Shakespeare'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Python Programming'),
    'For Loop',
    'Iteration structure in Python'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Cognitive Psychology'),
    'Memory',
    'Storage and retrieval of information'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Microeconomics'),
    'Elasticity',
    'Price responsiveness'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Ethics'),
    'Utilitarianism',
    'Greatest happiness principle'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Renaissance Art'),
    'Mona Lisa',
    'Painting by Leonardo da Vinci'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Music Theory'),
    'Major Scale',
    'Seven-note musical scale'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Civil Engineering'),
    'Bridge Design',
    'Structural engineering principles'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Human Anatomy'),
    'Cardiovascular System',
    'Heart and blood vessels'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Constitutional Law'),
    'Separation of Powers',
    'Division of government branches'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Social Structures'),
    'Social Class',
    'Hierarchical distinctions'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Solar System'),
    'Jupiter',
    'Largest planet in solar system'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Grammar Rules'),
    'Subject-Verb Agreement',
    'Grammar rule for sentence structure'
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Political Systems'),
    'Democracy',
    'Government by the people'
);

-- Insert 20 SIDES
INSERT INTO tblSIDE (SideName, SideDescr) VALUES
('Front', 'Question or prompt side'),
('Back', 'Answer or response side'),
('Side1', 'First side of card'),
('Side2', 'Second side of card'),
('Q', 'Question side'),
('A', 'Answer side'),
('Top', 'Top side of card'),
('Bot', 'Bottom side of card'),
('Left', 'Left side of card'),
('Right', 'Right side of card'),
('F', 'Front face'),
('B', 'Back face'),
('P1', 'Page one'),
('P2', 'Page two'),
('Start', 'Starting side'),
('End', 'Ending side'),
('In', 'Input side'),
('Out', 'Output side'),
('Ques', 'Question side'),
('Ans', 'Answer side');

-- Insert 20 MEDIA types
INSERT INTO tblMEDIA (MediaName, MediaDescr) VALUES
('Text', 'Plain text content'),
('Image', 'Picture or graphic'),
('Audio', 'Sound recording'),
('Video', 'Moving visual content'),
('Diagram', 'Visual representation'),
('Chart', 'Data visualization'),
('Graph', 'Mathematical plot'),
('Formula', 'Mathematical expression'),
('Code', 'Programming code snippet'),
('Table', 'Tabular data'),
('Map', 'Geographic representation'),
('Timeline', 'Chronological representation'),
('Infographic', 'Information graphic'),
('Equation', 'Mathematical equation'),
('Symbol', 'Special character or icon'),
('Animation', 'Animated content'),
('Illustration', 'Hand-drawn image'),
('Photo', 'Photograph'),
('Screenshot', 'Screen capture'),
('Sketch', 'Quick drawing');

-- Insert 20 MEDIA_CARD relationships using subqueries
INSERT INTO tblMEDIA_CARD (MediaID, CardID, SideID, Words)
VALUES
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Text'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Linear Equations'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Front'),
    'What is the solution to 2x + 5 = 15?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Image'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Newton First Law'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Front'),
    'State Newton First Law of Motion'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Audio'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Alkanes'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Front'),
    'What are alkanes?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Video'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Mitochondria'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Front'),
    'What is the function of mitochondria?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Diagram'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'D-Day'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Front'),
    'When did D-Day occur?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Chart'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Paris'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Front'),
    'What is the capital of France?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Graph'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Hamlet'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Front'),
    'Who wrote Hamlet?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Formula'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'For Loop'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Front'),
    'How do you write a for loop in Python?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Code'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Memory'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Front'),
    'Define memory in psychology'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Table'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Elasticity'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Front'),
    'What is price elasticity?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Text'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Utilitarianism'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Back'),
    'Explain utilitarianism'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Image'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Mona Lisa'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Back'),
    'Who painted the Mona Lisa?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Audio'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Major Scale'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Back'),
    'What notes are in C major scale?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Video'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Bridge Design'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Back'),
    'What are key bridge design principles?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Diagram'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Cardiovascular System'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Back'),
    'Describe the cardiovascular system'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Chart'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Separation of Powers'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Back'),
    'Explain separation of powers'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Graph'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Social Class'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Back'),
    'What is social class?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Formula'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Jupiter'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Back'),
    'What makes Jupiter unique?'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Code'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Subject-Verb Agreement'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Back'),
    'Explain subject-verb agreement'
),
(
    (SELECT MediaID FROM tblMEDIA WHERE MediaName = 'Table'),
    (SELECT CardID FROM tblCARD WHERE CardName = 'Democracy'),
    (SELECT SideID FROM tblSIDE WHERE SideName = 'Back'),
    'Define democracy'
);

-- Insert 20 ASSIGNMENTS using subqueries
INSERT INTO tblASSIGNMENT (DeckID, StudentID)
VALUES
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Algebra Basics'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Alice' AND StudentLname = 'Cooper')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Classical Mechanics'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Bob' AND StudentLname = 'Dylan')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Organic Chemistry'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Carol' AND StudentLname = 'King')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Cell Biology'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'David' AND StudentLname = 'Bowie')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'World War II'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Emily' AND StudentLname = 'Stone')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'World Capitals'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Frank' AND StudentLname = 'Ocean')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Shakespeare Plays'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Grace' AND StudentLname = 'Kelly')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Python Programming'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Henry' AND StudentLname = 'Ford')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Cognitive Psychology'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Iris' AND StudentLname = 'West')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Microeconomics'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Jack' AND StudentLname = 'Ryan')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Ethics'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Kate' AND StudentLname = 'Bush')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Renaissance Art'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Leo' AND StudentLname = 'Messi')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Music Theory'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Maya' AND StudentLname = 'Angelou')
),
(
    (SELECT DeckID FROM tblDECK WHERE DeckName = 'Civil Engineering'),
    (SELECT StudentID FROM tblSTUDENT WHERE StudentFname = 'Noah' AND StudentLname