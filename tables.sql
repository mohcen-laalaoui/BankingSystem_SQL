CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    AccountHolderName VARCHAR(100) NOT NULL,
    Balance DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT,
    TransactionType ENUM('DEPOSIT', 'WITHDRAWAL') NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Accounts (AccountHolderName, Balance) 
VALUES 
('John Doe', 1000.00),
('Jane Smith', 500.00),
('Alice Johnson', 1500.00);
