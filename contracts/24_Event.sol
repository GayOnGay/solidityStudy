// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// Events allow logging to the Ethereum blockchain. Some use cases for events are:
// 事件允许登录以太坊区块链。事件的一些用例包括
// Listening for events and updating user interface
// 监听事件并更新用户界面
// A cheap form of storage

contract Event {
    // Event declaration                                                        事件声明
    // Up to 3 parameters can be indexed.                                       最多可以索引3个参数
    // Indexed parameters helps you filter the logs by the indexed parameter    索引参数可帮助您根据索引参数筛选日志
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}