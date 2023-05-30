// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
 
contract Register {
    string private storedInfo;

    function setInfo(string memory myInfo) external {
        storedstoredInfo = myInfo;
    }

    function getInfo() external view returns (string memory) {
        return storedInfo;
    }
}
