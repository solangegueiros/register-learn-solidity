// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Type address, owner

contract Register04 {
    string private info;
    uint public countChanges = 0;
    address public owner;

    constructor() {
        owner = msg.sender;
        info = "Sol";
    }
    
    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) external {
        info = _info;
        countChanges++;
    }    
}