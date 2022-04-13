// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// A library can be defined using library keyword. 
// All functions listed here in IntExtended are now available in testLibrary.
library IntExtended {
    function increment(uint _self) public pure returns (uint) {
        return _self + 1;
    }

    function decrement(uint _self) public pure returns (uint) {
        return _self - 1;
    }

    function incrementByValue(uint _self, uint _value) public pure returns (uint) {
        return _self + _value;
    }

    function decrementByValue(uint _self, uint _value) public pure returns (uint) {
        return _self - _value;
    }
}