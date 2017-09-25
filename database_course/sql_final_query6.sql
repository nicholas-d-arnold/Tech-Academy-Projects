USE db_LibMgmtSys3
GO

CREATE PROCEDURE dbo.uspGetQuery6
AS
BEGIN TRY
/* Query 6 */
SELECT DISTINCT(borrower_name) AS 'Borrower', book_copies_no_of_copies As 'Copies Out', borrower_address AS 'Address' FROM tbl_borrower
	INNER JOIN tbl_book_loans ON tbl_book_loans.book_loan_card_no = tbl_borrower.borrower_card_no
	INNER JOIN tbl_book_copies ON tbl_book_copies.book_copies_book_id = tbl_book_loans.book_loan_book_id
WHERE
	book_copies_no_of_copies > 5
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