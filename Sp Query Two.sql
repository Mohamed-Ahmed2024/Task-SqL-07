

use MyCompany;

USE MyCompany
GO

CREATE PROCEDURE CheckEmployeesInProjectP2
AS
BEGIN
    DECLARE @EmpCount INT;

 
    SELECT @EmpCount = COUNT(*)
    FROM Works_for
    WHERE Works_for.Pno= 100;

   
    IF @EmpCount >= 3
    BEGIN
        PRINT 'The number of employees in the project p1 is 3 or more';
    END
    ELSE
    BEGIN
        PRINT 'The following employees work for the project p1';

        SELECT E.Fname, E.Lname
        FROM Employee E
        JOIN Works_for W ON E.SSN = W.ESSn
        WHERE W.Pno = 100 ;
    END
END


exec CheckEmployeesInProjectP2





CREATE PROCEDURE ReplaceEmployeeInProject
    @OldEmpNo INT,
    @NewEmpNo INT,
    @ProjectNo VARCHAR(10)
AS
BEGIN
    UPDATE Works_for
    SET ESSn = @NewEmpNo
    WHERE ESSn = @OldEmpNo AND Pno = @ProjectNo;
END


