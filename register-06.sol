// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Modifier onlyOwner

contract Register06 {
    string private info;
    address public owner;

    constructor() {
        owner = msg.sender;
        info = "Sol";
    }

    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) public onlyOwner {
        info = _info;
    }
    
}