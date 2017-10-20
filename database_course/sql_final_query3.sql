USE db_LibMgmtSys3
GO

CREATE PROCEDURE dbo.uspGetQuery3
AS
BEGIN TRY
/* Query 3 --note that all borrowers have books checked out*/
SELECT borrower_name AS 'Borrower', COUNT(borrower_card_no) AS 'Books Checked Out' FROM tbl_borrower
	INNER JOIN tbl_book_loans ON tbl_book_loans.book_loan_card_no = tbl_borrower.borrower_card_no
GROUP BY borrower_name
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