// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// Function Modifier
// 函数修饰符
// Modifiers are code that can be run before and / or after a function call.
// 修饰符是可以在函数调用之前和/或之后运行的代码
// Modifiers can be used to:
// 修改器可用于：
// Restrict access                                  限制访问
// Validate inputs                                  验证输入
// Guard against reentrancy hack                    防范重新进入黑客攻击

contract FunctionModifier {
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        // Set the transaction sender as the owner of the contract.         将交易发送方设置为合同的所有者
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of the contract.      //修饰符，以检查调用方是否为合同的所有者
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    // Modifiers can take inputs. This modifier checks that the             修改器可以接受输入。此修饰符检查
    // address passed in is not the zero address.                           传入的地址不是零地址
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}