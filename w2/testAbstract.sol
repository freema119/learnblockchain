// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

// 抽象合约
abstract contract A{
    uint a;
    // 定义虚函数
    function add(uint x) public virtual  returns (uint);
}

contract B is A{
    uint b;
    // 只有方法继续标记为virtual的时候才能被子合约重写
    function add(uint x) public override virtual pure returns (uint) {
        return  x + 1;
    }
}

contract C is B{
    uint c;
    function add(uint x) public override pure returns (uint) {
        return  x + 2;
    }
}