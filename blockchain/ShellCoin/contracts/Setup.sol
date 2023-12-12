// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ShellCoin} from "./ShellCoin.sol";

contract Setup {
    ShellCoin public immutable TARGET;
   
    constructor(address _player) payable {
        // Set willExecutor to the player address
        TARGET = new ShellCoin(_player);
        require(msg.value == 1 ether);
    }

    function getTargetAddress() external view returns (address) {
        return address(TARGET);
    }


    function isSolved() public view returns (bool) { 
        // Just a random address to match the narrative
        return TARGET.balanceOf(0xAf57Ac75f227363bB9D4d61872d81DE340BCc395) == 133713371333337;
    }

}