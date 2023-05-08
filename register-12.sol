// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Mapping and access control: whiteList

contract Register12 {
    string private info;
    uint public countChanges = 0;
    address public owner;
    mapping (address => bool) public whiteList;

    constructor() {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        info = "Sol";
    }

    event InfoChange(string oldInfo, string newInfo);
    
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    modifier onlyWhitelist {
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }

    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) external onlyWhitelist {
        emit InfoChange (info, _info);
        info = _info;
        countChanges++;
    }

    function addMember (address _member) external onlyOwner {
        whiteList[_member] = true;
    }
    
    function delMember (address _member) external onlyOwner {
        whiteList[_member] = false;
    }    
}