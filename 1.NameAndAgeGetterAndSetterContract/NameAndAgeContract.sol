// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract NameAndAgeContract{
    string private name;
    uint private age;

    function getAge() public view returns (uint){
        return age;
    }

    function getName() public view returns (string memory){
        return name;
    }

    function setAge(uint newAge) public {
        age = newAge;
    }

    function setName(string memory newName) public {
        name = newName;
    }
}
