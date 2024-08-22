// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Invoke{
    uint128 public  num;
    address public  addr;
    constructor(){
        num = 1;
        addr = msg.sender;
    }
    function setVal(uint128 x) public {
        num = x;
        addr = msg.sender;
    } 
}

contract testCall{
    uint128 public  num;
    address public  addr;
    constructor(){
        num = 4;
        addr = msg.sender;
    }
    function callSetVal(address _contract) public {
        // call：会切换到被调用合约的上下问中执行，会改变被调用合约的执行状态
        bytes memory methodData = abi.encodeWithSignature("setVal(uint128)", num);
        (bool success,) = _contract.call(methodData);
        require(success,"failed");
    }

    function delegateCallSetVal(address _contract) public {
        // delegateCall:不会切换到被调用合约的上下文中执行，被调用合约的状态不会被修改，只会修改自身状态
        bytes memory methodData = abi.encodeWithSignature("setVal(uint128)", num);
        _contract.delegatecall(methodData);
    }
}