// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract testModifier{
    address public owner;
    uint private  deposited = 0;
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == owner,"not owner");
        _;
    }

    fallback() external payable {
        deposited += msg.value;
    }
    
    function getDeposited() public view returns (uint){
        return deposited;
    }

    function withDraw() public onlyOwner{
        // 只有自己才能提取余额
        payable(owner).transfer(deposited);
    }
}