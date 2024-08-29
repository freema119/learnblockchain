// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract C{
    uint public data;
    constructor(){

    }

    function addOne(uint a) public  pure  returns(uint){
        return  a + 1;
    }

    function setData(uint d) public {
        data = d;
    }
}

// 创建合约
contract CreateC{
    // 第一种：直接new创建，每次创建的地址是不一样的
    function createByNew() public returns (address){
        C c = new C();// gas 179901
        return  address(c);
    }
    // 第二种：通过克隆创建（复用已经部署合约的地址创建）,目的是省更多的gas
    function createByClone(address impl) public  returns (address){
        address addr = createClone(impl); // gas 72797
        return addr;
    }
    // 克隆创建通用方法
    function createClone(address prototype) internal returns (address proxy) {
        bytes20 targetBytes = bytes20(prototype);
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
            mstore(add(clone, 0x14), targetBytes)
            mstore(
                add(clone, 0x28),
                0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000
            )
            proxy := create(0, clone, 0x37)
        }
        return proxy;
    }

    // 第三种：通过create2来创建一个确定地址的合约，可以预先创建地址，但是不创建合约
    // 使用同样的salt创建合约，最后返回的地址会是一样的
    function createByCreate2(uint salt) public returns (address){
        C c = new C{salt: keccak256(abi.encode(salt))}();
        return address(c);
    }
    function getAddress(uint _salt) public view returns (address) {
        bytes memory bytecode = type(C).creationCode;
        //  if constructor
        // bytecode = abi.encodePacked(bytecode, abi.encode(x));

        bytes32 hash = keccak256(
            abi.encodePacked(bytes1(0xff), address(this), keccak256(abi.encode(_salt)), keccak256(bytecode))
        );

        // NOTE: cast last 20 bytes of hash to address
        return address(uint160(uint(hash)));
    }
}