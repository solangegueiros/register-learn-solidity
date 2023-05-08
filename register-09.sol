// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Array = List of infos

contract Register09 {
    string[] private info;
    uint public countChanges = 0;
    address public owner;

    constructor() {
        owner = msg.sender;
        info.push ("Sol");
    }

    event InfoChange(string oldInfo, string newInfo);
    
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    function getInfo(uint index) public view returns (string memory) {
        return info[index];
    }

    function listAllInfo() public view returns (string[] memory) {
        return info;
    }
    
    function addInfo(string memory _info) external onlyOwner returns (uint index) {
        info.push(_info);
        index = info.length -1;
        countChanges++;
    }

    function setInfo(uint index, string memory _info) external onlyOwner {
        emit InfoChange (info[index], _info);
        info[index] = _info;
        countChanges++;
    }   
}