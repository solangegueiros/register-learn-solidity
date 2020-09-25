pragma solidity 0.5.4;
// Require

contract Register07 {
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
        require (msg.sender == owner, "only owner");
        info = _info;
    }

    function kill() public {
        require (msg.sender == owner, "only owner");
            selfdestruct(owner);
    }

    function isAlive() public pure returns (bool) {
        return true;
    }    
}