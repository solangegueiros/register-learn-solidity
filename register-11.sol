pragma solidity 0.5.4;
// One info per address = mapping of string

contract Register11 {
    address payable public owner;
    mapping (address => bool) public whiteList;
    mapping (address => string) public infos;

    constructor() public {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        infos[msg.sender] =  "Sol";
    }

    event InfoChange(address person, string oldInfo, string newInfo);
    
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    modifier onlyWhitelist {
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }

    function getInfo() public view returns (string memory) {
        return infos[msg.sender];
    }

    function setInfo(string memory _info) public onlyWhitelist {
        emit InfoChange (msg.sender, infos[msg.sender], _info);
        infos[msg.sender]= _info;
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