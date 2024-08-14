// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.21;

contract Counter {
    uint public count;
    constructor(uint x) {
        count = x;
    }
    function add(uint i) public{
        count = count + i;
    }
}