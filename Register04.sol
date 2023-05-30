// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: Type address, msg.sender, owner, if
/// @author Solange Gueiros
contract Register04 {
    string private storedInfo;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    /**
    * Store `myInfo`
    * Check if the account sending the transaction is the contract owner.
    * In affirmative case, update `myInfo` and increase the counter.
    * Otherwise, nothing will happen.
    * @dev check if msg.sender is the owner, update `storedInfo` and increase the counter
    * @param myInfo the new string to store
    */
    function setInfo(string memory myInfo) external {
        if (msg.sender == owner) {
            storedInfo = myInfo;
        }
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