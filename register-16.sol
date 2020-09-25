pragma solidity 0.5.4;
// mapping with array of structs

contract Register16 {
    address payable public owner;
    mapping (address => bool) public whiteList;
    
    //enum ColorInfo {Out = 0, Blue = 1, Blue = 2}
    enum ColorInfo {Undefined, Blue, Red}
    
    struct InfoStruct {
        ColorInfo color;
        string info;
    }
    mapping (address => InfoStruct[]) public infos;

    constructor() public {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        InfoStruct memory infoAux = InfoStruct ({
            color: ColorInfo.Undefined,
            info: "Sol"
        });        
        infos[msg.sender].push (infoAux);
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

    function getInfo(uint index) public view returns (ColorInfo, string memory) {
        return (infos[msg.sender][index].color, infos[msg.sender][index].info);
    }

    function setInfo(uint index, ColorInfo _color, string memory _info) public onlyWhitelist {
        emit InfoChange (msg.sender, infos[msg.sender][index].info, _info);
        infos[msg.sender][index].color = _color;
        infos[msg.sender][index].info = _info;
    }
    
    function addInfo(ColorInfo _color, string memory _info) public onlyWhitelist returns (uint index) {
        InfoStruct memory infoAux = InfoStruct ({
            color: _color,
            info: _info
        });        
        index = infos[msg.sender].push (infoAux) - 1;        
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