// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: All together 2
/// @author Solange Gueiros
// mapping and struct: one struct per address
contract Register14 {

    //enum Colors {Undefined = 0, Blue = 1, Blue = 2}
    enum Colors {Undefined, Blue, Red}

    struct InfoStruct {
        string info;
        Colors color;
        uint countChanges;
    }
    mapping (address => InfoStruct) private storedInfos;

    event InfoChange(address person, uint countChanges, string oldInfo, string newInfo);

    /**
    * Store `myColor` and `myInfo`
    * Increase the counter which how many times storedInfo is updated
    * emit an event with address, countChanges, oldInfo, newInfo
    * @dev update the strict `storedInfo` with the parameters `myColor` and `myInfo`
    * @dev increase the counter
    * @param myColor the new color to be stored
    * @param myInfo the new string to be stored
    */
    function setInfo(Colors myColor, string memory myInfo) external {
      storedInfos[msg.sender].countChanges++;
      emit InfoChange (msg.sender, storedInfos[msg.sender].countChanges, storedInfos[msg.sender].info, myInfo);
      storedInfos[msg.sender].color = myColor;  
      storedInfos[msg.sender].info = myInfo;    
    }

    /**
    * Return the struct storedInfo for the msg.sender
    * @dev return the struct storedInfo for the msg.sender
    * @return the stored struct storedInfo
    */
    function getInfo() external view returns (InfoStruct memory) {
        return storedInfos[msg.sender];
    } 

}