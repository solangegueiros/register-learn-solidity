pragma solidity 0.5.4;
// Struct = Array of Structs for all

contract Register14 {
    address payable public owner;
    mapping (address => bool) public whiteList;
    
    struct InfoStruct {
        address person;
        string info;
    }
    InfoStruct[] infos;

    constructor() public {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        InfoStruct memory infoAux = InfoStruct ({
            person: msg.sender,
            info: "Sol"
        });        
        infos.push (infoAux);
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

    function getInfo(uint index) public view returns (address, string memory) {
        return (infos[index].person, infos[index].info);
    }

    function setInfo(uint index, string memory _info) public onlyWhitelist {
        require(msg.sender == infos[index].person, "Only your info");
        emit InfoChange (msg.sender, infos[index].info, _info);
        infos[index].info = _info;
    }
    
    function addInfo(string memory _info) public onlyWhitelist returns (uint index) {
        InfoStruct memory infoAux = InfoStruct ({
            person: msg.sender,
            info: _info
        });
        index = infos.push(infoAux) - 1;
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