// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract testModifier{
    address public owner;
    uint private  deposited = 0;
    constructor(){
        owner = msg.sender;
    }
    // 定义modifier
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
    // 使用自定义的modifier修饰函数
    function withDraw() public onlyOwner{
        // 只有自己才能提取余额
        payable(owner).transfer(deposited);
    }
}