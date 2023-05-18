// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Struct = Array of Structs for all addresses
// countChanges per info slot

contract Register14 {
    address public owner;
    mapping (address => bool) public whiteList;
    
    struct InfoStruct {
        address account;
        string info;
        uint countChanges;
    }
    InfoStruct[] infos;

    constructor() {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        InfoStruct memory infoAux = InfoStruct ({
            account: msg.sender,
            info: "Sol",
            countChanges: 0
        });        
        infos.push (infoAux);
    }

    event InfoChange(address person, uint slot, string oldInfo, string newInfo);
    
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
    
    function addInfo(string memory _info) public onlyWhitelist returns (uint index) {
        InfoStruct memory infoAux = InfoStruct ({
            account: msg.sender,
            info: _info,
            countChanges: 0
        });
        infos.push(infoAux);
        index = infos.length - 1;
    }

    function setInfo(uint index, string memory _info) public onlyWhitelist {
        require(msg.sender == infos[index].account, "Only your info");
        infos[index].countChanges++;
        emit InfoChange (msg.sender, infos[index].countChanges, infos[index].info, _info);
        infos[index].info = _info;        
    }

    function listAllInfo() public view returns (InfoStruct[] memory) {
        return infos;
    }

    function listInfo() public view returns (InfoStruct[] memory) {
        return infos;
    }
    function listInfo(uint start, uint end) public view returns (InfoStruct[] memory) {
        if (end == 0 || end > infos.length)
            end = infos.length-1;
        require (start <= end, "start must <= end");
        uint infoCount = end - start + 1;
        InfoStruct[] memory infoAux = new InfoStruct[](infoCount);

        for (uint i = start; i < (end + 1); i++) {
            infoAux[i-start] = infos[i];
        }
        return infoAux;
    }

    function addMember (address _member) public onlyOwner {
        whiteList[_member] = true;
    }
    
    function delMember (address _member) public onlyOwner {
        whiteList[_member] = false;
    }    
}