pragma solidity 0.5.4;
// Modifier onlyOwner

contract Register08 {
    string private info;
    address payable public owner;

    constructor() public {
        owner = msg.sender;
        info = "Sol";
    }
    
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) public onlyOwner {
        info = _info;
    }

    function kill() public onlyOwner {
        selfdestruct(owner);
    }

    function isAlive() public pure returns (bool) {
        return true;
    }    
}