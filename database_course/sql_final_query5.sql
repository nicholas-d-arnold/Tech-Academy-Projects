USE db_LibMgmtSys3
GO

CREATE PROCEDURE dbo.uspGetQuery5
AS
BEGIN TRY
/* Query 5 */
SELECT branch_name AS 'Branch', COUNT(branch_name) AS 'Total Book Loaned' FROM tbl_library_branch
	INNER JOIN tbl_book_loans ON tbl_book_loans.book_loan_branch_id = tbl_library_branch.branch_id 
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