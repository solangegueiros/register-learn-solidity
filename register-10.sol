pragma solidity 0.5.4;
// WhiteList

contract Register10 {
    string private info;
    address payable public owner;
    mapping (address => bool) public whiteList;

    constructor() public {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        info = "Sol";
    }

    event InfoChange(string oldInfo, string newInfo);
    
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    modifier onlyWhitelist {
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }

    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) public onlyWhitelist {
        emit InfoChange (info, _info);
        info = _info;
    }

    function kill() public onlyOwner {
        selfdestruct(owner);
    }

    function isAlive() public pure returns (bool) {
        return true;
    }

    function addMember (address _member) public onlyOwner {
        whiteList[_member] = true;
    }
    
    function delMember (address _member) public onlyOwner {
        whiteList[_member] = false;
    }    
}