// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

// public: 内、外
// private: 内
// external：外包调用
// internal：内部调用
contract Available{
    uint public data;
    function cal(uint a) public returns (uint b){
        uint result = a+1;
        setData(result);
        // setData1(result);// 这里没法调用
        return result;
    }
    // internal修饰的函数不会在abi中出现
    function setData(uint a) internal {
        data = a;
    }
    // external 修饰的方法只能外部调用
    function setData1(uint a) external {
        data = a;
    }
}