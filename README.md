# BankingSystem_SQL

A simple SQL-based project to simulate basic banking operations. This project demonstrates how to use **cursors**, **triggers**, and **stored procedures** in SQL for managing accounts and tracking transactions.

---

## Features

1. **Accounts Management**: 
   - Stores customer account details with unique IDs, account holder names, and balances.

2. **Transactions Management**:
   - Logs transactions automatically (deposits and withdrawals).

3. **Stored Procedure**:
   - Processes transactions in bulk using a cursor to update account balances.

4. **Triggers**:
   - Automatically logs transaction details in the `Transactions` table when account balances are updated.

---

## Schema Details

### Tables

#### `Accounts`
- **AccountID**: Unique identifier for each account.
- **AccountHolderName**: Name of the account holder.
- **Balance**: Current balance of the account.
- **CreatedAt**: Timestamp when the account was created.

#### `Transactions`
- **TransactionID**: Unique identifier for each transaction.
- **AccountID**: Reference to the related account.
- **TransactionType**: Type of transaction (`DEPOSIT` or `WITHDRAWAL`).
- **Amount**: Amount involved in the transaction.
- **TransactionDate**: Timestamp when the transaction occurred.

---

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/mohcen-laalaoui/BankingSystem_SQL.git
   cd BankingSystem_SQL
