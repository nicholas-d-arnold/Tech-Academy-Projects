USE db_LibMgmtSys3
GO

CREATE PROCEDURE dbo.uspGetQuery4
AS
BEGIN TRY
/* Query 4 */
SELECT DISTINCT(book_title) AS 'Book', borrower_name, borrower_address FROM tbl_library_branch
	INNER JOIN tbl_book_loans ON tbl_book_loans.book_loan_branch_id = tbl_library_branch.branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_loans.book_loan_book_id
	INNER JOIN tbl_borrower ON tbl_borrower.borrower_card_no = tbl_book_loans.book_loan_card_no
WHERE
	branch_name = 'Sharpstown'
	AND
	date_out = CONVERT(date,GETDATE())
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