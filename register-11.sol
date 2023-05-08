// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// One info per address = mapping of string
// You can only modify your info, no whitelist
// countChanges per address

contract Register11 {
    address public owner;
    mapping (address => string) public infos;
    mapping (address => uint) public countChanges;

    constructor() {
        owner = msg.sender;
        infos[msg.sender] =  "Sol";
    }

    event InfoChange(address account, string oldInfo, string newInfo);

    function getInfo() public view returns (string memory) {
        return infos[msg.sender];
    }

    function setInfo(string memory _info) external {
        emit InfoChange (msg.sender, infos[msg.sender], _info);
        infos[msg.sender]= _info;
        countChanges[msg.sender] ++;
    }   
}