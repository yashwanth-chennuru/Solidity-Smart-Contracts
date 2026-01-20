//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract Basic{
address public owner;
uint256 public totalBalance;

event Deposited(address indexed user,uint256 amount);
event Withdrawal(address indexed user, uint256 amount);

error NotOwner();
error InsufficientBalance(uint256 requested, uint256 available);

constructor() {
    owner=msg.sender;

}

modifier onlyOwner() {
    if (msg.sender!= owner){
        revert NotOwner();
    
    } 
    _;
}
  function getOwner() public view onlyOwner returns(address){
    return owner;
  }
  
  function deposit() public payable{
   totalBalance= totalBalance +msg.value;  
  emit Deposited(msg.sender, msg.value);
  }

  function withdraw(uint256 amount) public {
    if (amount> address(this).balance){
      revert InsufficientBalance(amount, address(this).balance);
    }
   payable(msg.sender).transfer(amount);// transfer is depreceated
   emit Withdrawal(msg.sender, amount);
  }  

  function getContractInfo()
  public 
  view 
  returns(
    address contractOwner, uint256 contractBalance,uint256 currentBlock, uint256 currentTimestamp
  )
  {
    contractOwner=owner;
    contractBalance=address(this).balance;
    currentBlock=block.number;
    currentTimestamp=block.timestamp;
  }
  }
