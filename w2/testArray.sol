// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

// 数组的使用
contract testArray{
    // 状态变量默认是存储在storage中的
    uint[] public dynamicArray; // 声明一个动态数组
    uint[3] public fixedArray; // 声明一个固定数组
    
    function modifyFixedArray(uint x) public {
        fixedArray[1] = x;
    }
    function add(uint x) public {
        // 往动态数组中插入一个数据
        dynamicArray.push(x);
    }
    function copy(uint[] calldata arrs) public returns (uint len){
        // 拷贝传递
        dynamicArray = arrs;
        return dynamicArray.length;
    }
    // 引用状态变量然后修改值，看状态变量是否改变
    function referChange() public{
        uint[] storage arr = dynamicArray;
        arr[0] = 9;
        // 不能直接将一个storage的直接赋值给memory，我们只能遍历storage中的值然后一个一个拷贝给memory
        // uint[] memory arr = dynamicArray; // 这段代码编译不过
        // arr[0] = 8;
    }

}