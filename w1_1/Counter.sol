// SPDX-License-Identifier: MIT

// 编译器版本声明
pragma solidity ^0.8.0;

// 合约定义 对标class
contract Counter{
    // 状态变量，对标属性
    uint public counter;
    constructor(){
        // 构造函数初始变量
        counter = 0;
    }
    // 计数函数
    function count() public {
        counter = counter + 1;
    }
    // 新增一个add函数
    function add(uint x) public {
        counter = counter + x;
    }
    function count2() public{
        counter = counter + 2;
    }
}