pragma solidity 0.5.4;

contract Register01 {
    string private info;
    
    function getInfo() public view returns (string memory) {
        return info;
    }

    function setInfo(string memory _info) public {
        info = _info;
    }
}