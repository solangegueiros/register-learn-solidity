// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Owner

contract Register03 {
    string private info;
    address public owner;

    constructor() {
        owner = msg.sender;
        info = "Sol";
    }
    
    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) public {
        info = _info;
    }
    
}