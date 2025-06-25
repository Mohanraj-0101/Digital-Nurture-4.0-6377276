CREATE TABLE Customers (
    CustomerID NUMBER,
    Name VARCHAR2(100),
    Age NUMBER,
    Balance NUMBER,
    IsVIP CHAR(1), -- 'Y' or 'N'
    LoanInterestRate NUMBER
);

CREATE TABLE Loans (
    LoanID NUMBER,
    CustomerID NUMBER,
    DueDate DATE
);

INSERT INTO Customers VALUES (1, 'Aarav', 65, 12000, 'N', 10),
 (2, 'Diya', 30, 8000, 'N', 12),
 (3, 'Ravi', 70, 20000, 'N', 9);
COMMIT;

INSERT INTO Loans VALUES (101, 1, SYSDATE + 5);
INSERT INTO Loans VALUES (102, 2, SYSDATE + 40);
INSERT INTO Loans VALUES (103, 3, SYSDATE + 10);
COMMIT;


--Scenario 1

BEGIN
  FOR customer IN (SELECT * FROM Customers) LOOP
    IF customer.Age > 60 THEN
      UPDATE Customers
      SET LoanInterestRate = LoanInterestRate - 1
      WHERE CustomerID = customer.CustomerID;

      DBMS_OUTPUT.PUT_LINE('Discount applied to ' || customer.Name || 
                           ', new interest rate: ' || (customer.LoanInterestRate - 1));
    END IF;
  END LOOP;
  COMMIT;
END;
/


-- Scenario 2

BEGIN
  FOR customer IN (SELECT * FROM Customers) LOOP
    IF customer.Balance > 10000 THEN
      UPDATE Customers
      SET IsVIP = 'Y'
      WHERE CustomerID = customer.CustomerID;

      DBMS_OUTPUT.PUT_LINE(customer.Name || ' promoted to VIP 🚀');
    END IF;
  END LOOP;
  COMMIT;
END;
/


-- Scenario 3

BEGIN
  FOR loan IN (
    SELECT L.LoanID, C.Name, L.DueDate
    FROM Loans L JOIN Customers C ON L.CustomerID = C.CustomerID
    WHERE L.DueDate <= SYSDATE + 30
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || loan.LoanID || ' for ' || loan.Name || 
                         ' is due on ' || TO_CHAR(loan.DueDate, 'DD-MON-YYYY'));
  END LOOP;
END;
/

SELECT * FROM CUSTOMERS