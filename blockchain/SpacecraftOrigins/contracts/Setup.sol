// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {AstroManager} from "./AstroManager.sol";

contract Setup {
    AstroManager public immutable TARGET;
   
    constructor() payable {
        TARGET = new AstroManager();
    }

    function getTargetAddress() external view returns (address) {
        return address(TARGET);
    }


    function isSolved() public view returns (bool) {
        return TARGET.resourcesAllocated() == true;
    }

}