// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 若要写入或更新状态变量，您需要发送一个事务。
// 另一方面，您可以免费读取状态变量，而无需支付任何交易费用。
// To write or update a state variable you need to send a transaction.
// On the other hand, you can read state variables, for free, without any transaction fee.

contract SimpleStorage {
    //用于存储数字的状态变量  State variable to store a number
    uint256 public num;

    //您需要发送一个事务来写入状态变量。  You need to send a transaction to write to a state variable.
    function set(uint256 _num) public {
        num = _num;
    }

    //您可以在不发送事务的情况下读取状态变量。  You can read from a state variable without sending a transaction.
    function get() public view returns(uint256) {
        return num;
    }
}