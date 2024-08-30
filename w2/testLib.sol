// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

library ExSafeMethod{
    function add(uint x, uint y) internal  pure returns (uint){
        uint z = x+y;
        require(z>=x,"uint overflow");
        return z;
    }
}

contract myContract{
    using ExSafeMethod for uint;// 通过using方式引入库
    function test(uint x, uint y) public  pure  returns (uint){
        // return ExSafeMethod.add(x,y);
        return x.add(y); // 通过using使用和上面是等效的
    }
}