// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract testAddress{
    constructor() payable {
        
    }
    function testTrasfer(address payable x) public {
        address  myAddress = address(this);// 获取当前合约地址
        if(myAddress.balance > 10 ether){
            // 注意这里是合约向x地址转账，不是x地址转账给合约
            x.transfer(10 ether);
        }
    }

    function getBalance(address addr) public view returns (uint){
        return addr.balance;
    }
}