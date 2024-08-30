// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

// 编写⼀个Bank合约：
// • 通过 Metamask 向Bank合约转账ETH
// • 在Bank合约记录每个地址转账⾦额
// • 编写 Bank合约 withdraw(), 实现提取出所有的 ETH

// 作业需要学习到的知识点
// 1、mapping的使用；2、函数修改器modifier的使用；3、转账回调receive；4、call转账
contract Bank{
    // 定义一个mapping来保存账户地址和金额
    mapping (address=>uint) public amounts;
    // 记录自己的地址，从来判断调用是否为自己
    address private owner;

    constructor() {
        // 初始化记录自己的地址
        owner = msg.sender;
    }
    // 定义一个函数修改器来做统一判断验证
    modifier OnlyOwner(){
        require(owner == msg.sender,"not owner");
        _;
    }
    // 接受外部转账的回调函数
    receive() external payable {
        amounts[msg.sender] += msg.value;
    }

    // 取走自己的钱
    function withDraw() public {
        // (bool success,) = msg.sender.call{value:amounts[msg.sender]}(new bytes(0));// 坑：这个参数在高版本的solidity编译版本中转账会报错，新版本要用空字符串
        (bool success,) = msg.sender.call{value:amounts[msg.sender]}("");
        require(success);
        amounts[msg.sender] = 0;
    }
    // 自己提取所有的钱
    function withDrawAll() public OnlyOwner{
        uint b = address(this).balance;
        payable(owner).transfer(b);
    }
}