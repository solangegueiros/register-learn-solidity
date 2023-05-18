// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
// Variable: uint, visibility: public
 
contract Register02 {
    string private info;
    uint public countChanges = 0;

    function getInfo() public view returns (string memory ) {
        return info;
    }

    function setInfo(string memory _info) external {
        info = _info;
        countChanges++;
    }
}