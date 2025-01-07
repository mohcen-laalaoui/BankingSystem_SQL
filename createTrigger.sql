DELIMITER $$

CREATE TRIGGER AfterAccountUpdate
AFTER UPDATE ON Accounts
FOR EACH ROW
BEGIN
    DECLARE transactionType ENUM('DEPOSIT', 'WITHDRAWAL');
    DECLARE transactionAmount DECIMAL(10, 2);

    IF NEW.Balance > OLD.Balance THEN
        SET transactionType = 'DEPOSIT';
        SET transactionAmount = NEW.Balance - OLD.Balance;
    ELSE
        SET transactionType = 'WITHDRAWAL';
        SET transactionAmount = OLD.Balance - NEW.Balance;
    END IF;

    INSERT INTO Transactions (AccountID, TransactionType, Amount)
    VALUES (NEW.AccountID, transactionType, transactionAmount);
END$$

DELIMITER ;
