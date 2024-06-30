// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandlingExample {
    address public owner;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function assertExample(uint256 x) public pure returns (uint256) {
        // assert is used for internal consistency checks that should never fail
        uint256 y = x * 2;
        assert(y >= x); // ensure no overflow
        return y;
    }

    function revertExample(uint256 a, uint256 b) public pure returns (uint256) {
        // revert is used to handle exceptional cases or invalid inputs
        require(b != 0, "Divisor cannot be zero");
        return a / b;
    }

    function onlyOwner() public view {
        require(msg.sender == owner, "Only the contract owner can call this function");
        // additional logic for owner-only functions
    }
}
