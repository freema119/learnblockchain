// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Counter {
    uint public counter;
    constructor(uint x) {
        counter = x;
    }
    function add(uint i) public{
        counter = counter + i;
    }
}