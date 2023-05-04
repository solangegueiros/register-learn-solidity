// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Enum - info color, one struct / info per address

contract Register13 {
    address public owner;
    mapping (address => bool) public whiteList;
    
    //enum ColorInfo {Undefined = 0, Blue = 1, Blue = 2}
    enum ColorInfo {Undefined, Blue, Red}
    
    struct InfoStruct {
        ColorInfo color;
        string info;
    }
    mapping (address => InfoStruct) public infos;

    constructor() {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        InfoStruct memory infoAux = InfoStruct ({
            color: ColorInfo.Undefined,
            info: "Sol"
        });        
        infos[msg.sender] = infoAux;
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

    function getInfo() public view returns (ColorInfo, string memory) {
        return (infos[msg.sender].color, infos[msg.sender].info);
    }

    function setInfo(ColorInfo _color, string memory _info) public onlyWhitelist {
        emit InfoChange (msg.sender, infos[msg.sender].info, _info);
        infos[msg.sender].color = _color;
        infos[msg.sender].info = _info;
    }


    function addMember (address _member) public onlyOwner {
        whiteList[_member] = true;
    }
    
    function delMember (address _member) public onlyOwner {
        whiteList[_member] = false;
    }    
}