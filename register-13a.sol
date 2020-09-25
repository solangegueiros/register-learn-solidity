pragma solidity 0.5.4;
pragma experimental ABIEncoderV2;
// Return ArrayList for address

contract Register13a {
    address payable public owner;
    mapping (address => bool) public whiteList;
    mapping (address => string[]) public infos;

    constructor() public {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        infos[msg.sender].push("Sol");
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

    function getInfo(uint index) public view returns (string memory) {
        return infos[msg.sender][index];
    }

    function setInfo(uint index, string memory _info) public onlyWhitelist {
        emit InfoChange (msg.sender, infos[msg.sender][index], _info);
        infos[msg.sender][index] = _info;
    }
    
    function addInfo(string memory _info) public onlyWhitelist returns (uint index) {
        index = infos[msg.sender].push (_info) - 1;
    }
    
    function listInfo() public view returns (string[] memory) {
        return infos[msg.sender];
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