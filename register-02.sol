pragma solidity 0.5.4;
// Constructor

contract Register02 {
    string private info;

    constructor() public {
        info = "Sol";
    }
    
    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) public {
        info = _info;
    }    
}