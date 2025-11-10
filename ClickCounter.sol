//SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract ClickCounter{

    uint256 public counter;
    function clickIncrement() public{
        counter =counter +1;

    }

    function clickDecrement() public{
        counter =counter -1;
    } 
    
    function reset() public{
        counter =0;
        
    }
    
}
