USE db_LibMgmtSys3
GO

CREATE PROCEDURE dbo.uspGetQuery7
AS
BEGIN TRY
/* Query 7 */
SELECT DISTINCT(book_title) AS 'Book Title:', book_copies_no_of_copies AS 'Number of Copies' FROM tbl_book
	INNER JOIN tbl_book_authors ON tbl_book_authors.author_book_id = tbl_book.book_id
	INNER JOIN tbl_book_copies ON tbl_book_copies.book_copies_book_id = tbl_book.book_id
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copies.book_copies_branch_id
	
WHERE
	branch_name = 'Central'
	AND
	author_name = 'Stephen King'
;
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS Error_Number,
	ERROR_SEVERITY() AS Error_Severity,
	ERROR_STATE() As Error_State,
	ERROR_PROCEDURE() AS Error_Procedure,
	ERROR_LINE() AS Error_Line,
	ERROR_MESSAGE() AS Error_Message
;
END CATCH
GO