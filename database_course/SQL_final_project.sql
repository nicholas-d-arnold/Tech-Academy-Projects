CREATE DATABASE db_LibMgmtSys3;
USE db_LibMgmtSys3;

CREATE TABLE tbl_publisher (
	pub_name VARCHAR(100) PRIMARY KEY NOT NULL,
	pub_address VARCHAR(100) NOT NULL,
	pub_phone VARCHAR(30) NOT NULL 
);
CREATE TABLE tbl_borrower (
	borrower_card_no INT PRIMARY KEY NOT NULL IDENTITY(200,1),
	borrower_name VARCHAR(100) NOT NULL,
	borrower_address VARCHAR(100) NOT NULL,
	borrower_phone VARCHAR(30) NOT NULL 
);
CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	branch_name VARCHAR(100) NOT NULL,
	branch_address VARCHAR(100) NOT NULL
);
CREATE TABLE tbl_book (
	book_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	book_title VARCHAR(100) NOT NULL,
	book_publisher_name VARCHAR(100) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(pub_name) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE tbl_book_authors (
	author_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	author_book_id INT NOT NULL CONSTRAINT fk_book_author_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(50) NOT NULL
);
CREATE TABLE tbl_book_loans (
	book_loan_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	book_loan_book_id INT NOT NULL CONSTRAINT fk_book_loan_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loan_branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loan_card_no INT NOT NULL CONSTRAINT fk_card_no FOREIGN KEY REFERENCES tbl_borrower(borrower_card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NOT NULL,
	due_date DATE NOT NULL
);
CREATE TABLE tbl_book_copies (
	book_copies_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	book_copies_book_id INT NOT NULL CONSTRAINT fk_book_copy_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_copies_branch_id INT NOT NULL CONSTRAINT fk_branch_id_2 FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_copies_no_of_copies INT NOT NULL
);

INSERT INTO tbl_publisher 
	(pub_name,pub_address,pub_phone)
	VALUES
	('Scout Books','2130 SE 10th Ave. Portland, OR 97214','503-238-4514'),
	('Inkwater Press','6750 SW Franklin St #A, Portland, OR 97223','503-968-6777'),
	('Oregon State University Press','104 Kerr Admin Bldg #1101, Corvallis, OR 97331','541-737-1000')
;

INSERT INTO tbl_borrower 
	(borrower_name,borrower_address,borrower_phone)
	VALUES
	('John Smith','124 Caulfield Way Corvallis, OR 97331',''),
	('Helen Hunt','4051 SE Gladstone St Portland, OR 97202',''),
	('Bernie Jenny','970 Tall Terrace Independence, OR 97351',''),
	('Jennifer Arnold','670 Cornbread Road Muncie, IN 47304',''),
	('Hans Kellogg','1122 NE Newton Crek Road Roseburg, OR 97470',''),
	('Terrance Witzke',' 2159 Fir Lane Terrace Portland, OR 97216',''),
	('David Bowie','451 Talcott Ave Frostburg, MD 21532',''),
	('Sam Cheesman','1001 University Ave Muncie, IN 47306','')
;

INSERT INTO tbl_library_branch
	(branch_name,branch_address)
	VALUES
	('Sharpstown','1254 Sharpstown Rd Sharpstown, MD 21532'),
	('Central', '400 Central Ave Sharpstown, MD 21532'),
	('Bracken', '750 Main St Sharpstown, MD 21532'),
	('University','850 Cornwall St Sharpstown, MD 21532')
;

INSERT INTO tbl_book
	(book_title,book_publisher_name)
	VALUES
	('The Lost Tribe', 'Scout Books'),
	('The Found Tribe', 'Inkwater Press'),
	('Gone With The Wind', 'Oregon State University Press'),
	('A Candle In The Dark', 'Scout Books'),
	('All Dogs Go To Heaven', 'Inkwater Press'),
	('Clean Beauty', 'Inkwater Press'),
	('Animal Tracks', 'Scout Books'),
	('Keshiki Bonsai', 'Oregon State University Press'),
	('The Lost World', 'Oregon State University Press'),
	('Slaughter House Five', 'Scout Books'),
	('Abominable', 'Scout Books'),
	('The Road', 'Scout Books'),
	('Artists Dream', 'Scout Books'),
	('Davie Bowie: A Biography', 'Scout Books'),
	('The History of Fender Guitars', 'Inkwater Press'),
	('The History of Gibson Guitars', 'Oregon State University Press'),
	('60 Hikes within 60 Miles of Portland', 'Scout Books'),
	('Hiking Corvallis', 'Scout Books'),
	('Dogs 101: Australian Shepherds', 'Inkwater Press'),
	('Goop', 'Oregon State University Press')
;

INSERT INTO tbl_book_authors
	(author_book_id, author_name)
	VALUES
	(1,'James Patterson'),
	(2,'Shelley Kirkland'),
	(3,'James Patterson'),
	(4,'Danna Bridges'),
	(5,'Greg Rosenberg'),
	(6,'Michael Christopher'),
	(7,'James Patterson'),
	(8,'David James'),
	(9,'Hank Moody'),
	(10,'Jason Hu'),
	(11,'James Patterson'),
	(12,'Christopher Walken'),
	(13,'Carly Townsend'),
	(14,'James Patterson'),
	(15,'Charles Bradley'),
	(16,'David James'),
	(17,'Michael Christopher'),
	(18,'Hank Moody'),
	(19,'Stephen King'),
	(20,'Charles Bradley')
;

INSERT INTO tbl_book_loans
	(book_loan_book_id,book_loan_branch_id,book_loan_card_no,date_out,due_date)
	VALUES
	(1,1,200,GETDATE(),DATEADD(day, 30, GETDATE())),
	(2,2,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(3,3,202,GETDATE(),DATEADD(day, 30, GETDATE())),
	(4,4,203,GETDATE(),DATEADD(day, 30, GETDATE())),
	(5,1,204,GETDATE(),DATEADD(day, 30, GETDATE())),
	(6,2,205,GETDATE(),DATEADD(day, 30, GETDATE())),
	(7,3,206,GETDATE(),DATEADD(day, 30, GETDATE())),
	(8,4,207,GETDATE(),DATEADD(day, 30, GETDATE())),
	(9,1,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(10,2,202,GETDATE(),DATEADD(day, 30, GETDATE())),
	(11,3,203,GETDATE(),DATEADD(day, 30, GETDATE())),
	(12,4,204,GETDATE(),DATEADD(day, 30, GETDATE())),
	(13,1,205,GETDATE(),DATEADD(day, 30, GETDATE())),
	(14,2,206,GETDATE(),DATEADD(day, 30, GETDATE())),
	(15,3,207,GETDATE(),DATEADD(day, 30, GETDATE())),
	(16,4,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(17,1,202,GETDATE(),DATEADD(day, 30, GETDATE())),
	(18,2,203,GETDATE(),DATEADD(day, 30, GETDATE())),
	(19,3,204,GETDATE(),DATEADD(day, 30, GETDATE())),
	(20,4,205,GETDATE(),DATEADD(day, 30, GETDATE())),
	(1,1,206,GETDATE(),DATEADD(day, 30, GETDATE())),
	(2,2,207,GETDATE(),DATEADD(day, 30, GETDATE())),
	(3,3,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(4,4,202,GETDATE(),DATEADD(day, 30, GETDATE())),
	(5,1,203,GETDATE(),DATEADD(day, 30, GETDATE())),
	(6,2,204,GETDATE(),DATEADD(day, 30, GETDATE())),
	(7,3,205,GETDATE(),DATEADD(day, 30, GETDATE())),
	(8,4,206,GETDATE(),DATEADD(day, 30, GETDATE())),
	(9,1,207,GETDATE(),DATEADD(day, 30, GETDATE())),
	(10,2,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(11,3,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(12,4,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(13,1,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(14,2,207,GETDATE(),DATEADD(day, 30, GETDATE())),
	(15,3,207,GETDATE(),DATEADD(day, 30, GETDATE())),
	(16,4,207,GETDATE(),DATEADD(day, 30, GETDATE())),
	(17,1,200,GETDATE(),DATEADD(day, 30, GETDATE())),
	(18,2,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(19,3,202,GETDATE(),DATEADD(day, 30, GETDATE())),
	(20,4,203,GETDATE(),DATEADD(day, 30, GETDATE())),
	(1,1,204,GETDATE(),DATEADD(day, 30, GETDATE())),
	(2,2,205,GETDATE(),DATEADD(day, 30, GETDATE())),
	(3,3,206,GETDATE(),DATEADD(day, 30, GETDATE())),
	(4,4,207,GETDATE(),DATEADD(day, 30, GETDATE())),
	(5,1,200,GETDATE(),DATEADD(day, 30, GETDATE())),
	(6,2,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(7,3,202,GETDATE(),DATEADD(day, 30, GETDATE())),
	(8,4,203,GETDATE(),DATEADD(day, 30, GETDATE())),
	(9,1,204,GETDATE(),DATEADD(day, 30, GETDATE())),
	(10,2,205,GETDATE(),DATEADD(day, 30, GETDATE())),
	(11,3,206,GETDATE(),DATEADD(day, 30, GETDATE())),
	(12,4,207,GETDATE(),DATEADD(day, 30, GETDATE())),
	(13,1,200,GETDATE(),DATEADD(day, 30, GETDATE())),
	(14,2,201,GETDATE(),DATEADD(day, 30, GETDATE())),
	(15,3,202,GETDATE(),DATEADD(day, 30, GETDATE())),
	(16,4,203,GETDATE(),DATEADD(day, 30, GETDATE())),
	(17,1,204,GETDATE(),DATEADD(day, 30, GETDATE())),
	(18,2,205,GETDATE(),DATEADD(day, 30, GETDATE())),
	(19,3,206,GETDATE(),DATEADD(day, 30, GETDATE())),
	(20,4,207,GETDATE(),DATEADD(day, 30, GETDATE()))
;

INSERT INTO tbl_book_copies
	(book_copies_book_id,book_copies_branch_id,book_copies_no_of_copies)
	VALUES
	(1,1,5),
	(2,2,5),
	(3,3,5),
	(4,4,5),
	(5,1,5),
	(6,2,5),
	(7,3,5),
	(8,4,5),
	(9,1,5),
	(10,2,5),
	(11,3,5),
	(12,4,5),
	(13,1,5),
	(14,2,5),
	(15,3,5),
	(16,4,5),
	(17,1,5),
	(18,2,5),
	(19,3,5),
	(20,4,5),
	(1,2,5),
	(2,1,5),
	(3,4,5),
	(4,3,5),
	(5,2,5),
	(6,1,5),
	(7,4,5),
	(8,3,5),
	(9,2,5),
	(10,1,5),
	(11,4,5),
	(12,3,5),
	(13,2,5),
	(14,1,5),
	(15,4,5),
	(16,3,5),
	(17,2,5),
	(18,1,5),
	(19,4,5),
	(20,3,5),
	(1,4,5),
	(2,3,5),
	(3,2,5),
	(4,1,5),
	(5,4,5),
	(6,3,5),
	(7,2,5),
	(8,1,5),
	(9,4,5),
	(10,3,5),
	(11,2,5),
	(12,1,5),
	(13,4,5),
	(14,3,5),
	(15,2,5),
	(16,1,5),
	(17,4,5),
	(18,3,5),
	(19,2,5),
	(20,1,5)
;
/*
SELECT * FROM tbl_book book
	INNER JOIN tbl_publisher pub ON pub.name = book.publisher_name
	INNER JOIN tbl_book_authors author ON author.book_id = book.book_id
	INNER JOIN tbl_book_loans loans ON loans.book_id = book.book_id
	INNER JOIN tbl_book_copies copies ON copies.book_copy_id = book.book_id
	INNER JOIN tbl_library_branch branch ON branch.branch_id = loans.branch_id
	INNER JOIN tbl_borrower borrower ON borrower.card_no = loans.card_no
	INNER JOIN tbl_library_branch ON branch.branch_id = copies.branch_id
;
*/


/* Begin Stored Procedure Comment

/* STORED PROCEDURES */

/* Query 1 */
SELECT branch_name AS 'Branch:', book_title AS 'Title:', book_copies_no_of_copies AS 'Copies:'  FROM tbl_book_copies
	INNER JOIN tbl_library_branch branch ON branch.branch_id = tbl_book_copies.book_copies_branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copies.book_copies_book_id 
WHERE
	branch_name = 'Sharpstown'
	AND
	book_title = 'The Lost Tribe'
;

/* Query 2 */
SELECT branch_name AS 'Branch:', book_title AS 'Title:', book_copies_no_of_copies AS 'Copies:'  FROM tbl_book_copies
	INNER JOIN tbl_library_branch branch ON branch.branch_id = tbl_book_copies.book_copies_branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copies.book_copies_book_id 
WHERE
	book_title = 'The Lost Tribe'
;

/* Query 3 --note that all borrowers have books checked out*/
SELECT borrower_name AS 'Borrower', book_copies_no_of_copies As 'Copies Out' FROM tbl_borrower
	INNER JOIN tbl_book_loans ON tbl_book_loans.book_loan_card_no = tbl_borrower.borrower_card_no
	INNER JOIN tbl_book_copies ON tbl_book_copies.book_copies_book_id = tbl_book_loans.book_loan_book_id
WHERE
	book_copies_no_of_copies = 0
;

/* Query 4 */
SELECT DISTINCT(book_title) AS 'Book', borrower_name, borrower_address FROM tbl_library_branch
	INNER JOIN tbl_book_copies ON tbl_book_copies.book_copies_branch_id = tbl_library_branch.branch_id 
	INNER JOIN tbl_book_loans ON tbl_book_loans.book_loan_branch_id = tbl_library_branch.branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_loans.book_loan_book_id
	INNER JOIN tbl_borrower ON tbl_borrower.borrower_card_no = tbl_book_loans.book_loan_card_no
WHERE
	branch_name = 'Sharpstown'
	AND
	date_out = CONVERT(date,GETDATE())
;

/* Query 5 */
SELECT branch_name AS 'Branch', SUM(book_copies_no_of_copies) AS 'Number of Loaned Books'  FROM tbl_book_copies
	INNER JOIN tbl_library_branch branch ON branch.branch_id = tbl_book_copies.book_copies_branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copies.book_copies_book_id 
GROUP BY 
	branch_name
;

/* Query 6 */
SELECT DISTINCT(borrower_name) AS 'Borrower', book_copies_no_of_copies As 'Copies Out', borrower_address AS 'Address' FROM tbl_borrower
	INNER JOIN tbl_book_loans ON tbl_book_loans.book_loan_card_no = tbl_borrower.borrower_card_no
	INNER JOIN tbl_book_copies ON tbl_book_copies.book_copies_book_id = tbl_book_loans.book_loan_book_id
WHERE
	book_copies_no_of_copies > 5
;

/* Query 7 */
SELECT DISTINCT(book_title) AS 'Book Title:', book_copies_no_of_copies AS 'Number of Copies' FROM tbl_book
	INNER JOIN tbl_book_authors ON tbl_book_authors.author_book_id = tbl_book.book_id
	INNER JOIN tbl_book_loans ON tbl_book_loans.book_loan_book_id = tbl_book.book_id
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_loans.book_loan_branch_id
	INNER JOIN tbl_book_copies ON tbl_book_copies.book_copies_book_id = tbl_book.book_id
WHERE
	branch_name = 'Central'
	AND
	author_name = 'Stephen King'
;


End Stored Procedure Comment */