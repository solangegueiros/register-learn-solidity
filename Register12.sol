// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/// @title Concepts: enum
/// @author Solange Gueiros
// Define a custom type with a list of colors
// The info will have a color
contract Register12 {
    
    //enum Colors {Undefined = 0, Blue = 1, Blue = 2}
    enum Colors {Undefined, Blue, Red}
    Colors infoColor;
    string storedInfo;

    /**
    * Store `myColor` and `myInfo`
    * @dev update the variables `infoColor` and `storedInfo` with the parameters `myColor` and `myInfo`
    * @param myColor the new color to store
    * @param myInfo the new string to store
    */
    function setInfo(Colors myColor, string memory myInfo) external {
        infoColor = myColor;
        storedInfo = myInfo;
    }

    /**
    * Return the stored string and the color
    * @dev retrieves the string of the state variable `storedInfo` 
    * @dev and the custom color selected from the enum Colors which is stored in infoColor
    * @return the stored string
    */
    function getInfo() external view returns (string memory, Colors) {
        return (storedInfo, infoColor);
    }

}