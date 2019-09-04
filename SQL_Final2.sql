USE [SQL_Final 2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


	CREATE TABLE Library_Branch (
		BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		BranchName VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL
	);


	CREATE TABLE Publisher (
		PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(20) NOT NULL

	);


	CREATE TABLE Books (
		BookID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		Title VARCHAR(100) NOT NULL
		PublisherName VARCHAR(50) FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
	);

		CREATE TABLE Book_Authors (
		BookID INT FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		AuthorName VARCHAR(50) NOT NULL
	
	);

	CREATE TABLE Borrower (
		CardNo INT PRIMARY KEY NOT NULL,
		Name VARCHAR(50) NOT NULL,
		Address VARCHAR(50) NOT NULL,
		Phone VARCHAR(30) NOT NULL
	);
	

	CREATE TABLE Book_Copies (
		BookID INT FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		Number_Of_Copies INT NOT NULL
	);


	CREATE TABLE Book_Loans (
		BookID INT FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		BranchID INT NOT NULL FOREIGN KEY REFERENCES Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		CardNo INT FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		DateOut DATE NOT NULL,
		DateDue DATE NOT NULL

	);

	go
	

	INSERT INTO Library_Branch
	(BranchName, Address)
		VALUES 
		('Sharpstown', '24 Sharp rd' ),
		('Central', '65 Main st'),
		('Portland', '5677 Maple st'),
		('Goffstown', '334 Mast rd')
	;
	SELECT * FROM Library_Branch;
	
	INSERT INTO Books
		(Title, PublisherName)
		VALUES 
		('The Lost Tribe', 'DOW Publishing LLC'),
		('Lord Of the Flies', 'Faber and Faber'),
		('First Blood', 'Rowman & Littlefield'),
		('Patriot Games', 'GP Putnam'),
		('12 Rules For Life', 'Allen Lane'),
		('The Power of Myth', 'Anchor'),
		('To Kill a Mockingbird', 'JB Lippincott'),
		('Lord of the Rings', 'Allen & Unwin'),
		('Moby Dick', 'Harper & Brothers'),
		('The Great Gatspy', 'Charles Scribner & Sons'),
		('The Book Thief', 'Alfred A. Knopf'),
		('The Shining', 'Blackwood'),
		('Lolita', 'Olympia Press'),
		('The Art of War', 'Tuttle'),
		('War and Peace', 'Vintage'),
		('Huckleberry Finn', 'Charles L. Webster'),
		('Carrie', 'Westlake'),
		('Misery', 'Thomas Egerton'),
		('Catch-22', 'Simon & Schuster'),
		('1984', 'Harvill Secker')
	;
	SELECT * FROM Books;



	INSERT INTO Publisher
		(PublisherName, Address, Phone)
		VALUES 
		('DOW Publishing LLC', '23 Oak dr', '2345467878'),
		('Faber and Faber', '456 Gorham Pond rd', '3455657765'),
		('Rowman & Littlefield', '334 Tenny Hill rd', '9987767675'),
		('GP Putnam', '565 Litchfield dr', '7674345650'),
		('Allen Lane', '567 Lebby rd', '3456721234'),
		('Anchor', '343 Clover rd', '2456567787'),
		('JB Lippincott', '456 Davis ave', '5657878564'),
		('Allen & Unwin', '432 Ronin st', '5673435656'),
		('Harper & Brothers', '43 SE 2nd st', '3438758345'),
		('Charles Scribner & Sons', '76 E Brooke dr', '6509887454'),
		('Alfred A. Knopf', '45 Clarence ave', '7658236712'),
		('Blackwood', '99 Waterview rd', '9864563434'),
		('Olympia Press', '345 Chester rd', '6769841243'),
		('Tuttle', '8787 Harcourt dr', '7674597687'),
		('Vintage', '656 Windus rd', '7667349887'),
		('Charles L. Webster', '67 Cape dr', '7648767343'),
		('Westlake', '987 Signet rd', '7664980034'),
		('Thomas Egerton', '90 Kris rd', '5676334598'),
		('Simon & Schuster', '12 Penguin dr', '5654454344'),
		('Harvill Secker', '7789 Berkley st', '8887656676')
	;
	SELECT * FROM Publisher;


	INSERT INTO Book_Authors
		(BookID, AuthorName)
		VALUES 
		('100', 'William Golding'),
		('101', 'Stephen King'),
		('102', 'Melissa Thorman'),
		('103', 'Ngan Devore'),
		('104', 'Selena Madson'),
		('105', 'Darius Saffer'),
		('106', 'Sam Eason'),
		('107', 'Kelvin Goucher'),
		('108', 'Jeremy Dority'),
		('109', 'Glenn Kennelly')
	;
	SELECT * FROM Book_Authors;


	INSERT INTO Book_Copies
		(BookID, BranchID, Number_Of_Copies)
		VALUES 
		(100, 1, 3),
		(100, 2, 1),
		(100, 3, 1),
		(100, 4, 2),
		(101, 1, 2),
		(101, 2, 4),
		(101, 3, 3),
		(101, 4, 3),
		(102, 1, 6),
		(102, 2, 3),
		(102, 3, 3),
		(102, 4, 3),
		(103, 1, 3),
		(103, 2, 3),
		(103, 3, 5),
		(103, 4, 2),
		(104, 1, 3),
		(104, 2, 2),
		(104, 3, 2),
		(104, 4, 5),
		(105, 1, 3),
		(105, 2, 2),
		(105, 3, 2),
		(105, 4, 2),
		(106, 1, 2),
		(106, 2, 2),
		(106, 3, 3),
		(106, 4, 2),
		(107, 1, 2),
		(107, 2, 4),
		(107, 3, 2),
		(107, 4, 3),
		(108, 1, 2),
		(108, 2, 3),
		(108, 3, 7),
		(108, 4, 3),
		(109, 1, 4),
		(109, 2, 5),
		(109, 3, 3),
		(109, 4, 7),
		(110, 1, 3),
		(110, 2, 3),
		(110, 3, 5),
		(110, 4, 3),
		(111, 1, 6),
		(111, 2, 6),
		(111, 3, 4),
		(111, 4, 6),
		(112, 1, 4),
		(112, 2, 5),
		(112, 3, 4),
		(112, 4, 6),
		(113, 1, 5),
		(113, 2, 4),
		(113, 3, 4),
		(113, 4, 7),
		(114, 1, 8),
		(114, 2, 3),
		(114, 3, 4),
		(114, 4, 6),
		(115, 1, 4),
		(115, 2, 6),
		(115, 3, 5),
		(103, 1, 3)
		;
	SELECT * FROM Book_Copies;

	
	INSERT INTO Book_Loans
		(BookID, BranchID, CardNo, DateOut, DateDue)
		VALUES 
		(102, 2, 007, '2019-09-23', '2019-09-28'),
		(114, 1, 002, '2019-09-05', '2019-09-10'),
		(104, 4, 001, '2019-09-11', '2019-09-16'),
		(119, 2, 002, '2019-09-12', '2019-09-18'),
		(118, 1, 007, '2019-09-14', '2019-09-20'),
		(105, 4, 005, '2019-09-10', '2019-09-15'),
		(109, 2, 007, '2019-09-03', '2019-09-08'),
		(103, 3, 002, '2019-09-04', '2019-09-09'),
		(116, 1, 001, '2019-09-04', '2019-09-09'),
		(114, 2, 002, '2019-09-07', '2019-09-12'),
		(112, 2, 005, '2019-09-08', '2019-09-13'),
		(111, 4, 008, '2019-09-01', '2019-09-06'),		
		(108, 1, 007, '2019-09-04', '2019-09-10'),
		(104, 2, 002, '2019-09-06', '2019-09-11'),
	    (106, 3, 001, '2019-09-03', '2019-09-13'),
		(107, 3, 003, '2019-09-04', '2019-09-12'),
		(100, 1, 007, '2019-09-22', '2019-09-27'),
		(114, 4, 008, '2019-09-03', '2019-09-08'),
		(114, 3, 004, '2019-09-02', '2019-09-07'),
		(113, 2, 002, '2019-09-11', '2019-09-16'),
		(112, 3, 004, '2019-09-03', '2019-09-08'),
		(105, 4, 002, '2019-09-21', '2019-09-27'),
		(104, 2, 003, '2019-09-21', '2019-09-26'),
		(107, 1, 002, '2019-09-23', '2019-09-28'),
		(104, 4, 007, '2019-09-17', '2019-09-22'),
		(108, 3, 004, '2019-09-19', '2019-09-25'),
		(119, 1, 008, '2019-09-11', '2019-09-16'),
		(103 ,3, 003, '2019-09-18', '2019-09-23'),
		(105, 2, 002, '2019-09-23', '2019-09-28'),
		(116, 1, 008, '2019-09-19', '2019-09-24'),
		(111, 4, 003, '2019-09-03', '2019-09-08'),
		(115, 2, 002, '2019-09-03', '2019-09-08'),
		(114, 1, 006, '2019-09-07', '2019-09-12'),
		(119, 4, 003, '2019-09-12', '2019-09-17'),
		(118, 2, 001, '2019-09-13', '2019-09-18'),
		(106, 1, 002, '2019-09-12', '2019-09-17'),
		(102, 3, 007, '2019-09-20', '2019-09-24'),
		(108, 2, 006, '2019-09-14', '2019-09-19'),
		(114, 3, 007, '2019-09-12', '2019-09-18'),
		(119, 1, 004, '2019-09-12', '2019-09-18')
	

;
	SELECT * FROM Book_Loans;



	INSERT INTO Borrower
		(Cardno, Name, Address, Phone)
		VALUES 
		('001', 'David Chase', '23 Lawson rd', '384-576-2899'),
		('002', 'Lawrence Fischer', '565 Hawthorn rd', '384-784-4856'),
		('003', 'James Holden', '34 Willow rd', '385-475-3944'),
		('004', 'Richard Byeson', '56 Southwest dr', '384-485-4855'),
		('005', 'Susan Fritz', '8876 Raymond ave', '768-288-3749'),
		('006', 'Larry Hopkins', '34 Willow rd', '385-475-3944'),
		('007', 'Tylor Ronson', '47 Woodful dr', '384-485-4855'),
		('008', 'Bob Fiedel', '8876 Raymond ave', '768-288-3749'),
		('009', 'Porter Lawrence', '867 Davis st', '768-675-0967')
	;
	SELECT * FROM Borrower;

/* How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */	
USE [SQL_Final 2]
GO
CREATE PROC usp_getLOSTTRIBESharp
AS
SELECT * FROM Book_Copies
INNER JOIN Books ON Books.BookID = Book_Copies.BookID
INNER JOIN Library_Branch ON Library_Branch.BranchID = Book_Copies.BranchID
WHERE Books.Title = 'The Lost Tribe' AND Library_Branch.BranchName = 'Sharpstown';

GO

/* How many copies of the book titled "The Lost Tribe" are owned by each library branch? */
USE [SQL_Final 2]
GO
CREATE PROC usp_getLOSTTRIBERtotalcopies
AS
SELECT * FROM Book_Copies
INNER JOIN Books ON Books.BookID = Book_Copies.BookID
WHERE Books.Title = 'The Lost Tribe' ORDER BY BranchID;

GO

/*Retrieve the names of all borrowers who do not have any books checked out.*/
USE [SQL_Final 2]
GO
CREATE PROC usp_getCLIENTS0out
AS
SELECT Name FROM Borrower
LEFT JOIN Book_Loans
ON Book_Loans.CardNo = Borrower.CardNo
WHERE Book_Loans.CardNo IS NULL;

GO

/* For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. */
USE [SQL_Final 2]
GO
CREATE PROC usp_getSHARPduetoday
AS
SELECT * FROM Book_Loans
INNER JOIN Books ON Books.BookID = Book_Loans.BookID
WHERE Book_Loans.DateDue = '2019-09-27' ORDER BY CardNo;

GO

/* For each library branch, retrieve the branch name and the total number of books loaned out from that branch. */
USE [SQL_Final 2]
GO
CREATE PROC usp_getTOTALCOPIESout
AS
SELECT Library_Branch.BranchName, COUNT(Book_Loans.BranchID) AS "Books currently loaned out"
FROM Book_Loans LEFT JOIN Library_Branch
ON BOOK_LOANS.BranchID= Library_Branch.BranchID
GROUP BY BranchName;

GO

/* Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.*/
USE [SQL_Final 2]
GO
CREATE PROC usp_getCLIENTS5plus
AS

SELECT Borrower.Name, Address, COUNT(BOOK_LOANS.CardNo) AS "Books currently checked out"
FROM BOOK_LOANS
INNER JOIN BORROWER
ON Book_Loans.CardNo = Borrower.CardNo
GROUP BY Name, Address
HAVING COUNT(Book_Loans.CardNo) >5;

GO

/* For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central". */
USE [SQL_Final 2]
GO
CREATE PROC usp_getSTEPHENKINGcentral
AS

SELECT Books.Title, Book_Copies.Number_Of_Copies FROM Books
INNER JOIN Book_Copies ON Books.BookID = Book_Copies.BookID
INNER JOIN Library_Branch ON Book_Copies.BranchID = Library_Branch.BranchID
INNER JOIN Book_Authors ON Books.BookID = Book_Authors.BookID 
WHERE Library_Branch.BranchName = 'Central' AND AuthorName = 'Stephen King';

GO
/* Garth said #7 is passed  */


EXEC usp_getLOSTTRIBESharp;
EXEC usp_getLOSTTRIBERtotalcopies;
EXEC usp_getCLIENTS0out;
EXEC usp_getSHARPduetoday;
EXEC usp_getTOTALCOPIESout
EXEC usp_getCLIENTS5plus;
EXEC usp_getSTEPHENKINGcentral;


