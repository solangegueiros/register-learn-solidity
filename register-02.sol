// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Constructor

contract Register02 {
    string private info;

    constructor() {
        info = "Sol";
    }
    
    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) public {
        info = _info;
    }    
}