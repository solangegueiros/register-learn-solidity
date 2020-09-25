pragma solidity 0.5.4;
// Owner

contract Register05 {
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
        selfdestruct(owner);
    }

    function isAlive() public pure returns (bool) {
        return true;
    }    
}