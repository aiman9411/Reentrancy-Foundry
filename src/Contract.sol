// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract BankApp {

    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external {
        uint256 balance = balances[msg.sender];
        require(balance > 0, "Insufficient balance");
        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Failed to send");
        balances[msg.sender] = 0;
        
    }
}
