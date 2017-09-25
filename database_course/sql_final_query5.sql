USE db_LibMgmtSys3
GO

CREATE PROCEDURE dbo.uspGetQuery5
AS
BEGIN TRY
/* Query 5 */
SELECT branch_name AS 'Branch', SUM(book_copies_no_of_copies) AS 'Number of Loaned Books'  FROM tbl_book_copies
	INNER JOIN tbl_library_branch branch ON branch.branch_id = tbl_book_copies.book_copies_branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copies.book_copies_book_id 
GROUP BY 
	branch_name
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