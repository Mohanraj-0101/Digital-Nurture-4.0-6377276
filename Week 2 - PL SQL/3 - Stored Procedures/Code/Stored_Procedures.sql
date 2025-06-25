CREATE TABLE Accounts (
  AccountID NUMBER PRIMARY KEY,
  CustomerID NUMBER,
  Balance NUMBER,
  AccountType VARCHAR2(20) 
);

CREATE TABLE Employees (
  EmpID NUMBER,
  Name VARCHAR2(100),
  Department VARCHAR2(50),
  Salary NUMBER
);

-- Accounts
INSERT INTO Accounts VALUES (101, 1, 10000, 'Savings'),
 (102, 2, 5000, 'Savings'),
 (103, 3, 8000, 'Checking');
COMMIT;

-- Employees
INSERT INTO Employees VALUES (1, 'Arjun', 'IT', 50000),
 (2, 'Diya', 'HR', 45000),
 (3, 'Karthik', 'IT', 52000);
COMMIT;

--Scenario 1

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  FOR acc IN (SELECT * FROM Accounts WHERE AccountType = 'Savings') LOOP
    UPDATE Accounts
    SET Balance = Balance + (acc.Balance * 0.01)
    WHERE AccountID = acc.AccountID;

    DBMS_OUTPUT.PUT_LINE('Interest added to Account ' || acc.AccountID);
  END LOOP;
  COMMIT;
END;
/

BEGIN
  ProcessMonthlyInterest;
END;
/

--Scenario 2

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
  deptName IN VARCHAR2,
  bonusPercent IN NUMBER
) IS
BEGIN
  FOR emp IN (SELECT * FROM Employees WHERE Department = deptName) LOOP
    UPDATE Employees
    SET Salary = Salary + (emp.Salary * bonusPercent / 100)
    WHERE EmpID = emp.EmpID;

    DBMS_OUTPUT.PUT_LINE('Bonus applied to ' || emp.Name);
  END LOOP;
  COMMIT;
END;
/

BEGIN
  UpdateEmployeeBonus('IT', 10); 
END;
/


--Scenario 3

CREATE OR REPLACE PROCEDURE TransferFunds(
  fromAccountID IN NUMBER,
  toAccountID IN NUMBER,
  amount IN NUMBER
) IS
  fromBalance NUMBER;
BEGIN
  -- Use SELECT INTO safely assuming AccountID is unique
  SELECT Balance INTO fromBalance 
  FROM Accounts 
  WHERE AccountID = fromAccountID;

  IF fromBalance >= amount THEN
    UPDATE Accounts
    SET Balance = Balance - amount
    WHERE AccountID = fromAccountID;

    UPDATE Accounts
    SET Balance = Balance + amount
    WHERE AccountID = toAccountID;

    DBMS_OUTPUT.PUT_LINE(' Transferred ' || amount || ' from Account ' ||
                         fromAccountID || ' to Account ' || toAccountID);
    COMMIT;
  ELSE
    DBMS_OUTPUT.PUT_LINE(' Insufficient funds in Account ' || fromAccountID);
  END IF;

EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE(' Error: More than one account found for AccountID ' || fromAccountID);
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE(' Error: No account found for AccountID ' || fromAccountID);
END;
/


BEGIN
  TransferFunds(101, 102, 500); 
END;
/


SELECT * FROM ACCOUNTS;
SELECT * FROM EMPLOYEES;