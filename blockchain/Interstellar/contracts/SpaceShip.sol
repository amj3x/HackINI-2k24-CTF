// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.0;

contract SpaceShip {
    uint32 public distanceFromTheBlackHole;
    uint32 private distanceTraveled;
    address public controlSystem;

    constructor() {
        distanceTraveled = 1337;
        distanceFromTheBlackHole = 4294967295;
        controlSystem = msg.sender;
    }

    function galacticBoost(uint32 advanceWithDistance) public onlyControlSystem {
        // Avoid the space ship from falling into the black hole
        require(distanceTraveled + advanceWithDistance < distanceFromTheBlackHole);
        distanceTraveled += advanceWithDistance;
    }

    
    function getDistanceTraveled() public view returns (uint256) {
        return distanceTraveled;
    }

    modifier onlyControlSystem() {
            require(tx.origin == controlSystem, "Only the Ground Control System can perform this action.");
            _;
    }
}

