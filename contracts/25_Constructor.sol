// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

// A constructor is an optional function that is executed upon contract creation.
// 构建函数是在创建合同时执行的可选函数

contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// There are 2 ways to initialize parent contract with parameters.      有两种方法可以使用参数初始化父合约

// Pass the parameters here in the inheritance list.                    在继承列表中的此处传递参数
contract B is X("Input to X"), Y("Input to Y") {}

contract C is X, Y {
    // Pass the parameters here in the constructor,                     在构建函数中传递此处的参数
    // similar to function modifiers.                                   类似于函数修饰符
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

// Parent constructors are always called in the order of inheritance    父构建函数总是按继承顺序调用
// regardless of the order of parent contracts listed in the            无论中列出的父合同的顺序如何

// Order of constructors called:                                        调用的构建函数的顺序：
// 1. X                                                                 1. X
// 2. Y                                                                 2. Y
// 3. D                                                                 3. D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}