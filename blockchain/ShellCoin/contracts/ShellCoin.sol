// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "./ERC20.sol";

contract ShellCoin is ERC20 {


    address public willExecutor;
    uint public grandpaPassingTime;

    constructor(address _willExecutor) ERC20('shellCoin', '0x0') {
        grandpaPassingTime = block.timestamp;
        willExecutor = _willExecutor;
        totalSupply = 133713371333337;
        _mint(willExecutor, totalSupply);
    }

    

    function transfer(address _to, uint256 _amount) override public onlyExecutor itsTherightTime returns (bool) {
        return super.transfer(_to, _amount);
    }


    function _checkTime() internal view {
        require(block.timestamp > grandpaPassingTime + 30 * 365 days, "It's not the right time yet grandson.");
    }

    function _checkExecutor() internal view {
        require(willExecutor == msg.sender, "You're not the will executor you thief !");
    }



    modifier onlyExecutor() {
        _checkExecutor();
        _;
    }

    modifier itsTherightTime() {
        _checkTime();
        _;
    }
}
