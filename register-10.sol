// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Loop on array

contract Register10 {
    string[] private info;
    uint public countChanges = 0;
    address public owner;

    constructor() {
        owner = msg.sender;
        info.push ("Info 1");
        info.push ("Info 2");
        info.push ("Info 3");
        info.push ("Info 4");
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

    function listInfo(uint from, uint to) public view returns (string[] memory) {
        if (to == 0)
            to = info.length-1;
        uint infoCount = to - from + 1;
        string[] memory infoAux = new string[](infoCount);

        for (uint i = from; i < to; i++) {
            infoAux[i] = info[i];
        }
        return infoAux;
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