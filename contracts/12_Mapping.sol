// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// 映射是使用语法映射（keyType=>valueType）创建的。           Maps are created with the syntax mapping(keyType => valueType).
// keyType可以是任何内置的值类型、字节、字符串或任何约定。      The keyType can be any built-in value type, bytes, string, or any contract.
// valueType可以是任何类型，包括另一个映射或数组。             valueType can be any type including another mapping or an array.
// 映射是不可迭代的。                                        Mappings are not iterable.

contract Mapping {
    // Mapping from address to uint   从地址到uint的映射
    mapping(address => uint256) public myMap;

    function get(address _addr) public view returns(uint256){
        // Mapping always returns a value.                                  映射总是返回一个值。
        // If the value was never set, it will return the default value.    如果从未设置该值，它将返回默认值。
        return myMap[_addr];
    }

    function set(address _addr, uint256 _i) public{
        myMap[_addr] = _i;
    }

    function remove(address _addr) public{
        // Reset the value to the default value.   将该值重置为默认值
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)  嵌套映射（从地址映射到另一个映射）
    mapping(address => mapping(uint256 => bool)) public nested;

    function get(address _addr1, uint256 _i) public view returns(bool){
        // You can get values from a nested mapping   可以从嵌套映射中获取值
        // even when it is not initialized            即使未初始化
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint256 _i, bool _bool) public {
        nested[_addr1][_i] = _bool;
    }

    function remove(address _addr1, uint256 _i) public {
        delete nested[_addr1][_i];
    }
}