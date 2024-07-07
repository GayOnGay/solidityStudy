// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Variables {
    //状态变量存储在区块链上。
    string public text = "hello";
    uint256 public num = 123;
    
    function doSomething() public {
        //局部变量不会保存到区块链中。
        uint256 i = 456;
        //以下是一些全局变量
        uint256 timestamp = block.timestamp;
        address sender = msg.sender;
    }
}