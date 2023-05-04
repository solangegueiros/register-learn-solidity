// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// require owner

contract Register05 {
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
        require(msg.sender == owner, "Only owner");
        info = _info;
    }
    
}