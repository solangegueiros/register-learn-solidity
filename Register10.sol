// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: Loop for on array
/// @author Solange Gueiros
contract Register10 {
    string[] private storedInfos;

    constructor() {
        storedInfos.push ("Info 1 on index 0");
        storedInfos.push ("Info 2 on index 1");
        storedInfos.push ("Info 3 on index 2");
        storedInfos.push ("Info 4 on index 3");
    }

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
    * using the function listInfo from beginning to end
    * @dev retrieves the array of strings of the state variable `storedInfos`
    * @dev call the function listInfo from index 0 to info.length-1 
    * @return an string array
    */
    function listAllInfo() external view returns (string[] memory) {
        return listInfo(0, storedInfos.length-1);
    }

    /**
    * Return a range of stored strings
    * It is a public function because it can be called inside (from listAllInfo) or outside
    * @dev retrieves the string locate in the index of the array `storedInfos`
    * @param start is the initial range in the array to be returned
    * @param end is the final range in the array to be returned
    * @return infoAux - the stored string in the index
    */
    function listInfo(uint start, uint end) public view returns (string[] memory) {
        if (end > storedInfos.length)
            end = storedInfos.length-1;
        require (start <= end, "start must <= end");
        uint infoCount = end - start + 1;
        string[] memory infoAux = new string[](infoCount);

        for (uint i = start; i < (end + 1); i++) {
            infoAux[i-start] = storedInfos[i];
        }
        return infoAux;
    }
}