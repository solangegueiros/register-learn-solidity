// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: All together 1
/// @author Solange Gueiros
// types string, uint, address
// msg.sender and owner, constructor
// require, function modifiers, events

contract Register08 {
    string private storedInfo;
    uint public countChanges = 0;
    address public owner;

    constructor() {
        owner = msg.sender;
        storedInfo = "Hello world";
    }

    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    event InfoChange(string oldInfo, string newInfo);

    /**
    * Store `myInfo`
    * Use the function modifier onlyOwner to check the require condition
    * Emit athe event InfoChange when the storedInfo will be updated
    * Manage how many times storedInfo is updated
    * @dev emit InfoChange with oldInfo, newInfo
    * @dev Increase the counter
    * @param myInfo the new string to store
    */
    function setInfo(string memory myInfo) external onlyOwner {
        emit InfoChange (storedInfo, myInfo);
        storedInfo = myInfo;
        countChanges++;
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