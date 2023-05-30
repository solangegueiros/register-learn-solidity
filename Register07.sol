// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: event
/// @author Solange Gueiros
contract Register07 {
    string private storedInfo;

    event InfoChange(string oldInfo, string newInfo);

    /**
    * Store `myInfo`
    * Emit athe event InfoChange when the storedInfo will be updated
    * @dev emit InfoChange with oldInfo, newInfo
    * @param myInfo the new string to store
    */
    function setInfo(string memory myInfo) external {
        emit InfoChange (storedInfo, myInfo);
        storedInfo = myInfo;
    } 

    /**
    * Return the stored string
    * @dev retrieves the string of the state variable `storedInfo`
    * @return the stored string
    */
    function getInfo() external view returns (string memory) {
        return storedInfo;
    }   
}