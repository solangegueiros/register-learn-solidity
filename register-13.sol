// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// One array per address = mapping and array
// countChanges per address
// No whitelist

contract Register13 {
    mapping (address => string[]) public infos;
    mapping (address => uint) public countChanges;

    constructor() {
        infos[msg.sender].push("Sol");
    }

    event InfoChange(address person, string oldInfo, string newInfo);

    function getInfo(uint index) public view returns (string memory) {
        return infos[msg.sender][index];
    }
    
    function addInfo(string memory _info) public returns (uint index) {
        infos[msg.sender].push(_info);
        index = infos[msg.sender].length -1;
    }

    function setInfo(uint index, string memory _info) public {
        emit InfoChange (msg.sender, infos[msg.sender][index], _info);
        infos[msg.sender][index] = _info;
        countChanges[msg.sender]++;
    }

    function listYourInfo() public view returns (string[] memory) {
        return infos[msg.sender];
    }

    function listInfoByAccount(address account) public view returns (string[] memory) {
        return infos[account];
    }
   
}