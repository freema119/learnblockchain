// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract testEvent{
    event Deposit(address indexed addr, uint value);
    function test(uint value) public{
        // 事件会在链上打印一份日志，这样我们就可以解析链上日志，所以这也经常作为便宜的存储
        emit Deposit(msg.sender, value);
    }
}