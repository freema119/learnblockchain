// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract Counter{
    uint public a ;

    function add() public{
      a = a + 1;
    }
    function add2(uint x) public  pure  returns (uint){
        return  x + 2;
    }
}

interface  ICounter {
    // interface 里面的函数必须是external的
    function add() external ;
}

contract MyConstract{
    function invoke(address _counter) public {
        // 相当于类型转换
        ICounter(_counter).add();
    }
}