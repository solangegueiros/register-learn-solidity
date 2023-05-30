// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: require owner
/// @author Solange Gueiros
contract Register05 {
    string private storedInfo;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    /**
    * Store `myInfo`
    * Require that the account sending the transaction is the contract owner.
    * If not, exits returning an error message. 
    * If require is valid, continue execution.
    * @dev require msg.sender is the owner, otherwise send an error message
    * @param myInfo the new string to store
    */
    function setInfo(string memory myInfo) external {
        require(msg.sender == owner, "Only owner");
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