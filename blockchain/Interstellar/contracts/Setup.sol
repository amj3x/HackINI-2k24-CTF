// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

import {SpaceShip} from "./SpaceShip.sol";

contract Setup {
    SpaceShip public immutable TARGET;

    constructor() payable {
        TARGET = new SpaceShip();
        require(msg.value == 1 ether);
    }

    function getTargetAddress() external view returns (address) {
        return address(TARGET);
    }


    function isSolved() public view returns (bool) {
        return TARGET.getDistanceTraveled() == 0;
    }
}