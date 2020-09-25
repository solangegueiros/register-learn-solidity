pragma solidity 0.5.4;
// Enum - info color, one struct per address

contract Register15 {
    address payable public owner;
    mapping (address => bool) public whiteList;
    
    //enum ColorInfo {Out = 0, Blue = 1, Blue = 2}
    enum ColorInfo {Undefined, Blue, Red}
    
    struct InfoStruct {
        ColorInfo color;
        string info;
    }
    mapping (address => InfoStruct) public infos;

    constructor() public {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        InfoStruct memory infoAux = InfoStruct ({
            color: ColorInfo.Undefined,
            info: "Sol"
        });        
        infos[msg.sender] = infoAux;
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

    function getInfo() public view returns (ColorInfo, string memory) {
        return (infos[msg.sender].color, infos[msg.sender].info);
    }

    function setInfo(ColorInfo _color, string memory _info) public onlyWhitelist {
        emit InfoChange (msg.sender, infos[msg.sender].info, _info);
        infos[msg.sender].color = _color;
        infos[msg.sender].info = _info;
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