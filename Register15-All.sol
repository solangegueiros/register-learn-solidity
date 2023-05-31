// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: All together 3
/// @author Solange Gueiros
// One array of structs per address = mapping, struct and array
// countChanges per address
contract Register15 {

    //enum Colors {Undefined = 0, Blue = 1, Blue = 2}
    enum Colors {Undefined, Blue, Red}

    struct InfoStruct {
        string info;
        Colors color;
        uint countChanges;
    }
    mapping (address => InfoStruct[]) public storedInfos;

    constructor() {
        InfoStruct memory auxInfo = InfoStruct ({
            info: "Hello world",
            color: Colors.Undefined,
            countChanges: 0
        });
        storedInfos[msg.sender].push(auxInfo);
    }

    event InfoChange(address person, uint countChanges, string oldInfo, string newInfo);

    /**
    * Store `myColor` and `myInfo` at the end of the struct array
    * @dev Get the position (index) where the struct was stored and return it
    * @param myColor the new color to be stored
    * @param myInfo the new string to be stored
    * @return index where the struct was stored
    */    
    function addInfo(Colors myColor, string memory myInfo) public returns (uint index) {
        InfoStruct memory auxInfo = InfoStruct ({
            info: myInfo,
            color: myColor,
            countChanges: 0
        });
        storedInfos[msg.sender].push(auxInfo);
        index = storedInfos[msg.sender].length -1;
    }
    
    /**
    * Update `newInfo` in some index of the struct array
    * @dev Update `newInfo` in some index of the struct array
    * @param index is the position where the string will be updated
    * @param newInfo is the new string to be stored
    */
    function setInfo(uint index, string memory newInfo) public {
        storedInfos[msg.sender][index].countChanges++;
        emit InfoChange (msg.sender, storedInfos[msg.sender][index].countChanges, storedInfos[msg.sender][index].info, newInfo);
        storedInfos[msg.sender][index].info = newInfo;
        storedInfos[msg.sender][index].countChanges++;
    }

    /**
    * Update the color at the index
    * @dev Update `color` in some index of the struct array
    * @param index is the position where the struct will be updated
    * @param myColor is the new color to be stored
    */
    function setColor(uint index, Colors myColor) public {
        storedInfos[msg.sender][index].color = myColor;
        storedInfos[msg.sender][index].countChanges++;
    }

    /**
    * Return the struct in index for an given address
    * @dev retrieves the struct locate in the index of the array `storedInfos` for the address ptovided
    * @param account - the account to get the struct
    * @param index is the location in the array to be returned
    * @return the struct in the index
    */
    function getOneInfo(address account, uint index) public view returns (InfoStruct memory) {
        require (index < storedInfos[account].length, "invalid index");
        return storedInfos[account][index];
    }

    /**
    * Return the struct in index
    * @dev retrieves the struct locate in the index of the array `storedInfos` for the msg.sender address
    * @param index is the location in the array to be returned
    * @return the struct in the index
    */
    function getMyInfoAtIndex(uint index) external view returns (InfoStruct memory) {
        return getOneInfo(msg.sender, index);
    }

    /**
    * Return all the structs stored in the array per address account
    * @dev 
    * @param account is the address which the array of structs will be returned
    * @return an struct array
    */
    function listAllInfo(address account) external view returns (InfoStruct[] memory) {
        return storedInfos[account];
    }
   
}