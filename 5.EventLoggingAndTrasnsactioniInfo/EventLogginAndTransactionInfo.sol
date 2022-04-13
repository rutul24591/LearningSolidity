// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Transaction {
    event SenderLogger(address);
    event ValueLogger(uint);

    address private owner;

    modifier isOwner {
        require(owner == msg.sender);
        _;
    }

    modifier validValue {
        assert(msg.value >= 1 ether);
        _;
    }

    constructor() {
        owner = msg.sender;
    }
    // A fallback function can be defined using fallback keyword instead of function keyword 
    // and must have external keyword specified to it.
    // A fallback function must be payable or non-payable(don't specify payable keyword for non-payable)
    fallback() external payable isOwner validValue{
        emit SenderLogger(msg.sender);
        emit ValueLogger(msg.value);
    } 
}