// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: Constructor
/// @author Solange Gueiros
contract Register03 {
    string private storedInfo;
    uint public countChanges = 0;

    /**
    * Constructor is a function which is called only when the contract is been deployed
    * It is used to initialize variables and states
    */
    constructor() {
        storedInfo = "Hello world";
        // Will countChanges count the initial set? 
        // To be discussed in class
        // Here is not counting
    }
    
    /**
    * Store `myInfo`
    * Manage how many times storedInfo is updated
    * @dev stores the string in the state variable `storedInfo` 
    * @dev Increase the counter
    * @param myInfo the new string to store
    */
    function setInfo(string memory myInfo) external {
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