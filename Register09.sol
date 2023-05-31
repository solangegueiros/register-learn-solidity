// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: array = list of infos stored
/// @author Solange Gueiros
contract Register09 {
    string[] private storedInfos;

    /**
    * Store `myInfo` at the end of the string array
    * @dev Get the position (index) where the string was stored and return it
    * @param myInfo the new string to be stored
    * @return index where the string was stored
    */
    function addInfo(string memory myInfo) external returns (uint index) {
        storedInfos.push(myInfo);
        index = storedInfos.length -1;
    }

    /**
    * Update `newInfo` in some index of the string array
    * @dev Update `newInfo` in some index of the string array
    * @param index is the position where the string will be updated
    * @param newInfo is the new string to be stored
    */
    function updateInfo(uint index, string memory newInfo) external {
        require (index < storedInfos.length, "invalid index");
        storedInfos[index] = newInfo;
    }

    /**
    * Return a stored string
    * @dev retrieves the string locate in the index of the array `storedInfos`
    * @param index is the location in the array to be returned
    * @return the stored string in the index
    */
    function getOneInfo(uint index) external view returns (string memory) {
        require (index < storedInfos.length, "invalid index");
        return storedInfos[index];
    }

    /**
    * Return all the strings stored in the array
    * @dev retrieves the array of strings of the state variable `storedInfos`
    * @return an string array
    */
    function listAllInfo() external view returns (string[] memory) {
        return storedInfos;
    } 
}