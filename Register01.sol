// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

/// @title Storage string
/// @author Solange Gueiros
contract Register01 {
    string private storedInfo;

    /// Store `myInfo`
    /// @dev stores the string in the state variable `storedInfo`
    /// @param myInfo the new string to store
    function setInfo(string memory myInfo) external {
        storedInfo = myInfo;
    }

    /// Return the stored string
    /// @dev retrieves the string of the state variable `storedInfo`
    /// @return the stored string
    function getInfo() external view returns (string memory) {
        return storedInfo;
    }
}
