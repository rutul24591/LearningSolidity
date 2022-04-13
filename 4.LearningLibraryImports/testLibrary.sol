// Notes::: LEAVING this part as library linking to contract does not work locally currently with remix and vscode.
// Copying the files, compiling and deploying on remix.ethereum.org works.

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
import './library.sol';

// importing remote libraries would be something like
// import 'github.com/rutul24591/LearningSolidity/index.sol'

// use imported libraries like below
// contract useLibraries is Libraries {

// }

// Here we are doing extending the functionality for uint
contract TestLibrary {
    // Here we can use `*` instead `uint`, but that would mean the 
    // IntExtended would apply for strings as well
    using IntExtended for uint;

    // Here using uint8 _base instead of uint _base would throw error. 
    // We are sticking to extending functionality for uint.  
    function testIncrement(uint _base) public pure returns (uint) {
        return _base.increment();
    }

    function testDecrement(uint _base) public pure returns (uint) {
        return _base.decrement();
    }

    function testIncrementByValue(uint _base, uint _value) public pure returns (uint) {
        // return _base.incrementByValue(_value);
        // For static content
        return IntExtended.incrementByValue(_base, _value);
    }

    function testDecrementByValue(uint _base, uint _value) public pure returns (uint) {
        return _base.decrementByValue(_value);
    }
}