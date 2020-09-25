pragma solidity 0.5.4;
// Selfdestruct if Owner

contract Register06 {
    string private info;
    address payable public owner;

    constructor() public {
        owner = msg.sender;
        info = "Sol";
    }
    
    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) public {
        info = _info;
    }

    function kill() public {
        if (msg.sender == owner)
            selfdestruct(owner);
    }

    function isAlive() public pure returns (bool) {
        return true;
    }    
}