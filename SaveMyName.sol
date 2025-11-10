//SPDX-License-Identifier: MIT

pragma solidity ^0.8.25;

contract NaamToSunaHoga{
    string name;
    string bio;
     function saveNameandBio(string memory _name, string memory _bio) public{
        name =_name;
        bio= _bio;
     }

     function retieveNameandBio() public view returns(string memory, string memory) {
        return(name,bio);
     }
}