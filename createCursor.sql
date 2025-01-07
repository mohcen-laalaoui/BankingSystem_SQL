DELIMITER $$

CREATE PROCEDURE ProcessTransactions()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE tAccountID INT;
    DECLARE tTransactionType ENUM('DEPOSIT', 'WITHDRAWAL');
    DECLARE tAmount DECIMAL(10, 2);
    
    DECLARE transaction_cursor CURSOR FOR 
        SELECT AccountID, TransactionType, Amount 
        FROM Transactions;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN transaction_cursor;

    transaction_loop: LOOP
        FETCH transaction_cursor INTO tAccountID, tTransactionType, tAmount;

        IF done THEN 
            LEAVE transaction_loop;
        END IF;

        IF tTransactionType = 'DEPOSIT' THEN
            UPDATE Accounts 
            SET Balance = Balance + tAmount 
            WHERE AccountID = tAccountID;
        ELSEIF tTransactionType = 'WITHDRAWAL' THEN
            UPDATE Accounts 
            SET Balance = Balance - tAmount 
            WHERE AccountID = tAccountID;
        END IF;
    END LOOP;

    CLOSE transaction_cursor;
END$$

DELIMITER ;
