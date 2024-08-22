// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Receive{
    uint public  count;
    constructor() payable {

    }
    receive() external payable { 
        count += msg.value;
    }
    function getBalance() public view returns (uint256){
        return address(this).balance;
    }
}

contract testCallTransfer{
    constructor() payable {

    }
    function testTransfer(address payable towho) public returns (bool){
        payable(towho).transfer(2000);// 这里无法调用通过只能转2300的
        return true;
    }
    function testSafeTransfer(address towho) public {
        (bool success,) = towho.call{value:1 ether}(new bytes(0));
        require(success,"safeTransfer failed");
    }
}