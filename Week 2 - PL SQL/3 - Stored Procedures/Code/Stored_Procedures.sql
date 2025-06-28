
-- Scenario - 1

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  FOR acc IN (
    SELECT AccountID, Balance 
    FROM Accounts 
    WHERE AccountType = 'Savings'
  ) LOOP
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01),
        LastModified = SYSDATE
    WHERE AccountID = acc.AccountID;

    DBMS_OUTPUT.PUT_LINE(' Interest applied to AccountID ' || acc.AccountID);
  END LOOP;

  COMMIT;
END;
/

SET SERVEROUTPUT ON;
EXEC ProcessMonthlyInterest;


-- Scenario - 2

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  dept_name IN VARCHAR2,
  bonus_percent IN NUMBER
) IS
BEGIN
  FOR emp IN (
    SELECT EmployeeID, Salary 
    FROM Employees 
    WHERE Department = dept_name
  ) LOOP
    UPDATE Employees
    SET Salary = Salary + (Salary * bonus_percent / 100)
    WHERE EmployeeID = emp.EmployeeID;

    DBMS_OUTPUT.PUT_LINE(' Bonus applied to EmployeeID ' || emp.EmployeeID);
  END LOOP;

  COMMIT;
END;
/

SET SERVEROUTPUT ON;
EXEC UpdateEmployeeBonus('IT', 10);


-- Scenario - 3

CREATE OR REPLACE PROCEDURE TransferFunds (
  from_account IN NUMBER,
  to_account IN NUMBER,
  amount IN NUMBER
) IS
  from_balance NUMBER;
BEGIN
  -- Get balance of source account
  SELECT Balance INTO from_balance
  FROM Accounts
  WHERE AccountID = from_account
  FOR UPDATE;

  IF from_balance < amount THEN
    DBMS_OUTPUT.PUT_LINE(' Transfer failed: Insufficient funds in AccountID ' || from_account);
    RETURN;
  END IF;

  -- Deduct from source
  UPDATE Accounts
  SET Balance = Balance - amount,
      LastModified = SYSDATE
  WHERE AccountID = from_account;

  -- Add to target
  UPDATE Accounts
  SET Balance = Balance + amount,
      LastModified = SYSDATE
  WHERE AccountID = to_account;

  DBMS_OUTPUT.PUT_LINE(' Transferred ' || amount || 
                       ' from AccountID ' || from_account || 
                       ' to AccountID ' || to_account);

  COMMIT;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE(' Transfer failed: One or both accounts do not exist.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(' Error occurred: ' || SQLERRM);
END;
/

SET SERVEROUTPUT ON;
EXEC TransferFunds(1, 2, 500);