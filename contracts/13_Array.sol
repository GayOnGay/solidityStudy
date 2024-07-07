// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// Array can have a compile-time fixed size or a dynamic size.
// 数组可以具有编译时固定大小，也可以具有动态大小。

contract Array {
    //初始化数组的几种方法
    uint256 [] public arr;
    uint256 [] public arr2 = [1,2,3];
    // Fixed sized array, all elements initialize to 0     //固定大小的数组，所有元素初始化为0
    uint256[10] public myFixedSizeArr;

    function get(uint256 i) public view returns(uint256) {
        return arr[i];
    }

    // Solidity can return the entire array.                Solidity可以返回整个数组
    // But this function should be avoided for              但应避免使用此功能
    // arrays that can grow indefinitely in length.         数组的长度可以是无限大的
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        // Append to array                                  添加到数组中
        // This will increase the array length by 1.        这将使数组长度增加1。
        arr.push(i);
    }

    function pop() public {
        // Remove last element from array                   从数组中删除最后一个元素
        // This will decrease the array length by 1         这将使数组长度减少1
        arr.pop();
    }

    function getLength() public view returns(uint256){
        return arr.length;
    }

    function remove(uint256 index) public {
        // Delete does not change the array length.                 Delete不会更改数组长度
        // It resets the value at index to it's default value,      它将索引处的值重置为默认值
        // in this case 0                                           在这种情况下为0
        delete arr[index];
    }

    function examples() external {
        // create array in memory, only fixed size can be created   在内存中创建数组，只能创建固定大小
        uint256[] memory a = new uint256[](5);
    }
}