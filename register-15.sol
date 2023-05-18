// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Enum - info color, 
// one struct / info per address

contract Register15 {
    
    //enum ColorInfo {Undefined = 0, Blue = 1, Blue = 2}
    enum ColorInfo {Undefined, Blue, Red}
    
    struct InfoStruct {
        ColorInfo color;
        string info;
        uint countChanges;
    }
    mapping (address => InfoStruct) public infos;

    constructor() {
        InfoStruct memory infoAux = InfoStruct ({
            color: ColorInfo.Undefined,
            info: "Sol",
            countChanges: 0
        });        
        infos[msg.sender] = infoAux;
    }

    event InfoChange(address person, uint updateNumber, string oldInfo, string newInfo);

    function getInfo() public view returns (InfoStruct memory) {
        return (infos[msg.sender]);
    }

    function setInfo(ColorInfo _color, string memory _info) public {
        emit InfoChange (msg.sender, infos[msg.sender].countChanges, infos[msg.sender].info, _info);
        infos[msg.sender].color = _color;
        infos[msg.sender].info = _info;
        infos[msg.sender].countChanges++;
    }

}