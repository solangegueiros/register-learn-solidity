pragma solidity 0.5.4;
// Array = One array for all

contract Register12 {
    string[] private info;
    address payable public owner;
    mapping (address => bool) public whiteList;

    constructor() public {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        info.push ("Sol");
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

    function getInfo(uint index) public view returns (string memory) {
        return info[index];
    }

    function setInfo(uint index, string memory _info) public onlyWhitelist {
        emit InfoChange (info[index], _info);
        info[index] = _info;
    }
    
    function addInfo(string memory _info) public onlyWhitelist returns (uint index) {
        index = info.push (_info) - 1;
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