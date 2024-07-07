// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// View and Pure Functions
// 视图和纯函数
// Getter functions can be declared view or pure.
// Getter函数可以声明为view或pure
// View function declares that no state will be changed.
// View函数声明不会更改任何状态
// Pure function declares that no state variable will be changed or read.
// 纯函数声明不会更改或读取任何状态变量
contract ViewAndPure {
    uint256 public x = 1;

    // Promise not to modify the state.
    function addToX(uint256 y) public view returns (uint256) {
        return x + y;
    }

    // Promise not to modify or read from the state.
    function add(uint256 i, uint256 j) public pure returns (uint256) {
        return i + j;
    }
}