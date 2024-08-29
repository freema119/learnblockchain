// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract A{
    uint public a;
    uint internal c; // internal 修饰的变量能在子合约中使用但是因为他的方法会不被导出，所以部署后看不到
    constructor(){
        a = 0;
        c = 1;
    }
    function aMethod(uint x) public pure returns (uint){
        return x + 1;
    }
}

contract B is A{
    // B继承A 相当于把A中公开的变量和方法拷贝到B中部署编译
    uint public b;
    function bMethod() public view returns (uint){
        return a+c;
    }
    // 不能直接覆盖父合约方法
    // function aMethod(uint x) public pure  returns (uint){
    //     return  x + 2;
    // };
}