// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
* @title Self Destruct contract.
* @author Anthony (fps) https://github.com/fps8k.
* @dev  Step 1: Deploy contract with some ether.
*       Step 2: Call the killAndSendToWallet function.
*       Step 3: Send some ether.
*       Step 4: Kiss your ether goodbye.
*/

contract Selfdestruct {
    address payable immutable public  owner;
    uint256 public bal;

    constructor() payable {
        owner = payable(msg.sender);
        bal += msg.value;
    }

    receive() external payable {
        bal += msg.value;
    }

    function killAndSendToWallet() public {
        require(msg.sender == owner, "!Owner.");
        selfdestruct(owner);
    }

    function sendEther() public payable {}
}
