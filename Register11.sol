// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: mapping and access control: whiteList
/// @author Solange Gueiros
contract Register11 {
    string private storedInfo;
    address public owner;
    mapping (address => bool) public whiteList;

    constructor() {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        storedInfo = "Hello world";
    }
    
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    modifier onlyWhitelist {
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }

    /**
    * Store `myInfo`
    * Use the function modifier onlyWhitelist to check the require condition.
    * _ continue the function code
    * @dev function modifier onlyWhitelist
    * @param myInfo the new string to store
    */
    function setInfo(string memory myInfo) external onlyWhitelist {
        storedInfo = myInfo;
    }

    /**
    * `Add` an address in the whitelist
    * It means that the address will have `True` value, saing that it is in the whiteList
    * @dev update value true to the address in the whitelist
    * @param member is the adddress to be allowed
    */
    function addMember (address member) external onlyOwner {
        whiteList[member] = true;
    }

     /**
    * `Remove` an address in the whitelist
    * It means that the address will have `False` value, saing that it is NOT in the whiteList
    * When an index is not explicity setted, the default value is false.
    * @dev update value false to the address in the whitelist
    * @param member is the adddress to be unallowed
    */   
    function delMember (address member) external onlyOwner {
        whiteList[member] = false;
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