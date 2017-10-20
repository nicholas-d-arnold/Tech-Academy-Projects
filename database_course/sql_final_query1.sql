USE db_LibMgmtSys3
GO

CREATE PROCEDURE dbo.uspGetQuery1
AS
BEGIN TRY
	/* Query 1 */
SELECT branch_name AS 'Branch:', book_title AS 'Title:', book_copies_no_of_copies AS 'Copies:'  FROM tbl_book_copies
	INNER JOIN tbl_library_branch branch ON branch.branch_id = tbl_book_copies.book_copies_branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copies.book_copies_book_id 
WHERE
	branch_name = 'Sharpstown'
	AND
	book_title = 'The Lost Tribe'
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