// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract Foo{
    error notZero();
    function add(uint256 x) public pure returns (uint256) {
        if(x == 0) revert notZero();
        return x + 1;
    }
}

contract testTryCatch{
    uint256 public  y ;
    string public  errorMsg;
    bytes public  errorBytes;
    function errorCatch() public {
        Foo f = new Foo();
        try f.add(0) returns (uint256 value){
            y = value;
        }catch Error(string memory reason){
            errorMsg = reason;
        }catch (bytes memory reason){
            errorBytes = reason;
        }
    }
}