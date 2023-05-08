// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Constructor

contract Register03 {
    string private info;
    uint public countChanges = 0;

    constructor() {
        info = "Sol";
        // Will countChanges count the initial set? 
        // To be discussed in class
        // Here is not counting
    }
    
    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) external {
        info = _info;
        countChanges++;
    }    
}