// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Event

contract Register07 {
    string private info;
    address public owner;

    constructor() {
        owner = msg.sender;
        info = "Sol";
    }

    event InfoChange(string oldInfo, string newInfo);
    
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) public onlyOwner {
        emit InfoChange (info, _info);
        info = _info;
    }
 
}