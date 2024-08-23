// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract testError{
    address public owner;
    error notOwner();
    constructor(){
        owner = msg.sender;
    }

    function doSomething() public {
        if(msg.sender != owner){
            revert notOwner();// 没有传递参数消耗gas：23388; 传递参数消耗：23876，所以最好通过error名字就知道错误类型
        }

        // require(msg.sender == owner,"not owner");//23642
    }
}