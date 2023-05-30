// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: function modifiers
/// @author Solange Gueiros
contract Register06 {
    string private storedInfo;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    /**
    * Store `myInfo`
    * Use the function modifier onlyOwner to check the require condition.
    * _ continue the function code
    * @dev function modifier onlyOwner
    * @param myInfo the new string to store
    */
    function setInfo(string memory myInfo) external onlyOwner {
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