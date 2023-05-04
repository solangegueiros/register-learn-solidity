// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Struct = Array of Structs for all addresses

contract Register12 {
    address public owner;
    mapping (address => bool) public whiteList;
    
    struct InfoStruct {
        address account;
        string info;
    }
    InfoStruct[] infos;

    constructor() {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        InfoStruct memory infoAux = InfoStruct ({
            account: msg.sender,
            info: "Sol"
        });        
        infos.push (infoAux);
    }

    event InfoChange(address person, string oldInfo, string newInfo);
    
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    modifier onlyWhitelist {
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }

    function getInfo(uint index) public view returns (address, string memory) {
        return (infos[index].account, infos[index].info);
    }

    function setInfo(uint index, string memory _info) public onlyWhitelist {
        require(msg.sender == infos[index].account, "Only your info");
        emit InfoChange (msg.sender, infos[index].info, _info);
        infos[index].info = _info;
    }
    
    function addInfo(string memory _info) public onlyWhitelist returns (uint index) {
        InfoStruct memory infoAux = InfoStruct ({
            account: msg.sender,
            info: _info
        });
        infos.push(infoAux);
        index = infos.length - 1;
    }

    function listInfo() public view returns (InfoStruct[] memory) {
        return infos;
    }

    function addMember (address _member) public onlyOwner {
        whiteList[_member] = true;
    }
    
    function delMember (address _member) public onlyOwner {
        whiteList[_member] = false;
    }    
}