// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter{
    uint public  counter;
    constructor(){
        counter = 1;
    }

    function count(uint16 x) public {
        counter = counter + x;
    }
}

contract testABI{
    constructor() payable {

    }
    function newCall() public {
        Counter c = new  Counter();
        //0xbfaace81 调用一个合约，输入参数是函数的ABI编码
        c.count(1);
    }
    function call(Counter c) public {
        c.count(1);
    }
    // 通过call调用
    // function callAddress(address counter, address payload) public {
    //     (bool success, bytes memory methodData) = counter.call(payload);
    //     // require(success,"failed");
    // }

    function callABI(address addr) public {
        // 注意这里函数选择器中的参数单位不能是uint，必须指定位数，不然调用不通过
        bytes memory data = abi.encodeWithSignature("count(uint16)",4);
        (bool success,) = addr.call{gas:1000000}(data); // 这里表示赋值一个，如果另外一个写了下面没有调用会提示经过local value unused
        require(success, "call failed");
    }
}