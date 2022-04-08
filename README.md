LEARNING SOLIDITY

THIS REPO IS RELATED TO DIFFERENT MINI CODES, SAMPLES AND CONCEPTS TO LEARN SOLIDITY.

CONCEPTS:-

Solidity is an object-oriented, high-level language for implementing smart contracts. Smart contracts are programs which govern the behavior of accounts within the Ethereum state.
Solidity is a curly-bracket language designed to target the Ethereum Virtual Machine (EVM). It is influenced by C++, Python and JavaScript. 
Solidity is statically typed, supports inheritance, libraries and complex user-defined types among other features.
With Solidity you can create contracts for uses such as voting, crowdfunding, blind auctions, and multi-signature wallets.


Installation

Using Npm
To install solidity on mac, first we need to install npm(if not installed) on the system.

npm install -g solc@latest

Or simply

npm install -g solc


Using Homebrew
To install solidity on mac, first we need to install homebrew(if not installed) on the system.

brew tap ethereum/ethereum




After cloning ethereum objects using the above command, use

brew install solidity

Check solc version

solcjs --version

















Introduction to smart contracts

Layout of a solidity source file

Source files can contain an arbitrary number of contract definitions, import , pragma and use for directives and struct, enum, function, error and constant variable definitions.

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}

Trust in smart contracts can be better established if their source code is available. Since making source code available always touches on legal problems with regards to copyright, the Solidity compiler encourages the use of machine-readable SPDX license identifiers. Every source file should start with a comment indicating its license:
// SPDX-License-Identifier: MIT
The first line tells you that the source code is licensed under the GPL version 3.0. Machine-readable license specifiers are important in a setting where publishing the source code is the default.

The pragma keyword is used to enable certain compiler features or checks. A pragma directive is always local to a source file, so you have to add the pragma to all your files if you want to enable it in your whole project. If you import another file, the pragma from that file does not automatically apply to the importing file.
Pragmas are common instructions for compilers about how to treat the source code
The next line specifies that the source code is written for Solidity version 0.4.16, or a newer version of the language up to, but not including version 0.9.0.

The version pragma is used as follows: pragma solidity ^0.5.2;





Solidity supports import statements to help modularise your code that are similar to those available in JavaScript (from ES6 on). However, Solidity does not support the concept of a default export.

At global level you can use the import statements as follows:

Import “filename”;

The filename part is called an import path. This statement imports all global symbols from “filename” (and symbols imported there) into the current global scope (different than in ES6 but backwards-compatible for Solidity). This form is not recommended for use, because it unpredictably pollutes the namespace. If you add new top-level items inside “filename”, they automatically appear in all files that import like this from “filename”. It is better to import specific symbols explicitly.


The following example creates a new global symbol symbolName whose members are all the global symbols from "filename":

import * as symbolName from “filename”;

which results in all global symbols being available in the format symbolName.symbol.

Another variant is

import “filename” as symbolName;

which is equivalent to import * as symbolName from "filename";.

In case of naming collision you can use:

Import { symbol1 as alias, symbol2 } from ‘filename’;


Comments: 

Single-line comments (//) and multi-line comments (/*...*/) are possible.







Other:
A contract in the sense of Solidity is a collection of code (its functions) and data (its state) that resides at a specific address on the Ethereum blockchain. 

The line uint storedData; declares a state variable called storedData of type uint (unsigned integer of 256 bits). You can think of it as a single slot in a database that you can query and alter by calling functions of the code that manages the database. 

In this example, the contract defines the functions set and get that can be used to modify or retrieve the value of the variable.

To access a member (like a state variable) of the current contract, you do not typically add the this. prefix, you just access it directly via its name.

This contract does not do much yet apart from (due to the infrastructure built by Ethereum) allowing anyone to store a single number that is accessible by anyone in the world without a (feasible) way to prevent you from publishing this number. Anyone could call set again with a different value and overwrite your number, but the number is still stored in the history of the blockchain. Later, you will see how you can impose access restrictions so that only you can alter the number.























Structure of a contract:

Contracts in Solidity are similar to classes in object-oriented languages. Each contract can contain declarations of State Variables, Functions, Function Modifiers, Events, Errors, Struct Types and Enum Types. Furthermore, contracts can inherit from other contracts.
There are also special kinds of contracts called libraries and interfaces.
The section about contracts contains more details than this section, which serves to provide a quick overview.

State variables

State variables are variables whose values are permanently stored in contract storage.

Eg.

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract SimpleStorage {
    uint storedData; // State variable
    // ...
}

See the Types section for valid state variable types and Visibility and Getters for possible choices for visibility.

Functions
Functions are the executable units of a code. Functions are usually defined inside a contract, but can be written outside a contract in solidity as well.

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.1 <0.9.0;

contract SimpleAuction {
    function bid() public payable { // Function
        // ...
    }
}

// Helper function defined outside of a contract
function helper(uint x) pure returns (uint) {
    return x * 2;
}

Function Calls can happen internally or externally(of contract) and have different levels of visibility towards other contracts. Functions accept parameters and return variables to pass parameters and values between them.

Function Modifiers

Function modifiers can be used to amend the semantics of functions in a declarative way (see Function Modifiers in the contracts section).
Overloading, that is, having the same modifier name with different parameters, is not possible.
Like functions, modifiers can be overridden.
 
 



