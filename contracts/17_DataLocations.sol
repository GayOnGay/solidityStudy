// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// Data Locations
// Data Locations - Storage, Memory and Calldata
// Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.
// storage variable is a state variable (store on blockchain)
// memory variable is in memory and it exists while a function is being called
// calldata special data location that contains function arguments

// 数据位置
// 数据位置-Storage、Memory和Calldata
// 变量被声明为Storage、Memory或Calldata，以显式指定数据的位置。
// Storage变量是一个状态变量（存储在区块链上）
// Memory变量在内存中，并且在调用函数时存在
// calldata包含函数参数的特殊数据位置

contract DataLocations {
    uint256[] public arr;
    mapping(uint256 => address) map;
     struct MyStruct {
        uint256 foo;
    }
    mapping(uint256 => MyStruct) myStructs;

    function f() public {
        // call _f with state variables                     使用状态变量调用_f
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping                      从映射中获取结构
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory                        在内存中创建结构
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(uint256[] storage _arr, mapping(uint256 => address) storage _map, MyStruct storage _myStruct) internal {
        // do something with storage variables              对存储变量执行操作
    }

    // You can return memory variables                      您可以返回内存变量
    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        // do something with memory array
    }

    function h(uint256[] calldata _arr) external {
        // do something with calldata array
    }
}