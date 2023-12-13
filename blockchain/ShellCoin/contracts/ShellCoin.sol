// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "./ERC20.sol";

contract ShellCoin is ERC20 {


    address public willExecutor;
    uint public grandpaPassingTime;
    bool public faucetCalled;
    uint256 INITIAL_SUPPLY;

    constructor(address _willExecutor) ERC20('shellCoin', '0x0') {
        grandpaPassingTime = block.timestamp;
        INITIAL_SUPPLY = 133713371333337;
        faucetCalled = false;
    }

    function faucet() external {
        require(faucetCalled == false);
        _mint(msg.sender, INITIAL_SUPPLY);
        faucetCalled = true;
        willExecutor = msg.sender;
    }

    function transfer(address _to, uint256 _amount) override public itsTherightTime returns (bool) {
        return super.transfer(_to, _amount);
    }


    function _checkExecutor() internal view {
        require(willExecutor == msg.sender, "You're not the will executor you thief !");
    }



    modifier onlyExecutor() {
        _checkExecutor();
        _;
    }

    function _checkTime() internal view {
        require(block.timestamp > grandpaPassingTime + 30 * 365 days, "It's not the right time yet grandson.");
    }


    modifier itsTherightTime() {
        _checkTime();
        _;
    }
}
