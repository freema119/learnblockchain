// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// mapping 类型类似字典
contract testMapping{
    // mapping（keyType=>valueType）
    // mapping没有长度概念，key和value都没有集合的概念
    // mapping只能作为storage状态变量
    mapping (address => uint) public balance;
    function update (uint newBalance) public{
        balance [msg.sender] = newBalance;
    }

    function getMappingValue(address key) public view returns (uint){
        return balance [key];
    }
}