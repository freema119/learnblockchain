// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract Counter{
    uint public  counter;
    constructor(){
        counter = 1;
    }

    function count(uint x) public {
        counter = counter + x;
    }
}

contract testABI{
    function newCall() public {
        Counter c = new  Counter();
        //0xbfaace81 调用一个合约，输入参数是函数的ABI编码
        c.count(5);
    }
}