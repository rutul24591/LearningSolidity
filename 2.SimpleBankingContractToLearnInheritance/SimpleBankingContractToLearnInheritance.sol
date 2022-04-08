// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/** 
    Access modifiers in solidity are public, private and internal.
    Internal is similar to protected keyword

    The modifier order for a function should be:
        Visibility
        Mutability
        Virtual
        Override
        Custom modifiers
*/

interface Regulator  {
    // Functions in interfaces must be declared external.
    function loan() external returns (bool);

    // function checkValue would be used to check value at withdrawal request
    function checkValue(uint amount) external returns (bool);
}

// Bank `implements` interface Regulator, Can be done using `is`
contract Bank is Regulator {

    //  Default value can be provided like 
    //  uint private value = 10;
    //  But this makes every contract that inherits from bank gets a default value of 10.
    //  To solve this a `constructor` comes to the rescue. 
    uint private value;

    //  A `constructor` is an optional function declared with the constructor keyword 
    //  which is executed upon contract creation, 
    //  and where you can run contract initialisation code.
    constructor(uint amount) {
        value = amount;
    }

    function deposit(uint amount) public {
        value += amount; 
    }

    function withdraw(uint amount) public {
        // We can go ahead use throw method here, 
        // throw consumes lots of gas of transaction instead use revert, assert or return
        if(checkValue(amount)){
            value -= amount;
        }    
    }

    function balance() public view returns (uint) {
        return value;
    }

    function loan() public view override returns (bool) {
        return value > 0;
    }

    // Function declared as `pure`(when pure was written), but this expression (potentially) 
    // reads from the environment or state and thus requires "view".
    function checkValue(uint amount) public view override returns (bool) {
        return amount >= value;
    }

    // Here is a simple abstract function.
    // Contracts are identified as abstract contracts when at least one of their functions lacks an implementation.
    // function loan() public virtual returns (bool);
}


/* 
    `is` keyword is used to extend class. 
    Here `NameAndAgeContract` extends `Bank` contract 
    i.e it inherits from bank contract. 

    Contracts are identified as abstract contracts when at least one of their functions lacks an implementation.    
    Contracts may be marked as abstract even though all functions are implemented.
    Bank has a constructor, so if you dont pass 10 or any value as argument 
    then it raises an objection `Contract "NameAndAgeContract" should be marked as abstract.`
*/

//  If a contract inherits from an abstract contract and 
//  does not implement all non-implemented functions by overriding, it needs to be marked as abstract as well.

contract NameAndAgeContract is Bank(10) {
    string private name;
    uint private age;

    function getAge() public view returns (uint) {
        return age;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function setAge(uint newAge) public {
        age = newAge;
    }

    function setName(string memory newName) public {
        name = newName;
    }

    //  As we have commented the loan function from Bank, the below loan implementation would object
    // Function has override specified but does not override anything. 
    // To make it more generic we move the loan and checkValue function implementation in Bank
    
    // function loan() public pure override returns (bool) {
    //     return true;
    // }

    // function checkValue(uint amount) public pure returns (bool) {
    //     return true;
    // }
}