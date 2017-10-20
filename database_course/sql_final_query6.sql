USE db_LibMgmtSys3
GO

CREATE PROCEDURE dbo.uspGetQuery6
AS
BEGIN TRY
/* Query 6 */
SELECT borrower_name,borrower_address, COUNT(tbl_book_loans.book_loan_card_no) AS 'Num Books' FROM tbl_borrower
	INNER JOIN tbl_book_loans ON tbl_book_loans.book_loan_card_no = tbl_borrower.borrower_card_no
GROUP BY 
	borrower_name, borrower_address 
HAVING COUNT(tbl_book_loans.book_loan_card_no) > 5
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