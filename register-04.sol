// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// setInfo if is owner, nothing will happen if is not

contract Register04 {
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
        if (msg.sender == owner)
            info = _info;
    }
    
}