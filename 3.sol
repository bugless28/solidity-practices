// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedLoanSystem {
    // BorrowBalances
    // repayment
    // Collateral

    // Mapping to store the user's collateral
    mapping(address => uint256) public collateralBalances;
    mapping(address => uint256) public borrowedBalances;
    mapping(address => uint256) public repaymentDeadlines;

    // Event
    event CollateralDepoisted(address user, uint256 amount);
    event TokensBorrowed(address user, uint256 amount);
    event LoanRepaid(address user, uint256 amount);

    // Functions
    function depoistCollateral(uint256 amount) external {
        require(amount > 0, "Amount be greater than 0");
        require(collateralBalances[msg.sender] + amount >= collateralBalances[msg.sender], "out of limit");
        collateralBalances[msg.sender] += amount;
        emit CollateralDepoisted(msg.sender, amount);
    }

    function Borrowtokens(uint256 amount) external {
        require(amount > 0, "Amount should be greater than 0");
        require(collateralBalances[msg.sender] >= amount, "Insufficient Balance");
        collateralBalances[msg.sender] -= amount;
        borrowedBalances[msg.sender] += amount;
        repaymentDeadlines[msg.sender] = block.timestamp + 90 days;
        emit LoanRepaid(msg.sender, amount);
    }

    function replayloan() external {
        require(borrowedBalances[msg.sender] > 0, "No LOAN");
        require(block.timestamp <= repaymentDeadlines[msg.sender], "YOUR LOAN IS OVER DUE");
        uint256 amounttoRepay = borrowedBalances[msg.sender];
        borrowedBalances[msg.sender] = 0;
        repaymentDeadlines[msg.sender] = 0;
        collateralBalances[msg.sender] = 0;
        emit LoanRepaid(msg.sender, amounttoRepay);
    }


    // Function to Check Balances
    function checkCollateralBalance() external view returns (uint256) {
        return collateralBalances[msg.sender];
    }
    function checkBorrowBalance() external view returns (uint256) {
        return borrowedBalances[msg.sender];
    }
    
}
