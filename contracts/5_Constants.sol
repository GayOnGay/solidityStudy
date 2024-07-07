// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 常量是不能修改的变量。
// 它们的值是硬编码的，使用常数可以节省gas。
contract Constants {
    //大写常量变量的编码约定
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public constant MY_UINT = 123;
}