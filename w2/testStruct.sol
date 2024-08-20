// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// 结构体
contract testStruct{
    // 定义一个结构体,用来描述一个人的账户余额
    struct Funder{
        address addr;
        uint amount;
    }
    mapping (uint => Funder) funders;
    
    // 创建funder
    function contribute(uint key) public payable {
        // funders[key] = Funder({addr:msg.sender,amount:msg.value});
        // 改变初始化的方式
        funders[key] = Funder(msg.sender,msg.value);
    }

    // 修改
    function changeFunder(uint key) public {
        Funder storage f = funders[key];
        f.addr = msg.sender;
        f.amount = 5;
    }

    // 获取
    function getFunderAmount(uint key) public view returns (address,uint){
        Funder storage f = funders[key];
        return (f.addr,f.amount);
    }
}