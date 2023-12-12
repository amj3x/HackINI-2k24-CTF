// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ContactMe} from "./ContactMe.sol";

contract Setup {
    ContactMe public immutable TARGET;
   
    constructor() payable {
        TARGET = new ContactMe();
        require(msg.value == 1 ether);
    }

    function getTargetAddress() external view returns (address) {
        return address(TARGET);
    }

    function isSolved() public view returns (bool) {
        return TARGET.solved() == true;
    }

}