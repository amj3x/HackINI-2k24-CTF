// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract EtherVault {
    // I secured my vault with a super secure password, and I made it "private" so no one can access it.
    bytes16 private password;
    address public owner;

    constructor(bytes16 _password) payable {
        password =_password;
        owner = msg.sender;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance / 10**18;
    }

    // In case I decided to migrate to another account
    function changeAccount(address _newAccount, bytes16 _password) external {
        require(_password == password, "Authentication failed.");
        owner = _newAccount;
    }

    function safeWithdraw(bytes16 _password, uint256 value) external {
        require(msg.sender == owner, "AAAAAAHH YA SERA9");
        require(_password == password, "Authentication failed.");
        payable(msg.sender).transfer(value * 10**18);
    }

} 