// SPDX-License-Identifier: MIT
// pragma solidity ^0.5.0;
pragma solidity ^0.8.26;

contract testOverFlow{
    function add1() public pure returns(uint8){
        uint8 i = 128;
        uint8 result = i*2;
        // 结果值长度大于存储类型，所以现在会直接没法执行，执行报错
        return result;
    }

    function add2() public  pure  returns(uint8){
        uint8 a = 240;
        uint8 b = 17;
        uint8 result = a+b;
        return result;
    }

    function sub2() public pure returns(uint){
        uint a = 9;
        uint b = 10;
        uint result = a - b;
        return result;
    }
}