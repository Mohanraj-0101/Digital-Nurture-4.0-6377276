-- Scenario - 1

SET SERVEROUTPUT ON;

BEGIN
  FOR cust IN (SELECT CustomerID, DOB FROM Customers) LOOP
    IF MONTHS_BETWEEN(SYSDATE, cust.DOB) / 12 > 60 THEN
      UPDATE Loans
      SET InterestRate = InterestRate - 1
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE(
        'Senior detected → CustomerID: ' || cust.CustomerID || 
        ' → Applied 1% interest discount on loans.'
      );
    ELSE
      DBMS_OUTPUT.PUT_LINE(
        'CustomerID: ' || cust.CustomerID || 
        ' is not above 60. No discount applied.'
      );
    END IF;
  END LOOP;

  COMMIT;
END;
/


-- Scenario - 2

ALTER TABLE Customers ADD IsVIP CHAR(1);  -- 'Y' = Yes

SET SERVEROUTPUT ON;

BEGIN
  FOR cust IN (SELECT CustomerID, Balance FROM Customers) LOOP
    IF cust.Balance > 10000 THEN
      UPDATE Customers
      SET IsVIP = 'Y'
      WHERE CustomerID = cust.CustomerID;

      DBMS_OUTPUT.PUT_LINE(
        ' VIP Status Granted → CustomerID: ' || cust.CustomerID || 
        ' → Balance: $' || cust.Balance
      );
    ELSE
      DBMS_OUTPUT.PUT_LINE(
        ' Not Eligible for VIP → CustomerID: ' || cust.CustomerID || 
        ' → Balance: $' || cust.Balance
      );
    END IF;
  END LOOP;

  COMMIT;
END;
/

-- Scenario - 3

SET SERVEROUTPUT ON;

DECLARE
  loan_found BOOLEAN := FALSE;
BEGIN
  FOR loan_rec IN (
    SELECT LoanID, CustomerID, EndDate
    FROM Loans
    WHERE EndDate BETWEEN SYSDATE AND SYSDATE + 30
  ) LOOP
    loan_found := TRUE;

    DECLARE
      cust_name VARCHAR2(100);
    BEGIN
      SELECT Name INTO cust_name
      FROM Customers
      WHERE CustomerID = loan_rec.CustomerID;

      DBMS_OUTPUT.PUT_LINE(
        ' Reminder: Loan ID ' || loan_rec.LoanID ||
        ' for customer "' || cust_name ||
        '" is due on ' || TO_CHAR(loan_rec.EndDate, 'DD-MON-YYYY')
      );
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(' Loan found but customer not found → LoanID: ' || loan_rec.LoanID);
    END;
  END LOOP;

  IF NOT loan_found THEN
    DBMS_OUTPUT.PUT_LINE(' No loans are due within the next 30 days.');
  END IF;
END;
/