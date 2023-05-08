// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// command if
// setInfo if is owner, nothing will happen if is not

contract Register05 {
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
        if (msg.sender == owner) {
            info = _info;
            countChanges++;
        }
    }    
}